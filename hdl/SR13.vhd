--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: RamWriter.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFireSoC> <Die::MPFS250T_ES> <Package::FCVG484>
-- Author: <Chedi Fassi>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
entity RamWriter is

    port(
        -------------------------
		-- LED OUT
		-------------------------
        value_in              : in  std_logic_vector(31 downto 0);
        value_en              : in  std_logic;
        turn_on_writer              : in  std_logic;
        write_done              : out  std_logic;
        --LEDs : OUT std_logic_vector(3 downto 0);
		-------------------------
		-- RAM interface
		-------------------------
		--- Global signals
		ACLK                     : in  std_logic;
		ARESETN                  : in  std_logic;
		B_ADDR                   : out  std_logic_vector(17 downto 0);
		B_WEN                    : out  std_logic;
		B_DIN                    : in std_logic_vector(31 downto 0);
        B_DOUT                   : out std_logic_vector(31 downto 0)
    );
end RamWriter;

--Architecture Section

architecture architecture_RamWriter of RamWriter is
    type ram_states is (pending, idle);
    signal state : ram_states := pending;
 
    signal curr_address : std_logic_vector(32 downto 0):= (others=>'0');
  
begin
  -- unused signals
    -- axi-lite slave state machine
    axi_slave_states : process (ACLK)
    begin
        if rising_edge(ACLK) then
            if ARESETN='0' then -- slave reset state
                B_WEN <= '0';
                B_ADDR <= (others=>'0');
                B_DOUT <= (others=>'0');
                curr_address <= (others=>'0');
                state <= pending;
            else
                case state is
                    when pending =>                
                        if (turn_on_writer = '1') then
                            state <= idle;
                            write_done <= '0';
                        else
                            write_done <= '1';
                        end if;
                    B_WEN <= '0';
                    when idle => 
                    -- wait for a read or write address and latch it in
                    if (value_en = '1') then
                        B_DOUT(31 downto 0) <= value_in;
                        -- fill 2 compliment
                        --if (value_in(17) = '0') then 
                            --B_DOUT(31 downto 18) <= (others=>'0');
                        --else
                            --B_DOUT(31 downto 18) <= (others=>'1');
                        --end if;
                        B_ADDR <= curr_address(17 downto 0);
                        B_WEN <= '1';
                        if (curr_address = X"3F") then --should be X"3FFFF", for test change to X"3F"
                            curr_address <= (others=>'0');
                            state <= pending;
                        else
                            curr_address <= std_logic_vector(unsigned(curr_address) + 1);
                            state <= idle;
                        end if;
                    else
                        B_WEN <= '0';
                    end if;
                    --B_ADDR <= (others=>'0');

                    

     
                end case;
            end if;
        end if;
    end process;
    

end architecture_RamWriter;

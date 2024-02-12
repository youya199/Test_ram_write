--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: logictest.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
entity AndOfThree is
    Port (
        clk: in std_logic;
        reset_n : in std_logic;
        input_valid : in std_logic;
        addr : out STD_LOGIC_VECTOR(31 downto 0);
        start_write : out std_logic
    );
end AndOfThree;

architecture Behavioral of AndOfThree is
type write_fsm_states is (idle, s1, transit, s2, end_state);
signal current_state : write_fsm_states:= idle;
signal addr_buffer : STD_LOGIC_VECTOR(31 downto 0) := x"60000000";
signal start_write_buffer : std_logic := '0';

begin
       
    process(clk, reset_n, input_valid)
    begin
        if rising_edge(clk) then
            case current_state is
               when idle =>
                    if reset_n = '0' then
                        current_state <= s1;
                        addr_buffer <= x"60000000";
                        start_write_buffer <= '1';
                    end if;
                when s1 =>   
                    current_state <= transit;
                    addr_buffer <= x"60000000";
                    start_write_buffer <= '0';                
                when transit =>   
                    if input_valid = '1' then
                        current_state <= s2;
                        addr_buffer <= x"60000040";
                        start_write_buffer <= '1';
                    end if;
                when s2 =>   
                    current_state <= end_state;
                    addr_buffer <= x"60000040";
                    start_write_buffer <= '0';   
                when end_state => 
                    addr_buffer <= x"60000040";
                    start_write_buffer <= '0';   
            end case;
        end if;
    end process;
    
    addr <= addr_buffer;
    start_write <= start_write_buffer;
    
end Behavioral;

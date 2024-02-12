--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: test_AXI_write_displacedFSM.vhd
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
-- Author: <Yan>
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity test_AXI_write_displacedFSM is
port (

       CLK : in STD_LOGIC;
       RESET_N : in STD_LOGIC;
       WC_BUSY : in STD_LOGIC;
       ctrlr_ready : in STD_LOGIC;
       write_o : out STD_LOGIC;
       data_o : out STD_LOGIC_VECTOR(63 downto 0);
       addr_o : out STD_LOGIC_VECTOR(31 downto 0)
    );
end test_AXI_write_displacedFSM;
architecture architecture_test_AXI_write_displacedFSM of test_AXI_write_displacedFSM is
    type ram_states is (init_state, idle, in_work, end_state);
    signal state : ram_states := init_state;
    signal Counter1 : UNSIGNED(31 downto 0) := x"60000000";--for addr 
    signal Counter2 : UNSIGNED(63 downto 0) := x"abcdabcd11112222";--for data
    signal transfNo : UNSIGNED(11 downto 0) := x"000";-- number of transfers
  
begin
    axi_slave_states : process (CLK,RESET_N)
    begin
        if rising_edge(CLK) then
            if RESET_N='0' then 
                write_o <= '0';
                addr_o <= x"60000000";
                data_o <= x"abcdabcd11112222";
                state <= init_state;
            else
                case state is
                    when init_state =>                
                        if (ctrlr_ready = '1') then
                            state <= idle;
                        end if;

                    when idle =>                
                        if (WC_BUSY = '0') then
                            state <= in_work;
                            write_o <= '1';
                            --Counter1 <= Counter1 + 1;
                            --Counter2 <= Counter2 + 1;
                            addr_o <= STD_LOGIC_VECTOR(Counter1);
                            data_o <= STD_LOGIC_VECTOR(Counter2);
                        end if;

                    when in_work => 
                        write_o <= '1';
                        Counter1 <= Counter1 + 1;
                        Counter2 <= Counter2 + 1;
                        transfNo <= transfNo + 1;
                        addr_o <= STD_LOGIC_VECTOR(Counter1);
                        data_o <= STD_LOGIC_VECTOR(Counter2);
                        if (transfNo >= x"001") then
                            state <= end_state;
                            write_o <= '0';

                        end if;

                    
                    when end_state => 
                        write_o <= '0';
                        addr_o <= x"60000000";
                        data_o <= x"0000000000000000";
                end case;
            end if;
        end if;
    end process;
    
end architecture_test_AXI_write_displacedFSM;

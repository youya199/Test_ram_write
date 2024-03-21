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
entity test_wready is
    Port (
        clk: in std_logic;
        reset_n : in std_logic;
        input_wready : in std_logic;
        output_wvalid : out std_logic
    );
end test_wready;

architecture Behavioral of test_wready is
signal counter : unsigned(1 downto 0):= "00";

begin
       
    process(clk, reset_n, input_wready)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                output_wvalid <= '0';
            else 
               
                counter <= counter +1;
                if input_wready = '1' then
                    output_wvalid <= '1';
                else
                    output_wvalid <= '0';

                end if;
            end if;
        
            
        
        
        end if;
    end process;
    

end Behavioral;

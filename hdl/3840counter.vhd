--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: counter3840.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: This counter counts to 3840 then send out the signal "count_up". Every time this counter meets the signal "line_start", it would reset itself.
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

entity counter3840 is
    port ( clk : in STD_LOGIC;
           rst_N : in STD_LOGIC;
           count_up : out STD_LOGIC
           );
end counter3840;

architecture Behavioral of counter3840 is
    signal counter : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
begin
    process(clk, rst_N)
    begin
        if rst_N = '0' then
            -- Reset the counter to 0
            counter <= (others => '0');
            count_up <= '0';
        elsif rising_edge(clk) then
            -- Increment the counter on each rising edge of the clock
            counter <= std_logic_vector(unsigned(counter) + 1);
            if (counter = X"eff") then --0xeff = 3840-1
                count_up <= '1';
            else
                count_up <= '0';
            end if;
        end if;
    end process;

end Behavioral;

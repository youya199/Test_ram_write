--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: limited_counter.vhd
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

entity limited_counter is
    port ( clk : in STD_LOGIC;
           rst_N : in STD_LOGIC;
           en_val : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(7 downto 0)
           );
end limited_counter;

architecture Behavioral of limited_counter is
    signal counter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, rst_N)
    begin
        if rst_N = '0' then
            -- Reset the counter to 0
            counter <= (others => '0');
            en_val <= '0';
        elsif rising_edge(clk) then
            -- Increment the counter on each rising edge of the clock

            if (counter = X"25") then
                en_val <= '0';
            else
                en_val <= '1';
                counter <= std_logic_vector(unsigned(counter) + 1);
            end if;
        end if;
    end process;

    -- Output the counter value
    count <= counter;
end Behavioral;

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: limited_counter_valid.vhd
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

entity limited_counter_valid is
    port ( clk : in STD_LOGIC;
           rst_N : in STD_LOGIC;
           button : in STD_LOGIC;
           en_val : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(7 downto 0)
           );
end limited_counter_valid;

architecture Behavioral of limited_counter_valid is
    signal counter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal switch : std_logic := '0';
    type fsm_states is (switch_off, switch_on);
    signal current_state : fsm_states:= switch_off;
    
    
begin
    process(clk, rst_N)--counter
    begin
        if rst_N = '0' then
            -- Reset the counter to 0
            counter <= (others => '0');
            en_val <= '0';
        elsif rising_edge(clk) then
            -- Increment the counter on each rising edge of the clock
            if switch='1' then
                if (counter = X"f5") then
                    en_val <= '0';
                else
                    en_val <= '1';
                    counter <= std_logic_vector(unsigned(counter) + 1);
                end if;
            else
                en_val <= '0';
            end if;
        end if;
    end process;

    
    
    process (clk, rst_N)--enable 
    begin
        if rst_N = '0' then
            current_state <= switch_off;
            switch <= '0';
        elsif rising_edge(clk) then
            case current_state is
                when switch_off =>
                    switch <= '0';
                    if button='1' then
                        current_state <= switch_on;
                    end if;
                when switch_on =>
                    switch <= '1';
            end case;
        end if;
    end process;
    
    
    -- Output the counter value
    count <= counter;
end Behavioral;

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: clock_giving.vhd
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_giving is
    port (
        input_clk : in std_logic;
        button    : in std_logic;
        output_clk: out std_logic
    );
end entity clock_giving;

architecture rtl of clock_giving is
    signal clk_buffer : std_logic;
    signal switch : std_logic := '0';
    type fsm_states is (offen, zu);
    signal current_state : fsm_states:= offen;
begin
    output_clk <= clk_buffer;

    process (all)
    begin
        case current_state is
            when offen =>
                switch <= '0';
                if button='1' then
                    current_state <= zu;
                end if;
            when zu =>
                switch <= '1';
        end case;
    end process;

    clk_buffer <= input_clk and switch;
end architecture rtl;


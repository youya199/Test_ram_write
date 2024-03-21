----------------------------------------------------------------------
-- Created by SmartDesign Mon Mar 11 13:57:17 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- tow_AND_entop entity declaration
----------------------------------------------------------------------
entity tow_AND_entop is
    -- Port list
    port(
        -- Inputs
        clk         : in  std_logic;
        frame_end   : in  std_logic;
        frame_start : in  std_logic;
        line_end    : in  std_logic;
        line_start  : in  std_logic;
        line_valid  : in  std_logic;
        reset_n     : in  std_logic;
        t_o_w_SC    : in  std_logic;
        -- Outputs
        combined_EN : out std_logic
        );
end tow_AND_entop;
----------------------------------------------------------------------
-- tow_AND_entop architecture body
----------------------------------------------------------------------
architecture RTL of tow_AND_entop is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- combine
component combine
    -- Port list
    port(
        -- Inputs
        EN             : in  std_logic;
        clk            : in  std_logic;
        reset_n        : in  std_logic;
        turn_on_wrtier : in  std_logic;
        -- Outputs
        combined_EN    : out std_logic
        );
end component;
-- turn_on_writer_block
component turn_on_writer_block
    -- Port list
    port(
        -- Inputs
        clk            : in  std_logic;
        frame_start    : in  std_logic;
        reset_n        : in  std_logic;
        t_o_w_SC       : in  std_logic;
        -- Outputs
        turn_on_writer : out std_logic
        );
end component;
-- write_en
component write_en
    -- Port list
    port(
        -- Inputs
        clk         : in  std_logic;
        frame_end   : in  std_logic;
        frame_start : in  std_logic;
        line_end    : in  std_logic;
        line_start  : in  std_logic;
        line_valid  : in  std_logic;
        reset_n     : in  std_logic;
        -- Outputs
        EN          : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal combined_EN_net_0                     : std_logic;
signal turn_on_writer_block_0_turn_on_writer : std_logic;
signal write_en_0_EN                         : std_logic;
signal combined_EN_net_1                     : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 combined_EN_net_1 <= combined_EN_net_0;
 combined_EN       <= combined_EN_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- combine_0
combine_0 : combine
    port map( 
        -- Inputs
        clk            => clk,
        reset_n        => reset_n,
        turn_on_wrtier => turn_on_writer_block_0_turn_on_writer,
        EN             => write_en_0_EN,
        -- Outputs
        combined_EN    => combined_EN_net_0 
        );
-- turn_on_writer_block_0
turn_on_writer_block_0 : turn_on_writer_block
    port map( 
        -- Inputs
        clk            => clk,
        reset_n        => reset_n,
        t_o_w_SC       => t_o_w_SC,
        frame_start    => frame_start,
        -- Outputs
        turn_on_writer => turn_on_writer_block_0_turn_on_writer 
        );
-- write_en_0
write_en_0 : write_en
    port map( 
        -- Inputs
        clk         => clk,
        reset_n     => reset_n,
        frame_start => frame_start,
        frame_end   => frame_end,
        line_start  => line_start,
        line_end    => line_end,
        line_valid  => line_valid,
        -- Outputs
        EN          => write_en_0_EN 
        );

end RTL;

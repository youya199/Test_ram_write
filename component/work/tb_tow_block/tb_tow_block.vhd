----------------------------------------------------------------------
-- Created by SmartDesign Wed Dec 13 15:36:55 2023
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
-- tb_tow_block entity declaration
----------------------------------------------------------------------
entity tb_tow_block is
    -- Port list
    port(
        -- Outputs
        turn_on_writer : out std_logic
        );
end tb_tow_block;
----------------------------------------------------------------------
-- tb_tow_block architecture body
----------------------------------------------------------------------
architecture RTL of tb_tow_block is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CLK_GEN_C0
component CLK_GEN_C0
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
-- PULSE_GEN_C0
component PULSE_GEN_C0
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end component;
-- PULSE_GEN_C1
component PULSE_GEN_C1
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
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
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CLK_GEN_C0_0_CLK     : std_logic;
signal PULSE_GEN_C0_0_PULSE : std_logic;
signal PULSE_GEN_C1_0_PULSE : std_logic;
signal turn_on_writer_net_0 : std_logic;
signal turn_on_writer_net_1 : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net              : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 turn_on_writer_net_1 <= turn_on_writer_net_0;
 turn_on_writer       <= turn_on_writer_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- PULSE_GEN_C0_0
PULSE_GEN_C0_0 : PULSE_GEN_C0
    port map( 
        -- Outputs
        PULSE => PULSE_GEN_C0_0_PULSE 
        );
-- PULSE_GEN_C1_0
PULSE_GEN_C1_0 : PULSE_GEN_C1
    port map( 
        -- Outputs
        PULSE => PULSE_GEN_C1_0_PULSE 
        );
-- turn_on_writer_block_0
turn_on_writer_block_0 : turn_on_writer_block
    port map( 
        -- Inputs
        clk            => CLK_GEN_C0_0_CLK,
        reset_n        => VCC_net,
        t_o_w_SC       => PULSE_GEN_C0_0_PULSE,
        frame_start    => PULSE_GEN_C1_0_PULSE,
        -- Outputs
        turn_on_writer => turn_on_writer_net_0 
        );

end RTL;

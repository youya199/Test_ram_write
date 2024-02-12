----------------------------------------------------------------------
-- Created by SmartDesign Wed Dec 13 16:26:48 2023
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
-- tb_write_en entity declaration
----------------------------------------------------------------------
entity tb_write_en is
    -- Port list
    port(
        -- Outputs
        EN : out std_logic
        );
end tb_write_en;
----------------------------------------------------------------------
-- tb_write_en architecture body
----------------------------------------------------------------------
architecture RTL of tb_write_en is
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
-- CLK_GEN_C1
component CLK_GEN_C1
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
signal CLK_GEN_C0_0_CLK     : std_logic;
signal CLK_GEN_C1_0_CLK     : std_logic;
signal EN_net_0             : std_logic;
signal PULSE_GEN_C0_0_PULSE : std_logic;
signal PULSE_GEN_C1_0_PULSE : std_logic;
signal EN_net_1             : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net              : std_logic;
signal GND_net              : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net <= '1';
 GND_net <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 EN_net_1 <= EN_net_0;
 EN       <= EN_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- CLK_GEN_C1_0
CLK_GEN_C1_0 : CLK_GEN_C1
    port map( 
        -- Outputs
        CLK => CLK_GEN_C1_0_CLK 
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
-- write_en_0
write_en_0 : write_en
    port map( 
        -- Inputs
        clk         => CLK_GEN_C0_0_CLK,
        reset_n     => VCC_net,
        frame_start => PULSE_GEN_C0_0_PULSE,
        frame_end   => GND_net,
        line_start  => PULSE_GEN_C1_0_PULSE,
        line_end    => GND_net,
        line_valid  => CLK_GEN_C1_0_CLK,
        -- Outputs
        EN          => EN_net_0 
        );

end RTL;

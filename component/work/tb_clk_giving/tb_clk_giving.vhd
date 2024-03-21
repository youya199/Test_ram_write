----------------------------------------------------------------------
-- Created by SmartDesign Fri Feb 16 13:36:21 2024
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
-- tb_clk_giving entity declaration
----------------------------------------------------------------------
entity tb_clk_giving is
    -- Port list
    port(
        -- Outputs
        output_clk : out std_logic
        );
end tb_clk_giving;
----------------------------------------------------------------------
-- tb_clk_giving architecture body
----------------------------------------------------------------------
architecture RTL of tb_clk_giving is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CLK_GEN_C2
component CLK_GEN_C2
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
-- clock_giving
component clock_giving
    -- Port list
    port(
        -- Inputs
        button     : in  std_logic;
        input_clk  : in  std_logic;
        -- Outputs
        output_clk : out std_logic
        );
end component;
-- PULSE_GEN_C3
component PULSE_GEN_C3
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CLK_GEN_C2_0_CLK     : std_logic;
signal output_clk_net_0     : std_logic;
signal PULSE_GEN_C3_0_PULSE : std_logic;
signal output_clk_net_1     : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 output_clk_net_1 <= output_clk_net_0;
 output_clk       <= output_clk_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C2_0
CLK_GEN_C2_0 : CLK_GEN_C2
    port map( 
        -- Outputs
        CLK => CLK_GEN_C2_0_CLK 
        );
-- clock_giving_0
clock_giving_0 : clock_giving
    port map( 
        -- Inputs
        input_clk  => CLK_GEN_C2_0_CLK,
        button     => PULSE_GEN_C3_0_PULSE,
        -- Outputs
        output_clk => output_clk_net_0 
        );
-- PULSE_GEN_C3_0
PULSE_GEN_C3_0 : PULSE_GEN_C3
    port map( 
        -- Outputs
        PULSE => PULSE_GEN_C3_0_PULSE 
        );

end RTL;

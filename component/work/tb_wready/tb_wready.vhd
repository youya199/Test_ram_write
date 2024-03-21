----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb 13 11:03:20 2024
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
-- tb_wready entity declaration
----------------------------------------------------------------------
entity tb_wready is
    -- Port list
    port(
        -- Outputs
        output_wvalid : out std_logic
        );
end tb_wready;
----------------------------------------------------------------------
-- tb_wready architecture body
----------------------------------------------------------------------
architecture RTL of tb_wready is
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
-- RESET_GEN_C1
component RESET_GEN_C1
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end component;
-- test_wready
component test_wready
    -- Port list
    port(
        -- Inputs
        clk           : in  std_logic;
        input_wready  : in  std_logic;
        reset_n       : in  std_logic;
        -- Outputs
        output_wvalid : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CLK_GEN_C0_0_CLK     : std_logic;
signal output_wvalid_net_0  : std_logic;
signal RESET_GEN_C1_0_RESET : std_logic;
signal output_wvalid_net_1  : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net              : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 output_wvalid_net_1 <= output_wvalid_net_0;
 output_wvalid       <= output_wvalid_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );
-- test_wready_0
test_wready_0 : test_wready
    port map( 
        -- Inputs
        clk           => CLK_GEN_C0_0_CLK,
        reset_n       => RESET_GEN_C1_0_RESET,
        input_wready  => GND_net,
        -- Outputs
        output_wvalid => output_wvalid_net_0 
        );

end RTL;

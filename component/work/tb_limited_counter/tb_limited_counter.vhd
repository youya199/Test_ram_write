----------------------------------------------------------------------
-- Created by SmartDesign Wed Feb 14 15:35:14 2024
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
-- tb_limited_counter entity declaration
----------------------------------------------------------------------
entity tb_limited_counter is
    -- Port list
    port(
        -- Outputs
        count  : out std_logic_vector(7 downto 0);
        en_val : out std_logic
        );
end tb_limited_counter;
----------------------------------------------------------------------
-- tb_limited_counter architecture body
----------------------------------------------------------------------
architecture RTL of tb_limited_counter is
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
-- limited_counter
component limited_counter
    -- Port list
    port(
        -- Inputs
        clk    : in  std_logic;
        rst_N  : in  std_logic;
        -- Outputs
        count  : out std_logic_vector(7 downto 0);
        en_val : out std_logic
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
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CLK_GEN_C0_0_CLK     : std_logic;
signal count_net_0          : std_logic_vector(7 downto 0);
signal en_val_net_0         : std_logic;
signal RESET_GEN_C1_0_RESET : std_logic;
signal count_net_1          : std_logic_vector(7 downto 0);
signal en_val_net_1         : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 count_net_1       <= count_net_0;
 count(7 downto 0) <= count_net_1;
 en_val_net_1      <= en_val_net_0;
 en_val            <= en_val_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- limited_counter_0
limited_counter_0 : limited_counter
    port map( 
        -- Inputs
        clk    => CLK_GEN_C0_0_CLK,
        rst_N  => RESET_GEN_C1_0_RESET,
        -- Outputs
        en_val => en_val_net_0,
        count  => count_net_0 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );

end RTL;

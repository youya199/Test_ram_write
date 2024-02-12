----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb  8 17:35:32 2024
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
-- tb_dp entity declaration
----------------------------------------------------------------------
entity tb_dp is
    -- Port list
    port(
        -- Outputs
        address_out  : out std_logic_vector(31 downto 0);
        output_data  : out std_logic_vector(63 downto 0);
        output_ready : out std_logic
        );
end tb_dp;
----------------------------------------------------------------------
-- tb_dp architecture body
----------------------------------------------------------------------
architecture RTL of tb_dp is
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
-- dummypacker
component dummypacker
    -- Port list
    port(
        -- Inputs
        input_clk    : in  std_logic;
        input_reset  : in  std_logic;
        input_valid  : in  std_logic;
        -- Outputs
        address_out  : out std_logic_vector(31 downto 0);
        output_data  : out std_logic_vector(63 downto 0);
        output_ready : out std_logic
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
signal address_out_net_0    : std_logic_vector(31 downto 0);
signal CLK_GEN_C0_0_CLK     : std_logic;
signal output_data_net_0    : std_logic_vector(63 downto 0);
signal output_ready_net_0   : std_logic;
signal PULSE_GEN_C0_0_PULSE : std_logic;
signal RESET_GEN_C1_0_RESET : std_logic;
signal output_ready_net_1   : std_logic;
signal address_out_net_1    : std_logic_vector(31 downto 0);
signal output_data_net_1    : std_logic_vector(63 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 output_ready_net_1       <= output_ready_net_0;
 output_ready             <= output_ready_net_1;
 address_out_net_1        <= address_out_net_0;
 address_out(31 downto 0) <= address_out_net_1;
 output_data_net_1        <= output_data_net_0;
 output_data(63 downto 0) <= output_data_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- dummypacker_0
dummypacker_0 : dummypacker
    port map( 
        -- Inputs
        input_clk    => CLK_GEN_C0_0_CLK,
        input_reset  => RESET_GEN_C1_0_RESET,
        input_valid  => PULSE_GEN_C0_0_PULSE,
        -- Outputs
        output_data  => output_data_net_0,
        address_out  => address_out_net_0,
        output_ready => output_ready_net_0 
        );
-- PULSE_GEN_C0_0
PULSE_GEN_C0_0 : PULSE_GEN_C0
    port map( 
        -- Outputs
        PULSE => PULSE_GEN_C0_0_PULSE 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );

end RTL;

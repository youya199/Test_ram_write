----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb  8 10:46:31 2024
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
-- tb_fifo entity declaration
----------------------------------------------------------------------
entity tb_fifo is
    -- Port list
    port(
        -- Outputs
        address_out  : out std_logic_vector(31 downto 0);
        output_data  : out std_logic_vector(511 downto 0);
        output_ready : out std_logic
        );
end tb_fifo;
----------------------------------------------------------------------
-- tb_fifo architecture body
----------------------------------------------------------------------
architecture RTL of tb_fifo is
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
-- data_packer
component data_packer
    -- Port list
    port(
        -- Inputs
        input_clk    : in  std_logic;
        input_data   : in  std_logic_vector(31 downto 0);
        input_reset  : in  std_logic;
        input_valid  : in  std_logic;
        -- Outputs
        address_out  : out std_logic_vector(31 downto 0);
        output_data  : out std_logic_vector(511 downto 0);
        output_ready : out std_logic
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
signal address_out_net_0          : std_logic_vector(31 downto 0);
signal CLK_GEN_C0_0_CLK           : std_logic;
signal limited_counter_0_count    : std_logic_vector(7 downto 0);
signal limited_counter_0_en_val   : std_logic;
signal output_data_net_0          : std_logic_vector(511 downto 0);
signal output_ready_net_0         : std_logic;
signal RESET_GEN_C1_0_RESET       : std_logic;
signal output_ready_net_1         : std_logic;
signal output_data_net_1          : std_logic_vector(511 downto 0);
signal address_out_net_1          : std_logic_vector(31 downto 0);
signal input_data_net_0           : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal input_data_const_net_0     : std_logic_vector(15 downto 8);
signal input_data_const_net_1     : std_logic_vector(23 downto 16);
signal input_data_const_net_2     : std_logic_vector(31 downto 24);
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal input_reset_IN_POST_INV0_0 : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 input_data_const_net_0 <= B"00000000";
 input_data_const_net_1 <= B"00000000";
 input_data_const_net_2 <= B"00000000";
----------------------------------------------------------------------
-- Inversions
----------------------------------------------------------------------
 input_reset_IN_POST_INV0_0 <= NOT RESET_GEN_C1_0_RESET;
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 output_ready_net_1        <= output_ready_net_0;
 output_ready              <= output_ready_net_1;
 output_data_net_1         <= output_data_net_0;
 output_data(511 downto 0) <= output_data_net_1;
 address_out_net_1         <= address_out_net_0;
 address_out(31 downto 0)  <= address_out_net_1;
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 input_data_net_0 <= ( B"00000000" & B"00000000" & B"00000000" & limited_counter_0_count );
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- data_packer_0
data_packer_0 : data_packer
    port map( 
        -- Inputs
        input_clk    => CLK_GEN_C0_0_CLK,
        input_reset  => input_reset_IN_POST_INV0_0,
        input_valid  => limited_counter_0_en_val,
        input_data   => input_data_net_0,
        -- Outputs
        output_ready => output_ready_net_0,
        output_data  => output_data_net_0,
        address_out  => address_out_net_0 
        );
-- limited_counter_0
limited_counter_0 : limited_counter
    port map( 
        -- Inputs
        clk    => CLK_GEN_C0_0_CLK,
        rst_N  => RESET_GEN_C1_0_RESET,
        -- Outputs
        en_val => limited_counter_0_en_val,
        count  => limited_counter_0_count 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );

end RTL;

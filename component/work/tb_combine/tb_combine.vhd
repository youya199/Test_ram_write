----------------------------------------------------------------------
-- Created by SmartDesign Wed Dec 13 16:17:22 2023
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
-- tb_combine entity declaration
----------------------------------------------------------------------
entity tb_combine is
    -- Port list
    port(
        -- Outputs
        combined_EN : out std_logic
        );
end tb_combine;
----------------------------------------------------------------------
-- tb_combine architecture body
----------------------------------------------------------------------
architecture RTL of tb_combine is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- bit12_counter
component bit12_counter
    -- Port list
    port(
        -- Inputs
        clk            : in  std_logic;
        rst_N          : in  std_logic;
        -- Outputs
        count          : out std_logic_vector(7 downto 0);
        en_val         : out std_logic;
        turn_on_writer : out std_logic
        );
end component;
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
-- PULSE_GEN_C0
component PULSE_GEN_C0
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal bit12_counter_0_count1to1 : std_logic_vector(1 to 1);
signal CLK_GEN_C0_0_CLK          : std_logic;
signal CLK_GEN_C1_0_CLK          : std_logic;
signal combined_EN_net_0         : std_logic;
signal PULSE_GEN_C0_0_PULSE      : std_logic;
signal combined_EN_net_1         : std_logic;
signal count_slice_0             : std_logic_vector(0 to 0);
signal count_slice_1             : std_logic_vector(2 to 2);
signal count_slice_2             : std_logic_vector(3 to 3);
signal count_slice_3             : std_logic_vector(4 to 4);
signal count_slice_4             : std_logic_vector(5 to 5);
signal count_slice_5             : std_logic_vector(6 to 6);
signal count_slice_6             : std_logic_vector(7 to 7);
signal count_net_0               : std_logic_vector(7 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net                   : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 combined_EN_net_1 <= combined_EN_net_0;
 combined_EN       <= combined_EN_net_1;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 bit12_counter_0_count1to1(1) <= count_net_0(1);
 count_slice_0(0)             <= count_net_0(0);
 count_slice_1(2)             <= count_net_0(2);
 count_slice_2(3)             <= count_net_0(3);
 count_slice_3(4)             <= count_net_0(4);
 count_slice_4(5)             <= count_net_0(5);
 count_slice_5(6)             <= count_net_0(6);
 count_slice_6(7)             <= count_net_0(7);
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- bit12_counter_0
bit12_counter_0 : bit12_counter
    port map( 
        -- Inputs
        clk            => CLK_GEN_C0_0_CLK,
        rst_N          => VCC_net,
        -- Outputs
        turn_on_writer => OPEN,
        en_val         => OPEN,
        count          => count_net_0 
        );
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
-- combine_0
combine_0 : combine
    port map( 
        -- Inputs
        clk            => CLK_GEN_C0_0_CLK,
        reset_n        => VCC_net,
        turn_on_wrtier => PULSE_GEN_C0_0_PULSE,
        EN             => CLK_GEN_C1_0_CLK,
        -- Outputs
        combined_EN    => combined_EN_net_0 
        );
-- PULSE_GEN_C0_0
PULSE_GEN_C0_0 : PULSE_GEN_C0
    port map( 
        -- Outputs
        PULSE => PULSE_GEN_C0_0_PULSE 
        );

end RTL;

----------------------------------------------------------------------
-- Created by SmartDesign Sun Feb  4 17:09:26 2024
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
-- tb_allignedFSM entity declaration
----------------------------------------------------------------------
entity tb_allignedFSM is
    -- Port list
    port(
        -- Outputs
        test_out : out std_logic_vector(7 downto 0)
        );
end tb_allignedFSM;
----------------------------------------------------------------------
-- tb_allignedFSM architecture body
----------------------------------------------------------------------
architecture RTL of tb_allignedFSM is
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
-- PULSE_GEN_C0
component PULSE_GEN_C0
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end component;
-- read_control
component read_control
    -- Port list
    port(
        -- Inputs
        clk      : in  std_logic;
        enable   : in  std_logic;
        test_in  : in  std_logic_vector(7 downto 0);
        -- Outputs
        test_out : out std_logic_vector(7 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal bit12_counter_0_count : std_logic_vector(7 downto 0);
signal CLK_GEN_C0_0_CLK      : std_logic;
signal PULSE_GEN_C0_0_PULSE  : std_logic;
signal test_out_net_0        : std_logic_vector(7 downto 0);
signal test_out_net_1        : std_logic_vector(7 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net               : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 test_out_net_1       <= test_out_net_0;
 test_out(7 downto 0) <= test_out_net_1;
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
        count          => bit12_counter_0_count 
        );
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
-- read_control_0
read_control_0 : read_control
    port map( 
        -- Inputs
        clk      => CLK_GEN_C0_0_CLK,
        enable   => PULSE_GEN_C0_0_PULSE,
        test_in  => bit12_counter_0_count,
        -- Outputs
        test_out => test_out_net_0 
        );

end RTL;

----------------------------------------------------------------------
-- Created by SmartDesign Tue Dec 19 13:49:38 2023
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
-- tb_SR13 entity declaration
----------------------------------------------------------------------
entity tb_SR13 is
    -- Port list
    port(
        -- Outputs
        B_ADDR     : out std_logic_vector(17 downto 0);
        B_DOUT     : out std_logic_vector(31 downto 0);
        B_WEN      : out std_logic;
        write_done : out std_logic
        );
end tb_SR13;
----------------------------------------------------------------------
-- tb_SR13 architecture body
----------------------------------------------------------------------
architecture RTL of tb_SR13 is
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
-- RamWriter
component RamWriter
    -- Port list
    port(
        -- Inputs
        ACLK           : in  std_logic;
        ARESETN        : in  std_logic;
        B_DIN          : in  std_logic_vector(31 downto 0);
        turn_on_writer : in  std_logic;
        value_en       : in  std_logic;
        value_in       : in  std_logic_vector(31 downto 0);
        -- Outputs
        B_ADDR         : out std_logic_vector(17 downto 0);
        B_DOUT         : out std_logic_vector(31 downto 0);
        B_WEN          : out std_logic;
        write_done     : out std_logic
        );
end component;
-- RESET_GEN_C0
component RESET_GEN_C0
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal B_ADDR_net_0          : std_logic_vector(17 downto 0);
signal B_DOUT_net_0          : std_logic_vector(31 downto 0);
signal B_WEN_net_0           : std_logic;
signal bit12_counter_0_count : std_logic_vector(7 downto 0);
signal CLK_GEN_C0_0_CLK      : std_logic;
signal CLK_GEN_C1_0_CLK      : std_logic;
signal RESET_GEN_C0_0_RESET  : std_logic;
signal write_done_net_0      : std_logic;
signal B_WEN_net_1           : std_logic;
signal write_done_net_1      : std_logic;
signal B_DOUT_net_1          : std_logic_vector(31 downto 0);
signal B_ADDR_net_1          : std_logic_vector(17 downto 0);
signal value_in_net_0        : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net               : std_logic;
signal value_in_const_net_0  : std_logic_vector(15 downto 8);
signal value_in_const_net_1  : std_logic_vector(23 downto 16);
signal value_in_const_net_2  : std_logic_vector(31 downto 24);
signal B_DIN_const_net_0     : std_logic_vector(31 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net              <= '1';
 value_in_const_net_0 <= B"00000000";
 value_in_const_net_1 <= B"00000000";
 value_in_const_net_2 <= B"00000000";
 B_DIN_const_net_0    <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 B_WEN_net_1         <= B_WEN_net_0;
 B_WEN               <= B_WEN_net_1;
 write_done_net_1    <= write_done_net_0;
 write_done          <= write_done_net_1;
 B_DOUT_net_1        <= B_DOUT_net_0;
 B_DOUT(31 downto 0) <= B_DOUT_net_1;
 B_ADDR_net_1        <= B_ADDR_net_0;
 B_ADDR(17 downto 0) <= B_ADDR_net_1;
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 value_in_net_0 <= ( B"00000000" & B"00000000" & B"00000000" & bit12_counter_0_count );
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
-- CLK_GEN_C1_0
CLK_GEN_C1_0 : CLK_GEN_C1
    port map( 
        -- Outputs
        CLK => CLK_GEN_C1_0_CLK 
        );
-- RamWriter_0
RamWriter_0 : RamWriter
    port map( 
        -- Inputs
        value_in       => value_in_net_0,
        value_en       => CLK_GEN_C1_0_CLK,
        turn_on_writer => VCC_net,
        ACLK           => CLK_GEN_C0_0_CLK,
        ARESETN        => VCC_net,
        B_DIN          => B_DIN_const_net_0,
        -- Outputs
        write_done     => write_done_net_0,
        B_ADDR         => B_ADDR_net_0,
        B_WEN          => B_WEN_net_0,
        B_DOUT         => B_DOUT_net_0 
        );
-- RESET_GEN_C0_0
RESET_GEN_C0_0 : RESET_GEN_C0
    port map( 
        -- Outputs
        RESET => RESET_GEN_C0_0_RESET 
        );

end RTL;

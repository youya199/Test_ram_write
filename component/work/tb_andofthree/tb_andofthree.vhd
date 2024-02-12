----------------------------------------------------------------------
-- Created by SmartDesign Fri Feb  9 09:26:07 2024
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
-- tb_andofthree entity declaration
----------------------------------------------------------------------
entity tb_andofthree is
    -- Port list
    port(
        -- Outputs
        addr        : out std_logic_vector(31 downto 0);
        start_write : out std_logic
        );
end tb_andofthree;
----------------------------------------------------------------------
-- tb_andofthree architecture body
----------------------------------------------------------------------
architecture RTL of tb_andofthree is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AndOfThree
component AndOfThree
    -- Port list
    port(
        -- Inputs
        clk         : in  std_logic;
        input_valid : in  std_logic;
        reset_n     : in  std_logic;
        -- Outputs
        addr        : out std_logic_vector(31 downto 0);
        start_write : out std_logic
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
signal addr_net_0           : std_logic_vector(31 downto 0);
signal CLK_GEN_C0_0_CLK     : std_logic;
signal RESET_GEN_C1_0_RESET : std_logic;
signal start_write_net_0    : std_logic;
signal start_write_net_1    : std_logic;
signal addr_net_1           : std_logic_vector(31 downto 0);
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
 start_write_net_1 <= start_write_net_0;
 start_write       <= start_write_net_1;
 addr_net_1        <= addr_net_0;
 addr(31 downto 0) <= addr_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AndOfThree_0
AndOfThree_0 : AndOfThree
    port map( 
        -- Inputs
        clk         => CLK_GEN_C0_0_CLK,
        reset_n     => RESET_GEN_C1_0_RESET,
        input_valid => GND_net,
        -- Outputs
        addr        => addr_net_0,
        start_write => start_write_net_0 
        );
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

end RTL;

----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb 13 14:19:31 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of CLK_GEN_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component CLK_GEN_C0
--create_and_configure_core -core_vlnv {Actel:Simulation:CLK_GEN:1.0.1} -component_name {CLK_GEN_C0} -params {\
--"CLK_PERIOD:10000"  \
--"DUTY_CYCLE:50"   }
--# Exporting Component Description of CLK_GEN_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- CLK_GEN_C0 entity declaration
----------------------------------------------------------------------
entity CLK_GEN_C0 is
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end CLK_GEN_C0;
----------------------------------------------------------------------
-- CLK_GEN_C0 architecture body
----------------------------------------------------------------------
architecture RTL of CLK_GEN_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CLK_GEN   -   Actel:Simulation:CLK_GEN:1.0.1
component CLK_GEN
    generic( 
        CLK_PERIOD : integer := 10000 ;
        DUTY_CYCLE : integer := 50 
        );
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CLK_net_0 : std_logic;
signal CLK_net_1 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 CLK_net_1 <= CLK_net_0;
 CLK       <= CLK_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CLK_GEN_C0_0   -   Actel:Simulation:CLK_GEN:1.0.1
CLK_GEN_C0_0 : CLK_GEN
    generic map( 
        CLK_PERIOD => ( 10000 ),
        DUTY_CYCLE => ( 50 )
        )
    port map( 
        -- Outputs
        CLK => CLK_net_0 
        );

end RTL;

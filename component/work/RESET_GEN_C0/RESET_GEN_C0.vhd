----------------------------------------------------------------------
-- Created by SmartDesign Wed Dec 13 17:59:53 2023
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of RESET_GEN_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component RESET_GEN_C0
--create_and_configure_core -core_vlnv {Actel:Simulation:RESET_GEN:1.0.1} -component_name {RESET_GEN_C0} -params {\
--"DELAY:1000"  \
--"LOGIC_LEVEL:0"   }
--# Exporting Component Description of RESET_GEN_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- RESET_GEN_C0 entity declaration
----------------------------------------------------------------------
entity RESET_GEN_C0 is
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end RESET_GEN_C0;
----------------------------------------------------------------------
-- RESET_GEN_C0 architecture body
----------------------------------------------------------------------
architecture RTL of RESET_GEN_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- RESET_GEN   -   Actel:Simulation:RESET_GEN:1.0.1
component RESET_GEN
    generic( 
        DELAY       : integer := 1000 ;
        LOGIC_LEVEL : integer := 0 
        );
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal RESET_net_0 : std_logic;
signal RESET_net_1 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 RESET_net_1 <= RESET_net_0;
 RESET       <= RESET_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- RESET_GEN_C0_0   -   Actel:Simulation:RESET_GEN:1.0.1
RESET_GEN_C0_0 : RESET_GEN
    generic map( 
        DELAY       => ( 1000 ),
        LOGIC_LEVEL => ( 0 )
        )
    port map( 
        -- Outputs
        RESET => RESET_net_0 
        );

end RTL;

----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb 20 13:14:19 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of RESET_GEN_C1 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component RESET_GEN_C1
--create_and_configure_core -core_vlnv {Actel:Simulation:RESET_GEN:1.0.1} -component_name {RESET_GEN_C1} -params {\
--"DELAY:0"  \
--"LOGIC_LEVEL:0"   }
--# Exporting Component Description of RESET_GEN_C1 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- RESET_GEN_C1 entity declaration
----------------------------------------------------------------------
entity RESET_GEN_C1 is
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end RESET_GEN_C1;
----------------------------------------------------------------------
-- RESET_GEN_C1 architecture body
----------------------------------------------------------------------
architecture RTL of RESET_GEN_C1 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- RESET_GEN   -   Actel:Simulation:RESET_GEN:1.0.1
component RESET_GEN
    generic( 
        DELAY       : integer := 0 ;
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
-- RESET_GEN_C1_0   -   Actel:Simulation:RESET_GEN:1.0.1
RESET_GEN_C1_0 : RESET_GEN
    generic map( 
        DELAY       => ( 0 ),
        LOGIC_LEVEL => ( 0 )
        )
    port map( 
        -- Outputs
        RESET => RESET_net_0 
        );

end RTL;

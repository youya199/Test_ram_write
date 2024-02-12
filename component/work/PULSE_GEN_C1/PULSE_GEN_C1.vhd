----------------------------------------------------------------------
-- Created by SmartDesign Wed Dec 13 15:34:57 2023
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of PULSE_GEN_C1 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component PULSE_GEN_C1
--create_and_configure_core -core_vlnv {Actel:Simulation:PULSE_GEN:1.0.1} -component_name {PULSE_GEN_C1} -params {\
--"PULSE_START_TIME:2000"  \
--"PULSE_TYPE:0"  \
--"PULSE_WIDTH:100"   }
--# Exporting Component Description of PULSE_GEN_C1 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- PULSE_GEN_C1 entity declaration
----------------------------------------------------------------------
entity PULSE_GEN_C1 is
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end PULSE_GEN_C1;
----------------------------------------------------------------------
-- PULSE_GEN_C1 architecture body
----------------------------------------------------------------------
architecture RTL of PULSE_GEN_C1 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- PULSE_GEN   -   Actel:Simulation:PULSE_GEN:1.0.1
component PULSE_GEN
    generic( 
        PULSE_START_TIME : integer := 2000 ;
        PULSE_TYPE       : integer := 0 ;
        PULSE_WIDTH      : integer := 100 
        );
    -- Port list
    port(
        -- Outputs
        PULSE : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal PULSE_net_0 : std_logic;
signal PULSE_net_1 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 PULSE_net_1 <= PULSE_net_0;
 PULSE       <= PULSE_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- PULSE_GEN_C1_0   -   Actel:Simulation:PULSE_GEN:1.0.1
PULSE_GEN_C1_0 : PULSE_GEN
    generic map( 
        PULSE_START_TIME => ( 2000 ),
        PULSE_TYPE       => ( 0 ),
        PULSE_WIDTH      => ( 100 )
        )
    port map( 
        -- Outputs
        PULSE => PULSE_net_0 
        );

end RTL;

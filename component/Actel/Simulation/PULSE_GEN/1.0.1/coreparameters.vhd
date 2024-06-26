----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Mon Mar 11 16:10:23 2024
-- Parameters for PULSE_GEN
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant PULSE_START_TIME : integer := 1000;
    constant PULSE_TYPE : integer := 0;
    constant PULSE_WIDTH : integer := 100;
end coreparameters;

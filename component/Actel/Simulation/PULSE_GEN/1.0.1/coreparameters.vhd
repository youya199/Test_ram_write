----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Feb  8 17:32:58 2024
-- Parameters for PULSE_GEN
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant PULSE_START_TIME : integer := 1020;
    constant PULSE_TYPE : integer := 0;
    constant PULSE_WIDTH : integer := 5;
end coreparameters;

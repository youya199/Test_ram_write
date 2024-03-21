----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Feb 14 17:46:43 2024
-- Parameters for CLK_GEN
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant CLK_PERIOD : integer := 5555;
    constant DUTY_CYCLE : integer := 50;
end coreparameters;

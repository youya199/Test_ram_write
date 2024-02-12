----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Feb  8 14:58:41 2024
-- Parameters for COREAXI4SRAM
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant AXI4_AWIDTH : integer := 32;
    constant AXI4_DWIDTH : integer := 64;
    constant AXI4_IDWIDTH : integer := 4;
    constant AXI4_IFTYPE_RD : integer := 1;
    constant AXI4_IFTYPE_WR : integer := 1;
    constant FAMILY : integer := 26;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant MEM_DEPTH : integer := 512;
    constant SEL_SRAM_TYPE : integer := 1;
    constant testbench : string( 1 to 4 ) := "User";
    constant WRAP_SUPPORT : integer := 0;
end coreparameters;

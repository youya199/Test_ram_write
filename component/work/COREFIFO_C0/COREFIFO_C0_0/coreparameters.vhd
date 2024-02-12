----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Feb  7 14:53:28 2024
-- Parameters for COREFIFO
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant AE_STATIC_EN : integer := 0;
    constant AEVAL : integer := 4;
    constant AF_STATIC_EN : integer := 0;
    constant AFVAL : integer := 1020;
    constant CTRL_TYPE : integer := 1;
    constant DIE_SIZE : integer := 15;
    constant ECC : integer := 0;
    constant ESTOP : integer := 1;
    constant FAMILY : integer := 26;
    constant FSTOP : integer := 1;
    constant FWFT : integer := 0;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant NUM_STAGES : integer := 2;
    constant OVERFLOW_EN : integer := 0;
    constant PIPE : integer := 2;
    constant PREFETCH : integer := 0;
    constant RAM_OPT : integer := 0;
    constant RDCNT_EN : integer := 0;
    constant RDEPTH : integer := 1;
    constant RE_POLARITY : integer := 0;
    constant READ_DVALID : integer := 1;
    constant RWIDTH : integer := 16;
    constant SYNC : integer := 1;
    constant SYNC_RESET : integer := 0;
    constant testbench : string( 1 to 4 ) := "User";
    constant UNDERFLOW_EN : integer := 0;
    constant WDEPTH : integer := 2;
    constant WE_POLARITY : integer := 0;
    constant WRCNT_EN : integer := 0;
    constant WRITE_ACK : integer := 0;
    constant WWIDTH : integer := 8;
end coreparameters;

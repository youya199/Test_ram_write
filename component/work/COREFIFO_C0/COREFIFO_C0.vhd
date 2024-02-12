----------------------------------------------------------------------
-- Created by SmartDesign Wed Feb  7 14:53:28 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREFIFO_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component COREFIFO_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C0} -params {\
--"AE_STATIC_EN:false"  \
--"AEVAL:4"  \
--"AF_STATIC_EN:false"  \
--"AFVAL:1020"  \
--"CTRL_TYPE:1"  \
--"DIE_SIZE:15"  \
--"ECC:0"  \
--"ESTOP:true"  \
--"FSTOP:true"  \
--"FWFT:false"  \
--"NUM_STAGES:2"  \
--"OVERFLOW_EN:false"  \
--"PIPE:2"  \
--"PREFETCH:false"  \
--"RAM_OPT:0"  \
--"RDCNT_EN:false"  \
--"RDEPTH:1"  \
--"RE_POLARITY:0"  \
--"READ_DVALID:true"  \
--"RWIDTH:16"  \
--"SYNC:1"  \
--"SYNC_RESET:0"  \
--"UNDERFLOW_EN:false"  \
--"WDEPTH:2"  \
--"WE_POLARITY:0"  \
--"WRCNT_EN:false"  \
--"WRITE_ACK:false"  \
--"WWIDTH:8"   }
--# Exporting Component Description of COREFIFO_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
library COREFIFO_LIB;
use COREFIFO_LIB.all;
----------------------------------------------------------------------
-- COREFIFO_C0 entity declaration
----------------------------------------------------------------------
entity COREFIFO_C0 is
    -- Port list
    port(
        -- Inputs
        CLK      : in  std_logic;
        DATA     : in  std_logic_vector(7 downto 0);
        RE       : in  std_logic;
        RESET_N  : in  std_logic;
        WE       : in  std_logic;
        -- Outputs
        DVLD     : out std_logic;
        EMPTY    : out std_logic;
        FULL     : out std_logic;
        MEMRADDR : out std_logic_vector(0 to 0);
        MEMRE    : out std_logic;
        MEMWADDR : out std_logic_vector(0 to 0);
        MEMWE    : out std_logic;
        Q        : out std_logic_vector(15 downto 0)
        );
end COREFIFO_C0;
----------------------------------------------------------------------
-- COREFIFO_C0 architecture body
----------------------------------------------------------------------
architecture RTL of COREFIFO_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREFIFO_C0_COREFIFO_C0_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
component COREFIFO_C0_COREFIFO_C0_0_COREFIFO
    generic( 
        AE_STATIC_EN : integer := 0 ;
        AEVAL        : integer := 4 ;
        AF_STATIC_EN : integer := 0 ;
        AFVAL        : integer := 1020 ;
        CTRL_TYPE    : integer := 1 ;
        DIE_SIZE     : integer := 15 ;
        ECC          : integer := 0 ;
        ESTOP        : integer := 1 ;
        FAMILY       : integer := 26 ;
        FSTOP        : integer := 1 ;
        FWFT         : integer := 0 ;
        NUM_STAGES   : integer := 2 ;
        OVERFLOW_EN  : integer := 0 ;
        PIPE         : integer := 2 ;
        PREFETCH     : integer := 0 ;
        RAM_OPT      : integer := 0 ;
        RDCNT_EN     : integer := 0 ;
        RDEPTH       : integer := 1 ;
        RE_POLARITY  : integer := 0 ;
        READ_DVALID  : integer := 1 ;
        RWIDTH       : integer := 16 ;
        SYNC         : integer := 1 ;
        SYNC_RESET   : integer := 0 ;
        UNDERFLOW_EN : integer := 0 ;
        WDEPTH       : integer := 2 ;
        WE_POLARITY  : integer := 0 ;
        WRCNT_EN     : integer := 0 ;
        WRITE_ACK    : integer := 0 ;
        WWIDTH       : integer := 8 
        );
    -- Port list
    port(
        -- Inputs
        CLK        : in  std_logic;
        DATA       : in  std_logic_vector(7 downto 0);
        MEMRD      : in  std_logic_vector(15 downto 0);
        RCLOCK     : in  std_logic;
        RE         : in  std_logic;
        RESET_N    : in  std_logic;
        RRESET_N   : in  std_logic;
        WCLOCK     : in  std_logic;
        WE         : in  std_logic;
        WRESET_N   : in  std_logic;
        -- Outputs
        AEMPTY     : out std_logic;
        AFULL      : out std_logic;
        DB_DETECT  : out std_logic;
        DVLD       : out std_logic;
        EMPTY      : out std_logic;
        FULL       : out std_logic;
        MEMRADDR   : out std_logic_vector(0 to 0);
        MEMRE      : out std_logic;
        MEMWADDR   : out std_logic_vector(0 to 0);
        MEMWD      : out std_logic_vector(7 downto 0);
        MEMWE      : out std_logic;
        OVERFLOW   : out std_logic;
        Q          : out std_logic_vector(15 downto 0);
        RDCNT      : out std_logic_vector(0 to 0);
        SB_CORRECT : out std_logic;
        UNDERFLOW  : out std_logic;
        WACK       : out std_logic;
        WRCNT      : out std_logic_vector(1 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal DVLD_net_0     : std_logic;
signal EMPTY_net_0    : std_logic;
signal FULL_net_0     : std_logic;
signal MEMRADDR_net_0 : std_logic_vector(0 to 0);
signal MEMRE_net_0    : std_logic;
signal MEMWADDR_net_0 : std_logic_vector(0 to 0);
signal MEMWE_net_0    : std_logic;
signal Q_net_0        : std_logic_vector(15 downto 0);
signal FULL_net_1     : std_logic;
signal EMPTY_net_1    : std_logic;
signal DVLD_net_1     : std_logic;
signal MEMWE_net_1    : std_logic;
signal MEMRE_net_1    : std_logic;
signal Q_net_1        : std_logic_vector(15 downto 0);
signal MEMWADDR_net_1 : std_logic_vector(0 to 0);
signal MEMRADDR_net_1 : std_logic_vector(0 to 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net        : std_logic;
signal MEMRD_const_net_0: std_logic_vector(15 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net           <= '0';
 MEMRD_const_net_0 <= B"0000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 FULL_net_1        <= FULL_net_0;
 FULL              <= FULL_net_1;
 EMPTY_net_1       <= EMPTY_net_0;
 EMPTY             <= EMPTY_net_1;
 DVLD_net_1        <= DVLD_net_0;
 DVLD              <= DVLD_net_1;
 MEMWE_net_1       <= MEMWE_net_0;
 MEMWE             <= MEMWE_net_1;
 MEMRE_net_1       <= MEMRE_net_0;
 MEMRE             <= MEMRE_net_1;
 Q_net_1           <= Q_net_0;
 Q(15 downto 0)    <= Q_net_1;
 MEMWADDR_net_1(0) <= MEMWADDR_net_0(0);
 MEMWADDR(0)       <= MEMWADDR_net_1(0);
 MEMRADDR_net_1(0) <= MEMRADDR_net_0(0);
 MEMRADDR(0)       <= MEMRADDR_net_1(0);
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREFIFO_C0_0   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C0_0 : COREFIFO_C0_COREFIFO_C0_0_COREFIFO
    generic map( 
        AE_STATIC_EN => ( 0 ),
        AEVAL        => ( 4 ),
        AF_STATIC_EN => ( 0 ),
        AFVAL        => ( 1020 ),
        CTRL_TYPE    => ( 1 ),
        DIE_SIZE     => ( 15 ),
        ECC          => ( 0 ),
        ESTOP        => ( 1 ),
        FAMILY       => ( 26 ),
        FSTOP        => ( 1 ),
        FWFT         => ( 0 ),
        NUM_STAGES   => ( 2 ),
        OVERFLOW_EN  => ( 0 ),
        PIPE         => ( 2 ),
        PREFETCH     => ( 0 ),
        RAM_OPT      => ( 0 ),
        RDCNT_EN     => ( 0 ),
        RDEPTH       => ( 1 ),
        RE_POLARITY  => ( 0 ),
        READ_DVALID  => ( 1 ),
        RWIDTH       => ( 16 ),
        SYNC         => ( 1 ),
        SYNC_RESET   => ( 0 ),
        UNDERFLOW_EN => ( 0 ),
        WDEPTH       => ( 2 ),
        WE_POLARITY  => ( 0 ),
        WRCNT_EN     => ( 0 ),
        WRITE_ACK    => ( 0 ),
        WWIDTH       => ( 8 )
        )
    port map( 
        -- Inputs
        CLK        => CLK,
        WCLOCK     => GND_net, -- tied to '0' from definition
        RCLOCK     => GND_net, -- tied to '0' from definition
        RESET_N    => RESET_N,
        WRESET_N   => GND_net, -- tied to '0' from definition
        RRESET_N   => GND_net, -- tied to '0' from definition
        WE         => WE,
        RE         => RE,
        DATA       => DATA,
        MEMRD      => MEMRD_const_net_0, -- tied to X"0" from definition
        -- Outputs
        FULL       => FULL_net_0,
        EMPTY      => EMPTY_net_0,
        AFULL      => OPEN,
        AEMPTY     => OPEN,
        OVERFLOW   => OPEN,
        UNDERFLOW  => OPEN,
        WACK       => OPEN,
        DVLD       => DVLD_net_0,
        MEMWE      => MEMWE_net_0,
        MEMRE      => MEMRE_net_0,
        SB_CORRECT => OPEN,
        DB_DETECT  => OPEN,
        Q          => Q_net_0,
        WRCNT      => OPEN,
        RDCNT      => OPEN,
        MEMWADDR   => MEMWADDR_net_0,
        MEMRADDR   => MEMRADDR_net_0,
        MEMWD      => OPEN 
        );

end RTL;

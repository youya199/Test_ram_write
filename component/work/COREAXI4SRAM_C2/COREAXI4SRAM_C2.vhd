----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb  8 15:10:07 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREAXI4SRAM_C2 to TCL
--# Family: PolarFire
--# Part Number: MPF300TS-1FCG1152I
--# Create and Configure the core component COREAXI4SRAM_C2
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREAXI4SRAM:2.1.105} -component_name {COREAXI4SRAM_C2} -params {\
--"AXI4_AWIDTH:32"  \
--"AXI4_DWIDTH:64"  \
--"AXI4_IDWIDTH:4"  \
--"AXI4_IFTYPE_RD:true"  \
--"AXI4_IFTYPE_WR:true"  \
--"MEM_DEPTH:512"  \
--"SEL_SRAM_TYPE:1"  \
--"WRAP_SUPPORT:false"   }
--# Exporting Component Description of COREAXI4SRAM_C2 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
library COREAXI4SRAM_LIB;
use COREAXI4SRAM_LIB.all;
----------------------------------------------------------------------
-- COREAXI4SRAM_C2 entity declaration
----------------------------------------------------------------------
entity COREAXI4SRAM_C2 is
    -- Port list
    port(
        -- Inputs
        ACLK    : in  std_logic;
        ARADDR  : in  std_logic_vector(31 downto 0);
        ARBURST : in  std_logic_vector(1 downto 0);
        ARCACHE : in  std_logic_vector(3 downto 0);
        ARESETN : in  std_logic;
        ARID    : in  std_logic_vector(3 downto 0);
        ARLEN   : in  std_logic_vector(7 downto 0);
        ARLOCK  : in  std_logic_vector(1 downto 0);
        ARPROT  : in  std_logic_vector(2 downto 0);
        ARSIZE  : in  std_logic_vector(2 downto 0);
        ARVALID : in  std_logic;
        AWADDR  : in  std_logic_vector(31 downto 0);
        AWBURST : in  std_logic_vector(1 downto 0);
        AWCACHE : in  std_logic_vector(3 downto 0);
        AWID    : in  std_logic_vector(3 downto 0);
        AWLEN   : in  std_logic_vector(7 downto 0);
        AWLOCK  : in  std_logic_vector(1 downto 0);
        AWPROT  : in  std_logic_vector(2 downto 0);
        AWSIZE  : in  std_logic_vector(2 downto 0);
        AWVALID : in  std_logic;
        BREADY  : in  std_logic;
        RREADY  : in  std_logic;
        WDATA   : in  std_logic_vector(63 downto 0);
        WLAST   : in  std_logic;
        WSTRB   : in  std_logic_vector(7 downto 0);
        WVALID  : in  std_logic;
        -- Outputs
        ARREADY : out std_logic;
        AWREADY : out std_logic;
        BID     : out std_logic_vector(3 downto 0);
        BRESP   : out std_logic_vector(1 downto 0);
        BVALID  : out std_logic;
        RDATA   : out std_logic_vector(63 downto 0);
        RID     : out std_logic_vector(3 downto 0);
        RLAST   : out std_logic;
        RRESP   : out std_logic_vector(1 downto 0);
        RVALID  : out std_logic;
        WREADY  : out std_logic
        );
end COREAXI4SRAM_C2;
----------------------------------------------------------------------
-- COREAXI4SRAM_C2 architecture body
----------------------------------------------------------------------
architecture RTL of COREAXI4SRAM_C2 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_COREAXI4SRAM   -   Actel:DirectCore:COREAXI4SRAM:2.1.105
component COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_COREAXI4SRAM
    generic( 
        AXI4_AWIDTH    : integer := 32 ;
        AXI4_DWIDTH    : integer := 64 ;
        AXI4_IDWIDTH   : integer := 4 ;
        AXI4_IFTYPE_RD : integer := 1 ;
        AXI4_IFTYPE_WR : integer := 1 ;
        FAMILY         : integer := 26 ;
        MEM_DEPTH      : integer := 512 ;
        SEL_SRAM_TYPE  : integer := 1 ;
        WRAP_SUPPORT   : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        ACLK    : in  std_logic;
        ARADDR  : in  std_logic_vector(31 downto 0);
        ARBURST : in  std_logic_vector(1 downto 0);
        ARCACHE : in  std_logic_vector(3 downto 0);
        ARESETN : in  std_logic;
        ARID    : in  std_logic_vector(3 downto 0);
        ARLEN   : in  std_logic_vector(7 downto 0);
        ARLOCK  : in  std_logic_vector(1 downto 0);
        ARPROT  : in  std_logic_vector(2 downto 0);
        ARSIZE  : in  std_logic_vector(2 downto 0);
        ARVALID : in  std_logic;
        AWADDR  : in  std_logic_vector(31 downto 0);
        AWBURST : in  std_logic_vector(1 downto 0);
        AWCACHE : in  std_logic_vector(3 downto 0);
        AWID    : in  std_logic_vector(3 downto 0);
        AWLEN   : in  std_logic_vector(7 downto 0);
        AWLOCK  : in  std_logic_vector(1 downto 0);
        AWPROT  : in  std_logic_vector(2 downto 0);
        AWSIZE  : in  std_logic_vector(2 downto 0);
        AWVALID : in  std_logic;
        BREADY  : in  std_logic;
        RREADY  : in  std_logic;
        WDATA   : in  std_logic_vector(63 downto 0);
        WLAST   : in  std_logic;
        WSTRB   : in  std_logic_vector(7 downto 0);
        WVALID  : in  std_logic;
        -- Outputs
        ARREADY : out std_logic;
        AWREADY : out std_logic;
        BID     : out std_logic_vector(3 downto 0);
        BRESP   : out std_logic_vector(1 downto 0);
        BVALID  : out std_logic;
        RDATA   : out std_logic_vector(63 downto 0);
        RID     : out std_logic_vector(3 downto 0);
        RLAST   : out std_logic;
        RRESP   : out std_logic_vector(1 downto 0);
        RVALID  : out std_logic;
        WREADY  : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AXI4_Slave_ARREADY       : std_logic;
signal AXI4_Slave_AWREADY       : std_logic;
signal AXI4_Slave_BID           : std_logic_vector(3 downto 0);
signal AXI4_Slave_BRESP         : std_logic_vector(1 downto 0);
signal AXI4_Slave_BVALID        : std_logic;
signal AXI4_Slave_RDATA         : std_logic_vector(63 downto 0);
signal AXI4_Slave_RID           : std_logic_vector(3 downto 0);
signal AXI4_Slave_RLAST         : std_logic;
signal AXI4_Slave_RRESP         : std_logic_vector(1 downto 0);
signal AXI4_Slave_RVALID        : std_logic;
signal AXI4_Slave_WREADY        : std_logic;
signal AXI4_Slave_AWREADY_net_0 : std_logic;
signal AXI4_Slave_WREADY_net_0  : std_logic;
signal AXI4_Slave_BVALID_net_0  : std_logic;
signal AXI4_Slave_ARREADY_net_0 : std_logic;
signal AXI4_Slave_RDATA_net_0   : std_logic_vector(63 downto 0);
signal AXI4_Slave_RRESP_net_0   : std_logic_vector(1 downto 0);
signal AXI4_Slave_RLAST_net_0   : std_logic;
signal AXI4_Slave_RVALID_net_0  : std_logic;
signal AXI4_Slave_BRESP_net_0   : std_logic_vector(1 downto 0);
signal AXI4_Slave_BID_net_0     : std_logic_vector(3 downto 0);
signal AXI4_Slave_RID_net_0     : std_logic_vector(3 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 AXI4_Slave_AWREADY_net_0 <= AXI4_Slave_AWREADY;
 AWREADY                  <= AXI4_Slave_AWREADY_net_0;
 AXI4_Slave_WREADY_net_0  <= AXI4_Slave_WREADY;
 WREADY                   <= AXI4_Slave_WREADY_net_0;
 AXI4_Slave_BVALID_net_0  <= AXI4_Slave_BVALID;
 BVALID                   <= AXI4_Slave_BVALID_net_0;
 AXI4_Slave_ARREADY_net_0 <= AXI4_Slave_ARREADY;
 ARREADY                  <= AXI4_Slave_ARREADY_net_0;
 AXI4_Slave_RDATA_net_0   <= AXI4_Slave_RDATA;
 RDATA(63 downto 0)       <= AXI4_Slave_RDATA_net_0;
 AXI4_Slave_RRESP_net_0   <= AXI4_Slave_RRESP;
 RRESP(1 downto 0)        <= AXI4_Slave_RRESP_net_0;
 AXI4_Slave_RLAST_net_0   <= AXI4_Slave_RLAST;
 RLAST                    <= AXI4_Slave_RLAST_net_0;
 AXI4_Slave_RVALID_net_0  <= AXI4_Slave_RVALID;
 RVALID                   <= AXI4_Slave_RVALID_net_0;
 AXI4_Slave_BRESP_net_0   <= AXI4_Slave_BRESP;
 BRESP(1 downto 0)        <= AXI4_Slave_BRESP_net_0;
 AXI4_Slave_BID_net_0     <= AXI4_Slave_BID;
 BID(3 downto 0)          <= AXI4_Slave_BID_net_0;
 AXI4_Slave_RID_net_0     <= AXI4_Slave_RID;
 RID(3 downto 0)          <= AXI4_Slave_RID_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREAXI4SRAM_C2_0   -   Actel:DirectCore:COREAXI4SRAM:2.1.105
COREAXI4SRAM_C2_0 : COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_COREAXI4SRAM
    generic map( 
        AXI4_AWIDTH    => ( 32 ),
        AXI4_DWIDTH    => ( 64 ),
        AXI4_IDWIDTH   => ( 4 ),
        AXI4_IFTYPE_RD => ( 1 ),
        AXI4_IFTYPE_WR => ( 1 ),
        FAMILY         => ( 26 ),
        MEM_DEPTH      => ( 512 ),
        SEL_SRAM_TYPE  => ( 1 ),
        WRAP_SUPPORT   => ( 0 )
        )
    port map( 
        -- Inputs
        ACLK    => ACLK,
        ARESETN => ARESETN,
        AWADDR  => AWADDR,
        AWLEN   => AWLEN,
        AWSIZE  => AWSIZE,
        AWBURST => AWBURST,
        AWCACHE => AWCACHE,
        AWPROT  => AWPROT,
        AWLOCK  => AWLOCK,
        AWVALID => AWVALID,
        WDATA   => WDATA,
        WSTRB   => WSTRB,
        WLAST   => WLAST,
        WVALID  => WVALID,
        BREADY  => BREADY,
        ARADDR  => ARADDR,
        ARLEN   => ARLEN,
        ARSIZE  => ARSIZE,
        ARBURST => ARBURST,
        ARCACHE => ARCACHE,
        ARPROT  => ARPROT,
        ARLOCK  => ARLOCK,
        ARVALID => ARVALID,
        RREADY  => RREADY,
        AWID    => AWID,
        ARID    => ARID,
        -- Outputs
        AWREADY => AXI4_Slave_AWREADY,
        WREADY  => AXI4_Slave_WREADY,
        BRESP   => AXI4_Slave_BRESP,
        BVALID  => AXI4_Slave_BVALID,
        ARREADY => AXI4_Slave_ARREADY,
        RDATA   => AXI4_Slave_RDATA,
        RRESP   => AXI4_Slave_RRESP,
        RLAST   => AXI4_Slave_RLAST,
        RVALID  => AXI4_Slave_RVALID,
        RID     => AXI4_Slave_RID,
        BID     => AXI4_Slave_BID 
        );

end RTL;

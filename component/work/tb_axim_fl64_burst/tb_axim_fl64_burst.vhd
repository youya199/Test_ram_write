----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb 13 10:00:40 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- tb_axim_fl64_burst entity declaration
----------------------------------------------------------------------
entity tb_axim_fl64_burst is
end tb_axim_fl64_burst;
----------------------------------------------------------------------
-- tb_axim_fl64_burst architecture body
----------------------------------------------------------------------
architecture RTL of tb_axim_fl64_burst is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AndOfThree
component AndOfThree
    -- Port list
    port(
        -- Inputs
        clk         : in  std_logic;
        input_valid : in  std_logic;
        reset_n     : in  std_logic;
        -- Outputs
        addr        : out std_logic_vector(31 downto 0);
        start_write : out std_logic
        );
end component;
-- axiM_fl64_burst
-- using entity instantiation for component axiM_fl64_burst
-- CLK_GEN_C0
component CLK_GEN_C0
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
-- COREAXI4INTERCONNECT_C0
component COREAXI4INTERCONNECT_C0
    -- Port list
    port(
        -- Inputs
        ACLK             : in  std_logic;
        ARESETN          : in  std_logic;
        MASTER0_ARADDR   : in  std_logic_vector(31 downto 0);
        MASTER0_ARBURST  : in  std_logic_vector(1 downto 0);
        MASTER0_ARCACHE  : in  std_logic_vector(3 downto 0);
        MASTER0_ARID     : in  std_logic_vector(0 to 0);
        MASTER0_ARLEN    : in  std_logic_vector(7 downto 0);
        MASTER0_ARLOCK   : in  std_logic_vector(1 downto 0);
        MASTER0_ARPROT   : in  std_logic_vector(2 downto 0);
        MASTER0_ARQOS    : in  std_logic_vector(3 downto 0);
        MASTER0_ARREGION : in  std_logic_vector(3 downto 0);
        MASTER0_ARSIZE   : in  std_logic_vector(2 downto 0);
        MASTER0_ARUSER   : in  std_logic_vector(0 to 0);
        MASTER0_ARVALID  : in  std_logic;
        MASTER0_AWADDR   : in  std_logic_vector(31 downto 0);
        MASTER0_AWBURST  : in  std_logic_vector(1 downto 0);
        MASTER0_AWCACHE  : in  std_logic_vector(3 downto 0);
        MASTER0_AWID     : in  std_logic_vector(0 to 0);
        MASTER0_AWLEN    : in  std_logic_vector(7 downto 0);
        MASTER0_AWLOCK   : in  std_logic_vector(1 downto 0);
        MASTER0_AWPROT   : in  std_logic_vector(2 downto 0);
        MASTER0_AWQOS    : in  std_logic_vector(3 downto 0);
        MASTER0_AWREGION : in  std_logic_vector(3 downto 0);
        MASTER0_AWSIZE   : in  std_logic_vector(2 downto 0);
        MASTER0_AWUSER   : in  std_logic_vector(0 to 0);
        MASTER0_AWVALID  : in  std_logic;
        MASTER0_BREADY   : in  std_logic;
        MASTER0_RREADY   : in  std_logic;
        MASTER0_WDATA    : in  std_logic_vector(63 downto 0);
        MASTER0_WLAST    : in  std_logic;
        MASTER0_WSTRB    : in  std_logic_vector(7 downto 0);
        MASTER0_WUSER    : in  std_logic_vector(0 to 0);
        MASTER0_WVALID   : in  std_logic;
        SLAVE0_ARREADY   : in  std_logic;
        SLAVE0_AWREADY   : in  std_logic;
        SLAVE0_BID       : in  std_logic_vector(1 downto 0);
        SLAVE0_BRESP     : in  std_logic_vector(1 downto 0);
        SLAVE0_BUSER     : in  std_logic_vector(0 to 0);
        SLAVE0_BVALID    : in  std_logic;
        SLAVE0_RDATA     : in  std_logic_vector(63 downto 0);
        SLAVE0_RID       : in  std_logic_vector(1 downto 0);
        SLAVE0_RLAST     : in  std_logic;
        SLAVE0_RRESP     : in  std_logic_vector(1 downto 0);
        SLAVE0_RUSER     : in  std_logic_vector(0 to 0);
        SLAVE0_RVALID    : in  std_logic;
        SLAVE0_WREADY    : in  std_logic;
        -- Outputs
        MASTER0_ARREADY  : out std_logic;
        MASTER0_AWREADY  : out std_logic;
        MASTER0_BID      : out std_logic_vector(0 to 0);
        MASTER0_BRESP    : out std_logic_vector(1 downto 0);
        MASTER0_BUSER    : out std_logic_vector(0 to 0);
        MASTER0_BVALID   : out std_logic;
        MASTER0_RDATA    : out std_logic_vector(63 downto 0);
        MASTER0_RID      : out std_logic_vector(0 to 0);
        MASTER0_RLAST    : out std_logic;
        MASTER0_RRESP    : out std_logic_vector(1 downto 0);
        MASTER0_RUSER    : out std_logic_vector(0 to 0);
        MASTER0_RVALID   : out std_logic;
        MASTER0_WREADY   : out std_logic;
        SLAVE0_ARADDR    : out std_logic_vector(31 downto 0);
        SLAVE0_ARBURST   : out std_logic_vector(1 downto 0);
        SLAVE0_ARCACHE   : out std_logic_vector(3 downto 0);
        SLAVE0_ARID      : out std_logic_vector(1 downto 0);
        SLAVE0_ARLEN     : out std_logic_vector(7 downto 0);
        SLAVE0_ARLOCK    : out std_logic_vector(1 downto 0);
        SLAVE0_ARPROT    : out std_logic_vector(2 downto 0);
        SLAVE0_ARQOS     : out std_logic_vector(3 downto 0);
        SLAVE0_ARREGION  : out std_logic_vector(3 downto 0);
        SLAVE0_ARSIZE    : out std_logic_vector(2 downto 0);
        SLAVE0_ARUSER    : out std_logic_vector(0 to 0);
        SLAVE0_ARVALID   : out std_logic;
        SLAVE0_AWADDR    : out std_logic_vector(31 downto 0);
        SLAVE0_AWBURST   : out std_logic_vector(1 downto 0);
        SLAVE0_AWCACHE   : out std_logic_vector(3 downto 0);
        SLAVE0_AWID      : out std_logic_vector(1 downto 0);
        SLAVE0_AWLEN     : out std_logic_vector(7 downto 0);
        SLAVE0_AWLOCK    : out std_logic_vector(1 downto 0);
        SLAVE0_AWPROT    : out std_logic_vector(2 downto 0);
        SLAVE0_AWQOS     : out std_logic_vector(3 downto 0);
        SLAVE0_AWREGION  : out std_logic_vector(3 downto 0);
        SLAVE0_AWSIZE    : out std_logic_vector(2 downto 0);
        SLAVE0_AWUSER    : out std_logic_vector(0 to 0);
        SLAVE0_AWVALID   : out std_logic;
        SLAVE0_BREADY    : out std_logic;
        SLAVE0_RREADY    : out std_logic;
        SLAVE0_WDATA     : out std_logic_vector(63 downto 0);
        SLAVE0_WLAST     : out std_logic;
        SLAVE0_WSTRB     : out std_logic_vector(7 downto 0);
        SLAVE0_WUSER     : out std_logic_vector(0 to 0);
        SLAVE0_WVALID    : out std_logic
        );
end component;
-- COREAXI4SRAM_C2
component COREAXI4SRAM_C2
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
-- RESET_GEN_C1
component RESET_GEN_C1
    -- Port list
    port(
        -- Outputs
        RESET : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AndOfThree_0_addr                              : std_logic_vector(31 downto 0);
signal AndOfThree_0_start_write                       : std_logic;
signal axiM_fl64_burst_0_BIF_1_ARADDR                 : std_logic_vector(31 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARBURST                : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARCACHE                : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARLEN                  : std_logic_vector(7 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARLOCK                 : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARPROT                 : std_logic_vector(2 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARREADY                : std_logic;
signal axiM_fl64_burst_0_BIF_1_ARSIZE                 : std_logic_vector(2 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARVALID                : std_logic;
signal axiM_fl64_burst_0_BIF_1_AWADDR                 : std_logic_vector(31 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWBURST                : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWCACHE                : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWLEN                  : std_logic_vector(7 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWLOCK                 : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWPROT                 : std_logic_vector(2 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWREADY                : std_logic;
signal axiM_fl64_burst_0_BIF_1_AWSIZE                 : std_logic_vector(2 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWVALID                : std_logic;
signal axiM_fl64_burst_0_BIF_1_BREADY                 : std_logic;
signal axiM_fl64_burst_0_BIF_1_BRESP                  : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_BUSER                  : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_BVALID                 : std_logic;
signal axiM_fl64_burst_0_BIF_1_RDATA                  : std_logic_vector(63 downto 0);
signal axiM_fl64_burst_0_BIF_1_RLAST                  : std_logic;
signal axiM_fl64_burst_0_BIF_1_RREADY                 : std_logic;
signal axiM_fl64_burst_0_BIF_1_RRESP                  : std_logic_vector(1 downto 0);
signal axiM_fl64_burst_0_BIF_1_RUSER                  : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_RVALID                 : std_logic;
signal axiM_fl64_burst_0_BIF_1_WDATA                  : std_logic_vector(63 downto 0);
signal axiM_fl64_burst_0_BIF_1_WLAST                  : std_logic;
signal axiM_fl64_burst_0_BIF_1_WREADY                 : std_logic;
signal axiM_fl64_burst_0_BIF_1_WSTRB                  : std_logic_vector(7 downto 0);
signal axiM_fl64_burst_0_BIF_1_WVALID                 : std_logic;
signal CLK_GEN_C0_0_CLK                               : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARADDR   : std_logic_vector(31 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARBURST  : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARCACHE  : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLEN    : std_logic_vector(7 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLOCK   : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARPROT   : std_logic_vector(2 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARQOS    : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARREADY  : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARREGION : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARSIZE   : std_logic_vector(2 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARUSER   : std_logic_vector(0 to 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARVALID  : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWADDR   : std_logic_vector(31 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWBURST  : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWCACHE  : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLEN    : std_logic_vector(7 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLOCK   : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWPROT   : std_logic_vector(2 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWQOS    : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWREADY  : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWREGION : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWSIZE   : std_logic_vector(2 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWUSER   : std_logic_vector(0 to 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWVALID  : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BREADY   : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BRESP    : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BVALID   : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RDATA    : std_logic_vector(63 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RLAST    : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RREADY   : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RRESP    : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RVALID   : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WDATA    : std_logic_vector(63 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WLAST    : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WREADY   : std_logic;
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WSTRB    : std_logic_vector(7 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WUSER    : std_logic_vector(0 to 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WVALID   : std_logic;
signal RESET_GEN_C1_0_RESET                           : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                        : std_logic;
signal i_rd_addr_const_net_0                          : std_logic_vector(31 downto 0);
signal i_write_transfer_size_const_net_0              : std_logic_vector(9 downto 0);
signal i_read_transfer_size_const_net_0               : std_logic_vector(9 downto 0);
signal i_data_const_net_0                             : std_logic_vector(63 downto 0);
signal MASTER0_AWQOS_const_net_0                      : std_logic_vector(3 downto 0);
signal MASTER0_AWREGION_const_net_0                   : std_logic_vector(3 downto 0);
signal MASTER0_ARQOS_const_net_0                      : std_logic_vector(3 downto 0);
signal MASTER0_ARREGION_const_net_0                   : std_logic_vector(3 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal axiM_fl64_burst_0_BIF_1_ARID                   : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_ARID_0                 : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_ARID_0_0to0            : std_logic_vector(0 to 0);

signal axiM_fl64_burst_0_BIF_1_AWID                   : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_AWID_0                 : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_AWID_0_0to0            : std_logic_vector(0 to 0);

signal axiM_fl64_burst_0_BIF_1_BID                    : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_BID_0                  : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_BID_0_0to0             : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_BID_0_3to1             : std_logic_vector(3 downto 1);

signal axiM_fl64_burst_0_BIF_1_RID                    : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_RID_0                  : std_logic_vector(3 downto 0);
signal axiM_fl64_burst_0_BIF_1_RID_0_0to0             : std_logic_vector(0 to 0);
signal axiM_fl64_burst_0_BIF_1_RID_0_3to1             : std_logic_vector(3 downto 1);

signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID     : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0   : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_1to0: std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_3to2: std_logic_vector(3 downto 2);

signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID     : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0   : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_1to0: std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_3to2: std_logic_vector(3 downto 2);

signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID      : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0    : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0_1to0: std_logic_vector(1 downto 0);

signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID      : std_logic_vector(3 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0    : std_logic_vector(1 downto 0);
signal COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0_1to0: std_logic_vector(1 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                           <= '0';
 i_rd_addr_const_net_0             <= B"00000000000000000000000000000000";
 i_write_transfer_size_const_net_0 <= B"0000000001";
 i_read_transfer_size_const_net_0  <= B"0000000000";
 i_data_const_net_0                <= B"1111111111111111111111111111111111111111111111111111111111111111";
 MASTER0_AWQOS_const_net_0         <= B"0000";
 MASTER0_AWREGION_const_net_0      <= B"0000";
 MASTER0_ARQOS_const_net_0         <= B"0000";
 MASTER0_ARREGION_const_net_0      <= B"0000";
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 axiM_fl64_burst_0_BIF_1_ARID_0(0) <= ( axiM_fl64_burst_0_BIF_1_ARID_0_0to0(0) );
 axiM_fl64_burst_0_BIF_1_ARID_0_0to0(0) <= axiM_fl64_burst_0_BIF_1_ARID(0);

 axiM_fl64_burst_0_BIF_1_AWID_0(0) <= ( axiM_fl64_burst_0_BIF_1_AWID_0_0to0(0) );
 axiM_fl64_burst_0_BIF_1_AWID_0_0to0(0) <= axiM_fl64_burst_0_BIF_1_AWID(0);

 axiM_fl64_burst_0_BIF_1_BID_0(3 downto 0) <= ( axiM_fl64_burst_0_BIF_1_BID_0_3to1(3 downto 1) & axiM_fl64_burst_0_BIF_1_BID_0_0to0(0) );
 axiM_fl64_burst_0_BIF_1_BID_0_0to0(0) <= axiM_fl64_burst_0_BIF_1_BID(0);
 axiM_fl64_burst_0_BIF_1_BID_0_3to1(3 downto 1) <= B"000";

 axiM_fl64_burst_0_BIF_1_RID_0(3 downto 0) <= ( axiM_fl64_burst_0_BIF_1_RID_0_3to1(3 downto 1) & axiM_fl64_burst_0_BIF_1_RID_0_0to0(0) );
 axiM_fl64_burst_0_BIF_1_RID_0_0to0(0) <= axiM_fl64_burst_0_BIF_1_RID(0);
 axiM_fl64_burst_0_BIF_1_RID_0_3to1(3 downto 1) <= B"000";

 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0(3 downto 0) <= ( COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_3to2(3 downto 2) & COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_1to0(1 downto 0) );
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_1to0(1 downto 0) <= COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID(1 downto 0);
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0_3to2(3 downto 2) <= B"00";

 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0(3 downto 0) <= ( COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_3to2(3 downto 2) & COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_1to0(1 downto 0) );
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_1to0(1 downto 0) <= COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID(1 downto 0);
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0_3to2(3 downto 2) <= B"00";

 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0(1 downto 0) <= ( COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0_1to0(1 downto 0) );
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0_1to0(1 downto 0) <= COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID(1 downto 0);

 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0(1 downto 0) <= ( COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0_1to0(1 downto 0) );
 COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0_1to0(1 downto 0) <= COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID(1 downto 0);

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AndOfThree_0
AndOfThree_0 : AndOfThree
    port map( 
        -- Inputs
        clk         => CLK_GEN_C0_0_CLK,
        reset_n     => RESET_GEN_C1_0_RESET,
        input_valid => GND_net,
        -- Outputs
        start_write => AndOfThree_0_start_write,
        addr        => AndOfThree_0_addr 
        );
-- axiM_fl64_burst_0
axiM_fl64_burst_0 : entity work.axiM_fl64_burst
    port map( 
        -- Inputs
        i_clk                 => CLK_GEN_C0_0_CLK,
        i_rstn                => RESET_GEN_C1_0_RESET,
        i_start_write         => AndOfThree_0_start_write,
        i_start_read          => GND_net,
        i_rd_addr             => i_rd_addr_const_net_0,
        i_wrt_addr            => AndOfThree_0_addr,
        i_write_transfer_size => i_write_transfer_size_const_net_0,
        i_read_transfer_size  => i_read_transfer_size_const_net_0,
        i_data                => i_data_const_net_0,
        AWREADY               => axiM_fl64_burst_0_BIF_1_AWREADY,
        WREADY                => axiM_fl64_burst_0_BIF_1_WREADY,
        BID                   => axiM_fl64_burst_0_BIF_1_BID_0,
        BRESP                 => axiM_fl64_burst_0_BIF_1_BRESP,
        BVALID                => axiM_fl64_burst_0_BIF_1_BVALID,
        ARREADY               => axiM_fl64_burst_0_BIF_1_ARREADY,
        RDATA                 => axiM_fl64_burst_0_BIF_1_RDATA,
        RLAST                 => axiM_fl64_burst_0_BIF_1_RLAST,
        RVALID                => axiM_fl64_burst_0_BIF_1_RVALID,
        RID                   => axiM_fl64_burst_0_BIF_1_RID_0,
        RRESP                 => axiM_fl64_burst_0_BIF_1_RRESP,
        -- Outputs
        o_data_req            => OPEN,
        o_data                => OPEN,
        o_data_valid          => OPEN,
        o_ready               => OPEN,
        AWID                  => axiM_fl64_burst_0_BIF_1_AWID,
        AWADDR                => axiM_fl64_burst_0_BIF_1_AWADDR,
        AWLEN                 => axiM_fl64_burst_0_BIF_1_AWLEN,
        AWSIZE                => axiM_fl64_burst_0_BIF_1_AWSIZE,
        AWLOCK                => axiM_fl64_burst_0_BIF_1_AWLOCK,
        AWBURST               => axiM_fl64_burst_0_BIF_1_AWBURST,
        AWVALID               => axiM_fl64_burst_0_BIF_1_AWVALID,
        WSTRB                 => axiM_fl64_burst_0_BIF_1_WSTRB,
        WLAST                 => axiM_fl64_burst_0_BIF_1_WLAST,
        WVALID                => axiM_fl64_burst_0_BIF_1_WVALID,
        WDATA                 => axiM_fl64_burst_0_BIF_1_WDATA,
        BREADY                => axiM_fl64_burst_0_BIF_1_BREADY,
        ARID                  => axiM_fl64_burst_0_BIF_1_ARID,
        ARADDR                => axiM_fl64_burst_0_BIF_1_ARADDR,
        ARLEN                 => axiM_fl64_burst_0_BIF_1_ARLEN,
        ARSIZE                => axiM_fl64_burst_0_BIF_1_ARSIZE,
        ARLOCK                => axiM_fl64_burst_0_BIF_1_ARLOCK,
        ARBURST               => axiM_fl64_burst_0_BIF_1_ARBURST,
        ARVALID               => axiM_fl64_burst_0_BIF_1_ARVALID,
        RREADY                => axiM_fl64_burst_0_BIF_1_RREADY,
        ARCACHE               => axiM_fl64_burst_0_BIF_1_ARCACHE,
        ARPROT                => axiM_fl64_burst_0_BIF_1_ARPROT,
        AWCACHE               => axiM_fl64_burst_0_BIF_1_AWCACHE,
        AWPROT                => axiM_fl64_burst_0_BIF_1_AWPROT 
        );
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- COREAXI4INTERCONNECT_C0_0
COREAXI4INTERCONNECT_C0_0 : COREAXI4INTERCONNECT_C0
    port map( 
        -- Inputs
        ACLK              => CLK_GEN_C0_0_CLK,
        ARESETN           => RESET_GEN_C1_0_RESET,
        SLAVE0_AWREADY    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWREADY,
        SLAVE0_WREADY     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WREADY,
        SLAVE0_BVALID     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BVALID,
        SLAVE0_ARREADY    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARREADY,
        SLAVE0_RLAST      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RLAST,
        SLAVE0_RVALID     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RVALID,
        MASTER0_AWVALID   => axiM_fl64_burst_0_BIF_1_AWVALID,
        MASTER0_WLAST     => axiM_fl64_burst_0_BIF_1_WLAST,
        MASTER0_WVALID    => axiM_fl64_burst_0_BIF_1_WVALID,
        MASTER0_BREADY    => axiM_fl64_burst_0_BIF_1_BREADY,
        MASTER0_ARVALID   => axiM_fl64_burst_0_BIF_1_ARVALID,
        MASTER0_RREADY    => axiM_fl64_burst_0_BIF_1_RREADY,
        SLAVE0_BID        => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID_0,
        SLAVE0_BRESP      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BRESP,
        SLAVE0_RID        => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID_0,
        SLAVE0_RDATA      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RDATA,
        SLAVE0_RRESP      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RRESP,
        SLAVE0_BUSER(0)   => GND_net, -- tied to '0' from definition
        SLAVE0_RUSER(0)   => GND_net, -- tied to '0' from definition
        MASTER0_AWID      => axiM_fl64_burst_0_BIF_1_AWID_0,
        MASTER0_AWADDR    => axiM_fl64_burst_0_BIF_1_AWADDR,
        MASTER0_AWLEN     => axiM_fl64_burst_0_BIF_1_AWLEN,
        MASTER0_AWSIZE    => axiM_fl64_burst_0_BIF_1_AWSIZE,
        MASTER0_AWBURST   => axiM_fl64_burst_0_BIF_1_AWBURST,
        MASTER0_AWLOCK    => axiM_fl64_burst_0_BIF_1_AWLOCK,
        MASTER0_AWCACHE   => axiM_fl64_burst_0_BIF_1_AWCACHE,
        MASTER0_AWPROT    => axiM_fl64_burst_0_BIF_1_AWPROT,
        MASTER0_AWQOS     => MASTER0_AWQOS_const_net_0, -- tied to X"0" from definition
        MASTER0_AWREGION  => MASTER0_AWREGION_const_net_0, -- tied to X"0" from definition
        MASTER0_WDATA     => axiM_fl64_burst_0_BIF_1_WDATA,
        MASTER0_WSTRB     => axiM_fl64_burst_0_BIF_1_WSTRB,
        MASTER0_ARID      => axiM_fl64_burst_0_BIF_1_ARID_0,
        MASTER0_ARADDR    => axiM_fl64_burst_0_BIF_1_ARADDR,
        MASTER0_ARLEN     => axiM_fl64_burst_0_BIF_1_ARLEN,
        MASTER0_ARSIZE    => axiM_fl64_burst_0_BIF_1_ARSIZE,
        MASTER0_ARBURST   => axiM_fl64_burst_0_BIF_1_ARBURST,
        MASTER0_ARLOCK    => axiM_fl64_burst_0_BIF_1_ARLOCK,
        MASTER0_ARCACHE   => axiM_fl64_burst_0_BIF_1_ARCACHE,
        MASTER0_ARPROT    => axiM_fl64_burst_0_BIF_1_ARPROT,
        MASTER0_ARQOS     => MASTER0_ARQOS_const_net_0, -- tied to X"0" from definition
        MASTER0_ARREGION  => MASTER0_ARREGION_const_net_0, -- tied to X"0" from definition
        MASTER0_AWUSER(0) => GND_net, -- tied to '0' from definition
        MASTER0_WUSER(0)  => GND_net, -- tied to '0' from definition
        MASTER0_ARUSER(0) => GND_net, -- tied to '0' from definition
        -- Outputs
        SLAVE0_AWVALID    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWVALID,
        SLAVE0_WLAST      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WLAST,
        SLAVE0_WVALID     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WVALID,
        SLAVE0_BREADY     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BREADY,
        SLAVE0_ARVALID    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARVALID,
        SLAVE0_RREADY     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RREADY,
        MASTER0_AWREADY   => axiM_fl64_burst_0_BIF_1_AWREADY,
        MASTER0_WREADY    => axiM_fl64_burst_0_BIF_1_WREADY,
        MASTER0_BVALID    => axiM_fl64_burst_0_BIF_1_BVALID,
        MASTER0_ARREADY   => axiM_fl64_burst_0_BIF_1_ARREADY,
        MASTER0_RLAST     => axiM_fl64_burst_0_BIF_1_RLAST,
        MASTER0_RVALID    => axiM_fl64_burst_0_BIF_1_RVALID,
        SLAVE0_AWID       => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID,
        SLAVE0_AWADDR     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWADDR,
        SLAVE0_AWLEN      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLEN,
        SLAVE0_AWSIZE     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWSIZE,
        SLAVE0_AWBURST    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWBURST,
        SLAVE0_AWLOCK     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLOCK,
        SLAVE0_AWCACHE    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWCACHE,
        SLAVE0_AWPROT     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWPROT,
        SLAVE0_AWQOS      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWQOS,
        SLAVE0_AWREGION   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWREGION,
        SLAVE0_WDATA      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WDATA,
        SLAVE0_WSTRB      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WSTRB,
        SLAVE0_ARID       => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID,
        SLAVE0_ARADDR     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARADDR,
        SLAVE0_ARLEN      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLEN,
        SLAVE0_ARSIZE     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARSIZE,
        SLAVE0_ARBURST    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARBURST,
        SLAVE0_ARLOCK     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLOCK,
        SLAVE0_ARCACHE    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARCACHE,
        SLAVE0_ARPROT     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARPROT,
        SLAVE0_ARQOS      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARQOS,
        SLAVE0_ARREGION   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARREGION,
        SLAVE0_AWUSER     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWUSER,
        SLAVE0_WUSER      => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WUSER,
        SLAVE0_ARUSER     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARUSER,
        MASTER0_BID       => axiM_fl64_burst_0_BIF_1_BID,
        MASTER0_BRESP     => axiM_fl64_burst_0_BIF_1_BRESP,
        MASTER0_RID       => axiM_fl64_burst_0_BIF_1_RID,
        MASTER0_RDATA     => axiM_fl64_burst_0_BIF_1_RDATA,
        MASTER0_RRESP     => axiM_fl64_burst_0_BIF_1_RRESP,
        MASTER0_BUSER     => axiM_fl64_burst_0_BIF_1_BUSER,
        MASTER0_RUSER     => axiM_fl64_burst_0_BIF_1_RUSER 
        );
-- COREAXI4SRAM_C2_0
COREAXI4SRAM_C2_0 : COREAXI4SRAM_C2
    port map( 
        -- Inputs
        ACLK    => CLK_GEN_C0_0_CLK,
        ARESETN => RESET_GEN_C1_0_RESET,
        AWVALID => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWVALID,
        WLAST   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WLAST,
        WVALID  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WVALID,
        BREADY  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BREADY,
        ARVALID => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARVALID,
        RREADY  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RREADY,
        AWADDR  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWADDR,
        AWLEN   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLEN,
        AWSIZE  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWSIZE,
        AWBURST => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWBURST,
        AWLOCK  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWLOCK,
        AWCACHE => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWCACHE,
        AWPROT  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWPROT,
        WDATA   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WDATA,
        WSTRB   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WSTRB,
        ARADDR  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARADDR,
        ARLEN   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLEN,
        ARSIZE  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARSIZE,
        ARBURST => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARBURST,
        ARLOCK  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARLOCK,
        ARCACHE => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARCACHE,
        ARPROT  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARPROT,
        AWID    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWID_0,
        ARID    => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARID_0,
        -- Outputs
        AWREADY => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_AWREADY,
        WREADY  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_WREADY,
        BVALID  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BVALID,
        ARREADY => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_ARREADY,
        RLAST   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RLAST,
        RVALID  => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RVALID,
        RDATA   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RDATA,
        RRESP   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RRESP,
        BRESP   => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BRESP,
        BID     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_BID,
        RID     => COREAXI4INTERCONNECT_C0_0_AXI4mslave0_RID 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );

end RTL;

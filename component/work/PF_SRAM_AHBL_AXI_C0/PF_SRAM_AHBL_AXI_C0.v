//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Mar  6 15:17:14 2024
// Version: 2023.2 2023.2.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_SRAM_AHBL_AXI_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_SRAM_AHBL_AXI_C0
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:1.2.111} -component_name {PF_SRAM_AHBL_AXI_C0} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:32" \
"AXI4_IDWIDTH:8" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:487424" \
"RWIDTH:40" \
"USE_NATIVE_INTERFACE:T" \
"WDEPTH:487424" \
"WWIDTH:40" }
# Exporting Component Description of PF_SRAM_AHBL_AXI_C0 to TCL done
*/

// PF_SRAM_AHBL_AXI_C0
module PF_SRAM_AHBL_AXI_C0(
    // Inputs
    ACLK,
    ARADDR,
    ARBURST,
    ARCACHE,
    ARESETN,
    ARID,
    ARLEN,
    ARLOCK,
    ARPROT,
    ARSIZE,
    ARVALID,
    AWADDR,
    AWBURST,
    AWCACHE,
    AWID,
    AWLEN,
    AWLOCK,
    AWPROT,
    AWSIZE,
    AWVALID,
    BREADY,
    B_ADDR,
    B_BLK_EN,
    B_CLK,
    B_DIN,
    B_WBYTE_EN,
    B_WEN,
    RREADY,
    WDATA,
    WLAST,
    WSTRB,
    WVALID,
    // Outputs
    ARREADY,
    AWREADY,
    BID,
    BRESP,
    BVALID,
    B_DOUT,
    RDATA,
    RID,
    RLAST,
    RRESP,
    RVALID,
    WREADY
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ACLK;
input  [31:0] ARADDR;
input  [1:0]  ARBURST;
input  [3:0]  ARCACHE;
input         ARESETN;
input  [7:0]  ARID;
input  [7:0]  ARLEN;
input  [1:0]  ARLOCK;
input  [2:0]  ARPROT;
input  [2:0]  ARSIZE;
input         ARVALID;
input  [31:0] AWADDR;
input  [1:0]  AWBURST;
input  [3:0]  AWCACHE;
input  [7:0]  AWID;
input  [7:0]  AWLEN;
input  [1:0]  AWLOCK;
input  [2:0]  AWPROT;
input  [2:0]  AWSIZE;
input         AWVALID;
input         BREADY;
input  [18:0] B_ADDR;
input         B_BLK_EN;
input         B_CLK;
input  [31:0] B_DIN;
input  [7:0]  B_WBYTE_EN;
input         B_WEN;
input         RREADY;
input  [31:0] WDATA;
input         WLAST;
input  [3:0]  WSTRB;
input         WVALID;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ARREADY;
output        AWREADY;
output [7:0]  BID;
output [1:0]  BRESP;
output        BVALID;
output [31:0] B_DOUT;
output [31:0] RDATA;
output [7:0]  RID;
output        RLAST;
output [1:0]  RRESP;
output        RVALID;
output        WREADY;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           ACLK;
wire           ARESETN;
wire   [31:0]  ARADDR;
wire   [1:0]   ARBURST;
wire   [3:0]   ARCACHE;
wire   [7:0]   ARID;
wire   [7:0]   ARLEN;
wire   [1:0]   ARLOCK;
wire   [2:0]   ARPROT;
wire           AXI4_Slave_ARREADY;
wire   [2:0]   ARSIZE;
wire           ARVALID;
wire   [31:0]  AWADDR;
wire   [1:0]   AWBURST;
wire   [3:0]   AWCACHE;
wire   [7:0]   AWID;
wire   [7:0]   AWLEN;
wire   [1:0]   AWLOCK;
wire   [2:0]   AWPROT;
wire           AXI4_Slave_AWREADY;
wire   [2:0]   AWSIZE;
wire           AWVALID;
wire   [7:0]   AXI4_Slave_BID;
wire           BREADY;
wire   [1:0]   AXI4_Slave_BRESP;
wire           AXI4_Slave_BVALID;
wire   [31:0]  AXI4_Slave_RDATA;
wire   [7:0]   AXI4_Slave_RID;
wire           AXI4_Slave_RLAST;
wire           RREADY;
wire   [1:0]   AXI4_Slave_RRESP;
wire           AXI4_Slave_RVALID;
wire   [31:0]  WDATA;
wire           WLAST;
wire           AXI4_Slave_WREADY;
wire   [3:0]   WSTRB;
wire           WVALID;
wire   [18:0]  B_ADDR;
wire           B_BLK_EN;
wire           B_CLK;
wire   [0:0]   B_DIN_slice_0;
wire   [1:1]   B_DIN_slice_1;
wire   [2:2]   B_DIN_slice_2;
wire   [3:3]   B_DIN_slice_3;
wire   [4:4]   B_DIN_slice_4;
wire   [5:5]   B_DIN_slice_5;
wire   [6:6]   B_DIN_slice_6;
wire   [7:7]   B_DIN_slice_7;
wire   [8:8]   B_DIN_slice_8;
wire   [9:9]   B_DIN_slice_9;
wire   [10:10] B_DIN_slice_10;
wire   [11:11] B_DIN_slice_11;
wire   [12:12] B_DIN_slice_12;
wire   [13:13] B_DIN_slice_13;
wire   [14:14] B_DIN_slice_14;
wire   [15:15] B_DIN_slice_15;
wire   [16:16] B_DIN_slice_16;
wire   [17:17] B_DIN_slice_17;
wire   [18:18] B_DIN_slice_18;
wire   [19:19] B_DIN_slice_19;
wire   [20:20] B_DIN_slice_20;
wire   [21:21] B_DIN_slice_21;
wire   [22:22] B_DIN_slice_22;
wire   [23:23] B_DIN_slice_23;
wire   [24:24] B_DIN_slice_24;
wire   [25:25] B_DIN_slice_25;
wire   [26:26] B_DIN_slice_26;
wire   [27:27] B_DIN_slice_27;
wire   [28:28] B_DIN_slice_28;
wire   [29:29] B_DIN_slice_29;
wire   [30:30] B_DIN_slice_30;
wire   [31:31] B_DIN_slice_31;
wire   [0:0]   B_DOUT_net_0;
wire   [1:1]   B_DOUT_0;
wire   [2:2]   B_DOUT_1;
wire   [3:3]   B_DOUT_2;
wire   [4:4]   B_DOUT_3;
wire   [5:5]   B_DOUT_4;
wire   [6:6]   B_DOUT_5;
wire   [7:7]   B_DOUT_6;
wire   [10:10] B_DOUT_7;
wire   [11:11] B_DOUT_8;
wire   [12:12] B_DOUT_9;
wire   [13:13] B_DOUT_10;
wire   [14:14] B_DOUT_11;
wire   [15:15] B_DOUT_12;
wire   [16:16] B_DOUT_13;
wire   [17:17] B_DOUT_14;
wire   [20:20] B_DOUT_15;
wire   [21:21] B_DOUT_16;
wire   [22:22] B_DOUT_17;
wire   [23:23] B_DOUT_18;
wire   [24:24] B_DOUT_19;
wire   [25:25] B_DOUT_20;
wire   [26:26] B_DOUT_21;
wire   [27:27] B_DOUT_22;
wire   [30:30] B_DOUT_23;
wire   [31:31] B_DOUT_24;
wire   [32:32] B_DOUT_25;
wire   [33:33] B_DOUT_26;
wire   [34:34] B_DOUT_27;
wire   [35:35] B_DOUT_28;
wire   [36:36] B_DOUT_29;
wire   [37:37] B_DOUT_30;
wire   [7:0]   B_WBYTE_EN;
wire           B_WEN;
wire   [0:0]   COREAXI4SRAM_0_MEM_RADDR0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_RADDR1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_RADDR2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_RADDR3to3;
wire   [4:4]   COREAXI4SRAM_0_MEM_RADDR4to4;
wire   [5:5]   COREAXI4SRAM_0_MEM_RADDR5to5;
wire   [6:6]   COREAXI4SRAM_0_MEM_RADDR6to6;
wire   [7:7]   COREAXI4SRAM_0_MEM_RADDR7to7;
wire   [8:8]   COREAXI4SRAM_0_MEM_RADDR8to8;
wire   [9:9]   COREAXI4SRAM_0_MEM_RADDR9to9;
wire   [10:10] COREAXI4SRAM_0_MEM_RADDR10to10;
wire   [11:11] COREAXI4SRAM_0_MEM_RADDR11to11;
wire   [12:12] COREAXI4SRAM_0_MEM_RADDR12to12;
wire   [13:13] COREAXI4SRAM_0_MEM_RADDR13to13;
wire   [14:14] COREAXI4SRAM_0_MEM_RADDR14to14;
wire   [15:15] COREAXI4SRAM_0_MEM_RADDR15to15;
wire   [16:16] COREAXI4SRAM_0_MEM_RADDR16to16;
wire   [17:17] COREAXI4SRAM_0_MEM_RADDR17to17;
wire   [18:18] COREAXI4SRAM_0_MEM_RADDR18to18;
wire           COREAXI4SRAM_0_MEM_REN;
wire   [0:0]   COREAXI4SRAM_0_MEM_WADDR0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_WADDR1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_WADDR2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_WADDR3to3;
wire   [4:4]   COREAXI4SRAM_0_MEM_WADDR4to4;
wire   [5:5]   COREAXI4SRAM_0_MEM_WADDR5to5;
wire   [6:6]   COREAXI4SRAM_0_MEM_WADDR6to6;
wire   [7:7]   COREAXI4SRAM_0_MEM_WADDR7to7;
wire   [8:8]   COREAXI4SRAM_0_MEM_WADDR8to8;
wire   [9:9]   COREAXI4SRAM_0_MEM_WADDR9to9;
wire   [10:10] COREAXI4SRAM_0_MEM_WADDR10to10;
wire   [11:11] COREAXI4SRAM_0_MEM_WADDR11to11;
wire   [12:12] COREAXI4SRAM_0_MEM_WADDR12to12;
wire   [13:13] COREAXI4SRAM_0_MEM_WADDR13to13;
wire   [14:14] COREAXI4SRAM_0_MEM_WADDR14to14;
wire   [15:15] COREAXI4SRAM_0_MEM_WADDR15to15;
wire   [16:16] COREAXI4SRAM_0_MEM_WADDR16to16;
wire   [17:17] COREAXI4SRAM_0_MEM_WADDR17to17;
wire   [18:18] COREAXI4SRAM_0_MEM_WADDR18to18;
wire   [0:0]   COREAXI4SRAM_0_MEM_WBYTE_EN0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_WBYTE_EN1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_WBYTE_EN2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_WBYTE_EN3to3;
wire   [0:0]   COREAXI4SRAM_0_MEM_WDATA0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_WDATA1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_WDATA2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_WDATA3to3;
wire   [4:4]   COREAXI4SRAM_0_MEM_WDATA4to4;
wire   [5:5]   COREAXI4SRAM_0_MEM_WDATA5to5;
wire   [6:6]   COREAXI4SRAM_0_MEM_WDATA6to6;
wire   [7:7]   COREAXI4SRAM_0_MEM_WDATA7to7;
wire   [8:8]   COREAXI4SRAM_0_MEM_WDATA8to8;
wire   [9:9]   COREAXI4SRAM_0_MEM_WDATA9to9;
wire   [10:10] COREAXI4SRAM_0_MEM_WDATA10to10;
wire   [11:11] COREAXI4SRAM_0_MEM_WDATA11to11;
wire   [12:12] COREAXI4SRAM_0_MEM_WDATA12to12;
wire   [13:13] COREAXI4SRAM_0_MEM_WDATA13to13;
wire   [14:14] COREAXI4SRAM_0_MEM_WDATA14to14;
wire   [15:15] COREAXI4SRAM_0_MEM_WDATA15to15;
wire   [16:16] COREAXI4SRAM_0_MEM_WDATA16to16;
wire   [17:17] COREAXI4SRAM_0_MEM_WDATA17to17;
wire   [18:18] COREAXI4SRAM_0_MEM_WDATA18to18;
wire   [19:19] COREAXI4SRAM_0_MEM_WDATA19to19;
wire   [20:20] COREAXI4SRAM_0_MEM_WDATA20to20;
wire   [21:21] COREAXI4SRAM_0_MEM_WDATA21to21;
wire   [22:22] COREAXI4SRAM_0_MEM_WDATA22to22;
wire   [23:23] COREAXI4SRAM_0_MEM_WDATA23to23;
wire   [24:24] COREAXI4SRAM_0_MEM_WDATA24to24;
wire   [25:25] COREAXI4SRAM_0_MEM_WDATA25to25;
wire   [26:26] COREAXI4SRAM_0_MEM_WDATA26to26;
wire   [27:27] COREAXI4SRAM_0_MEM_WDATA27to27;
wire   [28:28] COREAXI4SRAM_0_MEM_WDATA28to28;
wire   [29:29] COREAXI4SRAM_0_MEM_WDATA29to29;
wire   [30:30] COREAXI4SRAM_0_MEM_WDATA30to30;
wire   [31:31] COREAXI4SRAM_0_MEM_WDATA31to31;
wire           COREAXI4SRAM_0_MEM_WEN;
wire   [18:0]  MEM_RADDR;
wire   [18:0]  MEM_WADDR;
wire   [3:0]   MEM_WBYTE_EN;
wire   [31:0]  MEM_WDATA;
wire           MX2_0_Y;
wire           MX2_1_Y;
wire           MX2_2_Y;
wire           MX2_3_Y;
wire           MX2_4_Y;
wire           MX2_5_Y;
wire           MX2_6_Y;
wire           MX2_7_Y;
wire           MX2_8_Y;
wire           MX2_9_Y;
wire           MX2_10_Y;
wire           MX2_11_Y;
wire           MX2_12_Y;
wire           MX2_13_Y;
wire           MX2_14_Y;
wire           MX2_15_Y;
wire           MX2_16_Y;
wire           MX2_17_Y;
wire           MX2_18_Y;
wire   [0:0]   PF_DPSRAM_AHB_AXI_0_A_DOUT0to0;
wire   [1:1]   PF_DPSRAM_AHB_AXI_0_A_DOUT1to1;
wire   [2:2]   PF_DPSRAM_AHB_AXI_0_A_DOUT2to2;
wire   [3:3]   PF_DPSRAM_AHB_AXI_0_A_DOUT3to3;
wire   [4:4]   PF_DPSRAM_AHB_AXI_0_A_DOUT4to4;
wire   [5:5]   PF_DPSRAM_AHB_AXI_0_A_DOUT5to5;
wire   [6:6]   PF_DPSRAM_AHB_AXI_0_A_DOUT6to6;
wire   [7:7]   PF_DPSRAM_AHB_AXI_0_A_DOUT7to7;
wire   [10:10] PF_DPSRAM_AHB_AXI_0_A_DOUT10to10;
wire   [11:11] PF_DPSRAM_AHB_AXI_0_A_DOUT11to11;
wire   [12:12] PF_DPSRAM_AHB_AXI_0_A_DOUT12to12;
wire   [13:13] PF_DPSRAM_AHB_AXI_0_A_DOUT13to13;
wire   [14:14] PF_DPSRAM_AHB_AXI_0_A_DOUT14to14;
wire   [15:15] PF_DPSRAM_AHB_AXI_0_A_DOUT15to15;
wire   [16:16] PF_DPSRAM_AHB_AXI_0_A_DOUT16to16;
wire   [17:17] PF_DPSRAM_AHB_AXI_0_A_DOUT17to17;
wire   [20:20] PF_DPSRAM_AHB_AXI_0_A_DOUT20to20;
wire   [21:21] PF_DPSRAM_AHB_AXI_0_A_DOUT21to21;
wire   [22:22] PF_DPSRAM_AHB_AXI_0_A_DOUT22to22;
wire   [23:23] PF_DPSRAM_AHB_AXI_0_A_DOUT23to23;
wire   [24:24] PF_DPSRAM_AHB_AXI_0_A_DOUT24to24;
wire   [25:25] PF_DPSRAM_AHB_AXI_0_A_DOUT25to25;
wire   [26:26] PF_DPSRAM_AHB_AXI_0_A_DOUT26to26;
wire   [27:27] PF_DPSRAM_AHB_AXI_0_A_DOUT27to27;
wire   [30:30] PF_DPSRAM_AHB_AXI_0_A_DOUT30to30;
wire   [31:31] PF_DPSRAM_AHB_AXI_0_A_DOUT31to31;
wire   [32:32] PF_DPSRAM_AHB_AXI_0_A_DOUT32to32;
wire   [33:33] PF_DPSRAM_AHB_AXI_0_A_DOUT33to33;
wire   [34:34] PF_DPSRAM_AHB_AXI_0_A_DOUT34to34;
wire   [35:35] PF_DPSRAM_AHB_AXI_0_A_DOUT35to35;
wire   [36:36] PF_DPSRAM_AHB_AXI_0_A_DOUT36to36;
wire   [37:37] PF_DPSRAM_AHB_AXI_0_A_DOUT37to37;
wire           AXI4_Slave_AWREADY_net_0;
wire           AXI4_Slave_WREADY_net_0;
wire           AXI4_Slave_BVALID_net_0;
wire           AXI4_Slave_ARREADY_net_0;
wire   [31:0]  AXI4_Slave_RDATA_net_0;
wire   [1:0]   AXI4_Slave_RRESP_net_0;
wire           AXI4_Slave_RLAST_net_0;
wire           AXI4_Slave_RVALID_net_0;
wire   [1:0]   AXI4_Slave_BRESP_net_0;
wire   [7:0]   AXI4_Slave_BID_net_0;
wire   [7:0]   AXI4_Slave_RID_net_0;
wire   [0:0]   B_DOUT_net_1;
wire   [10:10] B_DOUT_9_net_0;
wire   [11:11] B_DOUT_10_net_0;
wire   [12:12] B_DOUT_11_net_0;
wire   [13:13] B_DOUT_12_net_0;
wire   [14:14] B_DOUT_13_net_0;
wire   [15:15] B_DOUT_14_net_0;
wire   [16:16] B_DOUT_15_net_0;
wire   [17:17] B_DOUT_16_net_0;
wire   [18:18] B_DOUT_17_net_0;
wire   [19:19] B_DOUT_18_net_0;
wire   [1:1]   B_DOUT_0_net_0;
wire   [20:20] B_DOUT_19_net_0;
wire   [21:21] B_DOUT_20_net_0;
wire   [22:22] B_DOUT_21_net_0;
wire   [23:23] B_DOUT_22_net_0;
wire   [24:24] B_DOUT_23_net_0;
wire   [25:25] B_DOUT_24_net_0;
wire   [26:26] B_DOUT_25_net_0;
wire   [27:27] B_DOUT_26_net_0;
wire   [28:28] B_DOUT_27_net_0;
wire   [29:29] B_DOUT_28_net_0;
wire   [2:2]   B_DOUT_1_net_0;
wire   [30:30] B_DOUT_29_net_0;
wire   [31:31] B_DOUT_30_net_0;
wire   [3:3]   B_DOUT_2_net_0;
wire   [4:4]   B_DOUT_3_net_0;
wire   [5:5]   B_DOUT_4_net_0;
wire   [6:6]   B_DOUT_5_net_0;
wire   [7:7]   B_DOUT_6_net_0;
wire   [8:8]   B_DOUT_7_net_0;
wire   [9:9]   B_DOUT_8_net_0;
wire   [18:18] A_DOUT_slice_0;
wire   [19:19] A_DOUT_slice_1;
wire   [28:28] A_DOUT_slice_2;
wire   [29:29] A_DOUT_slice_3;
wire   [38:38] A_DOUT_slice_4;
wire   [39:39] A_DOUT_slice_5;
wire   [8:8]   A_DOUT_slice_6;
wire   [9:9]   A_DOUT_slice_7;
wire   [18:18] B_DOUT_slice_0;
wire   [19:19] B_DOUT_slice_1;
wire   [28:28] B_DOUT_slice_2;
wire   [29:29] B_DOUT_slice_3;
wire   [38:38] B_DOUT_slice_4;
wire   [39:39] B_DOUT_slice_5;
wire   [8:8]   B_DOUT_slice_6;
wire   [9:9]   B_DOUT_slice_7;
wire   [31:0]  B_DIN;
wire   [31:0]  MEM_RDATA_net_0;
wire   [39:0]  A_DIN_net_0;
wire   [18:0]  A_ADDR_net_0;
wire   [39:0]  B_DIN_net_0;
wire   [18:0]  B_ADDR_net_0;
wire   [39:0]  A_DOUT_net_0;
wire   [39:0]  B_DOUT_net_2;
wire   [7:0]   A_WBYTE_EN_net_0;
wire   [7:0]   B_WBYTE_EN_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net     = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXI4_Slave_AWREADY_net_0 = AXI4_Slave_AWREADY;
assign AWREADY                  = AXI4_Slave_AWREADY_net_0;
assign AXI4_Slave_WREADY_net_0  = AXI4_Slave_WREADY;
assign WREADY                   = AXI4_Slave_WREADY_net_0;
assign AXI4_Slave_BVALID_net_0  = AXI4_Slave_BVALID;
assign BVALID                   = AXI4_Slave_BVALID_net_0;
assign AXI4_Slave_ARREADY_net_0 = AXI4_Slave_ARREADY;
assign ARREADY                  = AXI4_Slave_ARREADY_net_0;
assign AXI4_Slave_RDATA_net_0   = AXI4_Slave_RDATA;
assign RDATA[31:0]              = AXI4_Slave_RDATA_net_0;
assign AXI4_Slave_RRESP_net_0   = AXI4_Slave_RRESP;
assign RRESP[1:0]               = AXI4_Slave_RRESP_net_0;
assign AXI4_Slave_RLAST_net_0   = AXI4_Slave_RLAST;
assign RLAST                    = AXI4_Slave_RLAST_net_0;
assign AXI4_Slave_RVALID_net_0  = AXI4_Slave_RVALID;
assign RVALID                   = AXI4_Slave_RVALID_net_0;
assign AXI4_Slave_BRESP_net_0   = AXI4_Slave_BRESP;
assign BRESP[1:0]               = AXI4_Slave_BRESP_net_0;
assign AXI4_Slave_BID_net_0     = AXI4_Slave_BID;
assign BID[7:0]                 = AXI4_Slave_BID_net_0;
assign AXI4_Slave_RID_net_0     = AXI4_Slave_RID;
assign RID[7:0]                 = AXI4_Slave_RID_net_0;
assign B_DOUT_net_1[0]          = B_DOUT_net_0[0];
assign B_DOUT[0:0]              = B_DOUT_net_1[0];
assign B_DOUT_9_net_0[10]       = B_DOUT_9[12];
assign B_DOUT[10:10]            = B_DOUT_9_net_0[10];
assign B_DOUT_10_net_0[11]      = B_DOUT_10[13];
assign B_DOUT[11:11]            = B_DOUT_10_net_0[11];
assign B_DOUT_11_net_0[12]      = B_DOUT_11[14];
assign B_DOUT[12:12]            = B_DOUT_11_net_0[12];
assign B_DOUT_12_net_0[13]      = B_DOUT_12[15];
assign B_DOUT[13:13]            = B_DOUT_12_net_0[13];
assign B_DOUT_13_net_0[14]      = B_DOUT_13[16];
assign B_DOUT[14:14]            = B_DOUT_13_net_0[14];
assign B_DOUT_14_net_0[15]      = B_DOUT_14[17];
assign B_DOUT[15:15]            = B_DOUT_14_net_0[15];
assign B_DOUT_15_net_0[16]      = B_DOUT_15[20];
assign B_DOUT[16:16]            = B_DOUT_15_net_0[16];
assign B_DOUT_16_net_0[17]      = B_DOUT_16[21];
assign B_DOUT[17:17]            = B_DOUT_16_net_0[17];
assign B_DOUT_17_net_0[18]      = B_DOUT_17[22];
assign B_DOUT[18:18]            = B_DOUT_17_net_0[18];
assign B_DOUT_18_net_0[19]      = B_DOUT_18[23];
assign B_DOUT[19:19]            = B_DOUT_18_net_0[19];
assign B_DOUT_0_net_0[1]        = B_DOUT_0[1];
assign B_DOUT[1:1]              = B_DOUT_0_net_0[1];
assign B_DOUT_19_net_0[20]      = B_DOUT_19[24];
assign B_DOUT[20:20]            = B_DOUT_19_net_0[20];
assign B_DOUT_20_net_0[21]      = B_DOUT_20[25];
assign B_DOUT[21:21]            = B_DOUT_20_net_0[21];
assign B_DOUT_21_net_0[22]      = B_DOUT_21[26];
assign B_DOUT[22:22]            = B_DOUT_21_net_0[22];
assign B_DOUT_22_net_0[23]      = B_DOUT_22[27];
assign B_DOUT[23:23]            = B_DOUT_22_net_0[23];
assign B_DOUT_23_net_0[24]      = B_DOUT_23[30];
assign B_DOUT[24:24]            = B_DOUT_23_net_0[24];
assign B_DOUT_24_net_0[25]      = B_DOUT_24[31];
assign B_DOUT[25:25]            = B_DOUT_24_net_0[25];
assign B_DOUT_25_net_0[26]      = B_DOUT_25[32];
assign B_DOUT[26:26]            = B_DOUT_25_net_0[26];
assign B_DOUT_26_net_0[27]      = B_DOUT_26[33];
assign B_DOUT[27:27]            = B_DOUT_26_net_0[27];
assign B_DOUT_27_net_0[28]      = B_DOUT_27[34];
assign B_DOUT[28:28]            = B_DOUT_27_net_0[28];
assign B_DOUT_28_net_0[29]      = B_DOUT_28[35];
assign B_DOUT[29:29]            = B_DOUT_28_net_0[29];
assign B_DOUT_1_net_0[2]        = B_DOUT_1[2];
assign B_DOUT[2:2]              = B_DOUT_1_net_0[2];
assign B_DOUT_29_net_0[30]      = B_DOUT_29[36];
assign B_DOUT[30:30]            = B_DOUT_29_net_0[30];
assign B_DOUT_30_net_0[31]      = B_DOUT_30[37];
assign B_DOUT[31:31]            = B_DOUT_30_net_0[31];
assign B_DOUT_2_net_0[3]        = B_DOUT_2[3];
assign B_DOUT[3:3]              = B_DOUT_2_net_0[3];
assign B_DOUT_3_net_0[4]        = B_DOUT_3[4];
assign B_DOUT[4:4]              = B_DOUT_3_net_0[4];
assign B_DOUT_4_net_0[5]        = B_DOUT_4[5];
assign B_DOUT[5:5]              = B_DOUT_4_net_0[5];
assign B_DOUT_5_net_0[6]        = B_DOUT_5[6];
assign B_DOUT[6:6]              = B_DOUT_5_net_0[6];
assign B_DOUT_6_net_0[7]        = B_DOUT_6[7];
assign B_DOUT[7:7]              = B_DOUT_6_net_0[7];
assign B_DOUT_7_net_0[8]        = B_DOUT_7[10];
assign B_DOUT[8:8]              = B_DOUT_7_net_0[8];
assign B_DOUT_8_net_0[9]        = B_DOUT_8[11];
assign B_DOUT[9:9]              = B_DOUT_8_net_0[9];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign B_DIN_slice_0[0]                     = B_DIN[0:0];
assign B_DIN_slice_1[1]                     = B_DIN[1:1];
assign B_DIN_slice_2[2]                     = B_DIN[2:2];
assign B_DIN_slice_3[3]                     = B_DIN[3:3];
assign B_DIN_slice_4[4]                     = B_DIN[4:4];
assign B_DIN_slice_5[5]                     = B_DIN[5:5];
assign B_DIN_slice_6[6]                     = B_DIN[6:6];
assign B_DIN_slice_7[7]                     = B_DIN[7:7];
assign B_DIN_slice_8[8]                     = B_DIN[8:8];
assign B_DIN_slice_9[9]                     = B_DIN[9:9];
assign B_DIN_slice_10[10]                   = B_DIN[10:10];
assign B_DIN_slice_11[11]                   = B_DIN[11:11];
assign B_DIN_slice_12[12]                   = B_DIN[12:12];
assign B_DIN_slice_13[13]                   = B_DIN[13:13];
assign B_DIN_slice_14[14]                   = B_DIN[14:14];
assign B_DIN_slice_15[15]                   = B_DIN[15:15];
assign B_DIN_slice_16[16]                   = B_DIN[16:16];
assign B_DIN_slice_17[17]                   = B_DIN[17:17];
assign B_DIN_slice_18[18]                   = B_DIN[18:18];
assign B_DIN_slice_19[19]                   = B_DIN[19:19];
assign B_DIN_slice_20[20]                   = B_DIN[20:20];
assign B_DIN_slice_21[21]                   = B_DIN[21:21];
assign B_DIN_slice_22[22]                   = B_DIN[22:22];
assign B_DIN_slice_23[23]                   = B_DIN[23:23];
assign B_DIN_slice_24[24]                   = B_DIN[24:24];
assign B_DIN_slice_25[25]                   = B_DIN[25:25];
assign B_DIN_slice_26[26]                   = B_DIN[26:26];
assign B_DIN_slice_27[27]                   = B_DIN[27:27];
assign B_DIN_slice_28[28]                   = B_DIN[28:28];
assign B_DIN_slice_29[29]                   = B_DIN[29:29];
assign B_DIN_slice_30[30]                   = B_DIN[30:30];
assign B_DIN_slice_31[31]                   = B_DIN[31:31];
assign B_DOUT_net_0[0]                      = B_DOUT_net_2[0:0];
assign B_DOUT_0[1]                          = B_DOUT_net_2[1:1];
assign B_DOUT_1[2]                          = B_DOUT_net_2[2:2];
assign B_DOUT_2[3]                          = B_DOUT_net_2[3:3];
assign B_DOUT_3[4]                          = B_DOUT_net_2[4:4];
assign B_DOUT_4[5]                          = B_DOUT_net_2[5:5];
assign B_DOUT_5[6]                          = B_DOUT_net_2[6:6];
assign B_DOUT_6[7]                          = B_DOUT_net_2[7:7];
assign B_DOUT_7[10]                         = B_DOUT_net_2[10:10];
assign B_DOUT_8[11]                         = B_DOUT_net_2[11:11];
assign B_DOUT_9[12]                         = B_DOUT_net_2[12:12];
assign B_DOUT_10[13]                        = B_DOUT_net_2[13:13];
assign B_DOUT_11[14]                        = B_DOUT_net_2[14:14];
assign B_DOUT_12[15]                        = B_DOUT_net_2[15:15];
assign B_DOUT_13[16]                        = B_DOUT_net_2[16:16];
assign B_DOUT_14[17]                        = B_DOUT_net_2[17:17];
assign B_DOUT_15[20]                        = B_DOUT_net_2[20:20];
assign B_DOUT_16[21]                        = B_DOUT_net_2[21:21];
assign B_DOUT_17[22]                        = B_DOUT_net_2[22:22];
assign B_DOUT_18[23]                        = B_DOUT_net_2[23:23];
assign B_DOUT_19[24]                        = B_DOUT_net_2[24:24];
assign B_DOUT_20[25]                        = B_DOUT_net_2[25:25];
assign B_DOUT_21[26]                        = B_DOUT_net_2[26:26];
assign B_DOUT_22[27]                        = B_DOUT_net_2[27:27];
assign B_DOUT_23[30]                        = B_DOUT_net_2[30:30];
assign B_DOUT_24[31]                        = B_DOUT_net_2[31:31];
assign B_DOUT_25[32]                        = B_DOUT_net_2[32:32];
assign B_DOUT_26[33]                        = B_DOUT_net_2[33:33];
assign B_DOUT_27[34]                        = B_DOUT_net_2[34:34];
assign B_DOUT_28[35]                        = B_DOUT_net_2[35:35];
assign B_DOUT_29[36]                        = B_DOUT_net_2[36:36];
assign B_DOUT_30[37]                        = B_DOUT_net_2[37:37];
assign COREAXI4SRAM_0_MEM_RADDR0to0[0]      = MEM_RADDR[0:0];
assign COREAXI4SRAM_0_MEM_RADDR1to1[1]      = MEM_RADDR[1:1];
assign COREAXI4SRAM_0_MEM_RADDR2to2[2]      = MEM_RADDR[2:2];
assign COREAXI4SRAM_0_MEM_RADDR3to3[3]      = MEM_RADDR[3:3];
assign COREAXI4SRAM_0_MEM_RADDR4to4[4]      = MEM_RADDR[4:4];
assign COREAXI4SRAM_0_MEM_RADDR5to5[5]      = MEM_RADDR[5:5];
assign COREAXI4SRAM_0_MEM_RADDR6to6[6]      = MEM_RADDR[6:6];
assign COREAXI4SRAM_0_MEM_RADDR7to7[7]      = MEM_RADDR[7:7];
assign COREAXI4SRAM_0_MEM_RADDR8to8[8]      = MEM_RADDR[8:8];
assign COREAXI4SRAM_0_MEM_RADDR9to9[9]      = MEM_RADDR[9:9];
assign COREAXI4SRAM_0_MEM_RADDR10to10[10]   = MEM_RADDR[10:10];
assign COREAXI4SRAM_0_MEM_RADDR11to11[11]   = MEM_RADDR[11:11];
assign COREAXI4SRAM_0_MEM_RADDR12to12[12]   = MEM_RADDR[12:12];
assign COREAXI4SRAM_0_MEM_RADDR13to13[13]   = MEM_RADDR[13:13];
assign COREAXI4SRAM_0_MEM_RADDR14to14[14]   = MEM_RADDR[14:14];
assign COREAXI4SRAM_0_MEM_RADDR15to15[15]   = MEM_RADDR[15:15];
assign COREAXI4SRAM_0_MEM_RADDR16to16[16]   = MEM_RADDR[16:16];
assign COREAXI4SRAM_0_MEM_RADDR17to17[17]   = MEM_RADDR[17:17];
assign COREAXI4SRAM_0_MEM_RADDR18to18[18]   = MEM_RADDR[18:18];
assign COREAXI4SRAM_0_MEM_WADDR0to0[0]      = MEM_WADDR[0:0];
assign COREAXI4SRAM_0_MEM_WADDR1to1[1]      = MEM_WADDR[1:1];
assign COREAXI4SRAM_0_MEM_WADDR2to2[2]      = MEM_WADDR[2:2];
assign COREAXI4SRAM_0_MEM_WADDR3to3[3]      = MEM_WADDR[3:3];
assign COREAXI4SRAM_0_MEM_WADDR4to4[4]      = MEM_WADDR[4:4];
assign COREAXI4SRAM_0_MEM_WADDR5to5[5]      = MEM_WADDR[5:5];
assign COREAXI4SRAM_0_MEM_WADDR6to6[6]      = MEM_WADDR[6:6];
assign COREAXI4SRAM_0_MEM_WADDR7to7[7]      = MEM_WADDR[7:7];
assign COREAXI4SRAM_0_MEM_WADDR8to8[8]      = MEM_WADDR[8:8];
assign COREAXI4SRAM_0_MEM_WADDR9to9[9]      = MEM_WADDR[9:9];
assign COREAXI4SRAM_0_MEM_WADDR10to10[10]   = MEM_WADDR[10:10];
assign COREAXI4SRAM_0_MEM_WADDR11to11[11]   = MEM_WADDR[11:11];
assign COREAXI4SRAM_0_MEM_WADDR12to12[12]   = MEM_WADDR[12:12];
assign COREAXI4SRAM_0_MEM_WADDR13to13[13]   = MEM_WADDR[13:13];
assign COREAXI4SRAM_0_MEM_WADDR14to14[14]   = MEM_WADDR[14:14];
assign COREAXI4SRAM_0_MEM_WADDR15to15[15]   = MEM_WADDR[15:15];
assign COREAXI4SRAM_0_MEM_WADDR16to16[16]   = MEM_WADDR[16:16];
assign COREAXI4SRAM_0_MEM_WADDR17to17[17]   = MEM_WADDR[17:17];
assign COREAXI4SRAM_0_MEM_WADDR18to18[18]   = MEM_WADDR[18:18];
assign COREAXI4SRAM_0_MEM_WBYTE_EN0to0[0]   = MEM_WBYTE_EN[0:0];
assign COREAXI4SRAM_0_MEM_WBYTE_EN1to1[1]   = MEM_WBYTE_EN[1:1];
assign COREAXI4SRAM_0_MEM_WBYTE_EN2to2[2]   = MEM_WBYTE_EN[2:2];
assign COREAXI4SRAM_0_MEM_WBYTE_EN3to3[3]   = MEM_WBYTE_EN[3:3];
assign COREAXI4SRAM_0_MEM_WDATA0to0[0]      = MEM_WDATA[0:0];
assign COREAXI4SRAM_0_MEM_WDATA1to1[1]      = MEM_WDATA[1:1];
assign COREAXI4SRAM_0_MEM_WDATA2to2[2]      = MEM_WDATA[2:2];
assign COREAXI4SRAM_0_MEM_WDATA3to3[3]      = MEM_WDATA[3:3];
assign COREAXI4SRAM_0_MEM_WDATA4to4[4]      = MEM_WDATA[4:4];
assign COREAXI4SRAM_0_MEM_WDATA5to5[5]      = MEM_WDATA[5:5];
assign COREAXI4SRAM_0_MEM_WDATA6to6[6]      = MEM_WDATA[6:6];
assign COREAXI4SRAM_0_MEM_WDATA7to7[7]      = MEM_WDATA[7:7];
assign COREAXI4SRAM_0_MEM_WDATA8to8[8]      = MEM_WDATA[8:8];
assign COREAXI4SRAM_0_MEM_WDATA9to9[9]      = MEM_WDATA[9:9];
assign COREAXI4SRAM_0_MEM_WDATA10to10[10]   = MEM_WDATA[10:10];
assign COREAXI4SRAM_0_MEM_WDATA11to11[11]   = MEM_WDATA[11:11];
assign COREAXI4SRAM_0_MEM_WDATA12to12[12]   = MEM_WDATA[12:12];
assign COREAXI4SRAM_0_MEM_WDATA13to13[13]   = MEM_WDATA[13:13];
assign COREAXI4SRAM_0_MEM_WDATA14to14[14]   = MEM_WDATA[14:14];
assign COREAXI4SRAM_0_MEM_WDATA15to15[15]   = MEM_WDATA[15:15];
assign COREAXI4SRAM_0_MEM_WDATA16to16[16]   = MEM_WDATA[16:16];
assign COREAXI4SRAM_0_MEM_WDATA17to17[17]   = MEM_WDATA[17:17];
assign COREAXI4SRAM_0_MEM_WDATA18to18[18]   = MEM_WDATA[18:18];
assign COREAXI4SRAM_0_MEM_WDATA19to19[19]   = MEM_WDATA[19:19];
assign COREAXI4SRAM_0_MEM_WDATA20to20[20]   = MEM_WDATA[20:20];
assign COREAXI4SRAM_0_MEM_WDATA21to21[21]   = MEM_WDATA[21:21];
assign COREAXI4SRAM_0_MEM_WDATA22to22[22]   = MEM_WDATA[22:22];
assign COREAXI4SRAM_0_MEM_WDATA23to23[23]   = MEM_WDATA[23:23];
assign COREAXI4SRAM_0_MEM_WDATA24to24[24]   = MEM_WDATA[24:24];
assign COREAXI4SRAM_0_MEM_WDATA25to25[25]   = MEM_WDATA[25:25];
assign COREAXI4SRAM_0_MEM_WDATA26to26[26]   = MEM_WDATA[26:26];
assign COREAXI4SRAM_0_MEM_WDATA27to27[27]   = MEM_WDATA[27:27];
assign COREAXI4SRAM_0_MEM_WDATA28to28[28]   = MEM_WDATA[28:28];
assign COREAXI4SRAM_0_MEM_WDATA29to29[29]   = MEM_WDATA[29:29];
assign COREAXI4SRAM_0_MEM_WDATA30to30[30]   = MEM_WDATA[30:30];
assign COREAXI4SRAM_0_MEM_WDATA31to31[31]   = MEM_WDATA[31:31];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT0to0[0]    = A_DOUT_net_0[0:0];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT1to1[1]    = A_DOUT_net_0[1:1];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT2to2[2]    = A_DOUT_net_0[2:2];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT3to3[3]    = A_DOUT_net_0[3:3];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT4to4[4]    = A_DOUT_net_0[4:4];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT5to5[5]    = A_DOUT_net_0[5:5];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT6to6[6]    = A_DOUT_net_0[6:6];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT7to7[7]    = A_DOUT_net_0[7:7];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT10to10[10] = A_DOUT_net_0[10:10];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT11to11[11] = A_DOUT_net_0[11:11];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT12to12[12] = A_DOUT_net_0[12:12];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT13to13[13] = A_DOUT_net_0[13:13];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT14to14[14] = A_DOUT_net_0[14:14];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT15to15[15] = A_DOUT_net_0[15:15];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT16to16[16] = A_DOUT_net_0[16:16];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT17to17[17] = A_DOUT_net_0[17:17];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT20to20[20] = A_DOUT_net_0[20:20];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT21to21[21] = A_DOUT_net_0[21:21];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT22to22[22] = A_DOUT_net_0[22:22];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT23to23[23] = A_DOUT_net_0[23:23];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT24to24[24] = A_DOUT_net_0[24:24];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT25to25[25] = A_DOUT_net_0[25:25];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT26to26[26] = A_DOUT_net_0[26:26];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT27to27[27] = A_DOUT_net_0[27:27];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT30to30[30] = A_DOUT_net_0[30:30];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT31to31[31] = A_DOUT_net_0[31:31];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT32to32[32] = A_DOUT_net_0[32:32];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT33to33[33] = A_DOUT_net_0[33:33];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT34to34[34] = A_DOUT_net_0[34:34];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT35to35[35] = A_DOUT_net_0[35:35];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT36to36[36] = A_DOUT_net_0[36:36];
assign PF_DPSRAM_AHB_AXI_0_A_DOUT37to37[37] = A_DOUT_net_0[37:37];
assign A_DOUT_slice_0[18]                   = A_DOUT_net_0[18:18];
assign A_DOUT_slice_1[19]                   = A_DOUT_net_0[19:19];
assign A_DOUT_slice_2[28]                   = A_DOUT_net_0[28:28];
assign A_DOUT_slice_3[29]                   = A_DOUT_net_0[29:29];
assign A_DOUT_slice_4[38]                   = A_DOUT_net_0[38:38];
assign A_DOUT_slice_5[39]                   = A_DOUT_net_0[39:39];
assign A_DOUT_slice_6[8]                    = A_DOUT_net_0[8:8];
assign A_DOUT_slice_7[9]                    = A_DOUT_net_0[9:9];
assign B_DOUT_slice_0[18]                   = B_DOUT_net_2[18:18];
assign B_DOUT_slice_1[19]                   = B_DOUT_net_2[19:19];
assign B_DOUT_slice_2[28]                   = B_DOUT_net_2[28:28];
assign B_DOUT_slice_3[29]                   = B_DOUT_net_2[29:29];
assign B_DOUT_slice_4[38]                   = B_DOUT_net_2[38:38];
assign B_DOUT_slice_5[39]                   = B_DOUT_net_2[39:39];
assign B_DOUT_slice_6[8]                    = B_DOUT_net_2[8:8];
assign B_DOUT_slice_7[9]                    = B_DOUT_net_2[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign MEM_RDATA_net_0  = { PF_DPSRAM_AHB_AXI_0_A_DOUT37to37[37] , PF_DPSRAM_AHB_AXI_0_A_DOUT36to36[36] , PF_DPSRAM_AHB_AXI_0_A_DOUT35to35[35] , PF_DPSRAM_AHB_AXI_0_A_DOUT34to34[34] , PF_DPSRAM_AHB_AXI_0_A_DOUT33to33[33] , PF_DPSRAM_AHB_AXI_0_A_DOUT32to32[32] , PF_DPSRAM_AHB_AXI_0_A_DOUT31to31[31] , PF_DPSRAM_AHB_AXI_0_A_DOUT30to30[30] , PF_DPSRAM_AHB_AXI_0_A_DOUT27to27[27] , PF_DPSRAM_AHB_AXI_0_A_DOUT26to26[26] , PF_DPSRAM_AHB_AXI_0_A_DOUT25to25[25] , PF_DPSRAM_AHB_AXI_0_A_DOUT24to24[24] , PF_DPSRAM_AHB_AXI_0_A_DOUT23to23[23] , PF_DPSRAM_AHB_AXI_0_A_DOUT22to22[22] , PF_DPSRAM_AHB_AXI_0_A_DOUT21to21[21] , PF_DPSRAM_AHB_AXI_0_A_DOUT20to20[20] , PF_DPSRAM_AHB_AXI_0_A_DOUT17to17[17] , PF_DPSRAM_AHB_AXI_0_A_DOUT16to16[16] , PF_DPSRAM_AHB_AXI_0_A_DOUT15to15[15] , PF_DPSRAM_AHB_AXI_0_A_DOUT14to14[14] , PF_DPSRAM_AHB_AXI_0_A_DOUT13to13[13] , PF_DPSRAM_AHB_AXI_0_A_DOUT12to12[12] , PF_DPSRAM_AHB_AXI_0_A_DOUT11to11[11] , PF_DPSRAM_AHB_AXI_0_A_DOUT10to10[10] , PF_DPSRAM_AHB_AXI_0_A_DOUT7to7[7] , PF_DPSRAM_AHB_AXI_0_A_DOUT6to6[6] , PF_DPSRAM_AHB_AXI_0_A_DOUT5to5[5] , PF_DPSRAM_AHB_AXI_0_A_DOUT4to4[4] , PF_DPSRAM_AHB_AXI_0_A_DOUT3to3[3] , PF_DPSRAM_AHB_AXI_0_A_DOUT2to2[2] , PF_DPSRAM_AHB_AXI_0_A_DOUT1to1[1] , PF_DPSRAM_AHB_AXI_0_A_DOUT0to0[0] };
assign A_DIN_net_0      = { 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA31to31[31] , COREAXI4SRAM_0_MEM_WDATA30to30[30] , COREAXI4SRAM_0_MEM_WDATA29to29[29] , COREAXI4SRAM_0_MEM_WDATA28to28[28] , COREAXI4SRAM_0_MEM_WDATA27to27[27] , COREAXI4SRAM_0_MEM_WDATA26to26[26] , COREAXI4SRAM_0_MEM_WDATA25to25[25] , COREAXI4SRAM_0_MEM_WDATA24to24[24] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA23to23[23] , COREAXI4SRAM_0_MEM_WDATA22to22[22] , COREAXI4SRAM_0_MEM_WDATA21to21[21] , COREAXI4SRAM_0_MEM_WDATA20to20[20] , COREAXI4SRAM_0_MEM_WDATA19to19[19] , COREAXI4SRAM_0_MEM_WDATA18to18[18] , COREAXI4SRAM_0_MEM_WDATA17to17[17] , COREAXI4SRAM_0_MEM_WDATA16to16[16] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA15to15[15] , COREAXI4SRAM_0_MEM_WDATA14to14[14] , COREAXI4SRAM_0_MEM_WDATA13to13[13] , COREAXI4SRAM_0_MEM_WDATA12to12[12] , COREAXI4SRAM_0_MEM_WDATA11to11[11] , COREAXI4SRAM_0_MEM_WDATA10to10[10] , COREAXI4SRAM_0_MEM_WDATA9to9[9] , COREAXI4SRAM_0_MEM_WDATA8to8[8] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA7to7[7] , COREAXI4SRAM_0_MEM_WDATA6to6[6] , COREAXI4SRAM_0_MEM_WDATA5to5[5] , COREAXI4SRAM_0_MEM_WDATA4to4[4] , COREAXI4SRAM_0_MEM_WDATA3to3[3] , COREAXI4SRAM_0_MEM_WDATA2to2[2] , COREAXI4SRAM_0_MEM_WDATA1to1[1] , COREAXI4SRAM_0_MEM_WDATA0to0[0] };
assign A_ADDR_net_0     = { MX2_18_Y , MX2_17_Y , MX2_16_Y , MX2_15_Y , MX2_14_Y , MX2_13_Y , MX2_12_Y , MX2_11_Y , MX2_10_Y , MX2_9_Y , MX2_8_Y , MX2_7_Y , MX2_6_Y , MX2_5_Y , MX2_4_Y , MX2_3_Y , MX2_2_Y , MX2_1_Y , MX2_0_Y };
assign B_DIN_net_0      = { 1'b0 , 1'b0 , B_DIN_slice_31[31] , B_DIN_slice_30[30] , B_DIN_slice_29[29] , B_DIN_slice_28[28] , B_DIN_slice_27[27] , B_DIN_slice_26[26] , B_DIN_slice_25[25] , B_DIN_slice_24[24] , 1'b0 , 1'b0 , B_DIN_slice_23[23] , B_DIN_slice_22[22] , B_DIN_slice_21[21] , B_DIN_slice_20[20] , B_DIN_slice_19[19] , B_DIN_slice_18[18] , B_DIN_slice_17[17] , B_DIN_slice_16[16] , 1'b0 , 1'b0 , B_DIN_slice_15[15] , B_DIN_slice_14[14] , B_DIN_slice_13[13] , B_DIN_slice_12[12] , B_DIN_slice_11[11] , B_DIN_slice_10[10] , B_DIN_slice_9[9] , B_DIN_slice_8[8] , 1'b0 , 1'b0 , B_DIN_slice_7[7] , B_DIN_slice_6[6] , B_DIN_slice_5[5] , B_DIN_slice_4[4] , B_DIN_slice_3[3] , B_DIN_slice_2[2] , B_DIN_slice_1[1] , B_DIN_slice_0[0] };
assign B_ADDR_net_0     = { B_ADDR };
assign A_WBYTE_EN_net_0 = { COREAXI4SRAM_0_MEM_WBYTE_EN3to3[3] , COREAXI4SRAM_0_MEM_WBYTE_EN3to3[3] , COREAXI4SRAM_0_MEM_WBYTE_EN2to2[2] , COREAXI4SRAM_0_MEM_WBYTE_EN2to2[2] , COREAXI4SRAM_0_MEM_WBYTE_EN1to1[1] , COREAXI4SRAM_0_MEM_WBYTE_EN1to1[1] , COREAXI4SRAM_0_MEM_WBYTE_EN0to0[0] , COREAXI4SRAM_0_MEM_WBYTE_EN0to0[0] };
assign B_WBYTE_EN_net_0 = { B_WBYTE_EN };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_SRAM_AHBL_AXI_C0_COREAXI4SRAM_0_COREAXI4SRAM   -   Actel:DirectCore:COREAXI4SRAM:2.7.102
PF_SRAM_AHBL_AXI_C0_COREAXI4SRAM_0_COREAXI4SRAM #( 
        .AXI4_AWIDTH    ( 32 ),
        .AXI4_DWIDTH    ( 32 ),
        .AXI4_IDWIDTH   ( 8 ),
        .AXI4_IFTYPE_RD ( 1 ),
        .AXI4_IFTYPE_WR ( 1 ),
        .ECC            ( 0 ),
        .FAMILY         ( 25 ),
        .MEM_DEPTH      ( 487424 ),
        .PIPE           ( 1 ),
        .SEL_SRAM_TYPE  ( 1 ),
        .WRAP_SUPPORT   ( 0 ) )
COREAXI4SRAM_0(
        // Inputs
        .ACLK         ( ACLK ),
        .ARESETN      ( ARESETN ),
        .AWADDR       ( AWADDR ),
        .AWLEN        ( AWLEN ),
        .AWSIZE       ( AWSIZE ),
        .AWBURST      ( AWBURST ),
        .AWCACHE      ( AWCACHE ),
        .AWPROT       ( AWPROT ),
        .AWLOCK       ( AWLOCK ),
        .AWVALID      ( AWVALID ),
        .WDATA        ( WDATA ),
        .WSTRB        ( WSTRB ),
        .WLAST        ( WLAST ),
        .WVALID       ( WVALID ),
        .BREADY       ( BREADY ),
        .ARADDR       ( ARADDR ),
        .ARLEN        ( ARLEN ),
        .ARSIZE       ( ARSIZE ),
        .ARBURST      ( ARBURST ),
        .ARCACHE      ( ARCACHE ),
        .ARPROT       ( ARPROT ),
        .ARLOCK       ( ARLOCK ),
        .ARVALID      ( ARVALID ),
        .RREADY       ( RREADY ),
        .AWID         ( AWID ),
        .ARID         ( ARID ),
        .MEM_RDATA    ( MEM_RDATA_net_0 ),
        // Outputs
        .AWREADY      ( AXI4_Slave_AWREADY ),
        .WREADY       ( AXI4_Slave_WREADY ),
        .BRESP        ( AXI4_Slave_BRESP ),
        .BVALID       ( AXI4_Slave_BVALID ),
        .ARREADY      ( AXI4_Slave_ARREADY ),
        .RDATA        ( AXI4_Slave_RDATA ),
        .RRESP        ( AXI4_Slave_RRESP ),
        .RLAST        ( AXI4_Slave_RLAST ),
        .RVALID       ( AXI4_Slave_RVALID ),
        .RID          ( AXI4_Slave_RID ),
        .BID          ( AXI4_Slave_BID ),
        .MEM_WADDR    ( MEM_WADDR ),
        .MEM_WDATA    ( MEM_WDATA ),
        .MEM_REN      ( COREAXI4SRAM_0_MEM_REN ),
        .MEM_WEN      ( COREAXI4SRAM_0_MEM_WEN ),
        .MEM_RADDR    ( MEM_RADDR ),
        .MEM_WBYTE_EN ( MEM_WBYTE_EN ) 
        );

//--------MX2
MX2 MX2_0(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR0to0 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR0to0 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_0_Y ) 
        );

//--------MX2
MX2 MX2_1(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR1to1 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR1to1 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_1_Y ) 
        );

//--------MX2
MX2 MX2_2(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR2to2 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR2to2 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_2_Y ) 
        );

//--------MX2
MX2 MX2_3(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR3to3 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR3to3 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_3_Y ) 
        );

//--------MX2
MX2 MX2_4(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR4to4 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR4to4 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_4_Y ) 
        );

//--------MX2
MX2 MX2_5(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR5to5 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR5to5 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_5_Y ) 
        );

//--------MX2
MX2 MX2_6(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR6to6 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR6to6 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_6_Y ) 
        );

//--------MX2
MX2 MX2_7(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR7to7 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR7to7 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_7_Y ) 
        );

//--------MX2
MX2 MX2_8(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR8to8 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR8to8 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_8_Y ) 
        );

//--------MX2
MX2 MX2_9(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR9to9 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR9to9 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_9_Y ) 
        );

//--------MX2
MX2 MX2_10(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR10to10 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR10to10 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_10_Y ) 
        );

//--------MX2
MX2 MX2_11(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR11to11 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR11to11 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_11_Y ) 
        );

//--------MX2
MX2 MX2_12(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR12to12 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR12to12 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_12_Y ) 
        );

//--------MX2
MX2 MX2_13(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR13to13 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR13to13 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_13_Y ) 
        );

//--------MX2
MX2 MX2_14(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR14to14 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR14to14 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_14_Y ) 
        );

//--------MX2
MX2 MX2_15(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR15to15 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR15to15 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_15_Y ) 
        );

//--------MX2
MX2 MX2_16(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR16to16 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR16to16 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_16_Y ) 
        );

//--------MX2
MX2 MX2_17(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR17to17 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR17to17 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_17_Y ) 
        );

//--------MX2
MX2 MX2_18(
        // Inputs
        .A ( COREAXI4SRAM_0_MEM_RADDR18to18 ),
        .B ( COREAXI4SRAM_0_MEM_WADDR18to18 ),
        .S ( COREAXI4SRAM_0_MEM_WEN ),
        // Outputs
        .Y ( MX2_18_Y ) 
        );

//--------PF_SRAM_AHBL_AXI_C0_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM   -   Actel:SgCore:PF_DPSRAM:1.1.110
PF_SRAM_AHBL_AXI_C0_PF_DPSRAM_AHB_AXI_0_PF_DPSRAM PF_DPSRAM_AHB_AXI_0(
        // Inputs
        .A_DIN      ( A_DIN_net_0 ),
        .A_ADDR     ( A_ADDR_net_0 ),
        .B_DIN      ( B_DIN_net_0 ),
        .B_ADDR     ( B_ADDR_net_0 ),
        .A_WBYTE_EN ( A_WBYTE_EN_net_0 ),
        .B_WBYTE_EN ( B_WBYTE_EN_net_0 ),
        .A_WEN      ( COREAXI4SRAM_0_MEM_WEN ),
        .A_REN      ( COREAXI4SRAM_0_MEM_REN ),
        .B_WEN      ( B_WEN ),
        .B_BLK_EN   ( B_BLK_EN ),
        .A_CLK      ( ACLK ),
        .B_CLK      ( B_CLK ),
        // Outputs
        .A_DOUT     ( A_DOUT_net_0 ),
        .B_DOUT     ( B_DOUT_net_2 ) 
        );


endmodule

//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Feb  5 12:38:14 2024
// Version: 2023.2 2023.2.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of COREAXI4SRAM_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component COREAXI4SRAM_C0
create_and_configure_core -core_vlnv {Actel:DirectCore:COREAXI4SRAM:2.7.102} -component_name {COREAXI4SRAM_C0} -params {\
"AXI4_AWIDTH:32"  \
"AXI4_DWIDTH:64"  \
"AXI4_IDWIDTH:4"  \
"AXI4_IFTYPE_RD:true"  \
"AXI4_IFTYPE_WR:true"  \
"MEM_DEPTH:512"  \
"SEL_SRAM_TYPE:1"  \
"WRAP_SUPPORT:false"   }
# Exporting Component Description of COREAXI4SRAM_C0 to TCL done
*/

// COREAXI4SRAM_C0
module COREAXI4SRAM_C0(
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
    MEM_RDATA,
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
    MEM_RADDR,
    MEM_REN,
    MEM_WADDR,
    MEM_WBYTE_EN,
    MEM_WDATA,
    MEM_WEN,
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
input  [3:0]  ARID;
input  [7:0]  ARLEN;
input  [1:0]  ARLOCK;
input  [2:0]  ARPROT;
input  [2:0]  ARSIZE;
input         ARVALID;
input  [31:0] AWADDR;
input  [1:0]  AWBURST;
input  [3:0]  AWCACHE;
input  [3:0]  AWID;
input  [7:0]  AWLEN;
input  [1:0]  AWLOCK;
input  [2:0]  AWPROT;
input  [2:0]  AWSIZE;
input         AWVALID;
input         BREADY;
input  [63:0] MEM_RDATA;
input         RREADY;
input  [63:0] WDATA;
input         WLAST;
input  [7:0]  WSTRB;
input         WVALID;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ARREADY;
output        AWREADY;
output [3:0]  BID;
output [1:0]  BRESP;
output        BVALID;
output [8:0]  MEM_RADDR;
output        MEM_REN;
output [8:0]  MEM_WADDR;
output [7:0]  MEM_WBYTE_EN;
output [63:0] MEM_WDATA;
output        MEM_WEN;
output [63:0] RDATA;
output [3:0]  RID;
output        RLAST;
output [1:0]  RRESP;
output        RVALID;
output        WREADY;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ACLK;
wire          ARESETN;
wire   [31:0] ARADDR;
wire   [1:0]  ARBURST;
wire   [3:0]  ARCACHE;
wire   [3:0]  ARID;
wire   [7:0]  ARLEN;
wire   [1:0]  ARLOCK;
wire   [2:0]  ARPROT;
wire          AXI4_Slave_ARREADY;
wire   [2:0]  ARSIZE;
wire          ARVALID;
wire   [31:0] AWADDR;
wire   [1:0]  AWBURST;
wire   [3:0]  AWCACHE;
wire   [3:0]  AWID;
wire   [7:0]  AWLEN;
wire   [1:0]  AWLOCK;
wire   [2:0]  AWPROT;
wire          AXI4_Slave_AWREADY;
wire   [2:0]  AWSIZE;
wire          AWVALID;
wire   [3:0]  AXI4_Slave_BID;
wire          BREADY;
wire   [1:0]  AXI4_Slave_BRESP;
wire          AXI4_Slave_BVALID;
wire   [63:0] AXI4_Slave_RDATA;
wire   [3:0]  AXI4_Slave_RID;
wire          AXI4_Slave_RLAST;
wire          RREADY;
wire   [1:0]  AXI4_Slave_RRESP;
wire          AXI4_Slave_RVALID;
wire   [63:0] WDATA;
wire          WLAST;
wire          AXI4_Slave_WREADY;
wire   [7:0]  WSTRB;
wire          WVALID;
wire   [8:0]  MEM_RADDR_net_0;
wire   [63:0] MEM_RDATA;
wire          MEM_REN_net_0;
wire   [8:0]  MEM_WADDR_net_0;
wire   [7:0]  MEM_WBYTE_EN_net_0;
wire   [63:0] MEM_WDATA_net_0;
wire          MEM_WEN_net_0;
wire   [8:0]  MEM_WADDR_net_1;
wire   [63:0] MEM_WDATA_net_1;
wire          MEM_REN_net_1;
wire          MEM_WEN_net_1;
wire   [8:0]  MEM_RADDR_net_1;
wire   [7:0]  MEM_WBYTE_EN_net_1;
wire          AXI4_Slave_AWREADY_net_0;
wire          AXI4_Slave_WREADY_net_0;
wire          AXI4_Slave_BVALID_net_0;
wire          AXI4_Slave_ARREADY_net_0;
wire   [63:0] AXI4_Slave_RDATA_net_0;
wire   [1:0]  AXI4_Slave_RRESP_net_0;
wire          AXI4_Slave_RLAST_net_0;
wire          AXI4_Slave_RVALID_net_0;
wire   [1:0]  AXI4_Slave_BRESP_net_0;
wire   [3:0]  AXI4_Slave_BID_net_0;
wire   [3:0]  AXI4_Slave_RID_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign MEM_WADDR_net_1          = MEM_WADDR_net_0;
assign MEM_WADDR[8:0]           = MEM_WADDR_net_1;
assign MEM_WDATA_net_1          = MEM_WDATA_net_0;
assign MEM_WDATA[63:0]          = MEM_WDATA_net_1;
assign MEM_REN_net_1            = MEM_REN_net_0;
assign MEM_REN                  = MEM_REN_net_1;
assign MEM_WEN_net_1            = MEM_WEN_net_0;
assign MEM_WEN                  = MEM_WEN_net_1;
assign MEM_RADDR_net_1          = MEM_RADDR_net_0;
assign MEM_RADDR[8:0]           = MEM_RADDR_net_1;
assign MEM_WBYTE_EN_net_1       = MEM_WBYTE_EN_net_0;
assign MEM_WBYTE_EN[7:0]        = MEM_WBYTE_EN_net_1;
assign AXI4_Slave_AWREADY_net_0 = AXI4_Slave_AWREADY;
assign AWREADY                  = AXI4_Slave_AWREADY_net_0;
assign AXI4_Slave_WREADY_net_0  = AXI4_Slave_WREADY;
assign WREADY                   = AXI4_Slave_WREADY_net_0;
assign AXI4_Slave_BVALID_net_0  = AXI4_Slave_BVALID;
assign BVALID                   = AXI4_Slave_BVALID_net_0;
assign AXI4_Slave_ARREADY_net_0 = AXI4_Slave_ARREADY;
assign ARREADY                  = AXI4_Slave_ARREADY_net_0;
assign AXI4_Slave_RDATA_net_0   = AXI4_Slave_RDATA;
assign RDATA[63:0]              = AXI4_Slave_RDATA_net_0;
assign AXI4_Slave_RRESP_net_0   = AXI4_Slave_RRESP;
assign RRESP[1:0]               = AXI4_Slave_RRESP_net_0;
assign AXI4_Slave_RLAST_net_0   = AXI4_Slave_RLAST;
assign RLAST                    = AXI4_Slave_RLAST_net_0;
assign AXI4_Slave_RVALID_net_0  = AXI4_Slave_RVALID;
assign RVALID                   = AXI4_Slave_RVALID_net_0;
assign AXI4_Slave_BRESP_net_0   = AXI4_Slave_BRESP;
assign BRESP[1:0]               = AXI4_Slave_BRESP_net_0;
assign AXI4_Slave_BID_net_0     = AXI4_Slave_BID;
assign BID[3:0]                 = AXI4_Slave_BID_net_0;
assign AXI4_Slave_RID_net_0     = AXI4_Slave_RID;
assign RID[3:0]                 = AXI4_Slave_RID_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------COREAXI4SRAM_C0_COREAXI4SRAM_C0_0_COREAXI4SRAM   -   Actel:DirectCore:COREAXI4SRAM:2.7.102
COREAXI4SRAM_C0_COREAXI4SRAM_C0_0_COREAXI4SRAM #( 
        .AXI4_AWIDTH    ( 32 ),
        .AXI4_DWIDTH    ( 64 ),
        .AXI4_IDWIDTH   ( 4 ),
        .AXI4_IFTYPE_RD ( 1 ),
        .AXI4_IFTYPE_WR ( 1 ),
        .ECC            ( 0 ),
        .FAMILY         ( 26 ),
        .MEM_DEPTH      ( 512 ),
        .PIPE           ( 1 ),
        .SEL_SRAM_TYPE  ( 1 ),
        .WRAP_SUPPORT   ( 0 ) )
COREAXI4SRAM_C0_0(
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
        .MEM_RDATA    ( MEM_RDATA ),
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
        .MEM_WADDR    ( MEM_WADDR_net_0 ),
        .MEM_WDATA    ( MEM_WDATA_net_0 ),
        .MEM_REN      ( MEM_REN_net_0 ),
        .MEM_WEN      ( MEM_WEN_net_0 ),
        .MEM_RADDR    ( MEM_RADDR_net_0 ),
        .MEM_WBYTE_EN ( MEM_WBYTE_EN_net_0 ) 
        );


endmodule

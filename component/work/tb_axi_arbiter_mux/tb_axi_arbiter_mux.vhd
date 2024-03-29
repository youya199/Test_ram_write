----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb 20 13:15:18 2024
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
-- tb_axi_arbiter_mux entity declaration
----------------------------------------------------------------------
entity tb_axi_arbiter_mux is
end tb_axi_arbiter_mux;
----------------------------------------------------------------------
-- tb_axi_arbiter_mux architecture body
----------------------------------------------------------------------
architecture RTL of tb_axi_arbiter_mux is
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
-- axi_arbiter_mus
-- using entity instantiation for component axi_arbiter_mus
-- axi_master_florian_64bits
-- using entity instantiation for component axi_master_florian_64bits
-- CLK_GEN_C0
component CLK_GEN_C0
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
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
signal AndOfThree_0_addr                         : std_logic_vector(31 downto 0);
signal AndOfThree_0_start_write                  : std_logic;
signal AndOfThree_1_addr                         : std_logic_vector(31 downto 0);
signal AndOfThree_1_start_write                  : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_ARADDR          : std_logic_vector(31 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARBURST         : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARCACHE         : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARID            : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARLEN           : std_logic_vector(7 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARLOCK          : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARPROT          : std_logic_vector(2 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARREADY         : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_ARSIZE          : std_logic_vector(2 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_ARVALID         : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_AWADDR          : std_logic_vector(31 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWBURST         : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWCACHE         : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWID            : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWLEN           : std_logic_vector(7 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWLOCK          : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWPROT          : std_logic_vector(2 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWREADY         : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_AWSIZE          : std_logic_vector(2 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_AWVALID         : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_BID             : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_BREADY          : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_BRESP           : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_BVALID          : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_RID             : std_logic_vector(3 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_RLAST           : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_RREADY          : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_RRESP           : std_logic_vector(1 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_RVALID          : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_WLAST           : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_WREADY          : std_logic;
signal axi_arbiter_mus_0_BIF_ddr_WVALID          : std_logic;
signal axi_master_florian_64bits_0_BIF_1_ARADDR  : std_logic_vector(31 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARBURST : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARCACHE : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARID    : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARLEN   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARLOCK  : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARPROT  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARREADY : std_logic;
signal axi_master_florian_64bits_0_BIF_1_ARSIZE  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_0_BIF_1_ARVALID : std_logic;
signal axi_master_florian_64bits_0_BIF_1_AWADDR  : std_logic_vector(31 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWBURST : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWCACHE : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWID    : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWLEN   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWLOCK  : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWPROT  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWREADY : std_logic;
signal axi_master_florian_64bits_0_BIF_1_AWSIZE  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_0_BIF_1_AWVALID : std_logic;
signal axi_master_florian_64bits_0_BIF_1_BID     : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_BREADY  : std_logic;
signal axi_master_florian_64bits_0_BIF_1_BRESP   : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_BVALID  : std_logic;
signal axi_master_florian_64bits_0_BIF_1_RID     : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_0_BIF_1_RLAST   : std_logic;
signal axi_master_florian_64bits_0_BIF_1_RREADY  : std_logic;
signal axi_master_florian_64bits_0_BIF_1_RRESP   : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_0_BIF_1_RVALID  : std_logic;
signal axi_master_florian_64bits_0_BIF_1_WLAST   : std_logic;
signal axi_master_florian_64bits_0_BIF_1_WREADY  : std_logic;
signal axi_master_florian_64bits_0_BIF_1_WVALID  : std_logic;
signal axi_master_florian_64bits_0_o_ready       : std_logic;
signal axi_master_florian_64bits_1_BIF_1_ARADDR  : std_logic_vector(31 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARBURST : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARCACHE : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARID    : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARLEN   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARLOCK  : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARPROT  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARREADY : std_logic;
signal axi_master_florian_64bits_1_BIF_1_ARSIZE  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_1_BIF_1_ARVALID : std_logic;
signal axi_master_florian_64bits_1_BIF_1_AWADDR  : std_logic_vector(31 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWBURST : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWCACHE : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWID    : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWLEN   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWLOCK  : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWPROT  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWREADY : std_logic;
signal axi_master_florian_64bits_1_BIF_1_AWSIZE  : std_logic_vector(2 downto 0);
signal axi_master_florian_64bits_1_BIF_1_AWVALID : std_logic;
signal axi_master_florian_64bits_1_BIF_1_BID     : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_BREADY  : std_logic;
signal axi_master_florian_64bits_1_BIF_1_BRESP   : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_BVALID  : std_logic;
signal axi_master_florian_64bits_1_BIF_1_RID     : std_logic_vector(3 downto 0);
signal axi_master_florian_64bits_1_BIF_1_RLAST   : std_logic;
signal axi_master_florian_64bits_1_BIF_1_RREADY  : std_logic;
signal axi_master_florian_64bits_1_BIF_1_RRESP   : std_logic_vector(1 downto 0);
signal axi_master_florian_64bits_1_BIF_1_RVALID  : std_logic;
signal axi_master_florian_64bits_1_BIF_1_WLAST   : std_logic;
signal axi_master_florian_64bits_1_BIF_1_WREADY  : std_logic;
signal axi_master_florian_64bits_1_BIF_1_WVALID  : std_logic;
signal axi_master_florian_64bits_1_o_ready       : std_logic;
signal CLK_GEN_C0_0_CLK                          : std_logic;
signal RESET_GEN_C1_1_RESET                      : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net                                   : std_logic;
signal GND_net                                   : std_logic;
signal i_rd_addr_const_net_0                     : std_logic_vector(31 downto 0);
signal i_write_transfer_size_const_net_0         : std_logic_vector(9 downto 0);
signal i_read_transfer_size_const_net_0          : std_logic_vector(9 downto 0);
signal i_data_const_net_0                        : std_logic_vector(63 downto 0);
signal i_rd_addr_const_net_1                     : std_logic_vector(31 downto 0);
signal i_write_transfer_size_const_net_1         : std_logic_vector(9 downto 0);
signal i_read_transfer_size_const_net_1          : std_logic_vector(9 downto 0);
signal i_data_const_net_1                        : std_logic_vector(63 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal axi_arbiter_mus_0_BIF_ddr_RDATA           : std_logic_vector(63 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_RDATA_0         : std_logic_vector(511 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_RDATA_0_511to64 : std_logic_vector(511 downto 64);
signal axi_arbiter_mus_0_BIF_ddr_RDATA_0_63to0   : std_logic_vector(63 downto 0);

signal axi_arbiter_mus_0_BIF_ddr_WDATA           : std_logic_vector(511 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_WDATA_0         : std_logic_vector(63 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_WDATA_0_63to0   : std_logic_vector(63 downto 0);

signal axi_arbiter_mus_0_BIF_ddr_WSTRB           : std_logic_vector(63 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_WSTRB_0         : std_logic_vector(7 downto 0);
signal axi_arbiter_mus_0_BIF_ddr_WSTRB_0_7to0    : std_logic_vector(7 downto 0);

signal axi_master_florian_64bits_0_BIF_1_RDATA   : std_logic_vector(511 downto 0);
signal axi_master_florian_64bits_0_BIF_1_RDATA_0 : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_0_BIF_1_RDATA_0_63to0: std_logic_vector(63 downto 0);

signal axi_master_florian_64bits_0_BIF_1_WDATA   : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_0_BIF_1_WDATA_0 : std_logic_vector(511 downto 0);
signal axi_master_florian_64bits_0_BIF_1_WDATA_0_511to64: std_logic_vector(511 downto 64);
signal axi_master_florian_64bits_0_BIF_1_WDATA_0_63to0: std_logic_vector(63 downto 0);

signal axi_master_florian_64bits_0_BIF_1_WSTRB   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_0_BIF_1_WSTRB_0 : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_0_BIF_1_WSTRB_0_63to8: std_logic_vector(63 downto 8);
signal axi_master_florian_64bits_0_BIF_1_WSTRB_0_7to0: std_logic_vector(7 downto 0);

signal axi_master_florian_64bits_1_BIF_1_RDATA   : std_logic_vector(511 downto 0);
signal axi_master_florian_64bits_1_BIF_1_RDATA_0 : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_1_BIF_1_RDATA_0_63to0: std_logic_vector(63 downto 0);

signal axi_master_florian_64bits_1_BIF_1_WDATA   : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_1_BIF_1_WDATA_0 : std_logic_vector(511 downto 0);
signal axi_master_florian_64bits_1_BIF_1_WDATA_0_511to64: std_logic_vector(511 downto 64);
signal axi_master_florian_64bits_1_BIF_1_WDATA_0_63to0: std_logic_vector(63 downto 0);

signal axi_master_florian_64bits_1_BIF_1_WSTRB   : std_logic_vector(7 downto 0);
signal axi_master_florian_64bits_1_BIF_1_WSTRB_0 : std_logic_vector(63 downto 0);
signal axi_master_florian_64bits_1_BIF_1_WSTRB_0_63to8: std_logic_vector(63 downto 8);
signal axi_master_florian_64bits_1_BIF_1_WSTRB_0_7to0: std_logic_vector(7 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net                           <= '1';
 GND_net                           <= '0';
 i_rd_addr_const_net_0             <= B"00000000000000000000000000000000";
 i_write_transfer_size_const_net_0 <= B"0000000001";
 i_read_transfer_size_const_net_0  <= B"0000000000";
 i_data_const_net_0                <= B"1111111111111111111111111111111111111111111111111111111111111111";
 i_rd_addr_const_net_1             <= B"00000000000000000000000000000000";
 i_write_transfer_size_const_net_1 <= B"0000000001";
 i_read_transfer_size_const_net_1  <= B"0000000000";
 i_data_const_net_1                <= B"0000000000000000000000000000000000000000000000000000000000000000";
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 axi_arbiter_mus_0_BIF_ddr_RDATA_0(511 downto 0) <= ( axi_arbiter_mus_0_BIF_ddr_RDATA_0_511to64(511 downto 64) & axi_arbiter_mus_0_BIF_ddr_RDATA_0_63to0(63 downto 0) );
 axi_arbiter_mus_0_BIF_ddr_RDATA_0_511to64(511 downto 64) <= B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
 axi_arbiter_mus_0_BIF_ddr_RDATA_0_63to0(63 downto 0) <= axi_arbiter_mus_0_BIF_ddr_RDATA(63 downto 0);

 axi_arbiter_mus_0_BIF_ddr_WDATA_0(63 downto 0) <= ( axi_arbiter_mus_0_BIF_ddr_WDATA_0_63to0(63 downto 0) );
 axi_arbiter_mus_0_BIF_ddr_WDATA_0_63to0(63 downto 0) <= axi_arbiter_mus_0_BIF_ddr_WDATA(63 downto 0);

 axi_arbiter_mus_0_BIF_ddr_WSTRB_0(7 downto 0) <= ( axi_arbiter_mus_0_BIF_ddr_WSTRB_0_7to0(7 downto 0) );
 axi_arbiter_mus_0_BIF_ddr_WSTRB_0_7to0(7 downto 0) <= axi_arbiter_mus_0_BIF_ddr_WSTRB(7 downto 0);

 axi_master_florian_64bits_0_BIF_1_RDATA_0(63 downto 0) <= ( axi_master_florian_64bits_0_BIF_1_RDATA_0_63to0(63 downto 0) );
 axi_master_florian_64bits_0_BIF_1_RDATA_0_63to0(63 downto 0) <= axi_master_florian_64bits_0_BIF_1_RDATA(63 downto 0);

 axi_master_florian_64bits_0_BIF_1_WDATA_0(511 downto 0) <= ( axi_master_florian_64bits_0_BIF_1_WDATA_0_511to64(511 downto 64) & axi_master_florian_64bits_0_BIF_1_WDATA_0_63to0(63 downto 0) );
 axi_master_florian_64bits_0_BIF_1_WDATA_0_511to64(511 downto 64) <= B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
 axi_master_florian_64bits_0_BIF_1_WDATA_0_63to0(63 downto 0) <= axi_master_florian_64bits_0_BIF_1_WDATA(63 downto 0);

 axi_master_florian_64bits_0_BIF_1_WSTRB_0(63 downto 0) <= ( axi_master_florian_64bits_0_BIF_1_WSTRB_0_63to8(63 downto 8) & axi_master_florian_64bits_0_BIF_1_WSTRB_0_7to0(7 downto 0) );
 axi_master_florian_64bits_0_BIF_1_WSTRB_0_63to8(63 downto 8) <= B"00000000000000000000000000000000000000000000000000000000";
 axi_master_florian_64bits_0_BIF_1_WSTRB_0_7to0(7 downto 0) <= axi_master_florian_64bits_0_BIF_1_WSTRB(7 downto 0);

 axi_master_florian_64bits_1_BIF_1_RDATA_0(63 downto 0) <= ( axi_master_florian_64bits_1_BIF_1_RDATA_0_63to0(63 downto 0) );
 axi_master_florian_64bits_1_BIF_1_RDATA_0_63to0(63 downto 0) <= axi_master_florian_64bits_1_BIF_1_RDATA(63 downto 0);

 axi_master_florian_64bits_1_BIF_1_WDATA_0(511 downto 0) <= ( axi_master_florian_64bits_1_BIF_1_WDATA_0_511to64(511 downto 64) & axi_master_florian_64bits_1_BIF_1_WDATA_0_63to0(63 downto 0) );
 axi_master_florian_64bits_1_BIF_1_WDATA_0_511to64(511 downto 64) <= B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
 axi_master_florian_64bits_1_BIF_1_WDATA_0_63to0(63 downto 0) <= axi_master_florian_64bits_1_BIF_1_WDATA(63 downto 0);

 axi_master_florian_64bits_1_BIF_1_WSTRB_0(63 downto 0) <= ( axi_master_florian_64bits_1_BIF_1_WSTRB_0_63to8(63 downto 8) & axi_master_florian_64bits_1_BIF_1_WSTRB_0_7to0(7 downto 0) );
 axi_master_florian_64bits_1_BIF_1_WSTRB_0_63to8(63 downto 8) <= B"00000000000000000000000000000000000000000000000000000000";
 axi_master_florian_64bits_1_BIF_1_WSTRB_0_7to0(7 downto 0) <= axi_master_florian_64bits_1_BIF_1_WSTRB(7 downto 0);

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AndOfThree_0
AndOfThree_0 : AndOfThree
    port map( 
        -- Inputs
        clk         => CLK_GEN_C0_0_CLK,
        reset_n     => RESET_GEN_C1_1_RESET,
        input_valid => axi_master_florian_64bits_0_o_ready,
        -- Outputs
        addr        => AndOfThree_0_addr,
        start_write => AndOfThree_0_start_write 
        );
-- AndOfThree_1
AndOfThree_1 : AndOfThree
    port map( 
        -- Inputs
        clk         => CLK_GEN_C0_0_CLK,
        reset_n     => RESET_GEN_C1_1_RESET,
        input_valid => axi_master_florian_64bits_1_o_ready,
        -- Outputs
        addr        => AndOfThree_1_addr,
        start_write => AndOfThree_1_start_write 
        );
-- axi_arbiter_mus_0
axi_arbiter_mus_0 : entity work.axi_arbiter_mus
    generic map( 
        ADDR_WIDTH => ( 32 ),
        DATA_WIDTH => ( 512 ),
        S_ID_WIDTH => ( 4 )
        )
    port map( 
        -- Inputs
        trigger_signal       => VCC_net,
        s_realtime_awid      => axi_master_florian_64bits_0_BIF_1_AWID,
        s_realtime_awaddr    => axi_master_florian_64bits_0_BIF_1_AWADDR,
        s_realtime_awlen     => axi_master_florian_64bits_0_BIF_1_AWLEN,
        s_realtime_awsize    => axi_master_florian_64bits_0_BIF_1_AWSIZE,
        s_realtime_awburst   => axi_master_florian_64bits_0_BIF_1_AWBURST,
        s_realtime_awlock    => axi_master_florian_64bits_0_BIF_1_AWLOCK,
        s_realtime_awcache   => axi_master_florian_64bits_0_BIF_1_AWCACHE,
        s_realtime_awprot    => axi_master_florian_64bits_0_BIF_1_AWPROT,
        s_realtime_awvalid   => axi_master_florian_64bits_0_BIF_1_AWVALID,
        s_realtime_wdata     => axi_master_florian_64bits_0_BIF_1_WDATA_0,
        s_realtime_wstrb     => axi_master_florian_64bits_0_BIF_1_WSTRB_0,
        s_realtime_wvalid    => axi_master_florian_64bits_0_BIF_1_WVALID,
        s_realtime_wlast     => axi_master_florian_64bits_0_BIF_1_WLAST,
        s_realtime_bready    => axi_master_florian_64bits_0_BIF_1_BREADY,
        s_realtime_arid      => axi_master_florian_64bits_0_BIF_1_ARID,
        s_realtime_araddr    => axi_master_florian_64bits_0_BIF_1_ARADDR,
        s_realtime_arlen     => axi_master_florian_64bits_0_BIF_1_ARLEN,
        s_realtime_arsize    => axi_master_florian_64bits_0_BIF_1_ARSIZE,
        s_realtime_arlock    => axi_master_florian_64bits_0_BIF_1_ARLOCK,
        s_realtime_arburst   => axi_master_florian_64bits_0_BIF_1_ARBURST,
        s_realtime_arvalid   => axi_master_florian_64bits_0_BIF_1_ARVALID,
        s_realtime_rready    => axi_master_florian_64bits_0_BIF_1_RREADY,
        s_realtime_arcache   => axi_master_florian_64bits_0_BIF_1_ARCACHE,
        s_realtime_arprot    => axi_master_florian_64bits_0_BIF_1_ARPROT,
        s_besteffort_awid    => axi_master_florian_64bits_1_BIF_1_AWID,
        s_besteffort_awaddr  => axi_master_florian_64bits_1_BIF_1_AWADDR,
        s_besteffort_awlen   => axi_master_florian_64bits_1_BIF_1_AWLEN,
        s_besteffort_awsize  => axi_master_florian_64bits_1_BIF_1_AWSIZE,
        s_besteffort_awburst => axi_master_florian_64bits_1_BIF_1_AWBURST,
        s_besteffort_awlock  => axi_master_florian_64bits_1_BIF_1_AWLOCK,
        s_besteffort_awcache => axi_master_florian_64bits_1_BIF_1_AWCACHE,
        s_besteffort_awprot  => axi_master_florian_64bits_1_BIF_1_AWPROT,
        s_besteffort_awvalid => axi_master_florian_64bits_1_BIF_1_AWVALID,
        s_besteffort_wdata   => axi_master_florian_64bits_1_BIF_1_WDATA_0,
        s_besteffort_wstrb   => axi_master_florian_64bits_1_BIF_1_WSTRB_0,
        s_besteffort_wvalid  => axi_master_florian_64bits_1_BIF_1_WVALID,
        s_besteffort_wlast   => axi_master_florian_64bits_1_BIF_1_WLAST,
        s_besteffort_bready  => axi_master_florian_64bits_1_BIF_1_BREADY,
        s_besteffort_arid    => axi_master_florian_64bits_1_BIF_1_ARID,
        s_besteffort_araddr  => axi_master_florian_64bits_1_BIF_1_ARADDR,
        s_besteffort_arlen   => axi_master_florian_64bits_1_BIF_1_ARLEN,
        s_besteffort_arsize  => axi_master_florian_64bits_1_BIF_1_ARSIZE,
        s_besteffort_arlock  => axi_master_florian_64bits_1_BIF_1_ARLOCK,
        s_besteffort_arburst => axi_master_florian_64bits_1_BIF_1_ARBURST,
        s_besteffort_arvalid => axi_master_florian_64bits_1_BIF_1_ARVALID,
        s_besteffort_rready  => axi_master_florian_64bits_1_BIF_1_RREADY,
        s_besteffort_arcache => axi_master_florian_64bits_1_BIF_1_ARCACHE,
        s_besteffort_arprot  => axi_master_florian_64bits_1_BIF_1_ARPROT,
        m_axi_awready        => axi_arbiter_mus_0_BIF_ddr_AWREADY,
        m_axi_wready         => axi_arbiter_mus_0_BIF_ddr_WREADY,
        m_axi_bid            => axi_arbiter_mus_0_BIF_ddr_BID,
        m_axi_bresp          => axi_arbiter_mus_0_BIF_ddr_BRESP,
        m_axi_bvalid         => axi_arbiter_mus_0_BIF_ddr_BVALID,
        m_axi_arready        => axi_arbiter_mus_0_BIF_ddr_ARREADY,
        m_axi_rid            => axi_arbiter_mus_0_BIF_ddr_RID,
        m_axi_rdata          => axi_arbiter_mus_0_BIF_ddr_RDATA_0,
        m_axi_rresp          => axi_arbiter_mus_0_BIF_ddr_RRESP,
        m_axi_rlast          => axi_arbiter_mus_0_BIF_ddr_RLAST,
        m_axi_rvalid         => axi_arbiter_mus_0_BIF_ddr_RVALID,
        -- Outputs
        s_realtime_awready   => axi_master_florian_64bits_0_BIF_1_AWREADY,
        s_realtime_wready    => axi_master_florian_64bits_0_BIF_1_WREADY,
        s_realtime_bid       => axi_master_florian_64bits_0_BIF_1_BID,
        s_realtime_bresp     => axi_master_florian_64bits_0_BIF_1_BRESP,
        s_realtime_bvalid    => axi_master_florian_64bits_0_BIF_1_BVALID,
        s_realtime_arready   => axi_master_florian_64bits_0_BIF_1_ARREADY,
        s_realtime_rdata     => axi_master_florian_64bits_0_BIF_1_RDATA,
        s_realtime_rlast     => axi_master_florian_64bits_0_BIF_1_RLAST,
        s_realtime_rvalid    => axi_master_florian_64bits_0_BIF_1_RVALID,
        s_realtime_rresp     => axi_master_florian_64bits_0_BIF_1_RRESP,
        s_realtime_rid       => axi_master_florian_64bits_0_BIF_1_RID,
        s_besteffort_awready => axi_master_florian_64bits_1_BIF_1_AWREADY,
        s_besteffort_wready  => axi_master_florian_64bits_1_BIF_1_WREADY,
        s_besteffort_bid     => axi_master_florian_64bits_1_BIF_1_BID,
        s_besteffort_bresp   => axi_master_florian_64bits_1_BIF_1_BRESP,
        s_besteffort_bvalid  => axi_master_florian_64bits_1_BIF_1_BVALID,
        s_besteffort_arready => axi_master_florian_64bits_1_BIF_1_ARREADY,
        s_besteffort_rdata   => axi_master_florian_64bits_1_BIF_1_RDATA,
        s_besteffort_rlast   => axi_master_florian_64bits_1_BIF_1_RLAST,
        s_besteffort_rvalid  => axi_master_florian_64bits_1_BIF_1_RVALID,
        s_besteffort_rresp   => axi_master_florian_64bits_1_BIF_1_RRESP,
        s_besteffort_rid     => axi_master_florian_64bits_1_BIF_1_RID,
        m_axi_awid           => axi_arbiter_mus_0_BIF_ddr_AWID,
        m_axi_awaddr         => axi_arbiter_mus_0_BIF_ddr_AWADDR,
        m_axi_awlen          => axi_arbiter_mus_0_BIF_ddr_AWLEN,
        m_axi_awsize         => axi_arbiter_mus_0_BIF_ddr_AWSIZE,
        m_axi_awburst        => axi_arbiter_mus_0_BIF_ddr_AWBURST,
        m_axi_awlock         => axi_arbiter_mus_0_BIF_ddr_AWLOCK,
        m_axi_awcache        => axi_arbiter_mus_0_BIF_ddr_AWCACHE,
        m_axi_awprot         => axi_arbiter_mus_0_BIF_ddr_AWPROT,
        m_axi_awvalid        => axi_arbiter_mus_0_BIF_ddr_AWVALID,
        m_axi_wdata          => axi_arbiter_mus_0_BIF_ddr_WDATA,
        m_axi_wstrb          => axi_arbiter_mus_0_BIF_ddr_WSTRB,
        m_axi_wlast          => axi_arbiter_mus_0_BIF_ddr_WLAST,
        m_axi_wvalid         => axi_arbiter_mus_0_BIF_ddr_WVALID,
        m_axi_bready         => axi_arbiter_mus_0_BIF_ddr_BREADY,
        m_axi_arid           => axi_arbiter_mus_0_BIF_ddr_ARID,
        m_axi_araddr         => axi_arbiter_mus_0_BIF_ddr_ARADDR,
        m_axi_arlen          => axi_arbiter_mus_0_BIF_ddr_ARLEN,
        m_axi_arsize         => axi_arbiter_mus_0_BIF_ddr_ARSIZE,
        m_axi_arburst        => axi_arbiter_mus_0_BIF_ddr_ARBURST,
        m_axi_arlock         => axi_arbiter_mus_0_BIF_ddr_ARLOCK,
        m_axi_arcache        => axi_arbiter_mus_0_BIF_ddr_ARCACHE,
        m_axi_arprot         => axi_arbiter_mus_0_BIF_ddr_ARPROT,
        m_axi_arvalid        => axi_arbiter_mus_0_BIF_ddr_ARVALID,
        m_axi_rready         => axi_arbiter_mus_0_BIF_ddr_RREADY 
        );
-- axi_master_florian_64bits_0
axi_master_florian_64bits_0 : entity work.axi_master_florian_64bits
    port map( 
        -- Inputs
        i_clk                 => CLK_GEN_C0_0_CLK,
        i_rstn                => RESET_GEN_C1_1_RESET,
        i_start_write         => AndOfThree_0_start_write,
        i_start_read          => GND_net,
        i_rd_addr             => i_rd_addr_const_net_0,
        i_wrt_addr            => AndOfThree_0_addr,
        i_write_transfer_size => i_write_transfer_size_const_net_0,
        i_read_transfer_size  => i_read_transfer_size_const_net_0,
        i_data                => i_data_const_net_0,
        AWREADY               => axi_master_florian_64bits_0_BIF_1_AWREADY,
        WREADY                => axi_master_florian_64bits_0_BIF_1_WREADY,
        BID                   => axi_master_florian_64bits_0_BIF_1_BID,
        BRESP                 => axi_master_florian_64bits_0_BIF_1_BRESP,
        BVALID                => axi_master_florian_64bits_0_BIF_1_BVALID,
        ARREADY               => axi_master_florian_64bits_0_BIF_1_ARREADY,
        RDATA                 => axi_master_florian_64bits_0_BIF_1_RDATA_0,
        RLAST                 => axi_master_florian_64bits_0_BIF_1_RLAST,
        RVALID                => axi_master_florian_64bits_0_BIF_1_RVALID,
        RID                   => axi_master_florian_64bits_0_BIF_1_RID,
        RRESP                 => axi_master_florian_64bits_0_BIF_1_RRESP,
        -- Outputs
        o_data_req            => OPEN,
        o_data                => OPEN,
        o_data_valid          => OPEN,
        o_ready               => axi_master_florian_64bits_0_o_ready,
        AWID                  => axi_master_florian_64bits_0_BIF_1_AWID,
        AWADDR                => axi_master_florian_64bits_0_BIF_1_AWADDR,
        AWLEN                 => axi_master_florian_64bits_0_BIF_1_AWLEN,
        AWSIZE                => axi_master_florian_64bits_0_BIF_1_AWSIZE,
        AWLOCK                => axi_master_florian_64bits_0_BIF_1_AWLOCK,
        AWBURST               => axi_master_florian_64bits_0_BIF_1_AWBURST,
        AWVALID               => axi_master_florian_64bits_0_BIF_1_AWVALID,
        WSTRB                 => axi_master_florian_64bits_0_BIF_1_WSTRB,
        WLAST                 => axi_master_florian_64bits_0_BIF_1_WLAST,
        WVALID                => axi_master_florian_64bits_0_BIF_1_WVALID,
        WDATA                 => axi_master_florian_64bits_0_BIF_1_WDATA,
        BREADY                => axi_master_florian_64bits_0_BIF_1_BREADY,
        ARID                  => axi_master_florian_64bits_0_BIF_1_ARID,
        ARADDR                => axi_master_florian_64bits_0_BIF_1_ARADDR,
        ARLEN                 => axi_master_florian_64bits_0_BIF_1_ARLEN,
        ARSIZE                => axi_master_florian_64bits_0_BIF_1_ARSIZE,
        ARLOCK                => axi_master_florian_64bits_0_BIF_1_ARLOCK,
        ARBURST               => axi_master_florian_64bits_0_BIF_1_ARBURST,
        ARVALID               => axi_master_florian_64bits_0_BIF_1_ARVALID,
        RREADY                => axi_master_florian_64bits_0_BIF_1_RREADY,
        ARCACHE               => axi_master_florian_64bits_0_BIF_1_ARCACHE,
        ARPROT                => axi_master_florian_64bits_0_BIF_1_ARPROT,
        AWCACHE               => axi_master_florian_64bits_0_BIF_1_AWCACHE,
        AWPROT                => axi_master_florian_64bits_0_BIF_1_AWPROT 
        );
-- axi_master_florian_64bits_1
axi_master_florian_64bits_1 : entity work.axi_master_florian_64bits
    port map( 
        -- Inputs
        i_clk                 => CLK_GEN_C0_0_CLK,
        i_rstn                => RESET_GEN_C1_1_RESET,
        i_start_write         => AndOfThree_1_start_write,
        i_start_read          => GND_net,
        i_rd_addr             => i_rd_addr_const_net_1,
        i_wrt_addr            => AndOfThree_1_addr,
        i_write_transfer_size => i_write_transfer_size_const_net_1,
        i_read_transfer_size  => i_read_transfer_size_const_net_1,
        i_data                => i_data_const_net_1,
        AWREADY               => axi_master_florian_64bits_1_BIF_1_AWREADY,
        WREADY                => axi_master_florian_64bits_1_BIF_1_WREADY,
        BID                   => axi_master_florian_64bits_1_BIF_1_BID,
        BRESP                 => axi_master_florian_64bits_1_BIF_1_BRESP,
        BVALID                => axi_master_florian_64bits_1_BIF_1_BVALID,
        ARREADY               => axi_master_florian_64bits_1_BIF_1_ARREADY,
        RDATA                 => axi_master_florian_64bits_1_BIF_1_RDATA_0,
        RLAST                 => axi_master_florian_64bits_1_BIF_1_RLAST,
        RVALID                => axi_master_florian_64bits_1_BIF_1_RVALID,
        RID                   => axi_master_florian_64bits_1_BIF_1_RID,
        RRESP                 => axi_master_florian_64bits_1_BIF_1_RRESP,
        -- Outputs
        o_data_req            => OPEN,
        o_data                => OPEN,
        o_data_valid          => OPEN,
        o_ready               => axi_master_florian_64bits_1_o_ready,
        AWID                  => axi_master_florian_64bits_1_BIF_1_AWID,
        AWADDR                => axi_master_florian_64bits_1_BIF_1_AWADDR,
        AWLEN                 => axi_master_florian_64bits_1_BIF_1_AWLEN,
        AWSIZE                => axi_master_florian_64bits_1_BIF_1_AWSIZE,
        AWLOCK                => axi_master_florian_64bits_1_BIF_1_AWLOCK,
        AWBURST               => axi_master_florian_64bits_1_BIF_1_AWBURST,
        AWVALID               => axi_master_florian_64bits_1_BIF_1_AWVALID,
        WSTRB                 => axi_master_florian_64bits_1_BIF_1_WSTRB,
        WLAST                 => axi_master_florian_64bits_1_BIF_1_WLAST,
        WVALID                => axi_master_florian_64bits_1_BIF_1_WVALID,
        WDATA                 => axi_master_florian_64bits_1_BIF_1_WDATA,
        BREADY                => axi_master_florian_64bits_1_BIF_1_BREADY,
        ARID                  => axi_master_florian_64bits_1_BIF_1_ARID,
        ARADDR                => axi_master_florian_64bits_1_BIF_1_ARADDR,
        ARLEN                 => axi_master_florian_64bits_1_BIF_1_ARLEN,
        ARSIZE                => axi_master_florian_64bits_1_BIF_1_ARSIZE,
        ARLOCK                => axi_master_florian_64bits_1_BIF_1_ARLOCK,
        ARBURST               => axi_master_florian_64bits_1_BIF_1_ARBURST,
        ARVALID               => axi_master_florian_64bits_1_BIF_1_ARVALID,
        RREADY                => axi_master_florian_64bits_1_BIF_1_RREADY,
        ARCACHE               => axi_master_florian_64bits_1_BIF_1_ARCACHE,
        ARPROT                => axi_master_florian_64bits_1_BIF_1_ARPROT,
        AWCACHE               => axi_master_florian_64bits_1_BIF_1_AWCACHE,
        AWPROT                => axi_master_florian_64bits_1_BIF_1_AWPROT 
        );
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- COREAXI4SRAM_C2_0
COREAXI4SRAM_C2_0 : COREAXI4SRAM_C2
    port map( 
        -- Inputs
        ACLK    => CLK_GEN_C0_0_CLK,
        ARESETN => RESET_GEN_C1_1_RESET,
        AWVALID => axi_arbiter_mus_0_BIF_ddr_AWVALID,
        WLAST   => axi_arbiter_mus_0_BIF_ddr_WLAST,
        WVALID  => axi_arbiter_mus_0_BIF_ddr_WVALID,
        BREADY  => axi_arbiter_mus_0_BIF_ddr_BREADY,
        ARVALID => axi_arbiter_mus_0_BIF_ddr_ARVALID,
        RREADY  => axi_arbiter_mus_0_BIF_ddr_RREADY,
        AWADDR  => axi_arbiter_mus_0_BIF_ddr_AWADDR,
        AWLEN   => axi_arbiter_mus_0_BIF_ddr_AWLEN,
        AWSIZE  => axi_arbiter_mus_0_BIF_ddr_AWSIZE,
        AWBURST => axi_arbiter_mus_0_BIF_ddr_AWBURST,
        AWLOCK  => axi_arbiter_mus_0_BIF_ddr_AWLOCK,
        AWCACHE => axi_arbiter_mus_0_BIF_ddr_AWCACHE,
        AWPROT  => axi_arbiter_mus_0_BIF_ddr_AWPROT,
        WDATA   => axi_arbiter_mus_0_BIF_ddr_WDATA_0,
        WSTRB   => axi_arbiter_mus_0_BIF_ddr_WSTRB_0,
        ARADDR  => axi_arbiter_mus_0_BIF_ddr_ARADDR,
        ARLEN   => axi_arbiter_mus_0_BIF_ddr_ARLEN,
        ARSIZE  => axi_arbiter_mus_0_BIF_ddr_ARSIZE,
        ARBURST => axi_arbiter_mus_0_BIF_ddr_ARBURST,
        ARLOCK  => axi_arbiter_mus_0_BIF_ddr_ARLOCK,
        ARCACHE => axi_arbiter_mus_0_BIF_ddr_ARCACHE,
        ARPROT  => axi_arbiter_mus_0_BIF_ddr_ARPROT,
        AWID    => axi_arbiter_mus_0_BIF_ddr_AWID,
        ARID    => axi_arbiter_mus_0_BIF_ddr_ARID,
        -- Outputs
        AWREADY => axi_arbiter_mus_0_BIF_ddr_AWREADY,
        WREADY  => axi_arbiter_mus_0_BIF_ddr_WREADY,
        BVALID  => axi_arbiter_mus_0_BIF_ddr_BVALID,
        ARREADY => axi_arbiter_mus_0_BIF_ddr_ARREADY,
        RLAST   => axi_arbiter_mus_0_BIF_ddr_RLAST,
        RVALID  => axi_arbiter_mus_0_BIF_ddr_RVALID,
        RDATA   => axi_arbiter_mus_0_BIF_ddr_RDATA,
        RRESP   => axi_arbiter_mus_0_BIF_ddr_RRESP,
        BRESP   => axi_arbiter_mus_0_BIF_ddr_BRESP,
        BID     => axi_arbiter_mus_0_BIF_ddr_BID,
        RID     => axi_arbiter_mus_0_BIF_ddr_RID 
        );
-- RESET_GEN_C1_1
RESET_GEN_C1_1 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_1_RESET 
        );

end RTL;

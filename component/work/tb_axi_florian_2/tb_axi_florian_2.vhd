----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb  8 15:07:09 2024
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
-- tb_axi_florian_2 entity declaration
----------------------------------------------------------------------
entity tb_axi_florian_2 is
    -- Port list
    port(
        -- Inputs
        ARREADY : in  std_logic;
        AWREADY : in  std_logic;
        BID     : in  std_logic_vector(3 downto 0);
        BRESP   : in  std_logic_vector(1 downto 0);
        BVALID  : in  std_logic;
        RDATA   : in  std_logic_vector(511 downto 0);
        RID     : in  std_logic_vector(3 downto 0);
        RLAST   : in  std_logic;
        RRESP   : in  std_logic_vector(1 downto 0);
        RVALID  : in  std_logic;
        WREADY  : in  std_logic;
        -- Outputs
        ARADDR  : out std_logic_vector(31 downto 0);
        ARBURST : out std_logic_vector(1 downto 0);
        ARCACHE : out std_logic_vector(3 downto 0);
        ARID    : out std_logic_vector(3 downto 0);
        ARLEN   : out std_logic_vector(7 downto 0);
        ARLOCK  : out std_logic_vector(1 downto 0);
        ARPROT  : out std_logic_vector(2 downto 0);
        ARSIZE  : out std_logic_vector(2 downto 0);
        ARVALID : out std_logic;
        AWADDR  : out std_logic_vector(31 downto 0);
        AWBURST : out std_logic_vector(1 downto 0);
        AWCACHE : out std_logic_vector(3 downto 0);
        AWID    : out std_logic_vector(3 downto 0);
        AWLEN   : out std_logic_vector(7 downto 0);
        AWLOCK  : out std_logic_vector(1 downto 0);
        AWPROT  : out std_logic_vector(2 downto 0);
        AWSIZE  : out std_logic_vector(2 downto 0);
        AWVALID : out std_logic;
        BREADY  : out std_logic;
        RREADY  : out std_logic;
        WDATA   : out std_logic_vector(511 downto 0);
        WLAST   : out std_logic;
        WSTRB   : out std_logic_vector(63 downto 0);
        WVALID  : out std_logic
        );
end tb_axi_florian_2;
----------------------------------------------------------------------
-- tb_axi_florian_2 architecture body
----------------------------------------------------------------------
architecture RTL of tb_axi_florian_2 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- axi_master_3_florian
-- using entity instantiation for component axi_master_3_florian
-- CLK_GEN_C0
component CLK_GEN_C0
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
-- data_packer
component data_packer
    -- Port list
    port(
        -- Inputs
        input_clk    : in  std_logic;
        input_data   : in  std_logic_vector(31 downto 0);
        input_reset  : in  std_logic;
        input_valid  : in  std_logic;
        -- Outputs
        address_out  : out std_logic_vector(31 downto 0);
        output_data  : out std_logic_vector(511 downto 0);
        output_ready : out std_logic
        );
end component;
-- limited_counter
component limited_counter
    -- Port list
    port(
        -- Inputs
        clk    : in  std_logic;
        rst_N  : in  std_logic;
        -- Outputs
        count  : out std_logic_vector(7 downto 0);
        en_val : out std_logic
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
signal BIF_1_ARADDR               : std_logic_vector(31 downto 0);
signal BIF_1_ARBURST              : std_logic_vector(1 downto 0);
signal BIF_1_ARCACHE              : std_logic_vector(3 downto 0);
signal BIF_1_ARID                 : std_logic_vector(3 downto 0);
signal BIF_1_ARLEN                : std_logic_vector(7 downto 0);
signal BIF_1_ARLOCK               : std_logic_vector(1 downto 0);
signal BIF_1_ARPROT               : std_logic_vector(2 downto 0);
signal BIF_1_ARSIZE               : std_logic_vector(2 downto 0);
signal BIF_1_ARVALID              : std_logic;
signal BIF_1_AWADDR               : std_logic_vector(31 downto 0);
signal BIF_1_AWBURST              : std_logic_vector(1 downto 0);
signal BIF_1_AWCACHE              : std_logic_vector(3 downto 0);
signal BIF_1_AWID                 : std_logic_vector(3 downto 0);
signal BIF_1_AWLEN                : std_logic_vector(7 downto 0);
signal BIF_1_AWLOCK               : std_logic_vector(1 downto 0);
signal BIF_1_AWPROT               : std_logic_vector(2 downto 0);
signal BIF_1_AWSIZE               : std_logic_vector(2 downto 0);
signal BIF_1_AWVALID              : std_logic;
signal BIF_1_BREADY               : std_logic;
signal BIF_1_RREADY               : std_logic;
signal BIF_1_WDATA                : std_logic_vector(511 downto 0);
signal BIF_1_WLAST                : std_logic;
signal BIF_1_WSTRB                : std_logic_vector(63 downto 0);
signal BIF_1_WVALID               : std_logic;
signal CLK_GEN_C0_0_CLK           : std_logic;
signal data_packer_0_address_out  : std_logic_vector(31 downto 0);
signal data_packer_0_output_data  : std_logic_vector(511 downto 0);
signal data_packer_0_output_ready : std_logic;
signal limited_counter_0_count    : std_logic_vector(7 downto 0);
signal limited_counter_0_en_val   : std_logic;
signal RESET_GEN_C1_0_RESET       : std_logic;
signal BIF_1_AWID_net_0           : std_logic_vector(3 downto 0);
signal BIF_1_AWADDR_net_0         : std_logic_vector(31 downto 0);
signal BIF_1_AWLEN_net_0          : std_logic_vector(7 downto 0);
signal BIF_1_AWSIZE_net_0         : std_logic_vector(2 downto 0);
signal BIF_1_AWBURST_net_0        : std_logic_vector(1 downto 0);
signal BIF_1_AWLOCK_net_0         : std_logic_vector(1 downto 0);
signal BIF_1_AWCACHE_net_0        : std_logic_vector(3 downto 0);
signal BIF_1_AWPROT_net_0         : std_logic_vector(2 downto 0);
signal BIF_1_AWVALID_net_0        : std_logic;
signal BIF_1_WDATA_net_0          : std_logic_vector(511 downto 0);
signal BIF_1_WSTRB_net_0          : std_logic_vector(63 downto 0);
signal BIF_1_WLAST_net_0          : std_logic;
signal BIF_1_WVALID_net_0         : std_logic;
signal BIF_1_BREADY_net_0         : std_logic;
signal BIF_1_ARID_net_0           : std_logic_vector(3 downto 0);
signal BIF_1_ARADDR_net_0         : std_logic_vector(31 downto 0);
signal BIF_1_ARLEN_net_0          : std_logic_vector(7 downto 0);
signal BIF_1_ARSIZE_net_0         : std_logic_vector(2 downto 0);
signal BIF_1_ARBURST_net_0        : std_logic_vector(1 downto 0);
signal BIF_1_ARLOCK_net_0         : std_logic_vector(1 downto 0);
signal BIF_1_ARCACHE_net_0        : std_logic_vector(3 downto 0);
signal BIF_1_ARPROT_net_0         : std_logic_vector(2 downto 0);
signal BIF_1_ARVALID_net_0        : std_logic;
signal BIF_1_RREADY_net_0         : std_logic;
signal input_data_net_0           : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                    : std_logic;
signal i_rd_addr_const_net_0      : std_logic_vector(31 downto 0);
signal i_write_transfer_size_const_net_0: std_logic_vector(9 downto 0);
signal i_read_transfer_size_const_net_0: std_logic_vector(9 downto 0);
signal input_data_const_net_0     : std_logic_vector(15 downto 8);
signal input_data_const_net_1     : std_logic_vector(23 downto 16);
signal input_data_const_net_2     : std_logic_vector(31 downto 24);
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal input_reset_IN_POST_INV0_0 : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                           <= '0';
 i_rd_addr_const_net_0             <= B"00000000000000000000000000000000";
 i_write_transfer_size_const_net_0 <= B"0000000001";
 i_read_transfer_size_const_net_0  <= B"0000000000";
 input_data_const_net_0            <= B"00000000";
 input_data_const_net_1            <= B"00000000";
 input_data_const_net_2            <= B"00000000";
----------------------------------------------------------------------
-- Inversions
----------------------------------------------------------------------
 input_reset_IN_POST_INV0_0 <= NOT RESET_GEN_C1_0_RESET;
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 BIF_1_AWID_net_0    <= BIF_1_AWID;
 AWID(3 downto 0)    <= BIF_1_AWID_net_0;
 BIF_1_AWADDR_net_0  <= BIF_1_AWADDR;
 AWADDR(31 downto 0) <= BIF_1_AWADDR_net_0;
 BIF_1_AWLEN_net_0   <= BIF_1_AWLEN;
 AWLEN(7 downto 0)   <= BIF_1_AWLEN_net_0;
 BIF_1_AWSIZE_net_0  <= BIF_1_AWSIZE;
 AWSIZE(2 downto 0)  <= BIF_1_AWSIZE_net_0;
 BIF_1_AWBURST_net_0 <= BIF_1_AWBURST;
 AWBURST(1 downto 0) <= BIF_1_AWBURST_net_0;
 BIF_1_AWLOCK_net_0  <= BIF_1_AWLOCK;
 AWLOCK(1 downto 0)  <= BIF_1_AWLOCK_net_0;
 BIF_1_AWCACHE_net_0 <= BIF_1_AWCACHE;
 AWCACHE(3 downto 0) <= BIF_1_AWCACHE_net_0;
 BIF_1_AWPROT_net_0  <= BIF_1_AWPROT;
 AWPROT(2 downto 0)  <= BIF_1_AWPROT_net_0;
 BIF_1_AWVALID_net_0 <= BIF_1_AWVALID;
 AWVALID             <= BIF_1_AWVALID_net_0;
 BIF_1_WDATA_net_0   <= BIF_1_WDATA;
 WDATA(511 downto 0) <= BIF_1_WDATA_net_0;
 BIF_1_WSTRB_net_0   <= BIF_1_WSTRB;
 WSTRB(63 downto 0)  <= BIF_1_WSTRB_net_0;
 BIF_1_WLAST_net_0   <= BIF_1_WLAST;
 WLAST               <= BIF_1_WLAST_net_0;
 BIF_1_WVALID_net_0  <= BIF_1_WVALID;
 WVALID              <= BIF_1_WVALID_net_0;
 BIF_1_BREADY_net_0  <= BIF_1_BREADY;
 BREADY              <= BIF_1_BREADY_net_0;
 BIF_1_ARID_net_0    <= BIF_1_ARID;
 ARID(3 downto 0)    <= BIF_1_ARID_net_0;
 BIF_1_ARADDR_net_0  <= BIF_1_ARADDR;
 ARADDR(31 downto 0) <= BIF_1_ARADDR_net_0;
 BIF_1_ARLEN_net_0   <= BIF_1_ARLEN;
 ARLEN(7 downto 0)   <= BIF_1_ARLEN_net_0;
 BIF_1_ARSIZE_net_0  <= BIF_1_ARSIZE;
 ARSIZE(2 downto 0)  <= BIF_1_ARSIZE_net_0;
 BIF_1_ARBURST_net_0 <= BIF_1_ARBURST;
 ARBURST(1 downto 0) <= BIF_1_ARBURST_net_0;
 BIF_1_ARLOCK_net_0  <= BIF_1_ARLOCK;
 ARLOCK(1 downto 0)  <= BIF_1_ARLOCK_net_0;
 BIF_1_ARCACHE_net_0 <= BIF_1_ARCACHE;
 ARCACHE(3 downto 0) <= BIF_1_ARCACHE_net_0;
 BIF_1_ARPROT_net_0  <= BIF_1_ARPROT;
 ARPROT(2 downto 0)  <= BIF_1_ARPROT_net_0;
 BIF_1_ARVALID_net_0 <= BIF_1_ARVALID;
 ARVALID             <= BIF_1_ARVALID_net_0;
 BIF_1_RREADY_net_0  <= BIF_1_RREADY;
 RREADY              <= BIF_1_RREADY_net_0;
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 input_data_net_0 <= ( B"00000000" & B"00000000" & B"00000000" & limited_counter_0_count );
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- axi_master_3_florian_0
axi_master_3_florian_0 : entity work.axi_master_3_florian
    port map( 
        -- Inputs
        i_clk                 => CLK_GEN_C0_0_CLK,
        i_rstn                => RESET_GEN_C1_0_RESET,
        i_start_write         => data_packer_0_output_ready,
        i_start_read          => GND_net,
        i_rd_addr             => i_rd_addr_const_net_0,
        i_wrt_addr            => data_packer_0_address_out,
        i_write_transfer_size => i_write_transfer_size_const_net_0,
        i_read_transfer_size  => i_read_transfer_size_const_net_0,
        i_data                => data_packer_0_output_data,
        AWREADY               => AWREADY,
        WREADY                => WREADY,
        BID                   => BID,
        BRESP                 => BRESP,
        BVALID                => BVALID,
        ARREADY               => ARREADY,
        RDATA                 => RDATA,
        RLAST                 => RLAST,
        RVALID                => RVALID,
        RID                   => RID,
        RRESP                 => RRESP,
        -- Outputs
        o_data_req            => OPEN,
        o_data                => OPEN,
        o_data_valid          => OPEN,
        o_ready               => OPEN,
        AWID                  => BIF_1_AWID,
        AWADDR                => BIF_1_AWADDR,
        AWLEN                 => BIF_1_AWLEN,
        AWSIZE                => BIF_1_AWSIZE,
        AWLOCK                => BIF_1_AWLOCK,
        AWBURST               => BIF_1_AWBURST,
        AWVALID               => BIF_1_AWVALID,
        WSTRB                 => BIF_1_WSTRB,
        WLAST                 => BIF_1_WLAST,
        WVALID                => BIF_1_WVALID,
        WDATA                 => BIF_1_WDATA,
        BREADY                => BIF_1_BREADY,
        ARID                  => BIF_1_ARID,
        ARADDR                => BIF_1_ARADDR,
        ARLEN                 => BIF_1_ARLEN,
        ARSIZE                => BIF_1_ARSIZE,
        ARLOCK                => BIF_1_ARLOCK,
        ARBURST               => BIF_1_ARBURST,
        ARVALID               => BIF_1_ARVALID,
        RREADY                => BIF_1_RREADY,
        ARCACHE               => BIF_1_ARCACHE,
        ARPROT                => BIF_1_ARPROT,
        AWCACHE               => BIF_1_AWCACHE,
        AWPROT                => BIF_1_AWPROT 
        );
-- CLK_GEN_C0_0
CLK_GEN_C0_0 : CLK_GEN_C0
    port map( 
        -- Outputs
        CLK => CLK_GEN_C0_0_CLK 
        );
-- data_packer_0
data_packer_0 : data_packer
    port map( 
        -- Inputs
        input_clk    => CLK_GEN_C0_0_CLK,
        input_reset  => input_reset_IN_POST_INV0_0,
        input_data   => input_data_net_0,
        input_valid  => limited_counter_0_en_val,
        -- Outputs
        output_data  => data_packer_0_output_data,
        address_out  => data_packer_0_address_out,
        output_ready => data_packer_0_output_ready 
        );
-- limited_counter_0
limited_counter_0 : limited_counter
    port map( 
        -- Inputs
        clk    => CLK_GEN_C0_0_CLK,
        rst_N  => RESET_GEN_C1_0_RESET,
        -- Outputs
        en_val => limited_counter_0_en_val,
        count  => limited_counter_0_count 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );

end RTL;

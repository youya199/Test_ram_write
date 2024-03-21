----------------------------------------------------------------------
-- Created by SmartDesign Wed Feb 14 17:49:59 2024
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
-- tb_diffclk entity declaration
----------------------------------------------------------------------
entity tb_diffclk is
end tb_diffclk;
----------------------------------------------------------------------
-- tb_diffclk architecture body
----------------------------------------------------------------------
architecture RTL of tb_diffclk is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- aM_fl64_fa
-- using entity instantiation for component aM_fl64_fa
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
-- CLK_GEN_C3
component CLK_GEN_C3
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
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
-- CLK_GEN_C2
component CLK_GEN_C2
    -- Port list
    port(
        -- Outputs
        CLK : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal aM_fl64_fa_0_BIF_1_ARADDR      : std_logic_vector(31 downto 0);
signal aM_fl64_fa_0_BIF_1_ARBURST     : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_ARCACHE     : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_ARID        : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_ARLEN       : std_logic_vector(7 downto 0);
signal aM_fl64_fa_0_BIF_1_ARLOCK      : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_ARPROT      : std_logic_vector(2 downto 0);
signal aM_fl64_fa_0_BIF_1_ARREADY     : std_logic;
signal aM_fl64_fa_0_BIF_1_ARSIZE      : std_logic_vector(2 downto 0);
signal aM_fl64_fa_0_BIF_1_ARVALID     : std_logic;
signal aM_fl64_fa_0_BIF_1_AWADDR      : std_logic_vector(31 downto 0);
signal aM_fl64_fa_0_BIF_1_AWBURST     : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_AWCACHE     : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_AWID        : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_AWLEN       : std_logic_vector(7 downto 0);
signal aM_fl64_fa_0_BIF_1_AWLOCK      : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_AWPROT      : std_logic_vector(2 downto 0);
signal aM_fl64_fa_0_BIF_1_AWREADY     : std_logic;
signal aM_fl64_fa_0_BIF_1_AWSIZE      : std_logic_vector(2 downto 0);
signal aM_fl64_fa_0_BIF_1_AWVALID     : std_logic;
signal aM_fl64_fa_0_BIF_1_BID         : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_BREADY      : std_logic;
signal aM_fl64_fa_0_BIF_1_BRESP       : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_BVALID      : std_logic;
signal aM_fl64_fa_0_BIF_1_RDATA       : std_logic_vector(63 downto 0);
signal aM_fl64_fa_0_BIF_1_RID         : std_logic_vector(3 downto 0);
signal aM_fl64_fa_0_BIF_1_RLAST       : std_logic;
signal aM_fl64_fa_0_BIF_1_RREADY      : std_logic;
signal aM_fl64_fa_0_BIF_1_RRESP       : std_logic_vector(1 downto 0);
signal aM_fl64_fa_0_BIF_1_RVALID      : std_logic;
signal aM_fl64_fa_0_BIF_1_WDATA       : std_logic_vector(63 downto 0);
signal aM_fl64_fa_0_BIF_1_WLAST       : std_logic;
signal aM_fl64_fa_0_BIF_1_WREADY      : std_logic;
signal aM_fl64_fa_0_BIF_1_WSTRB       : std_logic_vector(7 downto 0);
signal aM_fl64_fa_0_BIF_1_WVALID      : std_logic;
signal data_packer_0_address_out      : std_logic_vector(31 downto 0);
signal data_packer_0_output_data63to0 : std_logic_vector(63 downto 0);
signal data_packer_0_output_ready     : std_logic;
signal limited_counter_0_count        : std_logic_vector(7 downto 0);
signal limited_counter_0_en_val       : std_logic;
signal parallel_clk_CLK               : std_logic;
signal RESET_GEN_C1_0_RESET           : std_logic;
signal sys_clk_CLK                    : std_logic;
signal output_data_slice_0            : std_logic_vector(127 downto 64);
signal output_data_slice_1            : std_logic_vector(191 downto 128);
signal output_data_slice_2            : std_logic_vector(255 downto 192);
signal output_data_slice_3            : std_logic_vector(319 downto 256);
signal output_data_slice_4            : std_logic_vector(383 downto 320);
signal output_data_slice_5            : std_logic_vector(447 downto 384);
signal output_data_slice_6            : std_logic_vector(511 downto 448);
signal input_data_net_0               : std_logic_vector(31 downto 0);
signal output_data_net_0              : std_logic_vector(511 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                        : std_logic;
signal i_rd_addr_const_net_0          : std_logic_vector(31 downto 0);
signal i_write_transfer_size_const_net_0: std_logic_vector(9 downto 0);
signal i_read_transfer_size_const_net_0: std_logic_vector(9 downto 0);
signal input_data_const_net_0         : std_logic_vector(15 downto 8);
signal input_data_const_net_1         : std_logic_vector(23 downto 16);
signal input_data_const_net_2         : std_logic_vector(31 downto 24);
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal input_reset_IN_POST_INV0_0     : std_logic;

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
-- Slices assignments
----------------------------------------------------------------------
 data_packer_0_output_data63to0 <= output_data_net_0(63 downto 0);
 output_data_slice_0            <= output_data_net_0(127 downto 64);
 output_data_slice_1            <= output_data_net_0(191 downto 128);
 output_data_slice_2            <= output_data_net_0(255 downto 192);
 output_data_slice_3            <= output_data_net_0(319 downto 256);
 output_data_slice_4            <= output_data_net_0(383 downto 320);
 output_data_slice_5            <= output_data_net_0(447 downto 384);
 output_data_slice_6            <= output_data_net_0(511 downto 448);
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 input_data_net_0 <= ( B"00000000" & B"00000000" & B"00000000" & limited_counter_0_count );
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- aM_fl64_fa_0
aM_fl64_fa_0 : entity work.aM_fl64_fa
    port map( 
        -- Inputs
        i_clk                 => sys_clk_CLK,
        i_rstn                => RESET_GEN_C1_0_RESET,
        i_start_write         => data_packer_0_output_ready,
        i_start_read          => GND_net,
        i_rd_addr             => i_rd_addr_const_net_0,
        i_wrt_addr            => data_packer_0_address_out,
        i_write_transfer_size => i_write_transfer_size_const_net_0,
        i_read_transfer_size  => i_read_transfer_size_const_net_0,
        i_data                => data_packer_0_output_data63to0,
        AWREADY               => aM_fl64_fa_0_BIF_1_AWREADY,
        WREADY                => aM_fl64_fa_0_BIF_1_WREADY,
        BID                   => aM_fl64_fa_0_BIF_1_BID,
        BRESP                 => aM_fl64_fa_0_BIF_1_BRESP,
        BVALID                => aM_fl64_fa_0_BIF_1_BVALID,
        ARREADY               => aM_fl64_fa_0_BIF_1_ARREADY,
        RDATA                 => aM_fl64_fa_0_BIF_1_RDATA,
        RLAST                 => aM_fl64_fa_0_BIF_1_RLAST,
        RVALID                => aM_fl64_fa_0_BIF_1_RVALID,
        RID                   => aM_fl64_fa_0_BIF_1_RID,
        RRESP                 => aM_fl64_fa_0_BIF_1_RRESP,
        -- Outputs
        o_data_req            => OPEN,
        o_data                => OPEN,
        o_data_valid          => OPEN,
        o_ready               => OPEN,
        AWID                  => aM_fl64_fa_0_BIF_1_AWID,
        AWADDR                => aM_fl64_fa_0_BIF_1_AWADDR,
        AWLEN                 => aM_fl64_fa_0_BIF_1_AWLEN,
        AWSIZE                => aM_fl64_fa_0_BIF_1_AWSIZE,
        AWLOCK                => aM_fl64_fa_0_BIF_1_AWLOCK,
        AWBURST               => aM_fl64_fa_0_BIF_1_AWBURST,
        AWVALID               => aM_fl64_fa_0_BIF_1_AWVALID,
        WSTRB                 => aM_fl64_fa_0_BIF_1_WSTRB,
        WLAST                 => aM_fl64_fa_0_BIF_1_WLAST,
        WVALID                => aM_fl64_fa_0_BIF_1_WVALID,
        WDATA                 => aM_fl64_fa_0_BIF_1_WDATA,
        BREADY                => aM_fl64_fa_0_BIF_1_BREADY,
        ARID                  => aM_fl64_fa_0_BIF_1_ARID,
        ARADDR                => aM_fl64_fa_0_BIF_1_ARADDR,
        ARLEN                 => aM_fl64_fa_0_BIF_1_ARLEN,
        ARSIZE                => aM_fl64_fa_0_BIF_1_ARSIZE,
        ARLOCK                => aM_fl64_fa_0_BIF_1_ARLOCK,
        ARBURST               => aM_fl64_fa_0_BIF_1_ARBURST,
        ARVALID               => aM_fl64_fa_0_BIF_1_ARVALID,
        RREADY                => aM_fl64_fa_0_BIF_1_RREADY,
        ARCACHE               => aM_fl64_fa_0_BIF_1_ARCACHE,
        ARPROT                => aM_fl64_fa_0_BIF_1_ARPROT,
        AWCACHE               => aM_fl64_fa_0_BIF_1_AWCACHE,
        AWPROT                => aM_fl64_fa_0_BIF_1_AWPROT 
        );
-- COREAXI4SRAM_C2_0
COREAXI4SRAM_C2_0 : COREAXI4SRAM_C2
    port map( 
        -- Inputs
        ACLK    => sys_clk_CLK,
        ARESETN => RESET_GEN_C1_0_RESET,
        AWVALID => aM_fl64_fa_0_BIF_1_AWVALID,
        WLAST   => aM_fl64_fa_0_BIF_1_WLAST,
        WVALID  => aM_fl64_fa_0_BIF_1_WVALID,
        BREADY  => aM_fl64_fa_0_BIF_1_BREADY,
        ARVALID => aM_fl64_fa_0_BIF_1_ARVALID,
        RREADY  => aM_fl64_fa_0_BIF_1_RREADY,
        AWADDR  => aM_fl64_fa_0_BIF_1_AWADDR,
        AWLEN   => aM_fl64_fa_0_BIF_1_AWLEN,
        AWSIZE  => aM_fl64_fa_0_BIF_1_AWSIZE,
        AWBURST => aM_fl64_fa_0_BIF_1_AWBURST,
        AWLOCK  => aM_fl64_fa_0_BIF_1_AWLOCK,
        AWCACHE => aM_fl64_fa_0_BIF_1_AWCACHE,
        AWPROT  => aM_fl64_fa_0_BIF_1_AWPROT,
        WDATA   => aM_fl64_fa_0_BIF_1_WDATA,
        WSTRB   => aM_fl64_fa_0_BIF_1_WSTRB,
        ARADDR  => aM_fl64_fa_0_BIF_1_ARADDR,
        ARLEN   => aM_fl64_fa_0_BIF_1_ARLEN,
        ARSIZE  => aM_fl64_fa_0_BIF_1_ARSIZE,
        ARBURST => aM_fl64_fa_0_BIF_1_ARBURST,
        ARLOCK  => aM_fl64_fa_0_BIF_1_ARLOCK,
        ARCACHE => aM_fl64_fa_0_BIF_1_ARCACHE,
        ARPROT  => aM_fl64_fa_0_BIF_1_ARPROT,
        AWID    => aM_fl64_fa_0_BIF_1_AWID,
        ARID    => aM_fl64_fa_0_BIF_1_ARID,
        -- Outputs
        AWREADY => aM_fl64_fa_0_BIF_1_AWREADY,
        WREADY  => aM_fl64_fa_0_BIF_1_WREADY,
        BVALID  => aM_fl64_fa_0_BIF_1_BVALID,
        ARREADY => aM_fl64_fa_0_BIF_1_ARREADY,
        RLAST   => aM_fl64_fa_0_BIF_1_RLAST,
        RVALID  => aM_fl64_fa_0_BIF_1_RVALID,
        RDATA   => aM_fl64_fa_0_BIF_1_RDATA,
        RRESP   => aM_fl64_fa_0_BIF_1_RRESP,
        BRESP   => aM_fl64_fa_0_BIF_1_BRESP,
        BID     => aM_fl64_fa_0_BIF_1_BID,
        RID     => aM_fl64_fa_0_BIF_1_RID 
        );
-- data_packer_0
data_packer_0 : data_packer
    port map( 
        -- Inputs
        input_clk    => parallel_clk_CLK,
        input_reset  => input_reset_IN_POST_INV0_0,
        input_data   => input_data_net_0,
        input_valid  => limited_counter_0_en_val,
        -- Outputs
        output_data  => output_data_net_0,
        address_out  => data_packer_0_address_out,
        output_ready => data_packer_0_output_ready 
        );
-- limited_counter_0
limited_counter_0 : limited_counter
    port map( 
        -- Inputs
        clk    => parallel_clk_CLK,
        rst_N  => RESET_GEN_C1_0_RESET,
        -- Outputs
        en_val => limited_counter_0_en_val,
        count  => limited_counter_0_count 
        );
-- parallel_clk
parallel_clk : CLK_GEN_C3
    port map( 
        -- Outputs
        CLK => parallel_clk_CLK 
        );
-- RESET_GEN_C1_0
RESET_GEN_C1_0 : RESET_GEN_C1
    port map( 
        -- Outputs
        RESET => RESET_GEN_C1_0_RESET 
        );
-- sys_clk
sys_clk : CLK_GEN_C2
    port map( 
        -- Outputs
        CLK => sys_clk_CLK 
        );

end RTL;

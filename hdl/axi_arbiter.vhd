library IEEE;
use IEEE.std_logic_1164.all;


entity axi_arbiter is
  generic (
    DATA_WIDTH : integer := 512;
    ADDR_WIDTH : integer := 32;
    S_ID_WIDTH : integer := 4
    );
  port (
   
    s_realtime_awid    : in  std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_realtime_awaddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    s_realtime_awlen   : in  std_logic_vector(7 downto 0);
    s_realtime_awsize  : in  std_logic_vector(2 downto 0);
    s_realtime_awburst : in  std_logic_vector(1 downto 0);
    s_realtime_awlock : in  std_logic_vector(1 downto 0);
    s_realtime_awcache : in  std_logic_vector(3 downto 0);
    s_realtime_awprot : in  std_logic_vector(2 downto 0);
    s_realtime_awvalid : in  std_logic;
    s_realtime_awready : out std_logic;

    s_realtime_wdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    s_realtime_wstrb   : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    s_realtime_wvalid  : in  std_logic;
    s_realtime_wlast   : in  std_logic;
    s_realtime_wready  : out std_logic;
    
    s_realtime_bid     : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_realtime_bresp   : out std_logic_vector(1 downto 0);
    s_realtime_bvalid  : out std_logic;
    s_realtime_bready  : in  std_logic;

    s_realtime_arid    : in  std_logic_vector(S_ID_WIDTH-1 downto 0);    
    s_realtime_araddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    s_realtime_arlen   : in  std_logic_vector(7 downto 0);
    s_realtime_arsize  : in  std_logic_vector(2 downto 0);    
    s_realtime_arlock  : in  std_logic_vector(1 downto 0);    
    s_realtime_arburst : in  std_logic_vector(1 downto 0);
    s_realtime_arvalid : in  std_logic;
    s_realtime_arready : out std_logic;
    
    s_realtime_rdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);
    s_realtime_rlast   : out std_logic;
    s_realtime_rvalid  : out std_logic;
    s_realtime_rready  : in  std_logic;
    s_realtime_rresp   : out std_logic_vector(1 downto 0);
    s_realtime_rid     : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_realtime_arcache : in  std_logic_vector(3 downto 0);
    s_realtime_arprot : in  std_logic_vector(2 downto 0);
    
    
    s_besteffort_awid    : in  std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_besteffort_awaddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    s_besteffort_awlen   : in  std_logic_vector(7 downto 0);
    s_besteffort_awsize  : in  std_logic_vector(2 downto 0);
    s_besteffort_awburst : in  std_logic_vector(1 downto 0);
    s_besteffort_awlock : in  std_logic_vector(1 downto 0);
    s_besteffort_awcache : in  std_logic_vector(3 downto 0);
    s_besteffort_awprot : in  std_logic_vector(2 downto 0);
    s_besteffort_awvalid : in  std_logic;
    s_besteffort_awready : out std_logic;

    s_besteffort_wdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    s_besteffort_wstrb   : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    s_besteffort_wvalid  : in  std_logic;
    s_besteffort_wlast   : in  std_logic;
    s_besteffort_wready  : out std_logic;
    
    s_besteffort_bid     : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_besteffort_bresp   : out std_logic_vector(1 downto 0);
    s_besteffort_bvalid  : out std_logic;
    s_besteffort_bready  : in  std_logic;

    s_besteffort_arid    : in  std_logic_vector(S_ID_WIDTH-1 downto 0);    
    s_besteffort_araddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    s_besteffort_arlen   : in  std_logic_vector(7 downto 0);
    s_besteffort_arsize  : in  std_logic_vector(2 downto 0);    
    s_besteffort_arlock  : in  std_logic_vector(1 downto 0);    
    s_besteffort_arburst : in  std_logic_vector(1 downto 0);
    s_besteffort_arvalid : in  std_logic;
    s_besteffort_arready : out std_logic;
    
    s_besteffort_rdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);
    s_besteffort_rlast   : out std_logic;
    s_besteffort_rvalid  : out std_logic;
    s_besteffort_rready  : in  std_logic;
    s_besteffort_rresp   : out std_logic_vector(1 downto 0);
    s_besteffort_rid     : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    s_besteffort_arcache : in  std_logic_vector(3 downto 0);
    s_besteffort_arprot : in  std_logic_vector(2 downto 0);
    

    
    m_axi_awid    : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    m_axi_awaddr  : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    m_axi_awlen   : out std_logic_vector(7 downto 0);
    m_axi_awsize  : out std_logic_vector(2 downto 0);
    m_axi_awburst : out std_logic_vector(1 downto 0);    
    m_axi_awlock : out std_logic_vector(1 downto 0);
    m_axi_awcache : out std_logic_vector(3 downto 0);
    m_axi_awprot  : out std_logic_vector(2 downto 0);
    m_axi_awvalid : out std_logic;
    m_axi_awready : in  std_logic;
    m_axi_wdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);
    m_axi_wstrb   : out std_logic_vector((DATA_WIDTH)/8 - 1 downto 0);
    m_axi_wlast   : out std_logic;
    m_axi_wvalid  : out std_logic;
    m_axi_wready  : in  std_logic;
    m_axi_bid     : in  std_logic_vector(S_ID_WIDTH-1 downto 0);
    m_axi_bresp   : in  std_logic_vector(1 downto 0);
    m_axi_bvalid  : in  std_logic;
    m_axi_bready  : out std_logic;    
    m_axi_arid    : out std_logic_vector(S_ID_WIDTH-1 downto 0);
    m_axi_araddr  : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    m_axi_arlen   : out std_logic_vector(7 downto 0);
    m_axi_arsize  : out std_logic_vector(2 downto 0);
    m_axi_arburst : out std_logic_vector(1 downto 0);
    m_axi_arlock : out std_logic_vector(1 downto 0);
    m_axi_arcache : out std_logic_vector(3 downto 0);
    m_axi_arprot  : out std_logic_vector(2 downto 0);
    m_axi_arvalid : out std_logic;
    m_axi_arready : in  std_logic;
    m_axi_rid     : in  std_logic_vector(S_ID_WIDTH-1 downto 0);
    m_axi_rdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    m_axi_rresp   : in  std_logic_vector(1 downto 0);
    m_axi_rlast   : in  std_logic;
    m_axi_rvalid  : in  std_logic;
    m_axi_rready  : out std_logic
    );
end entity axi_arbiter;

architecture rtl of axi_arbiter is
 
begin
    --write
    m_axi_awid    <=   s_realtime_awid;
    m_axi_awaddr  <=  s_realtime_awaddr;
    m_axi_awlen   <=   s_realtime_awlen;
    m_axi_awsize  <=  s_realtime_awsize;
    m_axi_awburst <= s_realtime_awburst;
    m_axi_awlock  <=  s_realtime_awlock;
    m_axi_awcache <= s_realtime_awcache;
    m_axi_awprot  <=  s_realtime_awprot;
    m_axi_awvalid <= s_realtime_awvalid;
    s_realtime_awready   <=  m_axi_awready;
    m_axi_wdata   <=  s_realtime_wdata;
    m_axi_wstrb   <=  s_realtime_wstrb;
    m_axi_wlast   <=  s_realtime_wlast;
    m_axi_wvalid  <=  s_realtime_wvalid;
    s_realtime_wready    <=  m_axi_wready;
    s_realtime_bid       <=    m_axi_bid;
    s_realtime_bresp     <=  m_axi_bresp;
    s_realtime_bvalid    <=  m_axi_bvalid;
    m_axi_bready  <=  s_realtime_bready;

    --read
    m_axi_arid    <= s_besteffort_arid;
    m_axi_araddr  <= s_besteffort_araddr ;
    m_axi_arlen   <= s_besteffort_arlen ;
    m_axi_arsize  <= s_besteffort_arsize ;
    m_axi_arburst <= s_besteffort_arburst;
    m_axi_arlock  <= s_besteffort_arlock;
    m_axi_arcache <= s_besteffort_arcache;
    m_axi_arprot  <= s_besteffort_arprot;
    m_axi_arvalid <= s_besteffort_arvalid;
    s_besteffort_arready <= m_axi_arready;
    s_besteffort_rid     <= m_axi_rid;   
    s_besteffort_rdata   <= m_axi_rdata;
    s_besteffort_rresp   <= m_axi_rresp; 
    s_besteffort_rlast   <= m_axi_rlast;
    s_besteffort_rvalid  <= m_axi_rvalid;
    m_axi_rready  <= s_besteffort_rready;
 
 
 end architecture rtl;
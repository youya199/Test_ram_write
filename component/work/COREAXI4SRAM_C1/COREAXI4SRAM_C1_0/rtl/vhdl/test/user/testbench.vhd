--
----------------------------------------------------------------------------------------------
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.xhdl_std_logic.all;
use work.xhdl_misc.all;
use work.coreparameters.all;

ENTITY testbench IS
 END testbench;

ARCHITECTURE translated OF testbench IS

  CONSTANT xhdl_timescale         : time := 1 ns;
  CONSTANT AXI_CLK_PERIOD         : INTEGER := 5;

   COMPONENT top_COREAXI4SRAM_0_COREAXI4SRAM
      GENERIC (
         -- --------------------------------------------------------------------------
         -- PARAMETER Declaration
         -- --------------------------------------------------------------------------
         FAMILY                         :  integer := 19;    
         AXI4_DWIDTH                    :  integer := 64;    
         AXI4_AWIDTH                    :  integer := 32;    
         AXI4_IFTYPE_WR                 :  integer := 1;    
         AXI4_IFTYPE_RD                 :  integer := 1;    
         SEL_SRAM_TYPE                  :  integer := 1;    
         MEM_DEPTH                      :  integer := 512;    
         --PIPE_EN                        :  integer := 0;    
         AXI4_IDWIDTH                   :  integer := 4;    
         WRAP_SUPPORT                   :  integer := 0);    
      PORT (

-- -------------------------------------------------------------------------
-- I/O Signals
-- -------------------------------------------------------------------------
-- Clock and Clock control signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- AXI4 Slave interface signals

         AWID                    : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         AWADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
         ;   
         AWLEN                   : IN std_logic_vector(7 DOWNTO 0);   
         AWSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST                 : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE                 : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT                  : IN std_logic_vector(2 DOWNTO 0);   
         AWLOCK                  : IN std_logic_vector(1 DOWNTO 0);   
         AWVALID                 : IN std_logic;   
         AWREADY                 : OUT std_logic;   
         WDATA                   : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB                   : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 
         DOWNTO 0);   
         WLAST                   : IN std_logic;   
         WVALID                  : IN std_logic;   
         WREADY                  : OUT std_logic;   
         BID                     : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         BRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID                  : OUT std_logic;   
         BREADY                  : IN std_logic;   
         ARID                    : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         ARADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
         ;   
         ARLEN                   : IN std_logic_vector(7 DOWNTO 0);   
         ARSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST                 : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE                 : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT                  : IN std_logic_vector(2 DOWNTO 0);   
         ARLOCK                  : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID                 : IN std_logic;   
         ARREADY                 : OUT std_logic;   
         RID                     : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         RDATA                   : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 
         0);   
         RRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST                   : OUT std_logic;   
         RVALID                  : OUT std_logic;   
         RREADY                  : IN std_logic);
   END COMPONENT;

  COMPONENT axi_master
      GENERIC (
         FAMILY                         :  integer := 19;    
         AXI_DWIDTH                     :  integer := 64;    --  64/128/256
         AXI_AWIDTH                     :  integer := 32;    --  64/128/256
         ID_WIDTH                       :  integer := 4);    
      PORT (
         ACLK                    : IN  std_logic;
         ARESETN                 : IN  std_logic;
                                 
         AWREADY                 : IN std_logic;
         ARREADY                 : IN std_logic;
         WREADY                  : IN std_logic;
         BID                     : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);
         BRESP                   : IN std_logic_vector(1 DOWNTO 0);
         BVALID                  : IN std_logic;
         RID                     : IN std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);
         RDATA                   : IN std_logic_vector(63 DOWNTO 0);
         RRESP                    : IN std_logic_vector(1 DOWNTO 0);
         RVALID                  : IN std_logic;
         RLAST                   : IN std_logic;

   --    OUTPUTS 
         AWID                    : OUT std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);
         AWADDR                  : OUT std_logic_vector(31 DOWNTO 0);
         AWLEN                   : OUT std_logic_vector(7 DOWNTO 0);
         AWSIZE                  : OUT std_logic_vector(2 DOWNTO 0);  
         AWBURST                 : OUT std_logic_vector(1 DOWNTO 0);
         AWLOCK                  : OUT std_logic_vector(1 DOWNTO 0);
         AWCACHE                 : OUT  std_logic_vector(3 DOWNTO 0);
         AWPROT                  : OUT  std_logic_vector(2 DOWNTO 0);
         AWVALID                 : OUT std_logic;

         WID                     : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);
         WDATA                   : OUT std_logic_vector(63 DOWNTO 0);
         WSTRB                   : OUT std_logic_vector(7 DOWNTO 0);
         WLAST                   : OUT std_logic;
         WVALID                  : OUT std_logic;
   
         ARID                    : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);
         ARADDR                  : OUT std_logic_vector(31 DOWNTO 0);
         ARLEN                   : OUT std_logic_vector(7 DOWNTO 0);
         ARSIZE                  : OUT std_logic_vector(2 DOWNTO 0);  
         ARBURST                 : OUT std_logic_vector(1 DOWNTO 0);
         ARLOCK                  : OUT std_logic_vector(1 DOWNTO 0);
         ARCACHE                 : OUT std_logic_vector(3 DOWNTO 0);
         ARPROT                  : OUT std_logic_vector(2 DOWNTO 0);
         ARVALID                 : OUT std_logic;

         BREADY                  : OUT std_logic;
         RREADY                  : OUT std_logic;
         TRIGGER_M0              : IN std_logic;
         RDATA_TRIGGER           : OUT std_logic;
         END_OF_SIMULATION       : OUT boolean
 );
   END COMPONENT;



   CONSTANT  AXI_CLK_PERIO         :  real := 1.25;    
   SIGNAL ACLK                     :  std_logic;   
   SIGNAL ARESETN                  :  std_logic;   

   SIGNAL AWID_M0                  :  std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);   
   SIGNAL AWADDR_M0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_M0                 :  std_logic_vector(7 downto 0);   
   SIGNAL AWSIZE_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M0               :  std_logic;   
   SIGNAL AWREADY_M0               :  std_logic;   
   SIGNAL WID_M0                   :  std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);   
   SIGNAL WDATA_M0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_M0                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_M0                 :  std_logic;   
   SIGNAL WVALID_M0                :  std_logic;   
   SIGNAL WREADY_M0                :  std_logic;   
   SIGNAL BID_M0                   :  std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);   
   SIGNAL BRESP_M0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M0                :  std_logic;   
   SIGNAL BREADY_M0                :  std_logic;   
   SIGNAL ARID_M0                  :  std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);   
   SIGNAL ARADDR_M0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_M0                 :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL ARSIZE_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M0               :  std_logic;   
   SIGNAL ARREADY_M0               :  std_logic;   
   SIGNAL RID_M0                   :  std_logic_vector(AXI4_IDWIDTH - 1  DOWNTO 0);   
   SIGNAL RDATA_M0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_M0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M0                 :  std_logic;   
   SIGNAL RVALID_M0                :  std_logic;   
   SIGNAL RREADY_M0                :  std_logic;   
   SIGNAL TRIGGER_M0               :  std_logic;
   SIGNAL RDATA_TRIGGER            : std_logic;
   SIGNAL END_OF_SIMULATION1       : boolean;
   SIGNAL END_OF_SIMULATION2       : boolean;
   SIGNAL END_OF_SIMULATION3       : boolean;
   SIGNAL END_OF_SIMULATION4       : boolean;
 

BEGIN

   PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;
   BEGIN
      IF (xhdl_initial) THEN
         ARESETN <= '0';
         WAIT FOR AXI_CLK_PERIOD * 10 ns;
         ARESETN <= '1' AFTER 10 * 1 ns;    
         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;
   END PROCESS;

   PROCESS
   BEGIN
      ACLK <= '0';    
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      ACLK <= '1';    
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      IF(END_OF_SIMULATION1) THEN
          WAIT;
      END IF;
   END PROCESS;


   master_0 : axi_master 
     GENERIC MAP (
         FAMILY                     => FAMILY,
         AXI_DWIDTH                 => 64,
         AXI_AWIDTH                 => AXI4_AWIDTH,
         ID_WIDTH                   => 4)                 
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID    => AWID_M0,
         AWADDR  => AWADDR_M0,
         AWLEN   => AWLEN_M0,
         AWSIZE  => AWSIZE_M0,
         AWBURST => AWBURST_M0,
         AWLOCK  => AWLOCK_M0,
         AWCACHE => AWCACHE_M0,
         AWPROT  => AWPROT_M0,
         AWVALID => AWVALID_M0,
         AWREADY => AWREADY_M0,
         WID     => WID_M0,
         WDATA   => WDATA_M0,
         WSTRB   => WSTRB_M0,
         WLAST   => WLAST_M0,
         WVALID  => WVALID_M0,
         WREADY  => WREADY_M0,
         BID     => BID_M0,
         BRESP   => BRESP_M0,
         BVALID  => BVALID_M0,
         BREADY  => BREADY_M0,
         ARID    => ARID_M0,
         ARADDR  => ARADDR_M0,
         ARLEN   => ARLEN_M0,
         ARSIZE  => ARSIZE_M0,
         ARBURST => ARBURST_M0,
         ARLOCK  => ARLOCK_M0,
         ARCACHE => ARCACHE_M0,
         ARPROT  => ARPROT_M0,
         ARVALID => ARVALID_M0,
         ARREADY => ARREADY_M0,
         RID     => RID_M0,
         RDATA   => RDATA_M0,
         RRESP   => RRESP_M0,
         RLAST   => RLAST_M0,
         RVALID  => RVALID_M0,
         RREADY  => RREADY_M0,
         TRIGGER_M0 => TRIGGER_M0,
         RDATA_TRIGGER => RDATA_TRIGGER,
         END_OF_SIMULATION => END_OF_SIMULATION1);   
   


   U_COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_COREAXI4SRAM : COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_COREAXI4SRAM 
      GENERIC MAP (
         --PIPE_EN => PIPE_EN,
         SEL_SRAM_TYPE => SEL_SRAM_TYPE,
         AXI4_IDWIDTH => AXI4_IDWIDTH,
         AXI4_IFTYPE_RD => AXI4_IFTYPE_RD,
         AXI4_DWIDTH => 64,
         WRAP_SUPPORT => WRAP_SUPPORT,
         AXI4_IFTYPE_WR => AXI4_IFTYPE_WR,
         MEM_DEPTH => MEM_DEPTH,
         AXI4_AWIDTH => AXI4_AWIDTH,
         FAMILY => FAMILY)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_M0,
         AWADDR => AWADDR_M0,
         AWLEN => AWLEN_M0,
         AWSIZE => AWSIZE_M0,
         AWBURST => AWBURST_M0,
         AWCACHE => AWCACHE_M0,
         AWPROT => AWPROT_M0,
         AWLOCK => AWLOCK_M0,
         AWVALID => AWVALID_M0,
         AWREADY => AWREADY_M0,
         WDATA => WDATA_M0,
         WSTRB => WSTRB_M0,
         WLAST => WLAST_M0,
         WVALID => WVALID_M0,
         WREADY => WREADY_M0,
         BID => BID_M0,
         BRESP => BRESP_M0,
         BVALID => BVALID_M0,
         BREADY => BREADY_M0,
         ARID => ARID_M0,
         ARADDR => ARADDR_M0,
         ARLEN => ARLEN_M0,
         ARSIZE => ARSIZE_M0,
         ARBURST => ARBURST_M0,
         ARCACHE => ARCACHE_M0,
         ARPROT => ARPROT_M0,
         ARLOCK => ARLOCK_M0,
         ARVALID => ARVALID_M0,
         ARREADY => ARREADY_M0,
         RID => RID_M0,
         RDATA => RDATA_M0,
         RRESP => RRESP_M0,
         RLAST => RLAST_M0,
         RVALID => RVALID_M0,
         RREADY => RREADY_M0); 



   
  PROCESS
     VARIABLE xhdl_initial : BOOLEAN := TRUE;
  BEGIN
     IF (xhdl_initial) THEN
        TRIGGER_M0 <= '0';
       
        WAIT FOR 100 * xhdl_timescale;
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        
        TRIGGER_M0 <= '1';
    -- signal which trigger the transactions.
        
        xhdl_initial := FALSE;
     ELSE
        WAIT;
     END IF;
  END PROCESS;



END translated;


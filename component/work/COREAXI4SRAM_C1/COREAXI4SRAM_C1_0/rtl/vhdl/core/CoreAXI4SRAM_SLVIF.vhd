-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
--  Copyright 2011 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:  CoreAXI4SRAM_SLVIF
--               
--               
--
--
-- Revision Information:
-- Date     Description
--
-- SVN Revision Information:
-- SVN $Revision: 4805 $
-- SVN $Date: 2012-06-21 17:48:48 +0530 (Thu, 21 Jun 2012) $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes:
--
--               
--
--  Structure:
--            CoreAXI4SRAM (TOP) _   
--                               |
--                               |_ CoreAXI4_SLVIF
--                               |
--                               |_ CoreAXI4_MainCtrl
--                               |
--                               |_ CoreAXI4_SRAMCtrl
--               
--
-- ********************************************************************/

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;
use     work.misc_pkg.all;


ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF IS
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
      PIPE_EN                        :  integer := 0;    
      AXI4_IDWIDTH                   :  integer := 4);    
   PORT (
      -- -------------------------------------------------------------------------
-- I/O Signals
-- -------------------------------------------------------------------------
-- Clock and Clock control signals

      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;   
      -- AXI4 Slave interface signals

      AWID_S                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      AWADDR_S                : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);  
      AWLEN_S                 : IN std_logic_vector(7 DOWNTO 0);   
      AWSIZE_S                : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_S               : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S               : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_S                : IN std_logic_vector(2 DOWNTO 0);   
      AWLOCK_S                : IN std_logic_vector(1 DOWNTO 0);   
      AWVALID_S               : IN std_logic;   
      AWREADY_S               : OUT std_logic;   
      WDATA_S                 : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S                 : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 
      0);   
      WLAST_S                 : IN std_logic;   
      WVALID_S                : IN std_logic;   
      WREADY_S                : OUT std_logic;   
      BID_S                   : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      BRESP_S                 : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_S                : OUT std_logic;   
      BREADY_S                : IN std_logic;   
      ARID_S                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      ARADDR_S                : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);  
      ARLEN_S                 : IN std_logic_vector(7 DOWNTO 0);   
      ARSIZE_S                : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_S               : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S               : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_S                : IN std_logic_vector(2 DOWNTO 0);   
      ARLOCK_S                : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_S               : IN std_logic;   
      ARREADY_S               : OUT std_logic;   
      RID_S                   : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      RDATA_S                 : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0); 
      RRESP_S                 : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_S                 : OUT std_logic;   
      RVALID_S                : OUT std_logic;   
      RREADY_S                : IN std_logic;   
      -- From Main Control block

      waddrchset_mc           : IN std_logic;   
      raddrchset_mc           : IN std_logic;   
      awready_mc              : IN std_logic;   
      wready_mc               : IN std_logic;   
      arready_mc              : IN std_logic;   
      bvalid_mc               : IN std_logic;   
      bid_mc                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      bresp_mc                : IN std_logic_vector(1 DOWNTO 0);   
      rvalid_mc               : IN std_logic;   
      rid_mc                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      rresp_mc                : IN std_logic_vector(1 DOWNTO 0);   
      rlast_mc                : IN std_logic;   
      rdata_mc                : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);  
      -- To Main Control block

      AWID_slvif              : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      AWVALID_slvif           : OUT std_logic;   
      AWSIZE_slvif            : OUT std_logic_vector(2 DOWNTO 0);   
      AWLEN_slvif             : OUT std_logic_vector(7 DOWNTO 0);   
      AWADDR_slvif            : OUT std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0); 
      AWBURST_slvif           : OUT std_logic_vector(1 DOWNTO 0);   
      WDATA_slvif             : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0); 
      WSTRB_slvif             : OUT std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 
      0);   
      WLAST_slvif             : OUT std_logic;   
      WVALID_slvif            : OUT std_logic;   
      ARID_slvif              : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      ARVALID_slvif           : OUT std_logic;   
      ARBURST_slvif           : OUT std_logic_vector(1 DOWNTO 0);   
      ARSIZE_slvif            : OUT std_logic_vector(2 DOWNTO 0);   
      ARADDR_slvif            : OUT std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0); 
      ARLEN_slvif             : OUT std_logic_vector(7 DOWNTO 0);   
      RREADY_slvif            : OUT std_logic;   
      WSTRB                   : OUT std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 0));   
END ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF;

ARCHITECTURE trans OF COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF IS


   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   -- ------------------------------------------------------------------------ //
   -- Generate the ready signals for write address/read address and write data //
   -- ------------------------------------------------------------------------ //
   SIGNAL temp_xhdl32              :  std_logic;   
   SIGNAL temp_xhdl33              :  std_logic;   
   SIGNAL temp_xhdl34              :  std_logic;   
   SIGNAL AWREADY_S_xhdl1          :  std_logic;   
   SIGNAL WREADY_S_xhdl2           :  std_logic;   
   SIGNAL BID_S_xhdl3              :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL BRESP_S_xhdl4            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S_xhdl5           :  std_logic;   
   SIGNAL ARREADY_S_xhdl6          :  std_logic;   
   SIGNAL RID_S_xhdl7              :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL RDATA_S_xhdl8            :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_S_xhdl9            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S_xhdl10           :  std_logic;   
   SIGNAL RVALID_S_xhdl11          :  std_logic;   
   SIGNAL AWID_slvif_xhdl12        :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL AWVALID_slvif_xhdl13     :  std_logic;   
   SIGNAL AWADDR_slvif_xhdl14      :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWSIZE_slvif_xhdl15      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWLEN_slvif_xhdl16       :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL AWBURST_slvif_xhdl17     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL WDATA_slvif_xhdl18       :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_slvif_xhdl19       :  std_logic_vector(AXI4_DWIDTH / 8 - 1 
   DOWNTO 0);   
   SIGNAL WLAST_slvif_xhdl20       :  std_logic;   
   SIGNAL WVALID_slvif_xhdl21      :  std_logic;   
   SIGNAL ARID_slvif_xhdl22        :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL ARVALID_slvif_xhdl23     :  std_logic;   
   SIGNAL ARBURST_slvif_xhdl24     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARADDR_slvif_xhdl25      :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL ARSIZE_slvif_xhdl26      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARLEN_slvif_xhdl27       :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL RREADY_slvif_xhdl28      :  std_logic;   
   SIGNAL WSTRB_xhdl29             :  std_logic_vector(AXI4_DWIDTH / 8 - 1 
   DOWNTO 0);   

BEGIN
   AWREADY_S <= AWREADY_S_xhdl1;
   WREADY_S <= WREADY_S_xhdl2;
   BID_S <= BID_S_xhdl3;
   BRESP_S <= BRESP_S_xhdl4;
   BVALID_S <= BVALID_S_xhdl5;
   ARREADY_S <= ARREADY_S_xhdl6;
   RID_S <= RID_S_xhdl7;
   RDATA_S <= RDATA_S_xhdl8;
   RRESP_S <= RRESP_S_xhdl9;
   RLAST_S <= RLAST_S_xhdl10;
   RVALID_S <= RVALID_S_xhdl11;
   AWID_slvif <= AWID_slvif_xhdl12;
   AWVALID_slvif <= AWVALID_slvif_xhdl13;
   AWADDR_slvif <= AWADDR_slvif_xhdl14;
   AWSIZE_slvif <= AWSIZE_slvif_xhdl15;
   AWLEN_slvif <= AWLEN_slvif_xhdl16;
   AWBURST_slvif <= AWBURST_slvif_xhdl17;
   WDATA_slvif <= WDATA_slvif_xhdl18;
   WSTRB_slvif <= WSTRB_slvif_xhdl19;
   WLAST_slvif <= WLAST_slvif_xhdl20;
   WVALID_slvif <= WVALID_slvif_xhdl21;
   ARID_slvif <= ARID_slvif_xhdl22;
   ARVALID_slvif <= ARVALID_slvif_xhdl23;
   ARBURST_slvif <= ARBURST_slvif_xhdl24;
   ARADDR_slvif <= ARADDR_slvif_xhdl25;
   ARSIZE_slvif <= ARSIZE_slvif_xhdl26;
   ARLEN_slvif <= ARLEN_slvif_xhdl27;
   RREADY_slvif <= RREADY_slvif_xhdl28;
   WSTRB <= WSTRB_xhdl29;

   -- --------------------------------------------------------------------------
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- ||                                                                      ||
   -- ||                     Start - of - Code                                ||
   -- ||                                                                      ||
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- --------------------------------------------------------------------------
   -- ------------------------------------ //
   -- Latch the write/read channel signals //
   -- ------------------------------------ //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         AWADDR_slvif_xhdl14 <= (OTHERS => '0');    
         AWID_slvif_xhdl12 <= (OTHERS => '0');    
         AWBURST_slvif_xhdl17 <= "00";    
         AWSIZE_slvif_xhdl15 <= "000";    
         AWLEN_slvif_xhdl16 <= "00000000";    
         ARADDR_slvif_xhdl25 <= (OTHERS => '0');    
         ARID_slvif_xhdl22 <= (OTHERS => '0');    
         ARBURST_slvif_xhdl24 <= "00";    
         ARSIZE_slvif_xhdl26 <= "000";    
         ARLEN_slvif_xhdl27 <= "00000000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         -- From Main Control block: WR FSM 
         
         IF (waddrchset_mc = '1') THEN
            AWADDR_slvif_xhdl14 <= AWADDR_S;    
            AWID_slvif_xhdl12 <= AWID_S;    
            AWBURST_slvif_xhdl17 <= AWBURST_S;    
            AWSIZE_slvif_xhdl15 <= AWSIZE_S;    
         END IF;
         AWLEN_slvif_xhdl16 <= AWLEN_S;    
         -- From Main Control block: RD FSM 
         
         IF (raddrchset_mc = '1') THEN
            ARADDR_slvif_xhdl25 <= ARADDR_S;    
            ARID_slvif_xhdl22 <= ARID_S;    
            ARBURST_slvif_xhdl24 <= ARBURST_S;    
            ARSIZE_slvif_xhdl26 <= ARSIZE_S;    
         END IF;
         ARLEN_slvif_xhdl27 <= ARLEN_S;    
      END IF;
   END PROCESS;
   AWVALID_slvif_xhdl13 <= AWVALID_S ;
   ARVALID_slvif_xhdl23 <= ARVALID_S ;
   RREADY_slvif_xhdl28 <= RREADY_S ;

   -- ---------------------------------------------- //
   -- Latch the write data channel signals           //
   -- These signals are output to Main Control block //
   -- ---------------------------------------------- //
   PROCESS (WLAST_S, WSTRB_S, WDATA_S)
   BEGIN
         WLAST_slvif_xhdl20  <= WLAST_S;    
         WSTRB_slvif_xhdl19  <= WSTRB_S;    
         WDATA_slvif_xhdl18  <= WDATA_S;    
   END PROCESS;

   PROCESS (WVALID_S, WSTRB_S)
      VARIABLE WVALID_slvif_xhdl21_xhdl30  : std_logic;
      VARIABLE WSTRB_xhdl29_xhdl31  : std_logic_vector(AXI4_DWIDTH / 8 - 1 
      DOWNTO 0);
   BEGIN
      WVALID_slvif_xhdl21_xhdl30 := WVALID_S;    
      WSTRB_xhdl29_xhdl31 := WSTRB_S;    
      WVALID_slvif_xhdl21 <= WVALID_slvif_xhdl21_xhdl30;
      WSTRB_xhdl29 <= WSTRB_xhdl29_xhdl31;
   END PROCESS;
   temp_xhdl32 <= (AWVALID_S AND awready_mc) WHEN (AXI4_IFTYPE_WR) /= 0 ELSE 
   '0';
   AWREADY_S_xhdl1 <= temp_xhdl32 ;
   temp_xhdl33 <= (ARVALID_S AND arready_mc) WHEN (AXI4_IFTYPE_RD) /= 0 ELSE 
   '0';
   ARREADY_S_xhdl6 <= temp_xhdl33 ;
   temp_xhdl34 <= (WVALID_S AND wready_mc) WHEN (AXI4_IFTYPE_WR) /= 0 ELSE 
   '0';
   WREADY_S_xhdl2 <= temp_xhdl34 ;
   -- ------------------------------------------------------------------- //
   -- Generate the Write response channel output signals to the top-level //
   -- ------------------------------------------------------------------- //
   BVALID_S_xhdl5 <= bvalid_mc ;
   BRESP_S_xhdl4 <= bresp_mc ;
   BID_S_xhdl3 <= bid_mc ;
   -- ----------------------------------------------------------------------- //
   -- Generate the Read data response channel output signals to the top-level //
   -- ----------------------------------------------------------------------- //
   RVALID_S_xhdl11 <= rvalid_mc ;
   RRESP_S_xhdl9 <= rresp_mc ;
   RID_S_xhdl7 <= rid_mc ;
   RLAST_S_xhdl10 <= rlast_mc ;
   RDATA_S_xhdl8 <= rdata_mc ;

END ARCHITECTURE trans;

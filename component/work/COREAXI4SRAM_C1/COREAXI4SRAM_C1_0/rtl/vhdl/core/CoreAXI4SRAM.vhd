-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
--  Copyright 2011 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:  CoreAXI4SRAM
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
--                               |_ CoreAXI4_MAINCTRL
--                               |
--                               |_ CoreAXI4_MEMIF
--               
--
-- ********************************************************************/
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;
use     work.misc_pkg.all;


ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_COREAXI4SRAM IS
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

      AWID                    : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      AWADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);  
      AWLEN                   : IN std_logic_vector(7 DOWNTO 0);   
      AWSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST                 : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE                 : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT                  : IN std_logic_vector(2 DOWNTO 0);   
      AWLOCK                  : IN std_logic_vector(1 DOWNTO 0);   
      AWVALID                 : IN std_logic;   
      AWREADY                 : OUT std_logic;   
      WDATA                   : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);  
      WSTRB                   : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 
      0);   
      WLAST                   : IN std_logic;   
      WVALID                  : IN std_logic;   
      WREADY                  : OUT std_logic;   
      BID                     : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      BRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID                  : OUT std_logic;   
      BREADY                  : IN std_logic;   
      ARID                    : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
      ARADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);  
      ARLEN                   : IN std_logic_vector(7 DOWNTO 0);   
      ARSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST                 : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE                 : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT                  : IN std_logic_vector(2 DOWNTO 0);   
      ARLOCK                  : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID                 : IN std_logic;   
      ARREADY                 : OUT std_logic;   
      RID                     : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0)
      ;   
      RDATA                   : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0); 
      RRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST                   : OUT std_logic;   
      RVALID                  : OUT std_logic;   
      RREADY                  : IN std_logic);   
END ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_COREAXI4SRAM;

ARCHITECTURE trans OF COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_COREAXI4SRAM IS
    
    FUNCTION ceil_log2 (t : natural) RETURN natural is
    VARIABLE RetVal:    natural;
    BEGIN
        RetVal := log2(t);
        IF (t > (2**RetVal)) THEN
            RETURN(RetVal + 1); -- RetVal is too small, so bump it up by 1 and return
        ELSE
            RETURN(RetVal); -- Just right
        END IF;
    END FUNCTION ceil_log2;
   
   CONSTANT PIPE_EN :  integer := 0;

   -- --------------------------------------------------------------------------
   -- Components
   -- --------------------------------------------------------------------------
   COMPONENT COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MAINCTRL
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
         AXI4_IDWIDTH                   :  integer := 4;    
         MEM_AWIDTH                     :  integer := 9;    
         WRAP_SUPPORT                   :  integer := 1);  
      PORT (

-- -------------------------------------------------------------------------
-- I/O Signals
-- -------------------------------------------------------------------------
-- Clock and Clock control signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- From AXI4 Slave interface

         AWID_slvif              : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         AWVALID_slvif           : IN std_logic;   
         AWADDR_slvif            : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
         AWSIZE_slvif            : IN std_logic_vector(2 DOWNTO 0);   
         AWLEN_slvif             : IN std_logic_vector(7 DOWNTO 0);   
         AWBURST_slvif           : IN std_logic_vector(1 DOWNTO 0);   
         WDATA_slvif             : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);   
         WSTRB_slvif             : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 0);   
         WLAST_slvif             : IN std_logic;   
         WVALID_slvif            : IN std_logic;   
         BREADY_slvif            : IN std_logic;   
         AWVALID                 : IN std_logic;   
         AWADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
         AWSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
         AWLEN                   : IN std_logic_vector(7 DOWNTO 0);   
         AWBURST                 : IN std_logic_vector(1 DOWNTO 0);   
         ARBURST_slvif           : IN std_logic_vector(1 DOWNTO 0);   
         ARID_slvif              : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);   
         ARVALID_slvif           : IN std_logic;   
         ARADDR_slvif            : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
         ARSIZE_slvif            : IN std_logic_vector(2 DOWNTO 0);   
         ARLEN_slvif             : IN std_logic_vector(7 DOWNTO 0);   
         ARVALID                 : IN std_logic;   
         ARADDR                  : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
         ARSIZE                  : IN std_logic_vector(2 DOWNTO 0);   
         ARLEN                   : IN std_logic_vector(7 DOWNTO 0);   
         ARBURST                 : IN std_logic_vector(1 DOWNTO 0);   
         RREADY_slvif            : IN std_logic;   
         WSTRB                   : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 DOWNTO 0);   
         waddrchset_mc           : OUT std_logic;   
         raddrchset_mc           : OUT std_logic;   
         -- To AXI4 Slave interface

         awready_mc              : OUT std_logic;   
         wready_mc               : OUT std_logic;   
         arready_mc              : OUT std_logic;   
         bvalid_mc               : OUT std_logic;   
         bid_mc                  : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);   
         bresp_mc                : OUT std_logic_vector(1 DOWNTO 0);   
         rvalid_mc               : OUT std_logic;   
         rid_mc                  : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0);   
         rlast_mc                : OUT std_logic;   
         rresp_mc                : OUT std_logic_vector(1 DOWNTO 0);   
         rdata_mc                : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);   
         -- To SRAM Memory Interface   

         wena_sc                 : OUT std_logic_vector(1 DOWNTO 0);   
         wenb_sc                 : OUT std_logic_vector(1 DOWNTO 0);   
         wena_msb_sc             : OUT std_logic_vector(1 DOWNTO 0);   
         wenb_msb_sc             : OUT std_logic_vector(1 DOWNTO 0);   
         waddr_sc                : OUT std_logic_vector(ceil_log2(MEM_DEPTH) - 1 DOWNTO 0)
         ;   
         wdata_sc                : OUT std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
         ren_sc                  : OUT std_logic;   
         raddr_sc                : OUT std_logic_vector(ceil_log2(MEM_DEPTH) - 1 DOWNTO 0)
         ;   
         rdata_sc                : IN std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0) );
   END COMPONENT;

   COMPONENT COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF
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
         PIPE_EN                        :  integer := 0;    
         AXI4_IDWIDTH                   :  integer := 4;    
         MEM_DEPTH                      :  integer := 512;    
         MEM_AWIDTH                     :  integer := 9);    
      PORT (
-- -------------------------------------------------------------------------
-- I/O Signals
-- -------------------------------------------------------------------------
-- Clock and Clock control signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- From MainCtrl interface

         wena_sc                 : IN std_logic_vector(1 DOWNTO 0);   
         wenb_sc                 : IN std_logic_vector(1 DOWNTO 0);   
         wena_msb_sc             : IN std_logic_vector(1 DOWNTO 0);   
         wenb_msb_sc             : IN std_logic_vector(1 DOWNTO 0);   
         waddr_sc                : IN std_logic_vector(ceil_log2(MEM_DEPTH) - 1 DOWNTO 0)
         ;   
         wdata_sc                : IN std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
         ren_sc                  : IN std_logic;   
         raddr_sc                : IN std_logic_vector(ceil_log2(MEM_DEPTH) - 1 DOWNTO 0)
         ;   
         rdata_sc                : OUT std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0));
   END COMPONENT;

   COMPONENT COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF
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

         AWID_S                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         AWADDR_S                : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
         ;   
         AWLEN_S                 : IN std_logic_vector(7 DOWNTO 0);   
         AWSIZE_S                : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_S               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S               : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_S                : IN std_logic_vector(2 DOWNTO 0);   
         AWLOCK_S                : IN std_logic_vector(1 DOWNTO 0);   
         AWVALID_S               : IN std_logic;   
         AWREADY_S               : OUT std_logic;   
         WDATA_S                 : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_S                 : IN std_logic_vector(AXI4_DWIDTH / 8 - 1 
         DOWNTO 0);   
         WLAST_S                 : IN std_logic;   
         WVALID_S                : IN std_logic;   
         WREADY_S                : OUT std_logic;   
         BID_S                   : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         BRESP_S                 : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_S                : OUT std_logic;   
         BREADY_S                : IN std_logic;   
         ARID_S                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         ARADDR_S                : IN std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
         ;   
         ARLEN_S                 : IN std_logic_vector(7 DOWNTO 0);   
         ARSIZE_S                : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_S               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S               : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_S                : IN std_logic_vector(2 DOWNTO 0);   
         ARLOCK_S                : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID_S               : IN std_logic;   
         ARREADY_S               : OUT std_logic;   
         RID_S                   : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         RDATA_S                 : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 
         0);   
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
         bid_mc                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         bresp_mc                : IN std_logic_vector(1 DOWNTO 0);   
         rvalid_mc               : IN std_logic;   
         rid_mc                  : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         rresp_mc                : IN std_logic_vector(1 DOWNTO 0);   
         rlast_mc                : IN std_logic;   
         rdata_mc                : IN std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
         ;   
         -- To Main Control block

         AWID_slvif              : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         AWVALID_slvif           : OUT std_logic;   
         AWSIZE_slvif            : OUT std_logic_vector(2 DOWNTO 0);   
         AWLEN_slvif             : OUT std_logic_vector(7 DOWNTO 0);   
         AWADDR_slvif            : OUT std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 
         0);   
         AWBURST_slvif           : OUT std_logic_vector(1 DOWNTO 0);   
         WDATA_slvif             : OUT std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 
         0);   
         WSTRB_slvif             : OUT std_logic_vector(AXI4_DWIDTH / 8 - 1 
         DOWNTO 0);   
         WLAST_slvif             : OUT std_logic;   
         WVALID_slvif            : OUT std_logic;   
         ARID_slvif              : OUT std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
         0);   
         ARVALID_slvif           : OUT std_logic;   
         ARBURST_slvif           : OUT std_logic_vector(1 DOWNTO 0);   
         ARSIZE_slvif            : OUT std_logic_vector(2 DOWNTO 0);   
         ARADDR_slvif            : OUT std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 
         0);   
         ARLEN_slvif             : OUT std_logic_vector(7 DOWNTO 0);   
         RREADY_slvif            : OUT std_logic;   
         WSTRB                   : OUT std_logic_vector(AXI4_DWIDTH / 8 - 1 
         DOWNTO 0));
   END COMPONENT;

   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL bvalid_mc                :  std_logic;   
   SIGNAL bid_mc                   :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL bresp_mc                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWID_slvif               :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL AWADDR_slvif             :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWSIZE_slvif             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWLEN_slvif              :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL AWVALID_slvif            :  std_logic;   
   SIGNAL AWBURST_slvif            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL WDATA_slvif              :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_slvif              :  std_logic_vector(AXI4_DWIDTH / 8 - 1 
   DOWNTO 0);   
   SIGNAL WSTRB_net                :  std_logic_vector(AXI4_DWIDTH / 8 - 1 
   DOWNTO 0);   
   SIGNAL WLAST_slvif              :  std_logic;   
   SIGNAL WVALID_slvif             :  std_logic;   
   SIGNAL rvalid_mc                :  std_logic;   
   SIGNAL rid_mc                   :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL rresp_mc                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL rdata_mc                 :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL rlast_mc                 :  std_logic;   
   SIGNAL ARID_slvif               :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL ARADDR_slvif             :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL ARSIZE_slvif             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_slvif            :  std_logic;   
   SIGNAL ARLEN_slvif              :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL ARBURST_slvif            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wena_sc                  :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wenb_sc                  :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wena_msb_sc              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wenb_msb_sc              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL waddr_sc                 :  std_logic_vector((ceil_log2(MEM_DEPTH) - 1) DOWNTO 0);   
   SIGNAL wdata_sc                 :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
   SIGNAL ren_sc                   :  std_logic;   
   SIGNAL raddr_sc                 :  std_logic_vector((ceil_log2(MEM_DEPTH) - 1) DOWNTO 0);   
   SIGNAL rdata_sc                 :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
   SIGNAL AWREADY_xhdl1            :  std_logic;   
   SIGNAL WREADY_xhdl2             :  std_logic;   
   SIGNAL BID_xhdl3                :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL BRESP_xhdl4              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_xhdl5             :  std_logic;   
   SIGNAL ARREADY_xhdl6            :  std_logic;   
   SIGNAL RID_xhdl7                :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL RDATA_xhdl8              :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_xhdl9              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_xhdl10             :  std_logic;   
   SIGNAL RVALID_xhdl11            :  std_logic;   
   SIGNAL RREADY_slvif             :  std_logic;   
   SIGNAL arready_mc               :  std_logic;   
   SIGNAL awready_mc               :  std_logic;   
   SIGNAL raddrchset_mc            :  std_logic;   
   SIGNAL waddrchset_mc            :  std_logic;   
   SIGNAL wready_mc                :  std_logic;   

BEGIN
   AWREADY <= AWREADY_xhdl1;
   WREADY <= WREADY_xhdl2;
   BID <= BID_xhdl3;
   BRESP <= BRESP_xhdl4;
   BVALID <= BVALID_xhdl5;
   ARREADY <= ARREADY_xhdl6;
   RID <= RID_xhdl7;
   RDATA <= RDATA_xhdl8;
   RRESP <= RRESP_xhdl9;
   RLAST <= RLAST_xhdl10;
   RVALID <= RVALID_xhdl11;
   
   -- --------------------------------------------------------------------------
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- ||                                                                      ||
   -- ||                     Start - of - Code                                ||
   -- ||                                                                      ||
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- --------------------------------------------------------------------------
   -- --------------------------------------------------------------------------
   -- Top-level outputs
   -- --------------------------------------------------------------------------         
   -- --------------------------------------------------------------------------
   -- Instance:: AXI4 Slave Interface 
   -- --------------------------------------------------------------------------
   --            Contains logic to:
   --                              1. Generate AWREADY/ARREADY/WREADY
   --                              2. Generate BID/BVALID/BRESP
   --                              3. Generate RID/RVALID/RRESP/RLAST
   --                
   -- --------------------------------------------------------------------------         
   -- To Main Control block
   -- From Main Control block
   U_COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF : COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_SLVIF 
      GENERIC MAP (
         PIPE_EN => PIPE_EN,
         SEL_SRAM_TYPE => SEL_SRAM_TYPE,
         AXI4_IDWIDTH => AXI4_IDWIDTH,
         AXI4_IFTYPE_RD => AXI4_IFTYPE_RD,
         AXI4_DWIDTH => AXI4_DWIDTH,
         AXI4_IFTYPE_WR => AXI4_IFTYPE_WR,
         MEM_DEPTH => MEM_DEPTH,
         AXI4_AWIDTH => AXI4_AWIDTH,
         FAMILY => FAMILY)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID_S => AWID,
         AWADDR_S => AWADDR,
         AWLEN_S => AWLEN,
         AWSIZE_S => AWSIZE,
         AWBURST_S => AWBURST,
         AWCACHE_S => AWCACHE,
         AWPROT_S => AWPROT,
         AWLOCK_S => AWLOCK,
         AWVALID_S => AWVALID,
         AWREADY_S => AWREADY_xhdl1,
         WDATA_S => WDATA,
         WSTRB_S => WSTRB,
         WLAST_S => WLAST,
         WVALID_S => WVALID,
         WREADY_S => WREADY_xhdl2,
         BID_S => BID_xhdl3,
         BRESP_S => BRESP_xhdl4,
         BVALID_S => BVALID_xhdl5,
         BREADY_S => BREADY,
         ARID_S => ARID,
         ARADDR_S => ARADDR,
         ARLEN_S => ARLEN,
         ARSIZE_S => ARSIZE,
         ARBURST_S => ARBURST,
         ARCACHE_S => ARCACHE,
         ARPROT_S => ARPROT,
         ARLOCK_S => ARLOCK,
         ARVALID_S => ARVALID,
         ARREADY_S => ARREADY_xhdl6,
         RID_S => RID_xhdl7,
         RDATA_S => RDATA_xhdl8,
         RRESP_S => RRESP_xhdl9,
         RLAST_S => RLAST_xhdl10,
         RVALID_S => RVALID_xhdl11,
         RREADY_S => RREADY,
         AWID_slvif => AWID_slvif,
         AWADDR_slvif => AWADDR_slvif,
         AWSIZE_slvif => AWSIZE_slvif,
         AWLEN_slvif => AWLEN_slvif,
         AWVALID_slvif => AWVALID_slvif,
         AWBURST_slvif => AWBURST_slvif,
         WDATA_slvif => WDATA_slvif,
         WSTRB_slvif => WSTRB_slvif,
         WLAST_slvif => WLAST_slvif,
         WVALID_slvif => WVALID_slvif,
         ARID_slvif => ARID_slvif,
         ARADDR_slvif => ARADDR_slvif,
         ARSIZE_slvif => ARSIZE_slvif,
         ARVALID_slvif => ARVALID_slvif,
         ARLEN_slvif => ARLEN_slvif,
         ARBURST_slvif => ARBURST_slvif,
         RREADY_slvif => RREADY_slvif,
         WSTRB => WSTRB_net,
         waddrchset_mc => waddrchset_mc,
         raddrchset_mc => raddrchset_mc,
         awready_mc => awready_mc,
         wready_mc => wready_mc,
         arready_mc => arready_mc,
         bvalid_mc => bvalid_mc,
         bid_mc => bid_mc,
         bresp_mc => bresp_mc,
         rvalid_mc => rvalid_mc,
         rid_mc => rid_mc,
         rlast_mc => rlast_mc,
         rresp_mc => rresp_mc,
         rdata_mc => rdata_mc);   
   
   
   -- --------------------------------------------------------------------------
   -- Instance:: Main Control block
   -- --------------------------------------------------------------------------
   --            Contains : 
   --                      1. Write/Read State Machine
   --                      2. Generates control signals to the memory
   --
   -- --------------------------------------------------------------------------         
   -- From Slave Interface block
   -- To Slave Interface block
   -- To SRAM Memory Interface
   U_COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MAINCTRL : COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MAINCTRL 
      GENERIC MAP (
         PIPE_EN => PIPE_EN,
         MEM_AWIDTH => ceil_log2(MEM_DEPTH), 
         SEL_SRAM_TYPE => SEL_SRAM_TYPE,
         AXI4_IDWIDTH => AXI4_IDWIDTH,
         AXI4_IFTYPE_RD => AXI4_IFTYPE_RD,
         AXI4_DWIDTH => AXI4_DWIDTH,
         WRAP_SUPPORT => WRAP_SUPPORT,
         AXI4_IFTYPE_WR => AXI4_IFTYPE_WR,
         MEM_DEPTH => MEM_DEPTH,
         AXI4_AWIDTH => AXI4_AWIDTH,
         FAMILY => FAMILY)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID_slvif => AWID_slvif,
         AWADDR_slvif => AWADDR_slvif,
         AWSIZE_slvif => AWSIZE_slvif,
         AWLEN_slvif => AWLEN_slvif,
         AWVALID_slvif => AWVALID_slvif,
         AWBURST_slvif => AWBURST_slvif,
         WDATA_slvif => WDATA_slvif,
         WSTRB_slvif => WSTRB_slvif,
         WLAST_slvif => WLAST_slvif,
         WVALID_slvif => WVALID_slvif,
         BREADY_slvif => BREADY,
         AWADDR => AWADDR,
         AWSIZE => AWSIZE,
         AWLEN => AWLEN,
         AWVALID => AWVALID,
         AWBURST => AWBURST,
         ARID_slvif => ARID_slvif,
         ARADDR_slvif => ARADDR_slvif,
         ARBURST_slvif => ARBURST_slvif,
         ARSIZE_slvif => ARSIZE_slvif,
         ARVALID_slvif => ARVALID_slvif,
         ARLEN_slvif => ARLEN_slvif,
         RREADY_slvif => RREADY_slvif,
         ARADDR => ARADDR,
         ARVALID => ARVALID,
         ARSIZE => ARSIZE,
         ARLEN => ARLEN,
         ARBURST => ARBURST,
         WSTRB => WSTRB_net,
         waddrchset_mc => waddrchset_mc,
         raddrchset_mc => raddrchset_mc,
         awready_mc => awready_mc,
         wready_mc => wready_mc,
         arready_mc => arready_mc,
         bvalid_mc => bvalid_mc,
         bid_mc => bid_mc,
         bresp_mc => bresp_mc,
         rvalid_mc => rvalid_mc,
         rid_mc => rid_mc,
         rlast_mc => rlast_mc,
         rresp_mc => rresp_mc,
         rdata_mc => rdata_mc,
         wena_sc => wena_sc,
         wenb_sc => wenb_sc,
         wena_msb_sc => wena_msb_sc,
         wenb_msb_sc => wenb_msb_sc,
         waddr_sc => waddr_sc,
         wdata_sc => wdata_sc,
         ren_sc => ren_sc,
         raddr_sc => raddr_sc,
         rdata_sc => rdata_sc);   
   
   
   -- --------------------------------------------------------------------------
   -- Instance:: SRAM Memory Interface block
   -- --------------------------------------------------------------------------
   --            Contains : 
   --                      1. Interface with Fabric SRAM
   --
   -- --------------------------------------------------------------------------         
   -- From Main Ctrl block
   U_COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF : COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF 
      GENERIC MAP (
         PIPE_EN => PIPE_EN,
         MEM_AWIDTH => ceil_log2(MEM_DEPTH), 
         SEL_SRAM_TYPE => SEL_SRAM_TYPE,
         AXI4_IDWIDTH => AXI4_IDWIDTH,
         AXI4_IFTYPE_RD => AXI4_IFTYPE_RD,
         AXI4_DWIDTH => AXI4_DWIDTH,
         AXI4_IFTYPE_WR => AXI4_IFTYPE_WR,
         AXI4_AWIDTH => AXI4_AWIDTH,
         MEM_DEPTH => MEM_DEPTH,
         FAMILY => FAMILY)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         wena_sc => wena_sc,
         wenb_sc => wenb_sc,
         wena_msb_sc => wena_msb_sc,
         wenb_msb_sc => wenb_msb_sc,
         waddr_sc => waddr_sc,
         wdata_sc => wdata_sc,
         ren_sc => ren_sc,
         raddr_sc => raddr_sc,
         rdata_sc => rdata_sc);   
   

END ARCHITECTURE trans;

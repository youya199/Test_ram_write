-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
--  Copyright 2011 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:  CoreAXI4SRAM_MAINCTRL
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


ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF IS
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
      -- --------------------------------------------------------------------------
-- Local Parameter Declaration
-- --------------------------------------------------------------------------
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
      waddr_sc                : IN std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
      wdata_sc                : IN std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
      ren_sc                  : IN std_logic;   
      raddr_sc                : IN std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
      rdata_sc                : OUT std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0));   
END ENTITY COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF;

ARCHITECTURE trans OF COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_CoreAXI4SRAM_MEMIF IS

   COMPONENT COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_ram_wrapper
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
         AXI4_IDWIDTH                   :  integer := 4;    
         PIPE_EN                        :  integer := 0);    
      PORT (
            ACLK        : IN std_logic; 
            ARESETN     : IN std_logic; 
            wena_sc     : IN std_logic_vector(1 downto 0); 
            wenb_sc     : IN std_logic_vector(1 downto 0); 
            wena_msb_sc : IN std_logic_vector(1 downto 0); 
            wenb_msb_sc : IN std_logic_vector(1 downto 0); 
            waddr_sc    : IN std_logic_vector(MEM_AWIDTH -1 downto 0); 
            wdata_sc    : IN std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0); 
            ren_sc      : IN std_logic; 
            raddr_sc    : IN std_logic_vector(MEM_AWIDTH -1 downto 0); 
            rdata_sc    : OUT std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0)  
           ); 
   END COMPONENT; 
   -- --------------------------------------------------------------------------
   -- Local parameters 
   -- --------------------------------------------------------------------------
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL rdata_sc_xhdl1           :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   

BEGIN
   rdata_sc <= rdata_sc_xhdl1;
   
   -- --------------------------------------------------------------------------
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- ||                                                                      ||
   -- ||                     Start - of - Code                                ||
   -- ||                                                                      ||
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- --------------------------------------------------------------------------
   -- Instance:: RAM Memory wrapper
   U_COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_ram_wrapper : COREAXI4SRAM_C1_COREAXI4SRAM_C1_0_ram_wrapper 
      GENERIC MAP (
         FAMILY         => FAMILY,
	 AXI4_DWIDTH    => AXI4_DWIDTH,
	 AXI4_AWIDTH    => MEM_AWIDTH,
         AXI4_IFTYPE_WR => AXI4_IFTYPE_WR,
	 AXI4_IFTYPE_RD => AXI4_IFTYPE_RD,
	 SEL_SRAM_TYPE  => SEL_SRAM_TYPE,
         AXI4_IDWIDTH   => AXI4_IDWIDTH,
	 PIPE_EN        => PIPE_EN)
      PORT MAP (
         ACLK        => ACLK,
         ARESETN     => ARESETN,
         wena_sc     => wena_sc,
         wenb_sc     => wenb_sc,
         wena_msb_sc => wena_msb_sc,
         wenb_msb_sc => wenb_msb_sc,
         waddr_sc    => waddr_sc,
         wdata_sc    => wdata_sc,
         ren_sc      => ren_sc,
         raddr_sc    => raddr_sc,
         rdata_sc    => rdata_sc_xhdl1);   
   

END ARCHITECTURE trans;

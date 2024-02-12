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
use     work.xhdl_std_logic.all;



ENTITY COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_CoreAXI4SRAM_MAINCTRL IS
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
      WRAP_SUPPORT                   :  integer := 1);    --  Enables to handle the AXI wapping burst type.
   PORT (
      -- -------------------------------------------------------------------------
-- I/O Signals
-- -------------------------------------------------------------------------
-- Clock and Clock control signals

      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;   
      -- From AXI4 Slave interface

      AWID_slvif              : IN std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 0); 
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
      waddr_sc                : OUT std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);  
      wdata_sc                : OUT std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
      ren_sc                  : OUT std_logic;   
      raddr_sc                : OUT std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);  
      rdata_sc                : IN std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) * 2) -1 DOWNTO 0) 
  );   
END ENTITY COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_CoreAXI4SRAM_MAINCTRL;

ARCHITECTURE trans OF COREAXI4SRAM_C2_COREAXI4SRAM_C2_0_CoreAXI4SRAM_MAINCTRL IS


   -- Must be enabled in order for the wrapping burst
   -- transactions to work.
   -- --------------------------------------------------------------------------
   -- Local Parameter Declaration
   -- --------------------------------------------------------------------------
   CONSTANT  BRESP_OK              :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  BRESP_ERR             :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  RRESP_OK              :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  RRESP_ERR             :  std_logic_vector(1 DOWNTO 0) := "01";    
   -- --------------------------------------------------------------------------
   -- Local parameters 
   -- --------------------------------------------------------------------------
   -- Write state machine
   CONSTANT  WR_IDLE_ST            :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  WR_ADRLAT_ST          :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  WR_DATA_ST            :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  WR_WAIT_ST        :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  WR_RESP_ST            :  std_logic_vector(2 DOWNTO 0) := "100";    
   -- Read state machine
   CONSTANT  RD_IDLE_ST            :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  RD_ADRLAT_ST          :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  RD_DATA0_ST           :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  RD_DATA_ST            :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  RD_DATAWAIT_ST        :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  RD_LAST_ST            :  std_logic_vector(2 DOWNTO 0) := "101";    
   -- SRAM state machine
   CONSTANT  SRAM_IDLE_ST          :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  SRAM_ADDR_ST          :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  SRAM_WR_ST            :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  SRAM_WRWAIT_ST        :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  SRAM_RD_ST            :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  SRAM_RDWAIT_ST        :  std_logic_vector(2 DOWNTO 0) := "101";    
   -- SRAM state machine
   CONSTANT  REQ_IDLE_ST           :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  REQ_WR_ST             :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  REQ_RD_ST             :  std_logic_vector(1 DOWNTO 0) := "10";    
   
   CONSTANT  HIGH_PERF             :  integer := 1;    
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL wr_curr_state            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL wr_next_state            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL rd_curr_state            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL rd_next_state            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL sram_curr_state          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL sram_next_state          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL req_curr_state           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL req_next_state           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL awready_fsm              :  std_logic;   
   SIGNAL wready_fsm               :  std_logic;   
   SIGNAL arready_fsm              :  std_logic;   
   SIGNAL wready_mc_r              :  std_logic;   
   SIGNAL WVALID_slvif_r           :  std_logic;   
   SIGNAL waddrchset               :  std_logic;   
   SIGNAL waddrchset_mc_r          :  std_logic;   
   SIGNAL raddrchset               :  std_logic;   
   SIGNAL sram_xvalid              :  std_logic;   
   SIGNAL rd_sram_xvalid           :  std_logic;   
   SIGNAL rd_sram_xdone            :  std_logic;   
   SIGNAL sram_xdone               :  std_logic;   
   SIGNAL sram_xdone_r             :  std_logic;   
   SIGNAL wready                   :  std_logic;   
   SIGNAL wrburst_cnt              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rdburst_cnt              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wdata_sc_r               :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
   SIGNAL wen_sc                   :  std_logic;   
   SIGNAL waddr_aligned            :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_waddr_incr          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_waddr_incr_r        :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_waddr_next_r        :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_waddr_next          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_waddr_plus          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_waddr               :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_sc_dummy           :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   


   SIGNAL wrap_waddr_calc          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr_incr          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_raddr_incr_r        :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrap_raddr_next          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr_next_r        :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr_plus          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr               :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr_r             :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_waddr_r             :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   

   SIGNAL wrap_raddr_calc          :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_raddr_calc_r        :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   

   SIGNAL number_bytes             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL number_bytes_r           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL raddr_aligned            :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_xhdl21_sig2     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_xhdl21_sig3     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL raddr_sc_xhdl21_sig22    :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_xhdl21_sig33    :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig3     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig2     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl118_sig3     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl118_sig2     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig33     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig22    :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig333     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig222    :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig3333     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_raddr_calc_xhdl18_sig2222    :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);






   SIGNAL rd_number_bytes          :  std_logic_vector(3 DOWNTO 0);  
   SIGNAL rd_number_bytes_r        :  std_logic_vector(3 DOWNTO 0);  
   SIGNAL ren_sc_r                 :  std_logic;   
   SIGNAL ren_active               :  std_logic;   
   SIGNAL rdata_sc_lat             :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 DOWNTO 0);   
   SIGNAL rdbeat_cnt               :  std_logic_vector(8 DOWNTO 0);   
   SIGNAL wrbeat_cnt               :  std_logic_vector(8 DOWNTO 0);   
   SIGNAL rid_mc_r                 :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL rdata_mc_r               :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL rd_sram_xvalid_r         :  std_logic;   
   SIGNAL rresp_mc_r               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL aligned_done             :  std_logic;   
   SIGNAL rd_aligned_done          :  std_logic;   
   SIGNAL read_sampled             :  std_logic;   
   SIGNAL bresp_error              :  std_logic;   
   SIGNAL rresp_error              :  std_logic;   
   SIGNAL rdburst_len              :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL wrburst_len              :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL ren_sc_d1                :  std_logic;   
   SIGNAL WDATA_slvif_r            :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0);
   SIGNAL AWLEN_slvif_r            :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL ARLEN_slvif_r            :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL rdbeat_cnt_load          :  std_logic;   
   SIGNAL wrbeat_cnt_load          :  std_logic;   
   SIGNAL set_rdaligned_done       :  std_logic;   
   SIGNAL raddr_aligned_load       :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL raddr_aligned_load_r     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL waddr_aligned_load       :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_aligned_load_r     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL set_aligned_done         :  std_logic;   
   SIGNAL set_aligned_done_r       :  std_logic;   
   SIGNAL wr_wrap_boundary         :  std_logic;   
   SIGNAL wr_wrap_boundary_r       :  std_logic;   
   SIGNAL wr_wrap_boundary_int     :  std_logic;   
   SIGNAL temp_xhdl29              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl30              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl30_1            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl31              :  std_logic;   
   SIGNAL temp_xhdl31_1            :  std_logic;   
   SIGNAL temp_xhdl31_2            :  std_logic;   
   SIGNAL temp_xhdl37              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl40              :  std_logic;   
   SIGNAL temp_xhdl41              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl411             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl42              :  std_logic;   
   SIGNAL temp_xhdl422             :  std_logic;   
   SIGNAL temp_xhdl43              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl44              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl45              :  std_logic;   
   SIGNAL temp_xhdl46              :  std_logic;   
   SIGNAL temp_xhdl47              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl48              :  std_logic;   
   SIGNAL temp_xhdl49              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl58              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl59              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl60              :  std_logic;   
   SIGNAL temp_xhdl68              :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL temp_xhdl75              :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL awready_mc_xhdl1         :  std_logic;   
   SIGNAL wready_mc_xhdl2          :  std_logic;   
   SIGNAL arready_mc_xhdl3         :  std_logic;   
   SIGNAL waddrchset_mc_xhdl4      :  std_logic;   
   SIGNAL raddrchset_mc_xhdl5      :  std_logic;   
   SIGNAL bvalid_mc_xhdl6          :  std_logic;   
   SIGNAL bid_mc_xhdl7             :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL bresp_mc_xhdl8           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL rvalid_mc_xhdl9          :  std_logic;   
   SIGNAL rresp_mc_xhdl10          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL rid_mc_xhdl11            :  std_logic_vector(AXI4_IDWIDTH - 1 DOWNTO 
   0);   
   SIGNAL rlast_mc_xhdl12          :  std_logic;   
   SIGNAL rdata_mc_xhdl13          :  std_logic_vector(AXI4_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wena_sc_xhdl14           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wenb_sc_xhdl15           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wena_msb_sc_xhdl16       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL wenb_msb_sc_xhdl17       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL waddr_sc_xhdl18          :  std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_sc_xhdl18_sig3     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_sc_xhdl18_sig2     :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_sc_xhdl18_sig3_1   :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL waddr_sc_xhdl18_sig2_1   :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   
   SIGNAL wrap_waddr_next_xhdl18_sig3  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_next_xhdl18_sig2  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_next_xhdl118_sig3 :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_next_xhdl118_sig2 :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_calc_xhdl18_sig3  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_calc_xhdl18_sig2  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_calc_xhdl118_sig3  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wrap_waddr_calc_xhdl118_sig2  :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
   SIGNAL wdata_sc_xhdl19          :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
   SIGNAL wdata_sc_xhdl19_r        :  std_logic_vector(AXI4_DWIDTH+((AXI4_DWIDTH/8) *2) -1 downto 0);   
   SIGNAL ren_sc_xhdl20            :  std_logic;   
   SIGNAL ren_sc_xhdl20_d1         :  std_logic;   
   SIGNAL raddr_sc_xhdl21          :  std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_xhdl21_r        :  std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_r               :  std_logic_vector(MEM_AWIDTH - 1 DOWNTO 0);   
   SIGNAL raddr_sc_dummy           :  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);   

   SIGNAL wr_req_inprog            :  std_logic;   
   SIGNAL rd_req_inprog            :  std_logic;   
   SIGNAL wr_req_inprog_r          :  std_logic;   
   SIGNAL rd_req_inprog_r          :  std_logic;   
   SIGNAL wr_req_gnt               :  std_logic;   
   SIGNAL rd_req_gnt               :  std_logic;   
   SIGNAL set_wrap                 :  std_logic;   

   -- --------------------------------------------------------------------------
   -- Function Declarations
   -- --------------------------------------------------------------------------
   FUNCTION ShiftRight (
      val      : std_logic_vector;
      shft     : integer) RETURN std_logic_vector IS
      
      VARIABLE int      : std_logic_vector(val'LENGTH+shft-1 DOWNTO 0);
      VARIABLE rtn      : std_logic_vector(val'RANGE);
      VARIABLE fill     : std_logic_vector(shft-1 DOWNTO 0) := (others => '0');
   BEGIN
      int := fill & val;
      rtn := int(val'LENGTH+shft-1 DOWNTO shft);
      RETURN(rtn);
   END ShiftRight;  

   FUNCTION "SRL" (
      l        : std_logic_vector;
      r        : integer) RETURN std_logic_vector IS
   BEGIN
      RETURN(ShiftRight(l, r));
   END "SRL";

    FUNCTION ShiftLeft (
      val      : std_logic_vector;
      shft     : integer) RETURN std_logic_vector IS
      
      VARIABLE int      : std_logic_vector(val'LENGTH+shft-1 DOWNTO 0);
      VARIABLE rtn      : std_logic_vector(val'RANGE);
      VARIABLE fill     : std_logic_vector(shft-1 DOWNTO 0) := (others => '0');
   BEGIN
      int := val & fill;
      rtn := int(val'LENGTH-1 DOWNTO 0);
      RETURN(rtn);
   END ShiftLeft;

   FUNCTION "SLL" (
      l        : std_logic_vector;
      r        : integer) RETURN std_logic_vector IS
   BEGIN
      RETURN(ShiftLeft(l, r));
   END "SLL";
   
   FUNCTION to_stdlogicvector (
      val      : IN integer;
      len      : IN integer) RETURN std_logic_vector IS
      
      VARIABLE rtn      : std_logic_vector(len-1 DOWNTO 0) := (OTHERS => '0');
      VARIABLE num  : integer := val;
      VARIABLE r       : integer;
   BEGIN
      FOR index IN 0 TO len-1 LOOP
         r := num rem 2;
         num := num/2;
         IF (r = 1) THEN
            rtn(index) := '1';
         ELSE
            rtn(index) := '0';
         END IF;
      END LOOP;
      RETURN(rtn);
   END to_stdlogicvector;

    FUNCTION conv_std_logic_vector (
      val      : IN integer;
      len      : IN integer) RETURN std_logic_vector IS
   BEGIN
	   RETURN(to_stdlogicvector(val, len));
	END conv_std_logic_vector;        
   
   FUNCTION to_stdlogic (
      val      : IN boolean) RETURN std_logic IS
   BEGIN
      IF (val) THEN
         RETURN('1');
      ELSE
         RETURN('0');
      END IF;
   END to_stdlogic;
   
   FUNCTION conv_std_logic (
      val      : IN boolean) RETURN std_logic IS
   BEGIN
      RETURN(to_stdlogic(val));
   END conv_std_logic;   

  FUNCTION to_integer (
      val      : std_logic_vector) RETURN integer IS

      CONSTANT vec      : std_logic_vector(val'high-val'low DOWNTO 0) := val;      
      VARIABLE rtn      : integer := 0;
   BEGIN
      FOR index IN vec'RANGE LOOP
         IF (vec(index) = '1') THEN
            rtn := rtn + (2**index);
         END IF;
      END LOOP;
      RETURN(rtn);
   END to_integer;

BEGIN
   awready_mc <= awready_mc_xhdl1;
   wready_mc <= wready_mc_xhdl2;
   arready_mc <= arready_mc_xhdl3;
   waddrchset_mc <= waddrchset_mc_xhdl4;
   raddrchset_mc <= raddrchset_mc_xhdl5;
   bvalid_mc <= bvalid_mc_xhdl6;
   bid_mc <= bid_mc_xhdl7;
   bresp_mc <= bresp_mc_xhdl8;
   rvalid_mc <= rvalid_mc_xhdl9;
   rresp_mc <= rresp_mc_xhdl10;
   rid_mc <= rid_mc_xhdl11;
   rlast_mc <= rlast_mc_xhdl12;
   rdata_mc <= rdata_mc_xhdl13;
   wena_sc <= wena_sc_xhdl14;
   wenb_sc <= wenb_sc_xhdl15;
   wena_msb_sc <= wena_msb_sc_xhdl16;
   wenb_msb_sc <= wenb_msb_sc_xhdl17;
   waddr_sc <= waddr_sc_xhdl18;
   wdata_sc <= wdata_sc_xhdl19;
   ren_sc <= ren_sc_xhdl20;
   raddr_sc <= raddr_sc_xhdl21;

   -- --------------------------------------------------------------------------
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- ||                                                                      ||
   -- ||                     Start - of - Code                                ||
   -- ||                                                                      ||
   -- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   -- --------------------------------------------------------------------------
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         wr_req_inprog_r <= '0';    
         rd_req_inprog_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         wr_req_inprog_r <= wr_req_inprog;    
         rd_req_inprog_r <= rd_req_inprog;    
      END IF;
   END PROCESS;

   -- ------------------------------------------------------------------------ //
   -- //////////////////////////////////////////////////////////////////////// //
   --                        Request State Machine                             //
   -- //////////////////////////////////////////////////////////////////////// //
   -- ------------------------------------------------------------------------ //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         req_curr_state <= REQ_IDLE_ST;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         req_curr_state <= req_next_state;    
      END IF;
   END PROCESS;

   -- ----------------------------- //
   -- Next state and output decoder //
   -- ----------------------------- //
   
   PROCESS (AWVALID_slvif,ARVALID_slvif, wr_curr_state,
   wr_next_state, rd_curr_state, rd_next_state,req_curr_state,wr_req_inprog_r,rd_req_inprog_r)
      VARIABLE req_next_state_xhdl26  : std_logic_vector(1 DOWNTO 0);
   BEGIN
      req_next_state_xhdl26 := req_curr_state;
      wr_req_inprog <= wr_req_inprog_r;    
      rd_req_inprog <= rd_req_inprog_r;    
      wr_req_gnt    <= '0';
      rd_req_gnt    <= '0';
      CASE req_curr_state IS
         -- ---------------------------------------------------- //
         -- Move to address latch state when AWVALID is received //
         -- ---------------------------------------------------- //
         
         WHEN REQ_IDLE_ST =>
                  IF (AWVALID_slvif = '1') THEN
                     req_next_state_xhdl26 := REQ_WR_ST;    
                  END IF;
                  IF (ARVALID_slvif = '1') THEN
                     req_next_state_xhdl26 := REQ_RD_ST;    
                  END IF;

                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  
                  IF (AWVALID_slvif = '1') THEN
                     wr_req_inprog <= '1';    
		  ELSE
                     wr_req_inprog <= '0';    
                  END IF;
                  IF (ARVALID_slvif = '1') THEN
                     rd_req_inprog <= '1';    
		  ELSE
                     rd_req_inprog <= '0';    
                  END IF;


         WHEN REQ_WR_ST =>
                  IF (wr_curr_state = WR_RESP_ST AND wr_next_state = WR_IDLE_ST) THEN
                     IF (rd_req_inprog = '1') THEN
                        req_next_state_xhdl26 := REQ_RD_ST;    
		     ELSE
                        req_next_state_xhdl26 := REQ_IDLE_ST;    
                     END IF;
                  END IF;
                  -- ------- //
		  -- Outputs
                  -- ------- //
		  wr_req_gnt     <= '1';

         WHEN REQ_RD_ST =>
                  IF (rd_curr_state = RD_LAST_ST AND rd_next_state = RD_IDLE_ST) THEN
                     req_next_state_xhdl26 := REQ_IDLE_ST;    
                  END IF;

                  -- ------- //
		  -- Outputs
                  -- ------- //
		  rd_req_gnt     <= '1';

         WHEN OTHERS  =>
                  req_next_state_xhdl26 := REQ_IDLE_ST;    
         
      END CASE;
      req_next_state <= req_next_state_xhdl26;
   END PROCESS;


   -- ------------------------------------------------------------------------ //
   -- //////////////////////////////////////////////////////////////////////// //
   --                        Write State Machine                            // //
   -- //////////////////////////////////////////////////////////////////////// //
   -- ------------------------------------------------------------------------ //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         wr_curr_state <= WR_IDLE_ST;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (AXI4_IFTYPE_WR = 0) THEN
            wr_curr_state <= WR_IDLE_ST;    
         ELSE
            wr_curr_state <= wr_next_state;    
         END IF;
      END IF;
   END PROCESS;
   temp_xhdl29 <= WR_ADRLAT_ST WHEN (wr_req_gnt = '1' AND AWVALID_slvif = '1') ELSE WR_IDLE_ST;
   temp_xhdl30_1 <= WR_DATA_ST WHEN (WVALID_slvif = '1') ELSE WR_DATA_ST;
   temp_xhdl30 <= WR_WAIT_ST WHEN (WVALID_slvif = '1' AND WLAST_slvif = '1') ELSE temp_xhdl30_1;
   temp_xhdl31_1 <= '1' WHEN (WVALID_slvif = '1') ELSE '0';
   temp_xhdl31 <= '1' WHEN (WVALID_slvif = '1' AND WLAST_slvif = '1') ELSE temp_xhdl31_1;
   temp_xhdl31_2 <= '0' WHEN (wrbeat_cnt = "00000000") ELSE '1';

   -- ----------------------------- //
   -- Next state and output decoder //
   -- ----------------------------- //
   
   PROCESS (AWVALID_slvif,temp_xhdl29, temp_xhdl30, temp_xhdl31,wr_req_gnt,temp_xhdl31_2,AWID_slvif,
   wr_curr_state, bvalid_mc_xhdl6, BREADY_slvif)
      VARIABLE awready_fsm_xhdl22  : std_logic;
      VARIABLE wready_fsm_xhdl23  : std_logic;
      VARIABLE waddrchset_xhdl24  : std_logic;
      VARIABLE sram_xvalid_xhdl25  : std_logic;
      VARIABLE wr_next_state_xhdl26  : std_logic_vector(2 DOWNTO 0);
      VARIABLE wrbeat_cnt_load_xhdl27  : std_logic;
      VARIABLE set_aligned_done_xhdl28  : std_logic;
   BEGIN
      awready_fsm_xhdl22 := '0';    
      wready_fsm_xhdl23 := '0';    
      waddrchset_xhdl24 := '0';    
      sram_xvalid_xhdl25 := '0';    
      wr_next_state_xhdl26 := wr_curr_state;    
      wrbeat_cnt_load_xhdl27 := '0';   
      set_aligned_done_xhdl28 := '0';    
      bvalid_mc_xhdl6   <= '0';
      bid_mc_xhdl7      <= (OTHERS => '0');
      bresp_mc_xhdl8    <= (OTHERS => '0');
      CASE wr_curr_state IS
         -- ---------------------------------------------------- //
         -- Move to address latch state when AWVALID is received //
         -- ---------------------------------------------------- //
         
         WHEN WR_IDLE_ST =>
                  wr_next_state_xhdl26 := temp_xhdl29;    
                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  
                  IF (wr_req_gnt = '1' AND AWVALID_slvif = '1') THEN
                     waddrchset_xhdl24 := '1';    
                     awready_fsm_xhdl22 := '0';    
                  END IF;
         WHEN WR_ADRLAT_ST =>
                  wr_next_state_xhdl26 := WR_DATA_ST;    
                  set_aligned_done_xhdl28 := '1';    
                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  
                  awready_fsm_xhdl22 := '1';    
                  waddrchset_xhdl24 := '0';    
                  sram_xvalid_xhdl25 := '1';    
                  wrbeat_cnt_load_xhdl27 := '1';    
         
         WHEN WR_DATA_ST =>
                  -- ------------------------------------------------------- //
                  -- Move to response state when the last write data is sent //
                  -- ------------------------------------------------------- //
                  wr_next_state_xhdl26 := temp_xhdl30;    
                  wready_fsm_xhdl23 := temp_xhdl31;    
                  sram_xvalid_xhdl25 := temp_xhdl31_2;    
         WHEN WR_WAIT_ST =>
                  -- ------------------------------------------------------------------ //
                  -- Move to Response state
                  -- ------------------------------------------------------------------ //
                  wr_next_state_xhdl26 := WR_RESP_ST;    


         WHEN WR_RESP_ST =>
                  -- ------------------------------------------------------------------ //
                  -- Check for the valid Master BREADY                                  //
                  -- ------------------------------------------------------------------ //
                  IF (BREADY_slvif = '1') THEN
                        wr_next_state_xhdl26 := WR_IDLE_ST;    
                     -- ------- //
                     -- Outputs //
                     -- ------- //
                     -- --------------------------------------------------------------- //
                     -- Generate Write Response related outputs                         //
                     -- --------------------------------------------------------------- //
	             bvalid_mc_xhdl6   <= '1';
	             bid_mc_xhdl7      <= AWID_slvif;
	             bresp_mc_xhdl8    <= BRESP_OK;
                  END IF;

         
         WHEN OTHERS  =>
                  wr_next_state_xhdl26 := WR_IDLE_ST;    
         
      END CASE;
      -- case (wr_curr_state)
      
      
      awready_fsm <= awready_fsm_xhdl22;
      wready_fsm <= wready_fsm_xhdl23;
      waddrchset <= waddrchset_xhdl24;
      sram_xvalid <= sram_xvalid_xhdl25;
      wr_next_state <= wr_next_state_xhdl26;
      wrbeat_cnt_load <= wrbeat_cnt_load_xhdl27;
      set_aligned_done <= set_aligned_done_xhdl28;
   END PROCESS;

   -- ------------------------------------------------------------------------ //
   -- //////////////////////////////////////////////////////////////////////// //
   --                        SRAM State Machine                             // //
   -- //////////////////////////////////////////////////////////////////////// //
   -- ------------------------------------------------------------------------ //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         sram_curr_state <= SRAM_IDLE_ST;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         sram_curr_state <= sram_next_state;    
      END IF;
   END PROCESS;
   temp_xhdl37 <= SRAM_ADDR_ST WHEN (sram_xvalid = '1' OR rd_sram_xvalid = '1') ELSE SRAM_IDLE_ST;
   temp_xhdl40 <= '1' WHEN (sram_xvalid AND WVALID_slvif) = '1' ELSE '0';
   temp_xhdl41 <= SRAM_WR_ST WHEN (wrbeat_cnt /= "00000000") ELSE SRAM_IDLE_ST;
   temp_xhdl411 <= SRAM_WRWAIT_ST WHEN (sram_xvalid AND WVALID_slvif) = '1' ELSE temp_xhdl41;
   temp_xhdl42 <= '0' WHEN (wrburst_cnt /= "00000000") ELSE '1';
   temp_xhdl422 <= '0' WHEN (WVALID_slvif /= '1') ELSE temp_xhdl42;
   temp_xhdl43 <= SRAM_WRWAIT_ST WHEN (wrbeat_cnt /= "000000000") ELSE 
   SRAM_IDLE_ST;
   temp_xhdl44 <= SRAM_WR_ST WHEN (sram_xvalid AND WVALID_slvif) = '1' ELSE (temp_xhdl43);
   temp_xhdl45 <= wready_mc_xhdl2 WHEN (wrbeat_cnt /= "000000000") ELSE '0';
   temp_xhdl46 <= '1' WHEN (sram_xvalid AND WVALID_slvif) = '1' ELSE (temp_xhdl45);
   temp_xhdl47 <= SRAM_RDWAIT_ST WHEN (rvalid_mc_xhdl9 AND RREADY_slvif) = '1' ELSE SRAM_RD_ST;
   temp_xhdl48 <= '1' WHEN (rvalid_mc_xhdl9 AND RREADY_slvif) = '1' ELSE '0';
   temp_xhdl49 <= SRAM_RD_ST WHEN (rdbeat_cnt /= "000000000") ELSE SRAM_IDLE_ST;

   -- ----------------------------- //
   -- Next state and output decoder //
   -- ----------------------------- //
   
   PROCESS (WVALID_slvif, sram_next_state,temp_xhdl37, temp_xhdl411,rd_req_gnt,temp_xhdl40,
   sram_curr_state, temp_xhdl44, temp_xhdl422, temp_xhdl46,wr_req_gnt,
   temp_xhdl47, temp_xhdl48, temp_xhdl49,
   rd_sram_xvalid)
      VARIABLE sram_xdone_xhdl32  : std_logic;
      VARIABLE rd_sram_xdone_xhdl33  : std_logic;
      VARIABLE wready_xhdl34  : std_logic;
      VARIABLE sram_next_state_xhdl36  : std_logic_vector(2 DOWNTO 0);
   BEGIN
      sram_xdone_xhdl32 := '0';    
      rd_sram_xdone_xhdl33 := '0';    
      wready_xhdl34 := '0';    
      sram_next_state_xhdl36 := sram_curr_state;    
      CASE sram_curr_state IS
         -- --------------------------------------------------- //
         -- Move to sram address state when sram transaction is //
         -- valid from write state machine                      //
         -- --------------------------------------------------- //
         
         WHEN SRAM_IDLE_ST =>
                  sram_next_state_xhdl36 := temp_xhdl37;    
                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  
                  sram_xdone_xhdl32 := '0';    
                  rd_sram_xdone_xhdl33 := '0';    
         -- ------- //
         -- Outputs //
         -- ------- //
         
         WHEN SRAM_ADDR_ST =>
                  IF (rd_req_gnt = '1' AND rd_sram_xvalid = '1') THEN
                     sram_next_state_xhdl36 := SRAM_RD_ST;    
                  ELSIF (wr_req_gnt = '1' AND WVALID_slvif = '1') THEN
                     sram_next_state_xhdl36 := SRAM_WR_ST;    
                     wready_xhdl34 := temp_xhdl40;    
	          ELSE
                     sram_next_state_xhdl36 := SRAM_ADDR_ST;    
		  END IF;
         WHEN SRAM_WR_ST =>
                  sram_next_state_xhdl36 := temp_xhdl411;    
                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  sram_xdone_xhdl32 := temp_xhdl422;    
                  wready_xhdl34 := temp_xhdl46;    
         WHEN SRAM_WRWAIT_ST =>
                  sram_next_state_xhdl36 := temp_xhdl44;    
                  -- ------- //
                  -- Outputs //
                  -- ------- //
                  wready_xhdl34 := temp_xhdl46;    
                  sram_xdone_xhdl32 := temp_xhdl422;    
         WHEN SRAM_RD_ST =>
                  sram_next_state_xhdl36 := temp_xhdl47;    
                  rd_sram_xdone_xhdl33 := temp_xhdl48;    
         WHEN SRAM_RDWAIT_ST =>
                  sram_next_state_xhdl36 := temp_xhdl49;    
         WHEN OTHERS  =>
                  sram_next_state_xhdl36 := SRAM_IDLE_ST;    
         
      END CASE;
      -- case (sram_curr_state)
      
      
      sram_xdone <= sram_xdone_xhdl32;
      rd_sram_xdone <= rd_sram_xdone_xhdl33;
      wready <= wready_xhdl34;
      sram_next_state <= sram_next_state_xhdl36;
   END PROCESS;

   PROCESS (ACLK, ARESETN)
      VARIABLE wrburst_cnt_xhdl50  : std_logic_vector(3 DOWNTO 0);
   BEGIN
      IF (ARESETN = '0') THEN
         wrburst_cnt_xhdl50 := "0000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (wr_curr_state = WR_IDLE_ST) THEN
            wrburst_cnt_xhdl50 := "0000";    
         ELSE
            IF (sram_curr_state = SRAM_ADDR_ST OR (sram_curr_state = 
            SRAM_WRWAIT_ST AND sram_next_state = SRAM_WR_ST)) THEN
               -- --------------------------------------------------------------- //
               -- Each 64-bit data transaction on AXI IF is converted into 2, x32 //
               -- transactions on SRAM IF. Hence this count is 1.                 //
               -- --------------------------------------------------------------- //
               
               CASE AWSIZE_slvif IS
                  WHEN "011" =>
                           wrburst_cnt_xhdl50 := "0000";    
                  WHEN "010" |
                       "001" |
                       "000" =>
                           wrburst_cnt_xhdl50 := "0000";    
                  -- --------------------------------------------------------------- //
                  -- Move to sram read wait state when the read data is sampled      //
                  -- --------------------------------------------------------------- //
                  
                  WHEN OTHERS  =>
                           wrburst_cnt_xhdl50 := "0000";    
                  
               END CASE;
               -- case (AWSIZE_slvif)
               
               
            ELSE
               IF (((WVALID_slvif AND wready_mc_xhdl2) AND 
               CONV_STD_LOGIC(wrburst_cnt_xhdl50 /= "0000")) = '1') THEN
                  wrburst_cnt_xhdl50 := wrburst_cnt_xhdl50 - "0001";    
               END IF;
            END IF;
         END IF;
      END IF;
      wrburst_cnt <= wrburst_cnt_xhdl50;
   END PROCESS;

   PROCESS (ACLK, ARESETN)
      VARIABLE rdburst_cnt_xhdl51  : std_logic_vector(3 DOWNTO 0);
   BEGIN
      IF (ARESETN = '0') THEN
         rdburst_cnt_xhdl51 := "0000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (((rvalid_mc_xhdl9 AND RREADY_slvif) AND 
         CONV_STD_LOGIC(rdburst_cnt_xhdl51 /= "0000")) = '1') THEN
            rdburst_cnt_xhdl51 := rdburst_cnt_xhdl51 - "0001";    
         ELSE
            IF (sram_curr_state = SRAM_ADDR_ST OR (sram_curr_state = 
            SRAM_RDWAIT_ST AND sram_next_state = SRAM_RD_ST)) THEN
               -- --------------------------------------------------------------- //
               -- Each 64-bit data transaction on AXI IF is converted into 2, x32 //
               -- transactions on SRAM IF. Hence this count is 2.                 //
               -- --------------------------------------------------------------- //
               
               CASE ARSIZE_slvif IS
                  WHEN "011" =>
                           rdburst_cnt_xhdl51 := "0001";    
                  WHEN "010" |
                       "001" |
                       "000" =>
                           rdburst_cnt_xhdl51 := "0000";    
                  WHEN OTHERS  =>
                           rdburst_cnt_xhdl51 := "0000";    
                  
               END CASE;
            END IF;
         END IF;
      END IF;
      rdburst_cnt <= rdburst_cnt_xhdl51;
   END PROCESS;

   -- always @ (posedge ACLK or negedge ARESETN)
   -- ----------------------------------------------------------------------- //
   -- Generate the write address and data ready output to the slave interface //
   -- Outputs:                                                                //
   --         awready_mc                                                      //
   --         wready_mc                                                       //
   --         waddrchset_mc                                                   //
   -- ----------------------------------------------------------------------- //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         wready_mc_r <= '0';    
         waddrchset_mc_xhdl4 <= '0';    
         WVALID_slvif_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         wready_mc_r <= wready_mc_xhdl2;    
         waddrchset_mc_xhdl4 <= waddrchset;    
         WVALID_slvif_r <= WVALID_slvif;    
      END IF;
   END PROCESS;

   PROCESS (awready_fsm, wready_fsm)
   BEGIN
      awready_mc_xhdl1 <= awready_fsm;    
      wready_mc_xhdl2  <= wready_fsm;    
   END PROCESS;

   -- --------------------------------- //
   -- Assign the read/write burst value // 
   -- --------------------------------- //
   rdburst_len <= ARLEN_slvif + "00000001" ;
   wrburst_len <= AWLEN_slvif + "00000001" ;

   -- ----------------------------------------------------------------------- //
   -- Generate the read address and data ready output to the slave interface  //
   -- Outputs:                                                                //
   --         arready_mc                                                      //
   --         raddrchset_mc                                                   //
   -- ----------------------------------------------------------------------- //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         arready_mc_xhdl3 <= '0';    
         raddrchset_mc_xhdl5 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         arready_mc_xhdl3 <= arready_fsm;    
         raddrchset_mc_xhdl5 <= raddrchset;    
      END IF;
   END PROCESS;

   -- ------------------------------------------------------------------------ //
   -- //////////////////////////////////////////////////////////////////////// //
   --                        Read State Machine                             // //
   -- //////////////////////////////////////////////////////////////////////// //
   -- ------------------------------------------------------------------------ //
   
   PROCESS (ACLK, ARESETN)
   BEGIN
      IF (ARESETN = '0') THEN
         rd_curr_state <= RD_IDLE_ST;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (AXI4_IFTYPE_RD = 0) THEN
            rd_curr_state <= RD_IDLE_ST;    
         ELSE
            rd_curr_state <= rd_next_state;    
         END IF;
      END IF;
   END PROCESS;
   temp_xhdl58 <= RD_ADRLAT_ST WHEN (rd_req_gnt = '1' AND ARVALID_slvif = '1') ELSE RD_IDLE_ST;
   temp_xhdl59 <= RD_DATAWAIT_ST WHEN (rdbeat_cnt = "000000000") ELSE RD_DATA_ST;
   temp_xhdl60 <= '0' WHEN (rdbeat_cnt = "000000000") ELSE '1';

   -- Next state and output decoder
   
   PROCESS (temp_xhdl58, temp_xhdl59, temp_xhdl60, rd_req_gnt, 
   rd_curr_state, ARVALID_slvif)
      VARIABLE arready_fsm_xhdl52  : std_logic;
      VARIABLE raddrchset_xhdl53  : std_logic;
      VARIABLE rd_sram_xvalid_xhdl54  : std_logic;
      VARIABLE rd_next_state_xhdl55  : std_logic_vector(2 DOWNTO 0);
      VARIABLE rdbeat_cnt_load_xhdl56  : std_logic;
      VARIABLE set_rdaligned_done_xhdl57  : std_logic;
   BEGIN
      arready_fsm_xhdl52 := '0';    
      raddrchset_xhdl53 := '0';    
      rd_sram_xvalid_xhdl54 := '0';    
      rd_next_state_xhdl55 := rd_curr_state;    
      rdbeat_cnt_load_xhdl56 := '0';    
      set_rdaligned_done_xhdl57 := '0';    
      CASE rd_curr_state IS
         -- Move to address latch state when ARVALID is received
         
         WHEN RD_IDLE_ST =>
                  rd_next_state_xhdl55 := temp_xhdl58;    
                  -- Outputs
                  
                  IF (rd_req_gnt = '1' AND ARVALID_slvif = '1') THEN 
                     raddrchset_xhdl53 := '1';    
                     arready_fsm_xhdl52 := '1';    
                  END IF;
         WHEN RD_ADRLAT_ST =>
                  rd_next_state_xhdl55 := RD_DATA0_ST;    
                  -- Outputs
                  
                  arready_fsm_xhdl52 := '0';    
                  raddrchset_xhdl53 := '0';    
                  rd_sram_xvalid_xhdl54 := '1';    
                  rdbeat_cnt_load_xhdl56 := '1';    
         WHEN RD_DATA0_ST =>
                  -- Move to read data state
                  
                  rd_next_state_xhdl55 := RD_DATA_ST;    
                  -- Outputs
                  
                  set_rdaligned_done_xhdl57 := '1';    
         
         WHEN RD_DATA_ST =>
                  rd_next_state_xhdl55 := temp_xhdl59;    
                  rd_sram_xvalid_xhdl54 := temp_xhdl60;    
         WHEN RD_DATAWAIT_ST =>
                  -- Move to response state when the last write data is sent
                  
                  rd_next_state_xhdl55 := RD_LAST_ST;    
                  
         WHEN RD_LAST_ST =>
                  rd_next_state_xhdl55 := RD_IDLE_ST;    
                  
         -- Move to response state when the last write data is sent
         
         WHEN OTHERS  =>
                  rd_next_state_xhdl55 := RD_IDLE_ST;    
         
      END CASE;
      -- case (rd_curr_state)
      
      
      arready_fsm <= arready_fsm_xhdl52;
      raddrchset <= raddrchset_xhdl53;
      rd_sram_xvalid <= rd_sram_xvalid_xhdl54;
      rd_next_state <= rd_next_state_xhdl55;
      rdbeat_cnt_load <= rdbeat_cnt_load_xhdl56;
      set_rdaligned_done <= set_rdaligned_done_xhdl57;
   END PROCESS;
   
   L1: IF (PIPE_EN = 1) GENERATE
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rvalid_mc_xhdl9 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rvalid_mc_xhdl9 <= '0';    
               ELSIF (ren_sc_d1 = '1' AND rvalid_mc_xhdl9 = '0') THEN
                  rvalid_mc_xhdl9 <= '1';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rlast_mc_xhdl12 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rlast_mc_xhdl12 <= '0';    
               ELSIF (ren_sc_xhdl20 = '1' AND rdbeat_cnt = "000000001") THEN
                  rlast_mc_xhdl12 <= '1';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rid_mc_xhdl11    <= (OTHERS => '0'); 
	       rresp_mc_xhdl10  <= (OTHERS => '0');   
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rd_curr_state = RD_DATA_ST) THEN
                  rid_mc_xhdl11 <= ARID_slvif; 
	       ELSE
                  rid_mc_xhdl11 <= (OTHERS => '0'); 
               END IF;

               IF (rd_next_state = RD_LAST_ST AND rd_curr_state = RD_DATA_ST) THEN
                  IF (rresp_error = '1') THEN
                     rresp_mc_xhdl10 <= RRESP_ERR; 
	          ELSE
                     rresp_mc_xhdl10 <= RRESP_OK; 
                  END IF;
	       ELSE 
                  rresp_mc_xhdl10   <= RRESP_OK; 
               END IF;
            END IF;
         END PROCESS;
	 
   END GENERATE L1;
      L11: IF (AXI4_DWIDTH = 64 AND PIPE_EN = 1) GENERATE
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rdata_mc_xhdl13 <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                  IF (ren_sc_d1 = '1') THEN
                     rdata_mc_xhdl13 <= rdata_sc(77 DOWNTO 70) & rdata_sc(67 DOWNTO 60) & rdata_sc(57 DOWNTO 50) & rdata_sc(47 DOWNTO 40) &
		                        rdata_sc(37 DOWNTO 30) & rdata_sc(27 DOWNTO 20) & rdata_sc(17 DOWNTO 10) & rdata_sc(7 DOWNTO 0);    
                  END IF;
            END IF;
         END PROCESS;

      END GENERATE L11;
      
      L2: IF (AXI4_DWIDTH = 32 AND PIPE_EN = 1) GENERATE
         PROCESS (rdata_sc)
            VARIABLE rdata_mc_xhdl13_xhdl63  : std_logic_vector(AXI4_DWIDTH - 1 
            DOWNTO 0);
         BEGIN
            rdata_mc_xhdl13_xhdl63 := (others => '0');
            rdata_mc_xhdl13_xhdl63 := rdata_sc(37 DOWNTO 30) & rdata_sc(27 
            DOWNTO 20) & rdata_sc(17 DOWNTO 10) & rdata_sc(7 DOWNTO 0);    
            rdata_mc_xhdl13 <= rdata_mc_xhdl13_xhdl63;
         END PROCESS;
      END GENERATE L2;
      
      L3: IF (AXI4_DWIDTH = 64 AND PIPE_EN = 0) GENERATE
         PROCESS (rdata_mc_r, rdata_sc, ren_sc_d1)
            VARIABLE rdata_mc_xhdl13_xhdl64  : std_logic_vector(AXI4_DWIDTH - 1 
            DOWNTO 0);
         BEGIN
            rdata_mc_xhdl13_xhdl64 := (others => '0');    
              IF (ren_sc_d1 = '1') THEN
                 rdata_mc_xhdl13_xhdl64 := rdata_sc(77 DOWNTO 70) & rdata_sc(67 DOWNTO 60) & rdata_sc(57 DOWNTO 50) & rdata_sc(47 DOWNTO 40) &
		                           rdata_sc(37 DOWNTO 30) & rdata_sc(27 DOWNTO 20) & rdata_sc(17 DOWNTO 10) & rdata_sc(7 DOWNTO 0);    
	          ELSE 
                 rdata_mc_xhdl13_xhdl64 := rdata_mc_r;    
              END IF;
            
            rdata_mc_xhdl13 <= rdata_mc_xhdl13_xhdl64;
         END PROCESS;

      END GENERATE L3;
      
      -- For maintaining rdata with rvalid when rready is low to avoid protocol violation
      L4: IF (AXI4_DWIDTH = 32 AND PIPE_EN = 0) GENERATE
         PROCESS (rdata_sc,ren_sc_d1,rdata_mc_r)
            VARIABLE rdata_mc_xhdl13_xhdl67  : std_logic_vector(AXI4_DWIDTH - 1 
            DOWNTO 0);
         BEGIN
            rdata_mc_xhdl13_xhdl67 := (others => '0');
            IF (ren_sc_d1 = '1') THEN
               rdata_mc_xhdl13_xhdl67 := rdata_sc(37 DOWNTO 30) & rdata_sc(27 DOWNTO 20) & rdata_sc(17 DOWNTO 10) & rdata_sc(7 DOWNTO 0);    
            ELSE
               rdata_mc_xhdl13_xhdl67 := rdata_mc_r;
            END IF;
            rdata_mc_xhdl13 <= rdata_mc_xhdl13_xhdl67;
         END PROCESS;
      END GENERATE L4;

      PROCESS (ACLK, ARESETN)
      BEGIN
         IF (ARESETN = '0') THEN
            rid_mc_r <= (OTHERS => '0');    
         ELSIF (ACLK'EVENT AND ACLK = '1') THEN
            IF (rd_curr_state = RD_DATA_ST) THEN
               rid_mc_r <= ARID_slvif;    
            ELSE
               rid_mc_r <= (OTHERS => '0');    
            END IF;
         END IF;
      END PROCESS;

      PROCESS (ACLK, ARESETN)
      BEGIN
         IF (ARESETN = '0') THEN
            rdata_mc_r <= (OTHERS => '0');    
         ELSIF (ACLK'EVENT AND ACLK = '1') THEN
            rdata_mc_r <= rdata_mc_xhdl13;    
         END IF;
      END PROCESS;
      
      L7: IF (PIPE_EN = 0 AND HIGH_PERF = 0) GENERATE
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rvalid_mc_xhdl9 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rvalid_mc_xhdl9 <= '0';    
               ELSIF (ren_sc_xhdl20 = '1' AND rvalid_mc_xhdl9 = '0') THEN
                  rvalid_mc_xhdl9 <= '1';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rlast_mc_xhdl12 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rlast_mc_xhdl12 <= '0';    
               ELSIF (ren_sc_xhdl20 = '1' AND rdbeat_cnt = "000000001") THEN
                  rlast_mc_xhdl12 <= '1';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rid_mc_xhdl11    <= (OTHERS => '0'); 
	       rresp_mc_xhdl10  <= (OTHERS => '0');   
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rd_curr_state = RD_DATA_ST) THEN
                  rid_mc_xhdl11 <= ARID_slvif; 
	       ELSE
                  rid_mc_xhdl11 <= (OTHERS => '0'); 
               END IF;

               IF (rd_next_state = RD_LAST_ST AND rd_curr_state = RD_DATA_ST) THEN
                  IF (rresp_error = '1') THEN
                     rresp_mc_xhdl10 <= RRESP_ERR; 
	          ELSE
                     rresp_mc_xhdl10 <= RRESP_OK; 
                  END IF;
	       ELSE 
                  rresp_mc_xhdl10   <= RRESP_OK; 
               END IF;
            END IF;
         END PROCESS;

      END GENERATE L7;

      L71: IF (PIPE_EN = 0 AND HIGH_PERF = 1) GENERATE
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rvalid_mc_xhdl9 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rdbeat_cnt = "000000000" AND rlast_mc_xhdl12  = '1' AND rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rvalid_mc_xhdl9 <= '0';    
               ELSIF (ren_sc_xhdl20 = '1') THEN
                  rvalid_mc_xhdl9 <= '1';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rlast_mc_xhdl12 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (ren_sc_xhdl20 = '1' AND rdbeat_cnt = "000000001") THEN
                  rlast_mc_xhdl12 <= '1';    
               ELSIF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1') THEN
                  rlast_mc_xhdl12 <= '0';    
               END IF;
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rid_mc_xhdl11    <= (OTHERS => '0'); 
	       rresp_mc_xhdl10  <= (OTHERS => '0');   
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (WRAP_SUPPORT = 0 AND rd_curr_state = RD_DATA_ST) THEN
                  rid_mc_xhdl11 <= ARID_slvif; 
	       ELSIF (WRAP_SUPPORT = 1 AND rd_curr_state = RD_DATA0_ST) THEN
                  rid_mc_xhdl11 <= ARID_slvif; 
               ELSIF (rvalid_mc_xhdl9 = '1' AND RREADY_slvif = '1' AND rlast_mc_xhdl12  = '1') THEN
                  rid_mc_xhdl11 <= (OTHERS => '0'); 
               END IF;

               IF (rd_next_state = RD_LAST_ST AND rd_curr_state = RD_DATA_ST) THEN
                  IF (rresp_error = '1') THEN
                     rresp_mc_xhdl10 <= RRESP_ERR; 
	          ELSE
                     rresp_mc_xhdl10 <= RRESP_OK; 
                  END IF;
	       ELSE 
                  rresp_mc_xhdl10   <= RRESP_OK; 
               END IF;
            END IF;
         END PROCESS;

      END GENERATE L71;

         -- SRAM signal generation
         -- ren_sc:: 
         -- Read enable to SRAM 
         -- For 64-bit datawidth, two ren back-to-back pulses are generated on the SRAM interface for ARSIZE = 3.
         -- For 64-bit datawidth, only one ren pulse is generated on the SRAM interface for ARSIZE < 3.
         -- For 32-bit datawidth, only one ren pulse is generated on the SRAM interface.
      L711: IF (HIGH_PERF = 0) GENERATE         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               ren_sc_xhdl20 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rvalid_mc_xhdl9 = '1' AND rlast_mc_xhdl12 = '1') THEN
                  ren_sc_xhdl20 <= '0';    
               ELSE
                  IF (((rd_curr_state = RD_DATA_ST AND ren_sc_xhdl20 = '0') AND RREADY_slvif = '1') AND rdbeat_cnt /= "000000000") THEN
                     ren_sc_xhdl20 <= '1';    
                  ELSE
                     ren_sc_xhdl20 <= '0';    
                  END IF;
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L711;

      L7111: IF (HIGH_PERF = 1) GENERATE         
         PROCESS (rvalid_mc_xhdl9, rlast_mc_xhdl12, rd_curr_state, RREADY_slvif, 
		 rdbeat_cnt, ARBURST_slvif, ARLEN_slvif)
         BEGIN
               ren_sc_xhdl20 <= '0';    
               IF (rvalid_mc_xhdl9 = '1' AND rlast_mc_xhdl12 = '1') THEN
                  ren_sc_xhdl20 <= '0';    
               ELSE
                  IF (((((rd_curr_state = RD_DATA_ST))) AND RREADY_slvif = '1') AND rdbeat_cnt > "000000000" AND (ARBURST_slvif = "10")) THEN
                     ren_sc_xhdl20 <= '1';    
                  ELSIF (((rd_curr_state = RD_DATA_ST) AND RREADY_slvif = '1') AND rdbeat_cnt > "000000000"  AND (ARBURST_slvif /= "10")) THEN
                     ren_sc_xhdl20 <= '1';    
                  ELSIF (((rd_curr_state = RD_DATA_ST) AND RREADY_slvif = '1') AND rdbeat_cnt = "000000001"  AND (ARLEN_slvif = "00000000")) THEN
                     ren_sc_xhdl20 <= '1';    
                  END IF;
               END IF;
         END PROCESS;
      END GENERATE L7111;

         -- ren_active is used to generate the required number of read enable pulses based 
         -- on the AXI4 datawidth.
         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               ren_active <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF ((CONV_STD_LOGIC(ren_active = '1' AND RREADY_slvif = '1') AND 
               rvalid_mc_xhdl9) = '1') THEN
                  ren_active <= '0';    
               ELSE
                  IF (rd_curr_state = RD_DATA_ST AND ren_sc_xhdl20 = '1') THEN
                     ren_active <= '1';    
                  END IF;
               END IF;
            END IF;
         END PROCESS;

         -- always @ (posedge ACLK or negedge ARESETN)
         -- Registered ren_sc
         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               ren_sc_d1 <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               ren_sc_d1 <= ren_sc_xhdl20;    
            END IF;
         END PROCESS;


         PROCESS(raddr_aligned, raddr_aligned_load)
         BEGIN
              raddr_sc_xhdl21_sig3 <= ShiftRight(raddr_aligned,3);
              raddr_sc_xhdl21_sig2 <= ShiftRight(raddr_aligned,2);
              raddr_sc_xhdl21_sig33 <= ShiftRight(raddr_aligned_load,3);
              raddr_sc_xhdl21_sig22 <= ShiftRight(raddr_aligned_load,2);
         END PROCESS;

         PROCESS (wrap_raddr_calc,wrap_raddr_next,ARADDR_slvif)
         BEGIN 
             wrap_raddr_calc_xhdl18_sig3 <= ShiftRight(wrap_raddr_calc + "00000000000000000000000000000100",3);
             wrap_raddr_calc_xhdl18_sig2 <= ShiftRight(wrap_raddr_calc + "00000000000000000000000000000100",2);
             wrap_raddr_calc_xhdl118_sig3 <= ShiftRight(wrap_raddr_calc,3);
             wrap_raddr_calc_xhdl118_sig2 <= ShiftRight(wrap_raddr_calc,2);
             wrap_raddr_calc_xhdl18_sig33 <= ShiftRight(ARADDR_slvif,3);
             wrap_raddr_calc_xhdl18_sig22 <= ShiftRight(ARADDR_slvif,2);
             wrap_raddr_calc_xhdl18_sig333 <= ShiftRight(wrap_raddr_next + "00000000000000000000000000000100",3);
             wrap_raddr_calc_xhdl18_sig222 <= ShiftRight(wrap_raddr_next + "00000000000000000000000000000100",2);
             wrap_raddr_calc_xhdl18_sig3333 <= ShiftRight(wrap_raddr_next,3);
             wrap_raddr_calc_xhdl18_sig2222 <= ShiftRight(wrap_raddr_next,2);
         END PROCESS;


         -- ---------------------------------------------------------------------------------- //
         -- raddr_sc::                                                                         //
         -- Read Address generation logic to SRAM                                              //
         -- For 64-bit datawidth and ARSIZE = 3, each 64-bit transaction on AXI4               //
         -- interface is converted into 2, 32-bit transactions on the SRAM memory interface.   //
         -- For 64-bit datawidth and ARSIZE < 3, each 64-bit transaction on AXI4 interface     //
         -- is converted into corresponding 32-bit transaction on the SRAM memory interface    //
         -- based on the address.                                                              //
         -- For 32-bit datawidth and For ARSIZE < 3, each 32-bit transaction on AXI4 interface //
         -- is converted into corresponding 32-bit transaction on the SRAM memory interface    //
         -- based on the address.                                                              //
         -- ---------------------------------------------------------------------------------- //
         -- Register the next wrap address on every sample of 
      L7121: IF (HIGH_PERF = 0) GENERATE           
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               raddr_sc_xhdl21 <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (WRAP_SUPPORT = 1) THEN
               IF (ARBURST_slvif = "10") THEN
                  -- For burst type = WRAP
                  
                  IF (ARSIZE_slvif = "011") THEN
                     IF (rd_curr_state = RD_DATA0_ST) THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig33(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig22(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;
		     ELSIF (ren_sc_xhdl20 = '1') THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig333(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig222(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;
                     END IF;
                  -- For other ARSIZE = 3'b010, 3'b001, 3'b000
                  
                  ELSE
                     IF (rd_curr_state = RD_DATA0_ST) THEN      -- SAR#82319
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig33(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig22(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;
		     ELSIF (ren_sc_xhdl20 = '1') THEN
                        IF (AXI4_DWIDTH = 64) THEN     
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig3333(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig2222(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;			     
                     END IF;
                  END IF;
               ELSE
                  -- For burst type = INCR
                  
                  IF (sram_curr_state = SRAM_RDWAIT_ST AND rdbeat_cnt = 
                  "000000000") THEN
                     raddr_sc_xhdl21 <= (OTHERS => '0');    
                  ELSE
                     IF (rdbeat_cnt /= "000000000") THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82246
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig3(MEM_AWIDTH-1 DOWNTO 0);
                        ELSIF (AXI4_DWIDTH = 32) THEN
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig2(MEM_AWIDTH-1 DOWNTO 0);
                        END IF;
                     ELSE
                        IF (rd_curr_state = RD_LAST_ST) THEN
                           raddr_sc_xhdl21 <= (OTHERS => '0');    
                        END IF;
                     END IF;
                  END IF;
               END IF;
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L7121;

      L7122: IF (HIGH_PERF = 1) GENERATE           

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               raddr_sc_xhdl21 <= (OTHERS => '0');    
               raddr_sc_dummy  <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN		 
               IF (WRAP_SUPPORT = 1 AND ARBURST_slvif = "10") THEN
                  -- For burst type = WRAP
                  
                     IF (set_rdaligned_done = '1') THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig33(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig22(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;
                        raddr_sc_dummy  <= raddr_aligned_load;    
		     ELSIF (ren_sc_xhdl20 = '1') THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig3333(MEM_AWIDTH-1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           raddr_sc_xhdl21 <= wrap_raddr_calc_xhdl18_sig2222(MEM_AWIDTH-1 DOWNTO 0); 
                        END IF;
                        raddr_sc_dummy  <= wrap_raddr_next;    
                     END IF;
               ELSE
                  -- For burst type = INCR
                  
                  IF (sram_curr_state = SRAM_RDWAIT_ST AND rdbeat_cnt = "000000000") THEN
                     raddr_sc_xhdl21 <= (OTHERS => '0');    
                  ELSE
                     IF (set_rdaligned_done = '1') THEN      -- SAR#82246
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82246
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig33(MEM_AWIDTH-1 DOWNTO 0);
                        ELSIF (AXI4_DWIDTH = 32) THEN
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig22(MEM_AWIDTH-1 DOWNTO 0);
                        END IF;
                     ELSIF (ren_sc_xhdl20 = '1') THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82246
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig3(MEM_AWIDTH-1 DOWNTO 0);
                        ELSIF (AXI4_DWIDTH = 32) THEN
                            raddr_sc_xhdl21 <= raddr_sc_xhdl21_sig2(MEM_AWIDTH-1 DOWNTO 0);
                        END IF;
                     ELSE
                        IF (rd_curr_state = RD_LAST_ST) THEN
                           raddr_sc_xhdl21 <= (OTHERS => '0');    
                        END IF;
                     END IF;
                  END IF;
               END IF;
             END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               raddr_sc_xhdl21_r <= (OTHERS => '0');   
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               raddr_sc_xhdl21_r <= raddr_sc_xhdl21;
	    END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               wrap_raddr_plus <= (OTHERS =>'0');   
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rd_curr_state = RD_ADRLAT_ST) THEN    
                   wrap_raddr_plus <= raddr_aligned_load + rd_number_bytes;
               ELSIF (ren_sc_xhdl20 = '1') THEN
                   wrap_raddr_plus <= wrap_raddr_next + rd_number_bytes;
	       END IF;
	    END IF;
         END PROCESS;

      END GENERATE L7122;

         rresp_error <= '0' ;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rresp_mc_r <= "00";    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rd_next_state = RD_LAST_ST AND rd_curr_state = RD_DATA_ST) 
               THEN
                  IF (rresp_error = '1') THEN
                     rresp_mc_r <= RRESP_ERR;    --  Send error response
                  ELSE
                     rresp_mc_r <= RRESP_OK;    -- Send okay response
                  END IF;
               ELSE
                  rresp_mc_r <= RRESP_OK;    
               END IF;
            END IF;
         END PROCESS;

         -- --------------------------------------------- //
         -- Calculate the burst length based on the arlen //
         -- --------------------------------------------- //
         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               wrbeat_cnt <= "000000000";    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF ((((CONV_STD_LOGIC(wrbeat_cnt /= "000000000") AND 
               WVALID_slvif) AND wready_mc_xhdl2) AND WLAST_slvif) = '1') THEN
                  wrbeat_cnt <= "000000000";    
               ELSE
                  IF (wrbeat_cnt_load = '1') THEN
                     -- Load
                     
                     wrbeat_cnt <= "0" & AWLEN_slvif + "000000001";    
                  ELSE
                     IF (((CONV_STD_LOGIC(wrbeat_cnt /= "000000000") AND WVALID_slvif) AND wready_mc_xhdl2) = '1') THEN
                        wrbeat_cnt <= wrbeat_cnt - "000000001";    
                     END IF;
                  END IF;
               END IF;
            END IF;
         END PROCESS;

         -- --------------------------------------------- //
         -- Count the number of beats based on rvalid     //
         -- and rready.                                   //
         -- --------------------------------------------- //
         
      L7123: IF (HIGH_PERF = 0) GENERATE           
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rdbeat_cnt <= "000000000";    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (((rvalid_mc_xhdl9 AND RREADY_slvif) AND rlast_mc_xhdl12) = '1') THEN
                  rdbeat_cnt <= "000000000";    
               ELSE
                  IF (rdbeat_cnt_load = '1') THEN
                     -- Load
                     
                     rdbeat_cnt <= "0" & ARLEN_slvif + "000000001";    
                  ELSE
                     IF (((rvalid_mc_xhdl9 AND RREADY_slvif) AND CONV_STD_LOGIC(rdbeat_cnt /= "000000000")) = '1') THEN
                        rdbeat_cnt <= rdbeat_cnt - "000000001";    
                     END IF;
                  END IF;
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L7123;

      L7124: IF (HIGH_PERF = 1) GENERATE           
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rdbeat_cnt <= "000000000";    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (((rvalid_mc_xhdl9 AND RREADY_slvif) AND rlast_mc_xhdl12) = '1') THEN
                  rdbeat_cnt <= "000000000";    
               ELSE
                  IF (rdbeat_cnt_load = '1') THEN
                     -- Load
                     
                     rdbeat_cnt <= "0" & ARLEN_slvif + "000000001";    
                  ELSE
                     IF (((ren_sc_xhdl20 AND RREADY_slvif) AND CONV_STD_LOGIC(rdbeat_cnt /= "000000000")) = '1') THEN
                        rdbeat_cnt <= rdbeat_cnt - "000000001";    
                     END IF;
                  END IF;
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L7124;

         temp_xhdl68 <= (raddr_aligned + rd_number_bytes) WHEN (ren_sc_xhdl20) = '1' ELSE raddr_aligned;

         -- ----------------------------------------------------------------- //
         -- Generate the read aligned address based on the read size (ARSIZE) //
         -- ----------------------------------------------------------------- //
      L7125: IF (HIGH_PERF = 0) GENERATE            
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rd_aligned_done <= '0';    
               raddr_aligned <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (set_rdaligned_done = '1') THEN
                  raddr_aligned <= raddr_aligned_load;    
               ELSE
                  raddr_aligned <= temp_xhdl68;    
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L7125;

      L7126: IF (HIGH_PERF = 1) GENERATE            
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               rd_aligned_done <= '0';    
               raddr_aligned <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               IF (rd_curr_state = RD_ADRLAT_ST) THEN
                  raddr_aligned <= raddr_aligned_load;    
               ELSIF (ren_sc_xhdl20 = '1' OR set_rdaligned_done = '1') THEN
                  raddr_aligned <= raddr_aligned + rd_number_bytes;    
               END IF;
            END IF;
         END PROCESS;
      END GENERATE L7126;
         
      L7127: IF (HIGH_PERF = 0) GENERATE            
         PROCESS (ARADDR_slvif,ARSIZE_slvif)
            VARIABLE raddr_aligned_load_xhdl69  : std_logic_vector(AXI4_AWIDTH 
            - 1 DOWNTO 0);
            VARIABLE rd_number_bytes_xhdl70  : std_logic_vector(3 DOWNTO 0);
         BEGIN
            CASE ARSIZE_slvif IS
               WHEN "000" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif;    
                        rd_number_bytes_xhdl70 := "0001";    
               WHEN "001" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 1) & '0';    
                        rd_number_bytes_xhdl70 := "0010";    
               WHEN "010" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 2) & "00";    
                        rd_number_bytes_xhdl70 := "0100";    
               WHEN "011" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 3) & "000";    
                        rd_number_bytes_xhdl70 := "1000";    
               WHEN "100" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 4) & "0000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "101" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 5) & "00000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "110" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 6) & "000000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "111" =>
                        raddr_aligned_load_xhdl69 := ARADDR_slvif(AXI4_AWIDTH - 1 DOWNTO 7) & "0000000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN OTHERS  =>
                        raddr_aligned_load_xhdl69 := (OTHERS => '0');    
                        rd_number_bytes_xhdl70 := "0000";    
               
            END CASE;
            -- case (ARSIZE_slvif)
            
            
            raddr_aligned_load <= raddr_aligned_load_xhdl69;
            rd_number_bytes <= rd_number_bytes_xhdl70;
         END PROCESS;
      END GENERATE L7127;

      L7128: IF (HIGH_PERF = 1) GENERATE            
         PROCESS (ARVALID,ARADDR,ARSIZE,arready_mc_xhdl3, raddr_aligned_load_r,rd_number_bytes_r)
            VARIABLE raddr_aligned_load_xhdl69  : std_logic_vector(AXI4_AWIDTH 
            - 1 DOWNTO 0);
            VARIABLE rd_number_bytes_xhdl70  : std_logic_vector(3 DOWNTO 0);
         BEGIN
           IF ((ARVALID AND arready_mc_xhdl3) = '1') THEN
            CASE ARSIZE IS
               WHEN "000" =>
                        raddr_aligned_load_xhdl69 := ARADDR;    
                        rd_number_bytes_xhdl70 := "0001";    
               WHEN "001" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 1) & '0';    
                        rd_number_bytes_xhdl70 := "0010";    
               WHEN "010" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 2) & "00";    
                        rd_number_bytes_xhdl70 := "0100";    
               WHEN "011" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 3) & "000";    
                        rd_number_bytes_xhdl70 := "1000";    
               WHEN "100" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 4) & "0000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "101" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 5) & "00000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "110" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 6) & "000000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN "111" =>
                        raddr_aligned_load_xhdl69 := ARADDR(AXI4_AWIDTH - 1 DOWNTO 7) & "0000000";    
                        rd_number_bytes_xhdl70 := "0000";    
               WHEN OTHERS  =>
                        raddr_aligned_load_xhdl69 := (OTHERS => '0');    
                        rd_number_bytes_xhdl70 := "0000";    
               
            END CASE;
            -- case (ARSIZE)
           ELSE
              raddr_aligned_load_xhdl69 := raddr_aligned_load_r;    
              rd_number_bytes_xhdl70 := rd_number_bytes_r;    
	   END IF;
            
            
            raddr_aligned_load <= raddr_aligned_load_xhdl69;
            rd_number_bytes <= rd_number_bytes_xhdl70;
         END PROCESS;
      END GENERATE L7128;

         -- ------------------------------------------------------------------------ //
         -- //////////////////////////////////////////////////////////////////////// //
         --                        SRAM Control block                             // //
         -- //////////////////////////////////////////////////////////////////////// //
         -- ------------------------------------------------------------------------ //
         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               sram_xdone_r <= '0';    
               raddr_aligned_load_r <= (OTHERS => '0');    
               rd_number_bytes_r <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               sram_xdone_r <= sram_xdone;    
               raddr_aligned_load_r <= raddr_aligned_load;    
               rd_number_bytes_r <= rd_number_bytes;    
            END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               wdata_sc_r <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               wdata_sc_r <= wdata_sc_xhdl19;    
            END IF;
         END PROCESS;


         PROCESS (waddr_aligned,waddr_aligned_load,number_bytes)
         BEGIN 
             waddr_sc_xhdl18_sig3 <= ShiftRight(waddr_aligned+number_bytes,3);
             waddr_sc_xhdl18_sig2 <= ShiftRight(waddr_aligned+number_bytes,2);
             waddr_sc_xhdl18_sig3_1 <= ShiftRight(waddr_aligned_load,3);
             waddr_sc_xhdl18_sig2_1 <= ShiftRight(waddr_aligned_load,2);
         END PROCESS;


         PROCESS (wrap_waddr_next)
         BEGIN 
             wrap_waddr_next_xhdl18_sig3 <= ShiftRight(wrap_waddr_next + "00000000000000000000000000001000",3);
             wrap_waddr_next_xhdl18_sig2 <= ShiftRight(wrap_waddr_next + "00000000000000000000000000001000",2);
             wrap_waddr_next_xhdl118_sig3 <= ShiftRight(wrap_waddr_next,3);
             wrap_waddr_next_xhdl118_sig2 <= ShiftRight(wrap_waddr_next,2);
         END PROCESS;

         PROCESS (wrap_waddr_calc)
         BEGIN 
             wrap_waddr_calc_xhdl18_sig3 <= ShiftRight(wrap_waddr_calc,3);
             wrap_waddr_calc_xhdl18_sig2 <= ShiftRight(wrap_waddr_calc,2);
             wrap_waddr_calc_xhdl118_sig3 <= ShiftRight(wrap_waddr_calc + "00000000000000000000000000001000",3);
             wrap_waddr_calc_xhdl118_sig2 <= ShiftRight(wrap_waddr_calc + "00000000000000000000000000001000",2);
         END PROCESS;

         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               wr_wrap_boundary_int <= '0';    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
              IF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                 wr_wrap_boundary_int <= '0';    
              ELSIF (wr_wrap_boundary = '1') THEN
                 wr_wrap_boundary_int <= '1';    
              END IF;
            END IF;
         END PROCESS;

         -- Write signals to SRAM
         -- ---------------------------------------------------------------------------------- //
         -- waddr_sc::                                                                         //
         -- Write Address generation logic to SRAM                                             //
         -- For 64-bit datawidth and AWSIZE = 3, each 64-bit transaction on AXI4               //
         -- interface is converted into 2, 32-bit transactions on the SRAM memory interface.   //
         -- For 64-bit datawidth and AWSIZE < 3, each 64-bit transaction on AXI4 interface     //
         -- is converted into corresponding 32-bit transaction on the SRAM memory interface    //
         -- based on the address.                                                              //
         -- For 32-bit datawidth and For AWSIZE < 3, each 32-bit transaction on AXI4 interface //
         -- is converted into corresponding 32-bit transaction on the SRAM memory interface    //
         -- based on the address.                                                              //
         -- ---------------------------------------------------------------------------------- //
         
         PROCESS (ACLK, ARESETN)
         BEGIN
            IF (ARESETN = '0') THEN
               waddr_sc_xhdl18 <= (OTHERS => '0');    
               waddr_sc_dummy  <= (OTHERS => '0');    
            ELSIF (ACLK'EVENT AND ACLK = '1') THEN
               -- For burst type = WRAP
               -- For AWSIZE = 3'b011
               
               
                     IF (waddrchset_mc_xhdl4 = '1' AND AWBURST = "10" AND WRAP_SUPPORT = 1) THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig3_1(MEM_AWIDTH - 1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig2_1(MEM_AWIDTH - 1 DOWNTO 0); 
                        END IF;
                        waddr_sc_dummy <= waddr_aligned_load; 
                     ELSIF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1' AND AWBURST_slvif = "10" AND WRAP_SUPPORT = 1) THEN
                           IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                              waddr_sc_xhdl18 <= wrap_waddr_next_xhdl118_sig3(MEM_AWIDTH - 1 DOWNTO 0);
                           ELSIF (AXI4_DWIDTH = 32) THEN
                              waddr_sc_xhdl18 <= wrap_waddr_next_xhdl118_sig2(MEM_AWIDTH - 1 DOWNTO 0);
                           END IF;
                           waddr_sc_dummy <= wrap_waddr_next; 
               -- For burst type = INCR
               
                     ELSIF (waddrchset_mc_xhdl4 = '1' AND AWBURST /= "10" ) THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig3_1(MEM_AWIDTH - 1 DOWNTO 0); 
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig2_1(MEM_AWIDTH - 1 DOWNTO 0); 
                        END IF;
                        waddr_sc_dummy  <= (OTHERS => '0');    
                     ELSIF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1' AND AWBURST_slvif /= "10") THEN
                        IF (AXI4_DWIDTH = 64) THEN      -- SAR#82319
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig3(MEM_AWIDTH - 1 DOWNTO 0);
                        ELSIF (AXI4_DWIDTH = 32) THEN
                           waddr_sc_xhdl18 <= waddr_sc_xhdl18_sig2(MEM_AWIDTH - 1 DOWNTO 0);
                        END IF;
                        waddr_sc_dummy  <= (OTHERS => '0');    
                     END IF;
           END IF;
         END PROCESS;

         PROCESS (ACLK, ARESETN)
           BEGIN
             IF (ARESETN = '0') THEN
                wrap_waddr_plus <= (OTHERS => '0');    
             ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                IF (waddrchset_mc_xhdl4 = '1') THEN
                   wrap_waddr_plus <= wrap_waddr_next + number_bytes;    
                ELSIF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                   wrap_waddr_plus <= wrap_waddr_next + number_bytes;    
                END IF;
             END IF;
         END PROCESS;

         -- if (AXI4_DWIDTH == 32)
         
         L5: IF (AXI4_DWIDTH = 32) GENERATE

         -- ------------------------------------------------------------ //
         -- wdata_sc::                                                   //
         -- Route the write data from the AXI4 interface onto the 32-bit //
         -- SRAM interface till the write beat count is reached.         //
         -- ------------------------------------------------------------ //
               PROCESS (WVALID_slvif, wready_mc_xhdl2, WDATA_slvif,wdata_sc_xhdl19_r)
               BEGIN
                  wdata_sc_xhdl19 <= wdata_sc_xhdl19_r;
	          IF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                      wdata_sc_xhdl19 <= ("00" & WDATA_slvif(AXI4_DWIDTH-1  DOWNTO AXI4_DWIDTH-8 ) &
	         		               "00" & WDATA_slvif(AXI4_DWIDTH-9  DOWNTO AXI4_DWIDTH-16) &  
				               "00" & WDATA_slvif(AXI4_DWIDTH-17 DOWNTO AXI4_DWIDTH-24) &  
				               "00" & WDATA_slvif(AXI4_DWIDTH-25 DOWNTO 0             )  
				              );
	          END IF;
               END PROCESS;

               --For SAR#82246
               PROCESS (WVALID_slvif, wready_mc_xhdl2,WSTRB_slvif)
               BEGIN
   	             IF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                        wen_sc  <= WVALID_slvif AND wready_mc_xhdl2;
                        wenb_sc_xhdl15 <= WSTRB_slvif(1 DOWNTO 0);    
                        wena_sc_xhdl14 <= WSTRB_slvif(3 DOWNTO 2);
		     ELSE
                        wen_sc  <= '0';    
                        wena_sc_xhdl14 <= (OTHERS => '0');    
                        wenb_sc_xhdl15 <= (OTHERS => '0');    
		     END IF;
               END PROCESS;

         END GENERATE L5;
    
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wdata_sc_xhdl19_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wdata_sc_xhdl19_r <= wdata_sc_xhdl19;
                  END IF;
               END PROCESS;

            L6: IF (AXI4_DWIDTH = 64) GENERATE

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     WDATA_slvif_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     WDATA_slvif_r <= WDATA_slvif;
                  END IF;
               END PROCESS;	

         -- ------------------------------------------------------------ //
         -- wdata_sc::                                                   //
         -- Route the write data from the AXI4 interface onto the 32-bit //
         -- SRAM interface till the write beat count is reached.         //
         -- ------------------------------------------------------------ //
               PROCESS (WVALID_slvif, wready_mc_xhdl2,wdata_sc_xhdl19_r,WDATA_slvif)
               BEGIN
                  wdata_sc_xhdl19 <= wdata_sc_xhdl19_r;
	          IF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                           wdata_sc_xhdl19 <= ("00" & WDATA_slvif(AXI4_DWIDTH-1     DOWNTO AXI4_DWIDTH/2+24) &
				        "00" & WDATA_slvif(AXI4_DWIDTH/2+23  DOWNTO AXI4_DWIDTH/2+16) &  
				        "00" & WDATA_slvif(AXI4_DWIDTH/2+15  DOWNTO AXI4_DWIDTH/2+8 ) &  
				        "00" & WDATA_slvif(AXI4_DWIDTH/2+7   DOWNTO AXI4_DWIDTH/2   ) & 
                                        "00" & WDATA_slvif(AXI4_DWIDTH/2-1   DOWNTO AXI4_DWIDTH/2-8 ) &
				        "00" & WDATA_slvif(AXI4_DWIDTH/2-9   DOWNTO AXI4_DWIDTH/2-16) &  
				        "00" & WDATA_slvif(AXI4_DWIDTH/2-17  DOWNTO AXI4_DWIDTH/2-24) &  
				        "00" & WDATA_slvif(AXI4_DWIDTH/2-25  DOWNTO 0));  
                  END IF;
               END PROCESS;
    
               PROCESS (WVALID_slvif, wready_mc_xhdl2,WVALID_slvif_r,wready_mc_r,WSTRB_slvif)
               BEGIN
	          -- Generate the byte enables according to the write strobe
		  IF (WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN 
                         wen_sc  <= WVALID_slvif_r AND wready_mc_r;
                         wenb_sc_xhdl15 <= WSTRB_slvif(1 DOWNTO 0);    
                         wena_sc_xhdl14  <= WSTRB_slvif(3 DOWNTO 2);
                         wenb_msb_sc_xhdl17 <= WSTRB_slvif(5 DOWNTO 4);    
                         wena_msb_sc_xhdl16  <= WSTRB_slvif(7 DOWNTO 6);    
	          ELSE 
                         wen_sc  <= '0';
                         wena_sc_xhdl14 <= (OTHERS => '0');
                         wenb_sc_xhdl15 <= (OTHERS => '0');
                         wena_msb_sc_xhdl16 <= (OTHERS => '0');    
                         wenb_msb_sc_xhdl17 <= (OTHERS => '0');    
                  END IF;
               END PROCESS;       
            END GENERATE L6;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     waddrchset_mc_r <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     waddrchset_mc_r <= waddrchset_mc_xhdl4;    
                  END IF;
               END PROCESS;
               temp_xhdl75 <= (waddr_aligned + number_bytes) WHEN (WVALID_slvif AND wready_mc_xhdl2) = '1' ELSE waddr_aligned;

               -- --------------------------------------------------------------------------
               -- Generate the aligned address based on the write size (AWSIZE)
               -- --------------------------------------------------------------------------
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     waddr_aligned <= (OTHERS => '0');    
                     aligned_done <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (waddrchset_mc_xhdl4 = '1') THEN
                        waddr_aligned <= waddr_aligned_load;    
                     ELSE
                        waddr_aligned <= temp_xhdl75;    
                     END IF;
                  END IF;
               END PROCESS;

               PROCESS (AWVALID,AWSIZE,AWADDR,waddr_aligned_load_r,number_bytes_r)
                  VARIABLE waddr_aligned_load_xhdl76  : 
                  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
                  VARIABLE number_bytes_xhdl77  : std_logic_vector(3 DOWNTO 0)
                  ;
               BEGIN
                 IF (AWVALID = '1') THEN
                  CASE AWSIZE IS
                     WHEN "000" =>
                              waddr_aligned_load_xhdl76 := AWADDR;    
                              number_bytes_xhdl77 := "0001";    
                     WHEN "001" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 1) & '0';    
                              number_bytes_xhdl77 := "0010";    
                     WHEN "010" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 2) & "00";    
                              number_bytes_xhdl77 := "0100";    
                     WHEN "011" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 3) & "000";    
                              number_bytes_xhdl77 := "1000";    
                     WHEN "100" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 4) & "0000";    
                              number_bytes_xhdl77 := "0000";    
                     WHEN "101" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 5) & "00000";    
                              number_bytes_xhdl77 := "0000";    
                     WHEN "110" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 6) & "000000";    
                              number_bytes_xhdl77 := "0000";    
                     WHEN "111" =>
                              waddr_aligned_load_xhdl76 := AWADDR(AXI4_AWIDTH - 1 DOWNTO 7) & "0000000";    
                              number_bytes_xhdl77 := "0000";    
                     WHEN OTHERS  =>
                              waddr_aligned_load_xhdl76 := (OTHERS => '0');    
                              number_bytes_xhdl77 := "0000";    
                     
                  END CASE;
                  -- case (AWSIZE_slvif)
                 ELSE 
                   waddr_aligned_load_xhdl76 := waddr_aligned_load_r;    
                   number_bytes_xhdl77 := number_bytes_r;    
		 END IF;
                  
                  waddr_aligned_load <= waddr_aligned_load_xhdl76;
                  number_bytes <= number_bytes_xhdl77;
               END PROCESS;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wr_wrap_boundary_r <= '0';    
                     waddr_aligned_load_r <= (OTHERS => '0');    
                     number_bytes_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wr_wrap_boundary_r <= wr_wrap_boundary;    
                     waddr_aligned_load_r <= waddr_aligned_load;    
                     number_bytes_r <= number_bytes;    
                  END IF;
               END PROCESS;

               -- --------------------------------------------------------------------------
               -- Generate the wrap address based on the write size (AWSIZE) and write 
               -- length (AWLEN)
               -- --------------------------------------------------------------------------
               -- Increment the start address using the number bytes for calculation of
               -- address.
               
               PROCESS (number_bytes, wrap_waddr_calc, wready_mc_xhdl2, WVALID_slvif,
               wrap_waddr_incr_r, wr_curr_state, 
               set_aligned_done, AWADDR, wr_wrap_boundary_int,AWSIZE_slvif,
               sram_xdone_r)
                  VARIABLE wrap_waddr_incr_xhdl78  : 
                  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
               BEGIN
                  wrap_waddr_incr_xhdl78 := wrap_waddr_incr_r;    
                  IF (WRAP_SUPPORT /= 0) THEN
                     wrap_waddr_incr_xhdl78 := wrap_waddr_incr_r;    
                     IF (set_aligned_done = '1') THEN
                        wrap_waddr_incr_xhdl78 := AWADDR;    
                     ELSE
                        IF ((WVALID_slvif AND wready_mc_xhdl2 ) = '1' AND AWSIZE_slvif /= "011") THEN
                           wrap_waddr_incr_xhdl78 := wrap_waddr_calc + number_bytes;    
                        ELSIF (wr_wrap_boundary_int = '1' AND AWSIZE_slvif = "011") THEN
                           wrap_waddr_incr_xhdl78 := wrap_waddr_calc;    
                        ELSIF ((CONV_STD_LOGIC(wr_curr_state = WR_DATA_ST) AND sram_xdone_r ) = '1' AND AWSIZE_slvif = "011") THEN
                           wrap_waddr_incr_xhdl78 := wrap_waddr_calc + number_bytes;    
                        END IF;
                     END IF;
                  END IF;
                  wrap_waddr_incr <= wrap_waddr_incr_xhdl78;
               END PROCESS;

               -- always @ (posedge ACLK or negedge ARESETN)
               -- Calculate the next waddr for wrap transactions based 
               -- on the write burst length and the write burst type.
               
               PROCESS (wrap_waddr_incr, AWSIZE_slvif,  waddrchset_mc_r,
               wrap_waddr_calc, AWLEN_slvif, AWADDR_slvif, WVALID_slvif, wready_mc_xhdl2, waddr_sc_dummy,wrap_waddr_plus,
               wr_curr_state, AWBURST_slvif, set_aligned_done, sram_xdone,
               AWADDR, sram_xdone_r, wrap_waddr_next_r)
                  VARIABLE wr_wrap_boundary_xhdl79  : std_logic;
                  VARIABLE wrap_waddr_next_xhdl80  : 
                  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
               BEGIN
                  wr_wrap_boundary_xhdl79 := '0';    
                  IF (set_aligned_done = '1') THEN
                     wrap_waddr_next_xhdl80 := AWADDR;    
                  ELSE
                     IF ((AWBURST_slvif = "10" AND AWSIZE_slvif = "011") AND 
                     WRAP_SUPPORT /= 0) THEN
                        -- For Wrap burst
                        
                        CASE AWLEN_slvif IS
                           WHEN "00000000" =>
                                    -- no wrap
                                    
                                    wrap_waddr_next_xhdl80 := wrap_waddr_incr;  
                           WHEN "00000001" =>
                                    -- Wrap at every two locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF ((CONV_STD_LOGIC(AWADDR_slvif(3 DOWNTO 0) = "1000") AND waddrchset_mc_r) = '1') THEN
                                       wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                       wr_wrap_boundary_xhdl79 := '1';    
                                    ELSE
                                       IF ((CONV_STD_LOGIC(waddr_sc_dummy(3 DOWNTO 0) = "1000")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                          wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                       END IF;
                                    END IF;
                           WHEN "00000011" =>
                                    -- Wrap at every four locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF ((CONV_STD_LOGIC(AWADDR_slvif(4 DOWNTO 0) = "11000") AND waddrchset_mc_r) = '1') THEN
                                       wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                       wr_wrap_boundary_xhdl79 := '1';    
                                    ELSE
                                       IF ((CONV_STD_LOGIC(waddr_sc_dummy(4 DOWNTO 0) = "11000")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                          wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                       END IF;
                                    END IF;
                           WHEN "00000111" =>
                                    -- Wrap at every eight locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF ((CONV_STD_LOGIC(AWADDR_slvif(5 DOWNTO 0) = "111000") AND waddrchset_mc_r) = '1') THEN
                                       wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                       wr_wrap_boundary_xhdl79 := '1';    
                                    --else begin
                                    
                                    ELSE
                                       IF ((CONV_STD_LOGIC(waddr_sc_dummy(5 DOWNTO 0) = "111000")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                          wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                       END IF;
                                    END IF;
                           WHEN "00001111" =>
                                    -- Wrap at every 16 locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF ((CONV_STD_LOGIC(AWADDR_slvif(6 DOWNTO 0) = "1111000") AND waddrchset_mc_r) = '1') THEN
                                       wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 7) & "0000000";
                                       wr_wrap_boundary_xhdl79 := '1';
                                    ELSE
                                       IF ((CONV_STD_LOGIC(waddr_sc_dummy(6 DOWNTO 0) = "1111000")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                          wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 7) & "0000000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                       END IF;
                                    END IF;
                           WHEN OTHERS  =>
                                    wrap_waddr_next_xhdl80 := wrap_waddr_next_r;  
                           
                        END CASE;
                     ELSE
                    -- SAR#82319
                    -- The wrap boundary for Size - Word/Halfword and Byte is defined in the
                    -- if-else conditions
                        IF ((AWBURST_slvif = "10" AND (AWSIZE_slvif = "010")) AND WRAP_SUPPORT /= 0) THEN
                           -- For Wrap burst
                           
                           CASE AWLEN_slvif IS
                              WHEN "00000000" =>
                                       -- no wrap                                       
                                       wrap_waddr_next_xhdl80 := wrap_waddr_incr;    
                              WHEN "00000001" =>
                                       -- Wrap at every two locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(2 DOWNTO 0) = "100") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(2 DOWNTO 0) = "100")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000011" =>
                                       -- Wrap at every four locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(3 DOWNTO 0) = "1100") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(3 DOWNTO 0) = "1100")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000111" =>
                                       -- Wrap at every eight locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(4 DOWNTO 0) = "11100") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(4 DOWNTO 0) = "11100")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00001111" =>
                                       -- Wrap at every 16 locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(5 DOWNTO 0) = "111100") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(5 DOWNTO 0) = "111100")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN OTHERS  =>
                                       wrap_waddr_next_xhdl80 := wrap_waddr_next_r;    
                              
                           END CASE;
                        ELSIF ((AWBURST_slvif = "10" AND (AWSIZE_slvif = "001")) AND WRAP_SUPPORT /= 0) THEN
                           -- For Wrap burst
                           
                           CASE AWLEN_slvif IS
                              WHEN "00000000" =>
                                       -- no wrap                                       
                                       wrap_waddr_next_xhdl80 := wrap_waddr_incr;    
                              WHEN "00000001" =>
                                       -- Wrap at every two locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(1 DOWNTO 0) = "10") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(1 DOWNTO 0) = "10")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000011" =>
                                       -- Wrap at every four locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(2 DOWNTO 0) = "110") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(2 DOWNTO 0) = "110")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000111" =>
                                       -- Wrap at every eight locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(3 DOWNTO 0) = "1110") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(3 DOWNTO 0) = "1110")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00001111" =>
                                       -- Wrap at every 16 locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(4 DOWNTO 0) = "11110") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(4 DOWNTO 0) = "11110")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN OTHERS  =>
                                       wrap_waddr_next_xhdl80 := wrap_waddr_next_r;    
                              
                           END CASE;
                        ELSIF ((AWBURST_slvif = "10" AND (AWSIZE_slvif = "000")) AND WRAP_SUPPORT /= 0) THEN
                           -- For Wrap burst
                           
                           CASE AWLEN_slvif IS
                              WHEN "00000000" =>
                                       -- no wrap                                       
                                       wrap_waddr_next_xhdl80 := wrap_waddr_incr;    
                              WHEN "00000001" =>
                                       -- Wrap at every two locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(0) = '1') AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 1) & '0';
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(0) = '1')) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 1) & '0';
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000011" =>
                                       -- Wrap at every four locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(1 DOWNTO 0) = "11") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                          wr_wrap_boundary_xhdl79 := '1';    
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(1 DOWNTO 0) = "11")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00000111" =>
                                       -- Wrap at every eight locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(2 DOWNTO 0) = "111") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(2 DOWNTO 0) = "111")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN "00001111" =>
                                       -- Wrap at every 16 locations
                                       -- Roll-over when the wrap boundary is reached.
                                       
                                       IF ((CONV_STD_LOGIC(AWADDR_slvif(3 DOWNTO 0) = "1111") AND waddrchset_mc_r) = '1') THEN
                                          wrap_waddr_next_xhdl80 := AWADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                          wr_wrap_boundary_xhdl79 := '1';
                                       ELSE
                                          IF ((CONV_STD_LOGIC(waddr_sc_dummy(3 DOWNTO 0) = "1111")) = '1' AND WVALID_slvif = '1' AND wready_mc_xhdl2 = '1') THEN
                                             wrap_waddr_next_xhdl80 := waddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                             wr_wrap_boundary_xhdl79 := '1';    
                                          ELSE
                                             wrap_waddr_next_xhdl80 := wrap_waddr_plus;    
                                          END IF;
                                       END IF;
                              WHEN OTHERS  =>
                                       wrap_waddr_next_xhdl80 := wrap_waddr_next_r;    
                              
                           END CASE;
                        ELSE
                           wrap_waddr_next_xhdl80 := (OTHERS => '0');    
                        END IF;
                     END IF;
                  END IF;
                  wr_wrap_boundary <= wr_wrap_boundary_xhdl79;
                  wrap_waddr_next <= wrap_waddr_next_xhdl80;
               END PROCESS;

               -- Register the next wrap address on every sample of 
               -- WVALID_slvif & wready_mc.
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_waddr_calc <= (OTHERS => '0');    
                  --ELSE
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (WRAP_SUPPORT /= 0) THEN
                        -- For burst type = WRAP
                        
                        IF (wr_curr_state = WR_RESP_ST) THEN
                           wrap_waddr_calc <= (OTHERS => '0');    
                        ELSE
                           IF (set_aligned_done = '1') THEN
                              wrap_waddr_calc <= wrap_waddr_incr;    
                           ELSE
                              wrap_waddr_calc <= wrap_waddr_next;    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
               END PROCESS;

               -- Register the next wrap address on every sample of 
               -- WVALID_slvif & wready_mc.
               
	       -- Done for Performance
               PROCESS (wrap_waddr_calc, AWBURST_slvif)
               BEGIN
                  wrap_waddr <= (OTHERS => '0');    
                  IF (WRAP_SUPPORT = 1) THEN
                     IF ((AWBURST_slvif = "10")) THEN
                        -- For burst type = WRAP
                        wrap_waddr <= wrap_waddr_calc;    
                     END IF;
                  END IF;
               END PROCESS;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_waddr_incr_r <= (OTHERS => '0');    
                     wrap_waddr_next_r <= (OTHERS => '0');    
                     set_aligned_done_r <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wrap_waddr_incr_r <= wrap_waddr_incr;    
                     wrap_waddr_next_r <= wrap_waddr_next;    
                     set_aligned_done_r <= set_aligned_done;    
                  END IF;
               END PROCESS;

               -- Registered version
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     AWLEN_slvif_r <= "00000000";    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (set_aligned_done = '1') THEN
                        AWLEN_slvif_r <= AWLEN_slvif;    
                     END IF;
                  END IF;
               END PROCESS;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     ren_sc_xhdl20_d1 <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     ren_sc_xhdl20_d1 <= ren_sc_xhdl20;    
                  END IF;
               END PROCESS;
               -- --------------------------------------------------------------------------
               -- Generate the wrap address based on the write size (AWSIZE) and write 
               -- length (AWLEN)
               -- --------------------------------------------------------------------------
               -- Increment the start address using the number bytes for calculation of
               -- address.
               L81: IF (HIGH_PERF = 0) GENERATE   

               PROCESS (ARADDR_slvif,  
               wrap_raddr_incr_r, RREADY_slvif, wrap_raddr_calc, 
               rd_number_bytes, rd_aligned_done,   
               rd_curr_state, ren_sc_xhdl20_d1)
                  VARIABLE wrap_raddr_incr_xhdl81  : 
                  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
               BEGIN
                  wrap_raddr_incr_xhdl81 := wrap_raddr_incr_r;    
                  IF (WRAP_SUPPORT /= 0) THEN
                     wrap_raddr_incr_xhdl81 := wrap_raddr_incr_r;    
                     IF ((rd_curr_state = RD_DATA0_ST) AND rd_aligned_done = '0') THEN
                        wrap_raddr_incr_xhdl81 := ARADDR_slvif;    
                     ELSE
                        IF ((CONV_STD_LOGIC(rd_curr_state = RD_DATA_ST) AND ren_sc_xhdl20_d1) = '1') THEN
                           wrap_raddr_incr_xhdl81 := wrap_raddr_calc + rd_number_bytes;    
                        END IF;
                     END IF;
                  END IF;
                  wrap_raddr_incr <= wrap_raddr_incr_xhdl81;
               END PROCESS;

               END GENERATE L81;

               L811: IF (HIGH_PERF = 1) GENERATE   
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_incr <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (WRAP_SUPPORT /= 0) THEN
                        IF ((ARVALID = '1' AND arready_mc_xhdl3 = '1')) THEN
                           wrap_raddr_incr <= ARADDR + rd_number_bytes;    
                        ELSE
                           IF ((CONV_STD_LOGIC(rd_curr_state = RD_DATA0_ST) AND ren_sc_xhdl20) = '1') THEN
                              wrap_raddr_incr <= wrap_raddr_next + rd_number_bytes;    
                           ELSIF ((CONV_STD_LOGIC(rd_curr_state = RD_DATA_ST) AND ren_sc_xhdl20) = '1') THEN
                              wrap_raddr_incr <= wrap_raddr_next + rd_number_bytes;    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
               END PROCESS;

               END GENERATE L811;


               -- Calculate the next waddr for wrap transactions based 
               -- on the write burst length and the write burst type.
               
               PROCESS (rd_curr_state,ARLEN_slvif, wrap_raddr_calc, ARSIZE_slvif, wrap_raddr,ARADDR,ARADDR_slvif, wrap_raddr_plus,raddr_sc_dummy,
               ARBURST_slvif, wrap_raddr_incr,ren_sc_xhdl20,set_rdaligned_done,wrap_raddr_next_r)
                  VARIABLE wrap_raddr_next_xhdl82  : 
                  std_logic_vector(AXI4_AWIDTH - 1 DOWNTO 0);
               BEGIN
                  IF (rd_curr_state = RD_ADRLAT_ST) THEN
                     wrap_raddr_next_xhdl82 := ARADDR;    
                  ELSIF ((ARBURST_slvif = "10" AND ARSIZE_slvif = "011") AND WRAP_SUPPORT /= 0) THEN
                     -- For Wrap burst
                     
                     CASE ARLEN_slvif IS
                        WHEN "00000000" =>
                                 -- no wrap
                                 
                                 wrap_raddr_next_xhdl82 := wrap_raddr_incr;    
                        WHEN "00000001" =>
                                 -- Wrap at every two locations
                                 -- Roll-over when the wrap boundary is reached.
                                 
                                 IF (ARADDR_slvif(3 DOWNTO 0) = "1000" AND set_rdaligned_done = '1') THEN
                                    wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";  
                                 ELSIF (raddr_sc_dummy(3 DOWNTO 0) = "1000" AND ren_sc_xhdl20 = '1') THEN
                                    wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";  
                                 ELSE
                                    wrap_raddr_next_xhdl82 := wrap_raddr_plus;  
                                 END IF;
                        WHEN "00000011" =>
                                 -- Wrap at every four locations
                                 -- Roll-over when the wrap boundary is reached.
                                 
                                 IF (ARADDR_slvif(4 DOWNTO 0) = "11000" AND set_rdaligned_done = '1') THEN
                                    wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";  
                                 ELSIF (raddr_sc_dummy(4 DOWNTO 0) = "11000" AND ren_sc_xhdl20 = '1') THEN
                                    wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                 ELSE
                                    wrap_raddr_next_xhdl82 := wrap_raddr_plus;  
                                 END IF;
                        WHEN "00000111" =>
                                 -- Wrap at every eight locations
                                 -- Roll-over when the wrap boundary is reached.
                                 
                                 IF (ARADDR_slvif(5 DOWNTO 0) = "111000" AND set_rdaligned_done = '1') THEN
                                    wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 6) & "000000";  
                                 ELSIF (raddr_sc_dummy(5 DOWNTO 0) = "111000" AND ren_sc_xhdl20 = '1') THEN
                                    wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                 ELSE
                                    wrap_raddr_next_xhdl82 := wrap_raddr_plus;  
                                 END IF;
                        WHEN "00001111" =>
                                 -- Wrap at every 16 locations
                                 -- Roll-over when the wrap boundary is reached.
                                 
                                 IF (ARADDR_slvif(6 DOWNTO 0) = "1111000" AND set_rdaligned_done = '1') THEN
                                    wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 7) & "0000000";  
                                 ELSIF (raddr_sc_dummy(6 DOWNTO 0) = "1111000" AND ren_sc_xhdl20 = '1') THEN
                                    wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 7) & "0000000";
                                 ELSE
                                    wrap_raddr_next_xhdl82 := wrap_raddr_plus;  
                                 END IF;
                        WHEN OTHERS  =>
                                 wrap_raddr_next_xhdl82 := wrap_raddr_next_r;    
                        
                     END CASE;
                  ELSE
                     IF ((ARBURST_slvif = "10" AND (ARSIZE_slvif = "010")) AND WRAP_SUPPORT /= 0) THEN
                        -- For Wrap burst
                        
                        CASE ARLEN_slvif IS
                           WHEN "00000000" =>
                                    -- no wrap
                                    
                                    wrap_raddr_next_xhdl82 := wrap_raddr_incr;  
                           WHEN "00000001" =>
                                    -- Wrap at every two locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(2 DOWNTO 0) = "100" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";  
                                    ELSIF (raddr_sc_dummy(2 DOWNTO 0) = "100" AND ren_sc_xhdl20 = '1') THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000011" =>
                                    -- Wrap at every four locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(3 DOWNTO 0) = "1100" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";  
                                    ELSIF (raddr_sc_dummy(3 DOWNTO 0) = "1100" AND ren_sc_xhdl20 = '1') THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000111" =>
                                    -- Wrap at every eight locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(4 DOWNTO 0) = "11100" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";  
                                    ELSIF (raddr_sc_dummy(4 DOWNTO 0) = "11100" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00001111" =>
                                    -- Wrap at every 16 locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(5 DOWNTO 0) = "111100" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 6) & "000000";  
                                    ELSIF (raddr_sc_dummy(5 DOWNTO 0) = "111100" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 6) & "000000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN OTHERS  =>
                                    wrap_raddr_next_xhdl82 := wrap_raddr_next_r;  
                           
                        END CASE;
                     ELSIF ((ARBURST_slvif = "10" AND (ARSIZE_slvif = "001")) AND WRAP_SUPPORT /= 0) THEN
                        -- For Wrap burst
                        
                        CASE ARLEN_slvif IS
                           WHEN "00000000" =>
                                    -- no wrap
                                    
                                    wrap_raddr_next_xhdl82 := wrap_raddr_incr;  
                           WHEN "00000001" =>
                                    -- Wrap at every two locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(1 DOWNTO 0) = "10" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 2) & "00";  
                                    ELSIF (raddr_sc_dummy(1 DOWNTO 0) = "10" AND ren_sc_xhdl20 = '1') THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000011" =>
                                    -- Wrap at every four locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(2 DOWNTO 0) = "110" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";  
                                    ELSIF (raddr_sc_dummy(2 DOWNTO 0) = "110" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000111" =>
                                    -- Wrap at every eight locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(3 DOWNTO 0) = "1110" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";  
                                    ELSIF (raddr_sc_dummy(3 DOWNTO 0) = "1110" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00001111" =>
                                    -- Wrap at every 16 locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(4 DOWNTO 0) = "11110" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 5) & "00000";  
                                    ELSIF (raddr_sc_dummy(4 DOWNTO 0) = "11110" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 5) & "00000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN OTHERS  =>
                                    wrap_raddr_next_xhdl82 := wrap_raddr_next_r;  
                           
                        END CASE;
                     ELSIF ((ARBURST_slvif = "10" AND (ARSIZE_slvif = "000")) AND WRAP_SUPPORT /= 0) THEN
                        -- For Wrap burst
                        
                        CASE ARLEN_slvif IS
                           WHEN "00000000" =>
                                    -- no wrap
                                    
                                    wrap_raddr_next_xhdl82 := wrap_raddr_incr;  
                           WHEN "00000001" =>
                                    -- Wrap at every two locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(0) = '1' AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 1) & '0';  
                                    ELSIF (raddr_sc_dummy(0) = '1' AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 1) & '0';
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000011" =>
                                    -- Wrap at every four locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(1 DOWNTO 0) = "11" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 2) & "00";  
                                    ELSIF (raddr_sc_dummy(1 DOWNTO 0) = "11" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 2) & "00";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00000111" =>
                                    -- Wrap at every eight locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(2 DOWNTO 0) = "111" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 3) & "000";  
                                    ELSIF (raddr_sc_dummy(2 DOWNTO 0) = "111" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 3) & "000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN "00001111" =>
                                    -- Wrap at every 16 locations
                                    -- Roll-over when the wrap boundary is reached.
                                    
                                    IF (ARADDR_slvif(3 DOWNTO 0) = "1111" AND set_rdaligned_done = '1') THEN
                                       wrap_raddr_next_xhdl82 := ARADDR_slvif(AXI4_AWIDTH-1 DOWNTO 4) & "0000";  
                                    ELSIF (raddr_sc_dummy(3 DOWNTO 0) = "1111" AND ren_sc_xhdl20 = '1') 
                                    THEN
                                       wrap_raddr_next_xhdl82 := raddr_sc_dummy(AXI4_AWIDTH-1 DOWNTO 4) & "0000";
                                    ELSE
                                       wrap_raddr_next_xhdl82 := wrap_raddr_plus;    
                                    END IF;
                           WHEN OTHERS  =>
                                    wrap_raddr_next_xhdl82 := wrap_raddr_next_r;  
                           
                        END CASE;
                     ELSE
                        wrap_raddr_next_xhdl82 := (OTHERS => '0');    
                     END IF;
                  END IF;
                  wrap_raddr_next <= wrap_raddr_next_xhdl82;
               END PROCESS;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_next_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wrap_raddr_next_r <= wrap_raddr_next;    
		  END IF;
               END PROCESS;

               -- Register the next wrap address on every sample of 
               -- WVALID_slvif & wready_mc.
               
               L91: IF (HIGH_PERF = 0) GENERATE   
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_calc <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (WRAP_SUPPORT /= 0) THEN
                        IF (rd_curr_state = RD_LAST_ST) THEN
                           wrap_raddr_calc <= (OTHERS => '0');    
                        ELSE
                           IF ((rd_curr_state = RD_DATA0_ST) AND rd_aligned_done = '0') THEN
                              wrap_raddr_calc <= ARADDR_slvif;    
                           ELSE
                              IF (((CONV_STD_LOGIC(rd_curr_state = RD_DATA_ST) 
                              AND ren_active) AND RREADY_slvif) = '1') THEN
                                 wrap_raddr_calc <= wrap_raddr_next;    
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
               END PROCESS;
               END GENERATE L91;

               L92: IF (HIGH_PERF = 1) GENERATE   
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_calc <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (WRAP_SUPPORT /= 0) THEN
                        IF (rd_curr_state = RD_LAST_ST) THEN
                           wrap_raddr_calc <= (OTHERS => '0');    
                        ELSE
                           IF (RREADY_slvif = '1' AND ren_sc_xhdl20 = '1') THEN
                              wrap_raddr_calc <= wrap_raddr_next;    
                           ELSIF (ARVALID = '1' AND arready_mc_xhdl3 = '1') THEN
                              wrap_raddr_calc <= ARADDR;    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
               END PROCESS;
               END GENERATE L92;

               L93: IF (HIGH_PERF = 0) GENERATE   
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (WRAP_SUPPORT = 1) THEN
                     IF (ARBURST_slvif = "10") THEN
                        -- For burst type = WRAP
                        wrap_raddr <= wrap_raddr_calc;    
                     END IF;
                     END IF;
                  END IF;
               END PROCESS;
               END GENERATE L93;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wrap_raddr_r <= wrap_raddr;    
		  END IF;
               END PROCESS;

               L94: IF (HIGH_PERF = 1) GENERATE   
               PROCESS (wrap_raddr_r, ARBURST_slvif,ARADDR_slvif)
               BEGIN
                   wrap_raddr <= wrap_raddr_r;    
                   IF (WRAP_SUPPORT = 1) THEN
                     IF (ARBURST_slvif = "10") THEN
                        -- For burst type = WRAP
                        wrap_raddr <= ARADDR_slvif;    
                     END IF;
                   END IF;
               END PROCESS;
               END GENERATE L94;

               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     wrap_raddr_incr_r <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     wrap_raddr_incr_r <= wrap_raddr_incr;    
                  END IF;
               END PROCESS;

               -- Registered version
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     ARLEN_slvif_r <= "00000000";    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF ((rd_curr_state = RD_DATA0_ST) AND rd_aligned_done = 
                     '0') THEN
                        ARLEN_slvif_r <= ARLEN_slvif;    
                     END IF;
                  END IF;
               END PROCESS;

               -- Registered signals
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     rd_sram_xvalid_r <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     rd_sram_xvalid_r <= rd_sram_xvalid;    
                  END IF;
               END PROCESS;

               -- Used to determine the state machine movement from
               -- read data state to read wait state.
               -- It is asserted when the read is sampled.
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     read_sampled <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     read_sampled <= rvalid_mc_xhdl9 AND RREADY_slvif;    
                  END IF;
               END PROCESS;

               -- Registered ren_sc
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     ren_sc_r <= '0';    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (ARSIZE_slvif = "011") THEN
                        ren_sc_r <= ren_sc_xhdl20;    
                     ELSE
                        ren_sc_r <= '0';    
                     END IF;
                  END IF;
               END PROCESS;

               -- Latch the second 40-bit read data from the memory 
               -- when the second read enable is asserted. This is
               -- used to form the 64-bit read data RDATA on the AXI4
               -- interface.
               
               PROCESS (ACLK, ARESETN)
               BEGIN
                  IF (ARESETN = '0') THEN
                     rdata_sc_lat <= (OTHERS => '0');    
                  ELSIF (ACLK'EVENT AND ACLK = '1') THEN
                     IF (ren_sc_xhdl20 = '1' AND ren_sc_d1 = '1') THEN
                        rdata_sc_lat <= rdata_sc;    
                     END IF;
                  END IF;
               END PROCESS;

END ARCHITECTURE trans;



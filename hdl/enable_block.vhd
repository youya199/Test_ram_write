--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: write_en.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG1152>
-- Author: <Yan Gao>
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY write_en IS
   PORT(
      clk: IN STD_LOGIC;
      reset_n: IN STD_LOGIC;
      frame_start: IN STD_LOGIC;
      frame_end: IN STD_LOGIC;
      line_start: IN STD_LOGIC;
      line_end: IN STD_LOGIC;
      line_valid: IN STD_LOGIC;
      EN: OUT STD_LOGIC
      );
END write_en;
ARCHITECTURE rtl OF write_en IS
   TYPE Tstate IS (pending, in_frame, working_inLine);
   SIGNAL state: Tstate;
   SIGNAL next_state: Tstate;
BEGIN
   PROCESS(clk, reset_n)
   BEGIN
      IF reset_n = '0' THEN
            state <=pending;
      ELSIF rising_edge(clk) THEN
            state <= next_state;
      END IF;
   END PROCESS;
PROCESS (state, frame_start, frame_end, line_start, line_end, line_valid)
   BEGIN
      CASE state IS
         WHEN pending =>
            IF frame_start = '1' THEN
                next_state <= in_frame;
            END IF;
            EN <= '0';
            
         WHEN in_frame =>
            IF line_start = '1' THEN
                next_state <= working_inLine;
                EN <= line_valid;    
            ELSIF frame_end = '1' THEN
                next_state <= pending;
                EN <= '0';            
            ELSE
                EN <= '0';            
            END IF;
            
         WHEN working_inLine =>
            IF line_end = '1' THEN
                next_state <= in_frame;
            END IF;
            EN <= line_valid;    
          
              
      END CASE;
   END PROCESS;
END rtl;
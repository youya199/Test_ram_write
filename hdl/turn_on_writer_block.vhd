--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: turn_on_writer_block.vhd
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
ENTITY turn_on_writer_block IS
   PORT(
      clk: IN STD_LOGIC;
      reset_n: IN STD_LOGIC;
      t_o_w_SC: IN STD_LOGIC;
      frame_start: IN STD_LOGIC;
      turn_on_writer: OUT STD_LOGIC
      );
END turn_on_writer_block;
ARCHITECTURE rtl OF turn_on_writer_block IS
   TYPE Tstate IS (pending, waitFS, sendOut);
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
PROCESS (state, t_o_w_SC, frame_start)
   BEGIN
      CASE state IS
         WHEN pending =>
            IF t_o_w_SC = '1' THEN
                next_state <= waitFS;
            END IF;
            turn_on_writer <= '0';
            
         WHEN waitFS =>
            IF frame_start = '1' THEN
                next_state <= sendOut;
            turn_on_writer <= '1';              
            else
            turn_on_writer <= '0';            
            END IF;

         WHEN sendOut =>
            next_state <= pending;
            turn_on_writer <= '1';              
      END CASE;
   END PROCESS;
END rtl;
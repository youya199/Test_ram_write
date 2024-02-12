--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: combine.vhd
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
ENTITY combine IS
   PORT(
      clk: IN STD_LOGIC;
      reset_n: IN STD_LOGIC;
      turn_on_wrtier: IN STD_LOGIC;
      EN: IN STD_LOGIC;
      combined_EN: OUT STD_LOGIC
      );
END combine;
ARCHITECTURE rtl OF combine IS
   TYPE Tstate IS (pending, working);
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
PROCESS (state, turn_on_wrtier, EN)
   BEGIN
      CASE state IS
         WHEN pending =>
            IF turn_on_wrtier = '1' THEN
                next_state <= working;
                combined_EN <= EN;
            ELSE
                combined_EN <= '0';
            END IF;
         WHEN working =>
            combined_EN <= EN;
      END CASE;
   END PROCESS;
END rtl;
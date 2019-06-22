-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 222 10/21/2009 SJ Full Version"

-- DATE "09/29/2012 19:38:32"

-- 
-- Device: Altera EPM7032SLC44-5 Package PLCC44
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAX;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAX.MAX_COMPONENTS.ALL;

ENTITY 	Lab1_blocked IS
    PORT (
	RG : OUT std_logic_vector(12 DOWNTO 0);
	F : IN std_logic_vector(2 DOWNTO 0);
	C : IN std_logic;
	D : IN std_logic_vector(12 DOWNTO 0)
	);
END Lab1_blocked;

-- Design Ports Information
-- F[2]	=>  Location: PIN_16
-- F[1]	=>  Location: PIN_18
-- F[0]	=>  Location: PIN_20
-- C	=>  Location: PIN_25
-- D[12]	=>  Location: PIN_1
-- D[11]	=>  Location: PIN_9
-- D[10]	=>  Location: PIN_36
-- D[9]	=>  Location: PIN_39
-- D[8]	=>  Location: PIN_44
-- D[7]	=>  Location: PIN_27
-- D[6]	=>  Location: PIN_29
-- D[5]	=>  Location: PIN_31
-- D[4]	=>  Location: PIN_11
-- D[3]	=>  Location: PIN_2
-- D[2]	=>  Location: PIN_6
-- D[1]	=>  Location: PIN_4
-- D[0]	=>  Location: PIN_41
-- RG[0]	=>  Location: PIN_33
-- RG[1]	=>  Location: PIN_40
-- RG[2]	=>  Location: PIN_37
-- RG[3]	=>  Location: PIN_34
-- RG[4]	=>  Location: PIN_28
-- RG[5]	=>  Location: PIN_8
-- RG[6]	=>  Location: PIN_5
-- RG[7]	=>  Location: PIN_12
-- RG[8]	=>  Location: PIN_17
-- RG[9]	=>  Location: PIN_19
-- RG[10]	=>  Location: PIN_21
-- RG[11]	=>  Location: PIN_14
-- RG[12]	=>  Location: PIN_26

ARCHITECTURE structure OF Lab1_blocked IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_RG : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_F : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_C : std_logic;
SIGNAL ww_D : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst|467_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|467_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst1|inst1|inst11~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~9_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst|inst8~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst1|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst4|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst2|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst3|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst5|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst6|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst7|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst8|inst8~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst9|inst8~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst|inst10|inst8~11_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst7~14_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \inst7~28_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \C~dataout\ : std_logic;
SIGNAL \inst7~14_dataout\ : std_logic;
SIGNAL \inst1|inst|467~dataout\ : std_logic;
SIGNAL \inst1|inst1|inst11~11_pexpout\ : std_logic;
SIGNAL \inst1|inst1|467~dataout\ : std_logic;
SIGNAL \inst|inst|inst8~9_pexpout\ : std_logic;
SIGNAL \inst|inst|inst8~11_pexpout\ : std_logic;
SIGNAL \inst|inst|inst10~dataout\ : std_logic;
SIGNAL \inst|inst1|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst1|inst10~dataout\ : std_logic;
SIGNAL \inst|inst4|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst4|inst10~dataout\ : std_logic;
SIGNAL \inst|inst2|inst8~10_pexpout\ : std_logic;
SIGNAL \inst7~28_dataout\ : std_logic;
SIGNAL \inst|inst2|inst10~dataout\ : std_logic;
SIGNAL \inst|inst3|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst3|inst10~dataout\ : std_logic;
SIGNAL \inst|inst5|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst5|inst10~dataout\ : std_logic;
SIGNAL \inst|inst6|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst6|inst10~dataout\ : std_logic;
SIGNAL \inst|inst7|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst7|inst10~dataout\ : std_logic;
SIGNAL \inst|inst8|inst8~10_pexpout\ : std_logic;
SIGNAL \inst|inst8|inst10~dataout\ : std_logic;
SIGNAL \inst|inst9|inst8~11_pexpout\ : std_logic;
SIGNAL \inst|inst9|inst10~dataout\ : std_logic;
SIGNAL \inst|inst10|inst8~11_pexpout\ : std_logic;
SIGNAL \inst|inst10|inst10~dataout\ : std_logic;
SIGNAL \D~dataout\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \F~dataout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst1|inst|ALT_INV_467~dataout\ : std_logic;
SIGNAL \inst1|inst1|ALT_INV_467~dataout\ : std_logic;
SIGNAL \inst|inst|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst1|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst4|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst2|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst3|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst5|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst6|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst7|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst8|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst9|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \inst|inst10|ALT_INV_inst10~dataout\ : std_logic;
SIGNAL \ALT_INV_F~dataout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_D~dataout\ : std_logic_vector(12 DOWNTO 3);

BEGIN

RG <= ww_RG;
ww_F <= F;
ww_C <= C;
ww_D <= D;

\inst1|inst|467_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & NOT \F~dataout\(0) & NOT \F~dataout\(2));

\inst1|inst|467_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \D~dataout\(0));

\inst1|inst|467_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst|467_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst|467_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2));

\inst1|inst|467_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst|467_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst|467_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst1|inst|467_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst1|inst|467_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst1|inst|467_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|467_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \inst1|inst1|467~dataout\ & NOT \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|467_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \inst1|inst1|467~dataout\ & NOT \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|467_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|467_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|467_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst|467~dataout\ & \inst1|inst1|467~dataout\ & NOT \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|467_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|467_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|467_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst1|inst1|467_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst1|inst1|467_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst1|inst1|467_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst1|467~dataout\ & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \inst|inst|inst10~dataout\ & NOT \F~dataout\(2));

\inst|inst|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \inst|inst|inst10~dataout\ & NOT \F~dataout\(2) & \F~dataout\(1));

\inst|inst|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst1|467~dataout\ & NOT \inst|inst|inst10~dataout\ & NOT \F~dataout\(2) & \F~dataout\(1));

\inst|inst|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst|inst|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst1|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst1|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \F~dataout\(1));

\inst|inst1|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst|inst1|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst1|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst1|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst4|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst4|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \F~dataout\(1));

\inst|inst4|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst|inst4|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst4|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst4|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst2|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst2|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \F~dataout\(1));

\inst|inst2|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst2|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst2|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst2|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & 
\inst1|inst1|467~dataout\);

\inst|inst3|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst3|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \F~dataout\(1));

\inst|inst3|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst3|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst3|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst3|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\
& \inst1|inst1|467~dataout\);

\inst|inst5|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst1|inst1|467~dataout\ & 
\F~dataout\(1));

\inst|inst5|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\
& \F~dataout\(1));

\inst|inst5|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst5|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst5|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst5|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst6|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\ & 
\inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst6|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \F~dataout\(1));

\inst|inst6|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst6|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst6|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst6|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst7|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\ & 
\inst|inst6|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst7|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \F~dataout\(1));

\inst|inst7|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst7|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst7|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst7|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst8|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\
& \inst|inst7|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst8|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \F~dataout\(1));

\inst|inst8|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst8|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst8|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst8|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst9|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & 
\inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst9|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & 
\inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \F~dataout\(1));

\inst|inst9|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~28_dataout\ & \C~dataout\);

\inst|inst9|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst9|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst9|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\
& \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \inst|inst9|inst10~dataout\ & \inst1|inst1|467~dataout\);

\inst|inst10|inst10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\ & \inst|inst6|inst10~dataout\ & 
\inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \inst|inst9|inst10~dataout\ & \inst1|inst1|467~dataout\ & \F~dataout\(1));

\inst|inst10|inst10_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & NOT \F~dataout\(2) & \inst|inst|inst10~dataout\ & \inst|inst1|inst10~dataout\ & \inst|inst4|inst10~dataout\ & \inst|inst2|inst10~dataout\ & \inst|inst3|inst10~dataout\ & \inst|inst5|inst10~dataout\
& \inst|inst6|inst10~dataout\ & \inst|inst7|inst10~dataout\ & \inst|inst8|inst10~dataout\ & \inst|inst9|inst10~dataout\ & \F~dataout\(1));

\inst|inst10|inst10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst10_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst7~14_dataout\ & \C~dataout\);

\inst|inst10|inst10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst10|inst10_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \F~dataout\(2));

\inst|inst10|inst10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \D~dataout\(1));

\inst1|inst1|inst11~11_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & NOT \inst1|inst1|467~dataout\ & \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|inst11~11_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst|467~dataout\ & NOT \inst1|inst1|467~dataout\ & \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|inst11~11_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \inst1|inst|467~dataout\ & \F~dataout\(0) & \inst1|inst1|467~dataout\ & \F~dataout\(1) & NOT \F~dataout\(2));

\inst1|inst1|inst11~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst1|inst1|inst11~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst1|inst1|inst11~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \D~dataout\(2));

\inst|inst|inst8~9_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst|inst8~9_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~9_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~11_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst|467~dataout\ & NOT \inst1|inst1|467~dataout\ & \inst|inst|inst10~dataout\ & NOT \F~dataout\(2));

\inst|inst|inst8~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst1|467~dataout\ & \inst|inst|inst10~dataout\ & NOT \F~dataout\(2) & NOT \F~dataout\(1));

\inst|inst|inst8~11_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & \inst|inst|inst10~dataout\ & NOT \F~dataout\(2) & NOT \F~dataout\(1));

\inst|inst|inst8~11_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \inst1|inst|467~dataout\ & \inst|inst|inst10~dataout\ & NOT \F~dataout\(2) & NOT \F~dataout\(1));

\inst|inst|inst8~11_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \F~dataout\(0) & NOT \inst1|inst1|467~dataout\ & \inst|inst|inst10~dataout\ & NOT \F~dataout\(2));

\inst|inst|inst8~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst|inst8~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst|inst8~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst1|inst10~dataout\ & \D~dataout\(3));

\inst|inst1|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst1|inst10~dataout\ & NOT \D~dataout\(3));

\inst|inst1|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst1|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst1|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst4|inst10~dataout\ & \D~dataout\(4));

\inst|inst4|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst4|inst10~dataout\ & NOT \D~dataout\(4));

\inst|inst4|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst4|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst4|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst2|inst10~dataout\ & \D~dataout\(5));

\inst|inst2|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst2|inst10~dataout\ & NOT \D~dataout\(5));

\inst|inst2|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst2|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst2|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst3|inst10~dataout\ & \D~dataout\(6));

\inst|inst3|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst3|inst10~dataout\ & NOT \D~dataout\(6));

\inst|inst3|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst3|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst3|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst5|inst10~dataout\ & \D~dataout\(7));

\inst|inst5|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst5|inst10~dataout\ & NOT \D~dataout\(7));

\inst|inst5|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst5|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst5|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst6|inst10~dataout\ & \D~dataout\(8));

\inst|inst6|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst6|inst10~dataout\ & NOT \D~dataout\(8));

\inst|inst6|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst6|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst6|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst7|inst10~dataout\ & \D~dataout\(9));

\inst|inst7|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst7|inst10~dataout\ & NOT \D~dataout\(9));

\inst|inst7|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst7|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst7|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst8|inst10~dataout\ & \D~dataout\(10));

\inst|inst8|inst8~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst8|inst10~dataout\ & NOT \D~dataout\(10));

\inst|inst8|inst8~10_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst8|inst8~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst8|inst8~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst9|inst10~dataout\ & \D~dataout\(11));

\inst|inst9|inst8~11_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst9|inst10~dataout\ & NOT \D~dataout\(11));

\inst|inst9|inst8~11_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst9|inst8~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst9|inst8~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & NOT \inst|inst10|inst10~dataout\ & \D~dataout\(12));

\inst|inst10|inst8~11_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(2) & \inst|inst10|inst10~dataout\ & NOT \D~dataout\(12));

\inst|inst10|inst8~11_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst|inst10|inst8~11_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst|inst10|inst8~11_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\inst7~14_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(1) & \F~dataout\(2));

\inst7~28_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \F~dataout\(1) & \F~dataout\(2));
\inst1|inst|ALT_INV_467~dataout\ <= NOT \inst1|inst|467~dataout\;
\inst1|inst1|ALT_INV_467~dataout\ <= NOT \inst1|inst1|467~dataout\;
\inst|inst|ALT_INV_inst10~dataout\ <= NOT \inst|inst|inst10~dataout\;
\inst|inst1|ALT_INV_inst10~dataout\ <= NOT \inst|inst1|inst10~dataout\;
\inst|inst4|ALT_INV_inst10~dataout\ <= NOT \inst|inst4|inst10~dataout\;
\inst|inst2|ALT_INV_inst10~dataout\ <= NOT \inst|inst2|inst10~dataout\;
\inst|inst3|ALT_INV_inst10~dataout\ <= NOT \inst|inst3|inst10~dataout\;
\inst|inst5|ALT_INV_inst10~dataout\ <= NOT \inst|inst5|inst10~dataout\;
\inst|inst6|ALT_INV_inst10~dataout\ <= NOT \inst|inst6|inst10~dataout\;
\inst|inst7|ALT_INV_inst10~dataout\ <= NOT \inst|inst7|inst10~dataout\;
\inst|inst8|ALT_INV_inst10~dataout\ <= NOT \inst|inst8|inst10~dataout\;
\inst|inst9|ALT_INV_inst10~dataout\ <= NOT \inst|inst9|inst10~dataout\;
\inst|inst10|ALT_INV_inst10~dataout\ <= NOT \inst|inst10|inst10~dataout\;
\ALT_INV_F~dataout\(2) <= NOT \F~dataout\(2);
\ALT_INV_F~dataout\(1) <= NOT \F~dataout\(1);
\ALT_INV_F~dataout\(0) <= NOT \F~dataout\(0);
\ALT_INV_D~dataout\(12) <= NOT \D~dataout\(12);
\ALT_INV_D~dataout\(11) <= NOT \D~dataout\(11);
\ALT_INV_D~dataout\(10) <= NOT \D~dataout\(10);
\ALT_INV_D~dataout\(9) <= NOT \D~dataout\(9);
\ALT_INV_D~dataout\(8) <= NOT \D~dataout\(8);
\ALT_INV_D~dataout\(7) <= NOT \D~dataout\(7);
\ALT_INV_D~dataout\(6) <= NOT \D~dataout\(6);
\ALT_INV_D~dataout\(5) <= NOT \D~dataout\(5);
\ALT_INV_D~dataout\(4) <= NOT \D~dataout\(4);
\ALT_INV_D~dataout\(3) <= NOT \D~dataout\(3);

-- Location: PIN_41
\D[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(0),
	dataout => \D~dataout\(0));

-- Location: PIN_16
\F[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_F(2),
	dataout => \F~dataout\(2));

-- Location: PIN_20
\F[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_F(0),
	dataout => \F~dataout\(0));

-- Location: PIN_25
\C~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_C,
	dataout => \C~dataout\);

-- Location: PIN_18
\F[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_F(1),
	dataout => \F~dataout\(1));

-- Location: SEXP17
\inst7~14\ : max_sexp
PORT MAP (
	datain => \inst7~14_datain_bus\,
	dataout => \inst7~14_dataout\);

-- Location: LC24
\inst1|inst|467\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst1|inst|467_pterm0_bus\,
	pterm1 => \inst1|inst|467_pterm1_bus\,
	pterm2 => \inst1|inst|467_pterm2_bus\,
	pterm3 => \inst1|inst|467_pterm3_bus\,
	pterm4 => \inst1|inst|467_pterm4_bus\,
	pterm5 => \inst1|inst|467_pterm5_bus\,
	pxor => \inst1|inst|467_pxor_bus\,
	pclk => \inst1|inst|467_pclk_bus\,
	papre => \inst1|inst|467_papre_bus\,
	paclr => \inst1|inst|467_paclr_bus\,
	pena => \inst1|inst|467_pena_bus\,
	dataout => \inst1|inst|467~dataout\);

-- Location: PIN_4
\D[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(1),
	dataout => \D~dataout\(1));

-- Location: LC17
\inst1|inst1|inst11~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst1|inst1|inst11~11_pterm0_bus\,
	pterm1 => \inst1|inst1|inst11~11_pterm1_bus\,
	pterm2 => \inst1|inst1|inst11~11_pterm2_bus\,
	pterm3 => \inst1|inst1|inst11~11_pterm3_bus\,
	pterm4 => \inst1|inst1|inst11~11_pterm4_bus\,
	pterm5 => \inst1|inst1|inst11~11_pterm5_bus\,
	pxor => \inst1|inst1|inst11~11_pxor_bus\,
	pclk => \inst1|inst1|inst11~11_pclk_bus\,
	papre => \inst1|inst1|inst11~11_papre_bus\,
	paclr => \inst1|inst1|inst11~11_paclr_bus\,
	pena => \inst1|inst1|inst11~11_pena_bus\,
	pexpout => \inst1|inst1|inst11~11_pexpout\);

-- Location: LC18
\inst1|inst1|467\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst1|inst1|inst11~11_pexpout\,
	pterm0 => \inst1|inst1|467_pterm0_bus\,
	pterm1 => \inst1|inst1|467_pterm1_bus\,
	pterm2 => \inst1|inst1|467_pterm2_bus\,
	pterm3 => \inst1|inst1|467_pterm3_bus\,
	pterm4 => \inst1|inst1|467_pterm4_bus\,
	pterm5 => \inst1|inst1|467_pterm5_bus\,
	pxor => \inst1|inst1|467_pxor_bus\,
	pclk => \inst1|inst1|467_pclk_bus\,
	papre => \inst1|inst1|467_papre_bus\,
	paclr => \inst1|inst1|467_paclr_bus\,
	pena => \inst1|inst1|467_pena_bus\,
	dataout => \inst1|inst1|467~dataout\);

-- Location: PIN_6
\D[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(2),
	dataout => \D~dataout\(2));

-- Location: LC19
\inst|inst|inst8~9\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst|inst8~9_pterm0_bus\,
	pterm1 => \inst|inst|inst8~9_pterm1_bus\,
	pterm2 => \inst|inst|inst8~9_pterm2_bus\,
	pterm3 => \inst|inst|inst8~9_pterm3_bus\,
	pterm4 => \inst|inst|inst8~9_pterm4_bus\,
	pterm5 => \inst|inst|inst8~9_pterm5_bus\,
	pxor => \inst|inst|inst8~9_pxor_bus\,
	pclk => \inst|inst|inst8~9_pclk_bus\,
	papre => \inst|inst|inst8~9_papre_bus\,
	paclr => \inst|inst|inst8~9_paclr_bus\,
	pena => \inst|inst|inst8~9_pena_bus\,
	pexpout => \inst|inst|inst8~9_pexpout\);

-- Location: LC20
\inst|inst|inst8~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst|inst8~9_pexpout\,
	pterm0 => \inst|inst|inst8~11_pterm0_bus\,
	pterm1 => \inst|inst|inst8~11_pterm1_bus\,
	pterm2 => \inst|inst|inst8~11_pterm2_bus\,
	pterm3 => \inst|inst|inst8~11_pterm3_bus\,
	pterm4 => \inst|inst|inst8~11_pterm4_bus\,
	pterm5 => \inst|inst|inst8~11_pterm5_bus\,
	pxor => \inst|inst|inst8~11_pxor_bus\,
	pclk => \inst|inst|inst8~11_pclk_bus\,
	papre => \inst|inst|inst8~11_papre_bus\,
	paclr => \inst|inst|inst8~11_paclr_bus\,
	pena => \inst|inst|inst8~11_pena_bus\,
	pexpout => \inst|inst|inst8~11_pexpout\);

-- Location: LC21
\inst|inst|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst|inst8~11_pexpout\,
	pterm0 => \inst|inst|inst10_pterm0_bus\,
	pterm1 => \inst|inst|inst10_pterm1_bus\,
	pterm2 => \inst|inst|inst10_pterm2_bus\,
	pterm3 => \inst|inst|inst10_pterm3_bus\,
	pterm4 => \inst|inst|inst10_pterm4_bus\,
	pterm5 => \inst|inst|inst10_pterm5_bus\,
	pxor => \inst|inst|inst10_pxor_bus\,
	pclk => \inst|inst|inst10_pclk_bus\,
	papre => \inst|inst|inst10_papre_bus\,
	paclr => \inst|inst|inst10_paclr_bus\,
	pena => \inst|inst|inst10_pena_bus\,
	dataout => \inst|inst|inst10~dataout\);

-- Location: PIN_2
\D[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(3),
	dataout => \D~dataout\(3));

-- Location: LC22
\inst|inst1|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst1|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst1|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst1|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst1|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst1|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst1|inst8~10_pterm5_bus\,
	pxor => \inst|inst1|inst8~10_pxor_bus\,
	pclk => \inst|inst1|inst8~10_pclk_bus\,
	papre => \inst|inst1|inst8~10_papre_bus\,
	paclr => \inst|inst1|inst8~10_paclr_bus\,
	pena => \inst|inst1|inst8~10_pena_bus\,
	pexpout => \inst|inst1|inst8~10_pexpout\);

-- Location: LC23
\inst|inst1|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst1|inst8~10_pexpout\,
	pterm0 => \inst|inst1|inst10_pterm0_bus\,
	pterm1 => \inst|inst1|inst10_pterm1_bus\,
	pterm2 => \inst|inst1|inst10_pterm2_bus\,
	pterm3 => \inst|inst1|inst10_pterm3_bus\,
	pterm4 => \inst|inst1|inst10_pterm4_bus\,
	pterm5 => \inst|inst1|inst10_pterm5_bus\,
	pxor => \inst|inst1|inst10_pxor_bus\,
	pclk => \inst|inst1|inst10_pclk_bus\,
	papre => \inst|inst1|inst10_papre_bus\,
	paclr => \inst|inst1|inst10_paclr_bus\,
	pena => \inst|inst1|inst10_pena_bus\,
	dataout => \inst|inst1|inst10~dataout\);

-- Location: PIN_11
\D[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(4),
	dataout => \D~dataout\(4));

-- Location: LC27
\inst|inst4|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst4|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst4|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst4|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst4|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst4|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst4|inst8~10_pterm5_bus\,
	pxor => \inst|inst4|inst8~10_pxor_bus\,
	pclk => \inst|inst4|inst8~10_pclk_bus\,
	papre => \inst|inst4|inst8~10_papre_bus\,
	paclr => \inst|inst4|inst8~10_paclr_bus\,
	pena => \inst|inst4|inst8~10_pena_bus\,
	pexpout => \inst|inst4|inst8~10_pexpout\);

-- Location: LC28
\inst|inst4|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst4|inst8~10_pexpout\,
	pterm0 => \inst|inst4|inst10_pterm0_bus\,
	pterm1 => \inst|inst4|inst10_pterm1_bus\,
	pterm2 => \inst|inst4|inst10_pterm2_bus\,
	pterm3 => \inst|inst4|inst10_pterm3_bus\,
	pterm4 => \inst|inst4|inst10_pterm4_bus\,
	pterm5 => \inst|inst4|inst10_pterm5_bus\,
	pxor => \inst|inst4|inst10_pxor_bus\,
	pclk => \inst|inst4|inst10_pclk_bus\,
	papre => \inst|inst4|inst10_papre_bus\,
	paclr => \inst|inst4|inst10_paclr_bus\,
	pena => \inst|inst4|inst10_pena_bus\,
	dataout => \inst|inst4|inst10~dataout\);

-- Location: PIN_31
\D[5]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(5),
	dataout => \D~dataout\(5));

-- Location: LC4
\inst|inst2|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst2|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst2|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst2|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst2|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst2|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst2|inst8~10_pterm5_bus\,
	pxor => \inst|inst2|inst8~10_pxor_bus\,
	pclk => \inst|inst2|inst8~10_pclk_bus\,
	papre => \inst|inst2|inst8~10_papre_bus\,
	paclr => \inst|inst2|inst8~10_paclr_bus\,
	pena => \inst|inst2|inst8~10_pena_bus\,
	pexpout => \inst|inst2|inst8~10_pexpout\);

-- Location: SEXP1
\inst7~28\ : max_sexp
PORT MAP (
	datain => \inst7~28_datain_bus\,
	dataout => \inst7~28_dataout\);

-- Location: LC5
\inst|inst2|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst2|inst8~10_pexpout\,
	pterm0 => \inst|inst2|inst10_pterm0_bus\,
	pterm1 => \inst|inst2|inst10_pterm1_bus\,
	pterm2 => \inst|inst2|inst10_pterm2_bus\,
	pterm3 => \inst|inst2|inst10_pterm3_bus\,
	pterm4 => \inst|inst2|inst10_pterm4_bus\,
	pterm5 => \inst|inst2|inst10_pterm5_bus\,
	pxor => \inst|inst2|inst10_pxor_bus\,
	pclk => \inst|inst2|inst10_pclk_bus\,
	papre => \inst|inst2|inst10_papre_bus\,
	paclr => \inst|inst2|inst10_paclr_bus\,
	pena => \inst|inst2|inst10_pena_bus\,
	dataout => \inst|inst2|inst10~dataout\);

-- Location: PIN_29
\D[6]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(6),
	dataout => \D~dataout\(6));

-- Location: LC1
\inst|inst3|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst3|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst3|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst3|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst3|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst3|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst3|inst8~10_pterm5_bus\,
	pxor => \inst|inst3|inst8~10_pxor_bus\,
	pclk => \inst|inst3|inst8~10_pclk_bus\,
	papre => \inst|inst3|inst8~10_papre_bus\,
	paclr => \inst|inst3|inst8~10_paclr_bus\,
	pena => \inst|inst3|inst8~10_pena_bus\,
	pexpout => \inst|inst3|inst8~10_pexpout\);

-- Location: LC2
\inst|inst3|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst3|inst8~10_pexpout\,
	pterm0 => \inst|inst3|inst10_pterm0_bus\,
	pterm1 => \inst|inst3|inst10_pterm1_bus\,
	pterm2 => \inst|inst3|inst10_pterm2_bus\,
	pterm3 => \inst|inst3|inst10_pterm3_bus\,
	pterm4 => \inst|inst3|inst10_pterm4_bus\,
	pterm5 => \inst|inst3|inst10_pterm5_bus\,
	pxor => \inst|inst3|inst10_pxor_bus\,
	pclk => \inst|inst3|inst10_pclk_bus\,
	papre => \inst|inst3|inst10_papre_bus\,
	paclr => \inst|inst3|inst10_paclr_bus\,
	pena => \inst|inst3|inst10_pena_bus\,
	dataout => \inst|inst3|inst10~dataout\);

-- Location: PIN_27
\D[7]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(7),
	dataout => \D~dataout\(7));

-- Location: LC7
\inst|inst5|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst5|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst5|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst5|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst5|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst5|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst5|inst8~10_pterm5_bus\,
	pxor => \inst|inst5|inst8~10_pxor_bus\,
	pclk => \inst|inst5|inst8~10_pclk_bus\,
	papre => \inst|inst5|inst8~10_papre_bus\,
	paclr => \inst|inst5|inst8~10_paclr_bus\,
	pena => \inst|inst5|inst8~10_pena_bus\,
	pexpout => \inst|inst5|inst8~10_pexpout\);

-- Location: LC8
\inst|inst5|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst5|inst8~10_pexpout\,
	pterm0 => \inst|inst5|inst10_pterm0_bus\,
	pterm1 => \inst|inst5|inst10_pterm1_bus\,
	pterm2 => \inst|inst5|inst10_pterm2_bus\,
	pterm3 => \inst|inst5|inst10_pterm3_bus\,
	pterm4 => \inst|inst5|inst10_pterm4_bus\,
	pterm5 => \inst|inst5|inst10_pterm5_bus\,
	pxor => \inst|inst5|inst10_pxor_bus\,
	pclk => \inst|inst5|inst10_pclk_bus\,
	papre => \inst|inst5|inst10_papre_bus\,
	paclr => \inst|inst5|inst10_paclr_bus\,
	pena => \inst|inst5|inst10_pena_bus\,
	dataout => \inst|inst5|inst10~dataout\);

-- Location: PIN_44
\D[8]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(8),
	dataout => \D~dataout\(8));

-- Location: LC11
\inst|inst6|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst6|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst6|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst6|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst6|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst6|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst6|inst8~10_pterm5_bus\,
	pxor => \inst|inst6|inst8~10_pxor_bus\,
	pclk => \inst|inst6|inst8~10_pclk_bus\,
	papre => \inst|inst6|inst8~10_papre_bus\,
	paclr => \inst|inst6|inst8~10_paclr_bus\,
	pena => \inst|inst6|inst8~10_pena_bus\,
	pexpout => \inst|inst6|inst8~10_pexpout\);

-- Location: LC12
\inst|inst6|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst6|inst8~10_pexpout\,
	pterm0 => \inst|inst6|inst10_pterm0_bus\,
	pterm1 => \inst|inst6|inst10_pterm1_bus\,
	pterm2 => \inst|inst6|inst10_pterm2_bus\,
	pterm3 => \inst|inst6|inst10_pterm3_bus\,
	pterm4 => \inst|inst6|inst10_pterm4_bus\,
	pterm5 => \inst|inst6|inst10_pterm5_bus\,
	pxor => \inst|inst6|inst10_pxor_bus\,
	pclk => \inst|inst6|inst10_pclk_bus\,
	papre => \inst|inst6|inst10_papre_bus\,
	paclr => \inst|inst6|inst10_paclr_bus\,
	pena => \inst|inst6|inst10_pena_bus\,
	dataout => \inst|inst6|inst10~dataout\);

-- Location: PIN_39
\D[9]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(9),
	dataout => \D~dataout\(9));

-- Location: LC13
\inst|inst7|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst7|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst7|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst7|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst7|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst7|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst7|inst8~10_pterm5_bus\,
	pxor => \inst|inst7|inst8~10_pxor_bus\,
	pclk => \inst|inst7|inst8~10_pclk_bus\,
	papre => \inst|inst7|inst8~10_papre_bus\,
	paclr => \inst|inst7|inst8~10_paclr_bus\,
	pena => \inst|inst7|inst8~10_pena_bus\,
	pexpout => \inst|inst7|inst8~10_pexpout\);

-- Location: LC14
\inst|inst7|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst7|inst8~10_pexpout\,
	pterm0 => \inst|inst7|inst10_pterm0_bus\,
	pterm1 => \inst|inst7|inst10_pterm1_bus\,
	pterm2 => \inst|inst7|inst10_pterm2_bus\,
	pterm3 => \inst|inst7|inst10_pterm3_bus\,
	pterm4 => \inst|inst7|inst10_pterm4_bus\,
	pterm5 => \inst|inst7|inst10_pterm5_bus\,
	pxor => \inst|inst7|inst10_pxor_bus\,
	pclk => \inst|inst7|inst10_pclk_bus\,
	papre => \inst|inst7|inst10_papre_bus\,
	paclr => \inst|inst7|inst10_paclr_bus\,
	pena => \inst|inst7|inst10_pena_bus\,
	dataout => \inst|inst7|inst10~dataout\);

-- Location: PIN_36
\D[10]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(10),
	dataout => \D~dataout\(10));

-- Location: LC15
\inst|inst8|inst8~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst8|inst8~10_pterm0_bus\,
	pterm1 => \inst|inst8|inst8~10_pterm1_bus\,
	pterm2 => \inst|inst8|inst8~10_pterm2_bus\,
	pterm3 => \inst|inst8|inst8~10_pterm3_bus\,
	pterm4 => \inst|inst8|inst8~10_pterm4_bus\,
	pterm5 => \inst|inst8|inst8~10_pterm5_bus\,
	pxor => \inst|inst8|inst8~10_pxor_bus\,
	pclk => \inst|inst8|inst8~10_pclk_bus\,
	papre => \inst|inst8|inst8~10_papre_bus\,
	paclr => \inst|inst8|inst8~10_paclr_bus\,
	pena => \inst|inst8|inst8~10_pena_bus\,
	pexpout => \inst|inst8|inst8~10_pexpout\);

-- Location: LC16
\inst|inst8|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst8|inst8~10_pexpout\,
	pterm0 => \inst|inst8|inst10_pterm0_bus\,
	pterm1 => \inst|inst8|inst10_pterm1_bus\,
	pterm2 => \inst|inst8|inst10_pterm2_bus\,
	pterm3 => \inst|inst8|inst10_pterm3_bus\,
	pterm4 => \inst|inst8|inst10_pterm4_bus\,
	pterm5 => \inst|inst8|inst10_pterm5_bus\,
	pxor => \inst|inst8|inst10_pxor_bus\,
	pclk => \inst|inst8|inst10_pclk_bus\,
	papre => \inst|inst8|inst10_papre_bus\,
	paclr => \inst|inst8|inst10_paclr_bus\,
	pena => \inst|inst8|inst10_pena_bus\,
	dataout => \inst|inst8|inst10~dataout\);

-- Location: PIN_9
\D[11]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(11),
	dataout => \D~dataout\(11));

-- Location: LC9
\inst|inst9|inst8~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst9|inst8~11_pterm0_bus\,
	pterm1 => \inst|inst9|inst8~11_pterm1_bus\,
	pterm2 => \inst|inst9|inst8~11_pterm2_bus\,
	pterm3 => \inst|inst9|inst8~11_pterm3_bus\,
	pterm4 => \inst|inst9|inst8~11_pterm4_bus\,
	pterm5 => \inst|inst9|inst8~11_pterm5_bus\,
	pxor => \inst|inst9|inst8~11_pxor_bus\,
	pclk => \inst|inst9|inst8~11_pclk_bus\,
	papre => \inst|inst9|inst8~11_papre_bus\,
	paclr => \inst|inst9|inst8~11_paclr_bus\,
	pena => \inst|inst9|inst8~11_pena_bus\,
	pexpout => \inst|inst9|inst8~11_pexpout\);

-- Location: LC10
\inst|inst9|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst9|inst8~11_pexpout\,
	pterm0 => \inst|inst9|inst10_pterm0_bus\,
	pterm1 => \inst|inst9|inst10_pterm1_bus\,
	pterm2 => \inst|inst9|inst10_pterm2_bus\,
	pterm3 => \inst|inst9|inst10_pterm3_bus\,
	pterm4 => \inst|inst9|inst10_pterm4_bus\,
	pterm5 => \inst|inst9|inst10_pterm5_bus\,
	pxor => \inst|inst9|inst10_pxor_bus\,
	pclk => \inst|inst9|inst10_pclk_bus\,
	papre => \inst|inst9|inst10_papre_bus\,
	paclr => \inst|inst9|inst10_paclr_bus\,
	pena => \inst|inst9|inst10_pena_bus\,
	dataout => \inst|inst9|inst10~dataout\);

-- Location: PIN_1
\D[12]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_D(12),
	dataout => \D~dataout\(12));

-- Location: LC29
\inst|inst10|inst8~11\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \inst|inst10|inst8~11_pterm0_bus\,
	pterm1 => \inst|inst10|inst8~11_pterm1_bus\,
	pterm2 => \inst|inst10|inst8~11_pterm2_bus\,
	pterm3 => \inst|inst10|inst8~11_pterm3_bus\,
	pterm4 => \inst|inst10|inst8~11_pterm4_bus\,
	pterm5 => \inst|inst10|inst8~11_pterm5_bus\,
	pxor => \inst|inst10|inst8~11_pxor_bus\,
	pclk => \inst|inst10|inst8~11_pclk_bus\,
	papre => \inst|inst10|inst8~11_papre_bus\,
	paclr => \inst|inst10|inst8~11_paclr_bus\,
	pena => \inst|inst10|inst8~11_pena_bus\,
	pexpout => \inst|inst10|inst8~11_pexpout\);

-- Location: LC30
\inst|inst10|inst10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "tff")
-- pragma translate_on
PORT MAP (
	pexpin => \inst|inst10|inst8~11_pexpout\,
	pterm0 => \inst|inst10|inst10_pterm0_bus\,
	pterm1 => \inst|inst10|inst10_pterm1_bus\,
	pterm2 => \inst|inst10|inst10_pterm2_bus\,
	pterm3 => \inst|inst10|inst10_pterm3_bus\,
	pterm4 => \inst|inst10|inst10_pterm4_bus\,
	pterm5 => \inst|inst10|inst10_pterm5_bus\,
	pxor => \inst|inst10|inst10_pxor_bus\,
	pclk => \inst|inst10|inst10_pclk_bus\,
	papre => \inst|inst10|inst10_papre_bus\,
	paclr => \inst|inst10|inst10_paclr_bus\,
	pena => \inst|inst10|inst10_pena_bus\,
	dataout => \inst|inst10|inst10~dataout\);

-- Location: PIN_33
\RG[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst1|inst|467~dataout\,
	oe => VCC,
	padio => ww_RG(0));

-- Location: PIN_40
\RG[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst1|inst1|467~dataout\,
	oe => VCC,
	padio => ww_RG(1));

-- Location: PIN_37
\RG[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(2));

-- Location: PIN_34
\RG[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst1|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(3));

-- Location: PIN_28
\RG[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst4|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(4));

-- Location: PIN_8
\RG[5]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst2|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(5));

-- Location: PIN_5
\RG[6]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst3|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(6));

-- Location: PIN_12
\RG[7]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst5|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(7));

-- Location: PIN_17
\RG[8]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst6|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(8));

-- Location: PIN_19
\RG[9]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst7|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(9));

-- Location: PIN_21
\RG[10]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst8|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(10));

-- Location: PIN_14
\RG[11]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst9|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(11));

-- Location: PIN_26
\RG[12]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \inst|inst10|inst10~dataout\,
	oe => VCC,
	padio => ww_RG(12));
END structure;



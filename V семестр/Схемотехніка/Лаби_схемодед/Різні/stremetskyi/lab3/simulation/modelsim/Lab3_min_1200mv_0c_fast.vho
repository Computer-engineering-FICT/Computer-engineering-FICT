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

-- DATE "10/16/2012 04:12:03"

-- 
-- Device: Altera EP3C40F780C6 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE Word8_data_type IS

TYPE Q_0_39_type IS ARRAY (0 TO 39) OF std_logic;
TYPE Q_0_39_1023_1016_type IS ARRAY (1023 DOWNTO 1016) OF Q_0_39_type;
SUBTYPE Q_type IS Q_0_39_1023_1016_type;

END Word8_data_type;

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
LIBRARY WORK;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.WORD8_DATA_TYPE.ALL;

ENTITY 	Word8 IS
    PORT (
	Q : OUT Q_type;
	C : IN std_logic;
	WR : IN std_logic;
	A : IN std_logic_vector(0 TO 9);
	D : IN std_logic_vector(0 TO 39)
	);
END Word8;

-- Design Ports Information
-- Q[1023][0]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][1]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][2]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][3]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][4]	=>  Location: PIN_M27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][5]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][6]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][7]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][8]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][9]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][10]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][11]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][12]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][13]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][14]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][15]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][16]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][17]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][18]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][19]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][20]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][21]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][22]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][23]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][24]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][25]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][26]	=>  Location: PIN_AG4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][27]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][28]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][29]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][30]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][31]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][32]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][33]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][34]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][35]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][36]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][37]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][38]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1023][39]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][0]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][1]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][2]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][3]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][4]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][5]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][6]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][8]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][9]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][10]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][11]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][12]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][13]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][14]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][15]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][16]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][17]	=>  Location: PIN_T25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][18]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][19]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][20]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][21]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][22]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][23]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][24]	=>  Location: PIN_AB1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][25]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][26]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][27]	=>  Location: PIN_T26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][28]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][29]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][30]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][31]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][32]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][33]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][34]	=>  Location: PIN_AF27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][35]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][36]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][37]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][38]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1022][39]	=>  Location: PIN_V27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][0]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][1]	=>  Location: PIN_P25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][2]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][3]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][4]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][5]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][6]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][7]	=>  Location: PIN_M26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][8]	=>  Location: PIN_U25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][9]	=>  Location: PIN_R27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][10]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][11]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][12]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][13]	=>  Location: PIN_G27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][14]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][15]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][16]	=>  Location: PIN_N26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][17]	=>  Location: PIN_R23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][18]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][19]	=>  Location: PIN_M25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][20]	=>  Location: PIN_P27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][21]	=>  Location: PIN_N25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][22]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][23]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][24]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][25]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][26]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][27]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][28]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][29]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][30]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][31]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][32]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][33]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][34]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][35]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][36]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][37]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][38]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1021][39]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][0]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][1]	=>  Location: PIN_R25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][2]	=>  Location: PIN_G24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][3]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][4]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][5]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][6]	=>  Location: PIN_L27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][7]	=>  Location: PIN_G28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][8]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][9]	=>  Location: PIN_M28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][10]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][11]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][12]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][13]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][14]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][15]	=>  Location: PIN_L20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][16]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][17]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][18]	=>  Location: PIN_V24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][19]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][20]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][21]	=>  Location: PIN_U27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][22]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][23]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][24]	=>  Location: PIN_L23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][25]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][26]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][27]	=>  Location: PIN_K3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][28]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][29]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][30]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][31]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][32]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][33]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][34]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][35]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][36]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][37]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][38]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1020][39]	=>  Location: PIN_K25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][0]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][1]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][2]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][3]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][4]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][5]	=>  Location: PIN_P26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][6]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][7]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][9]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][10]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][11]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][12]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][13]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][14]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][15]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][16]	=>  Location: PIN_AE3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][17]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][18]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][19]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][20]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][21]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][22]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][23]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][24]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][25]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][26]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][27]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][28]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][29]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][30]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][31]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][32]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][33]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][34]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][35]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][36]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][37]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][38]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1019][39]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][0]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][1]	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][2]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][3]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][4]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][5]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][6]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][7]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][8]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][9]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][10]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][11]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][12]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][13]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][14]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][15]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][16]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][17]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][18]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][19]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][20]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][21]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][22]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][23]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][24]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][25]	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][26]	=>  Location: PIN_F24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][27]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][28]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][29]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][30]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][31]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][32]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][33]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][34]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][35]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][36]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][37]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][38]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1018][39]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][0]	=>  Location: PIN_R26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][1]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][2]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][3]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][4]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][5]	=>  Location: PIN_AC21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][6]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][7]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][8]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][9]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][10]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][11]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][12]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][13]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][14]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][15]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][16]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][17]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][18]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][19]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][20]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][21]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][22]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][23]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][24]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][25]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][26]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][27]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][28]	=>  Location: PIN_K28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][29]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][30]	=>  Location: PIN_U26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][31]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][32]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][33]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][34]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][35]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][36]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][37]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][38]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1017][39]	=>  Location: PIN_J26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][0]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][2]	=>  Location: PIN_C23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][3]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][4]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][5]	=>  Location: PIN_H26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][6]	=>  Location: PIN_B23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][7]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][8]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][9]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][10]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][11]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][12]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][13]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][14]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][15]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][16]	=>  Location: PIN_AD28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][17]	=>  Location: PIN_L28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][18]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][19]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][20]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][21]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][22]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][23]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][24]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][25]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][26]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][27]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][28]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][29]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][30]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][31]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][32]	=>  Location: PIN_J23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][33]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][34]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][35]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][36]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][37]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][38]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1016][39]	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[8]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[9]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WR	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[3]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[4]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[5]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[6]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[7]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[8]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[9]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[10]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[11]	=>  Location: PIN_AC5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[12]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[13]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[14]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[15]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[16]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[17]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[18]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[19]	=>  Location: PIN_AF2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[20]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[21]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[22]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[23]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[24]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[25]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[26]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[27]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[28]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[29]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[30]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[31]	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[32]	=>  Location: PIN_U28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[33]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[34]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[35]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[36]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[37]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[38]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[39]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA

ARCHITECTURE structure OF Word8 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q : Q_type;
SIGNAL ww_C : std_logic;
SIGNAL ww_WR : std_logic;
SIGNAL ww_A : std_logic_vector(0 TO 9);
SIGNAL ww_D : std_logic_vector(0 TO 39);
SIGNAL \C~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\ : std_logic;
SIGNAL \D[0]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \D[1]~input_o\ : std_logic;
SIGNAL \Q[1023][0]~output_o\ : std_logic;
SIGNAL \Q[1023][1]~output_o\ : std_logic;
SIGNAL \Q[1023][2]~output_o\ : std_logic;
SIGNAL \Q[1023][3]~output_o\ : std_logic;
SIGNAL \Q[1023][4]~output_o\ : std_logic;
SIGNAL \Q[1023][5]~output_o\ : std_logic;
SIGNAL \Q[1023][6]~output_o\ : std_logic;
SIGNAL \Q[1023][7]~output_o\ : std_logic;
SIGNAL \Q[1023][8]~output_o\ : std_logic;
SIGNAL \Q[1023][9]~output_o\ : std_logic;
SIGNAL \Q[1023][10]~output_o\ : std_logic;
SIGNAL \Q[1023][11]~output_o\ : std_logic;
SIGNAL \Q[1023][12]~output_o\ : std_logic;
SIGNAL \Q[1023][13]~output_o\ : std_logic;
SIGNAL \Q[1023][14]~output_o\ : std_logic;
SIGNAL \Q[1023][15]~output_o\ : std_logic;
SIGNAL \Q[1023][16]~output_o\ : std_logic;
SIGNAL \Q[1023][17]~output_o\ : std_logic;
SIGNAL \Q[1023][18]~output_o\ : std_logic;
SIGNAL \Q[1023][19]~output_o\ : std_logic;
SIGNAL \Q[1023][20]~output_o\ : std_logic;
SIGNAL \Q[1023][21]~output_o\ : std_logic;
SIGNAL \Q[1023][22]~output_o\ : std_logic;
SIGNAL \Q[1023][23]~output_o\ : std_logic;
SIGNAL \Q[1023][24]~output_o\ : std_logic;
SIGNAL \Q[1023][25]~output_o\ : std_logic;
SIGNAL \Q[1023][26]~output_o\ : std_logic;
SIGNAL \Q[1023][27]~output_o\ : std_logic;
SIGNAL \Q[1023][28]~output_o\ : std_logic;
SIGNAL \Q[1023][29]~output_o\ : std_logic;
SIGNAL \Q[1023][30]~output_o\ : std_logic;
SIGNAL \Q[1023][31]~output_o\ : std_logic;
SIGNAL \Q[1023][32]~output_o\ : std_logic;
SIGNAL \Q[1023][33]~output_o\ : std_logic;
SIGNAL \Q[1023][34]~output_o\ : std_logic;
SIGNAL \Q[1023][35]~output_o\ : std_logic;
SIGNAL \Q[1023][36]~output_o\ : std_logic;
SIGNAL \Q[1023][37]~output_o\ : std_logic;
SIGNAL \Q[1023][38]~output_o\ : std_logic;
SIGNAL \Q[1023][39]~output_o\ : std_logic;
SIGNAL \Q[1022][0]~output_o\ : std_logic;
SIGNAL \Q[1022][1]~output_o\ : std_logic;
SIGNAL \Q[1022][2]~output_o\ : std_logic;
SIGNAL \Q[1022][3]~output_o\ : std_logic;
SIGNAL \Q[1022][4]~output_o\ : std_logic;
SIGNAL \Q[1022][5]~output_o\ : std_logic;
SIGNAL \Q[1022][6]~output_o\ : std_logic;
SIGNAL \Q[1022][7]~output_o\ : std_logic;
SIGNAL \Q[1022][8]~output_o\ : std_logic;
SIGNAL \Q[1022][9]~output_o\ : std_logic;
SIGNAL \Q[1022][10]~output_o\ : std_logic;
SIGNAL \Q[1022][11]~output_o\ : std_logic;
SIGNAL \Q[1022][12]~output_o\ : std_logic;
SIGNAL \Q[1022][13]~output_o\ : std_logic;
SIGNAL \Q[1022][14]~output_o\ : std_logic;
SIGNAL \Q[1022][15]~output_o\ : std_logic;
SIGNAL \Q[1022][16]~output_o\ : std_logic;
SIGNAL \Q[1022][17]~output_o\ : std_logic;
SIGNAL \Q[1022][18]~output_o\ : std_logic;
SIGNAL \Q[1022][19]~output_o\ : std_logic;
SIGNAL \Q[1022][20]~output_o\ : std_logic;
SIGNAL \Q[1022][21]~output_o\ : std_logic;
SIGNAL \Q[1022][22]~output_o\ : std_logic;
SIGNAL \Q[1022][23]~output_o\ : std_logic;
SIGNAL \Q[1022][24]~output_o\ : std_logic;
SIGNAL \Q[1022][25]~output_o\ : std_logic;
SIGNAL \Q[1022][26]~output_o\ : std_logic;
SIGNAL \Q[1022][27]~output_o\ : std_logic;
SIGNAL \Q[1022][28]~output_o\ : std_logic;
SIGNAL \Q[1022][29]~output_o\ : std_logic;
SIGNAL \Q[1022][30]~output_o\ : std_logic;
SIGNAL \Q[1022][31]~output_o\ : std_logic;
SIGNAL \Q[1022][32]~output_o\ : std_logic;
SIGNAL \Q[1022][33]~output_o\ : std_logic;
SIGNAL \Q[1022][34]~output_o\ : std_logic;
SIGNAL \Q[1022][35]~output_o\ : std_logic;
SIGNAL \Q[1022][36]~output_o\ : std_logic;
SIGNAL \Q[1022][37]~output_o\ : std_logic;
SIGNAL \Q[1022][38]~output_o\ : std_logic;
SIGNAL \Q[1022][39]~output_o\ : std_logic;
SIGNAL \Q[1021][0]~output_o\ : std_logic;
SIGNAL \Q[1021][1]~output_o\ : std_logic;
SIGNAL \Q[1021][2]~output_o\ : std_logic;
SIGNAL \Q[1021][3]~output_o\ : std_logic;
SIGNAL \Q[1021][4]~output_o\ : std_logic;
SIGNAL \Q[1021][5]~output_o\ : std_logic;
SIGNAL \Q[1021][6]~output_o\ : std_logic;
SIGNAL \Q[1021][7]~output_o\ : std_logic;
SIGNAL \Q[1021][8]~output_o\ : std_logic;
SIGNAL \Q[1021][9]~output_o\ : std_logic;
SIGNAL \Q[1021][10]~output_o\ : std_logic;
SIGNAL \Q[1021][11]~output_o\ : std_logic;
SIGNAL \Q[1021][12]~output_o\ : std_logic;
SIGNAL \Q[1021][13]~output_o\ : std_logic;
SIGNAL \Q[1021][14]~output_o\ : std_logic;
SIGNAL \Q[1021][15]~output_o\ : std_logic;
SIGNAL \Q[1021][16]~output_o\ : std_logic;
SIGNAL \Q[1021][17]~output_o\ : std_logic;
SIGNAL \Q[1021][18]~output_o\ : std_logic;
SIGNAL \Q[1021][19]~output_o\ : std_logic;
SIGNAL \Q[1021][20]~output_o\ : std_logic;
SIGNAL \Q[1021][21]~output_o\ : std_logic;
SIGNAL \Q[1021][22]~output_o\ : std_logic;
SIGNAL \Q[1021][23]~output_o\ : std_logic;
SIGNAL \Q[1021][24]~output_o\ : std_logic;
SIGNAL \Q[1021][25]~output_o\ : std_logic;
SIGNAL \Q[1021][26]~output_o\ : std_logic;
SIGNAL \Q[1021][27]~output_o\ : std_logic;
SIGNAL \Q[1021][28]~output_o\ : std_logic;
SIGNAL \Q[1021][29]~output_o\ : std_logic;
SIGNAL \Q[1021][30]~output_o\ : std_logic;
SIGNAL \Q[1021][31]~output_o\ : std_logic;
SIGNAL \Q[1021][32]~output_o\ : std_logic;
SIGNAL \Q[1021][33]~output_o\ : std_logic;
SIGNAL \Q[1021][34]~output_o\ : std_logic;
SIGNAL \Q[1021][35]~output_o\ : std_logic;
SIGNAL \Q[1021][36]~output_o\ : std_logic;
SIGNAL \Q[1021][37]~output_o\ : std_logic;
SIGNAL \Q[1021][38]~output_o\ : std_logic;
SIGNAL \Q[1021][39]~output_o\ : std_logic;
SIGNAL \Q[1020][0]~output_o\ : std_logic;
SIGNAL \Q[1020][1]~output_o\ : std_logic;
SIGNAL \Q[1020][2]~output_o\ : std_logic;
SIGNAL \Q[1020][3]~output_o\ : std_logic;
SIGNAL \Q[1020][4]~output_o\ : std_logic;
SIGNAL \Q[1020][5]~output_o\ : std_logic;
SIGNAL \Q[1020][6]~output_o\ : std_logic;
SIGNAL \Q[1020][7]~output_o\ : std_logic;
SIGNAL \Q[1020][8]~output_o\ : std_logic;
SIGNAL \Q[1020][9]~output_o\ : std_logic;
SIGNAL \Q[1020][10]~output_o\ : std_logic;
SIGNAL \Q[1020][11]~output_o\ : std_logic;
SIGNAL \Q[1020][12]~output_o\ : std_logic;
SIGNAL \Q[1020][13]~output_o\ : std_logic;
SIGNAL \Q[1020][14]~output_o\ : std_logic;
SIGNAL \Q[1020][15]~output_o\ : std_logic;
SIGNAL \Q[1020][16]~output_o\ : std_logic;
SIGNAL \Q[1020][17]~output_o\ : std_logic;
SIGNAL \Q[1020][18]~output_o\ : std_logic;
SIGNAL \Q[1020][19]~output_o\ : std_logic;
SIGNAL \Q[1020][20]~output_o\ : std_logic;
SIGNAL \Q[1020][21]~output_o\ : std_logic;
SIGNAL \Q[1020][22]~output_o\ : std_logic;
SIGNAL \Q[1020][23]~output_o\ : std_logic;
SIGNAL \Q[1020][24]~output_o\ : std_logic;
SIGNAL \Q[1020][25]~output_o\ : std_logic;
SIGNAL \Q[1020][26]~output_o\ : std_logic;
SIGNAL \Q[1020][27]~output_o\ : std_logic;
SIGNAL \Q[1020][28]~output_o\ : std_logic;
SIGNAL \Q[1020][29]~output_o\ : std_logic;
SIGNAL \Q[1020][30]~output_o\ : std_logic;
SIGNAL \Q[1020][31]~output_o\ : std_logic;
SIGNAL \Q[1020][32]~output_o\ : std_logic;
SIGNAL \Q[1020][33]~output_o\ : std_logic;
SIGNAL \Q[1020][34]~output_o\ : std_logic;
SIGNAL \Q[1020][35]~output_o\ : std_logic;
SIGNAL \Q[1020][36]~output_o\ : std_logic;
SIGNAL \Q[1020][37]~output_o\ : std_logic;
SIGNAL \Q[1020][38]~output_o\ : std_logic;
SIGNAL \Q[1020][39]~output_o\ : std_logic;
SIGNAL \Q[1019][0]~output_o\ : std_logic;
SIGNAL \Q[1019][1]~output_o\ : std_logic;
SIGNAL \Q[1019][2]~output_o\ : std_logic;
SIGNAL \Q[1019][3]~output_o\ : std_logic;
SIGNAL \Q[1019][4]~output_o\ : std_logic;
SIGNAL \Q[1019][5]~output_o\ : std_logic;
SIGNAL \Q[1019][6]~output_o\ : std_logic;
SIGNAL \Q[1019][7]~output_o\ : std_logic;
SIGNAL \Q[1019][8]~output_o\ : std_logic;
SIGNAL \Q[1019][9]~output_o\ : std_logic;
SIGNAL \Q[1019][10]~output_o\ : std_logic;
SIGNAL \Q[1019][11]~output_o\ : std_logic;
SIGNAL \Q[1019][12]~output_o\ : std_logic;
SIGNAL \Q[1019][13]~output_o\ : std_logic;
SIGNAL \Q[1019][14]~output_o\ : std_logic;
SIGNAL \Q[1019][15]~output_o\ : std_logic;
SIGNAL \Q[1019][16]~output_o\ : std_logic;
SIGNAL \Q[1019][17]~output_o\ : std_logic;
SIGNAL \Q[1019][18]~output_o\ : std_logic;
SIGNAL \Q[1019][19]~output_o\ : std_logic;
SIGNAL \Q[1019][20]~output_o\ : std_logic;
SIGNAL \Q[1019][21]~output_o\ : std_logic;
SIGNAL \Q[1019][22]~output_o\ : std_logic;
SIGNAL \Q[1019][23]~output_o\ : std_logic;
SIGNAL \Q[1019][24]~output_o\ : std_logic;
SIGNAL \Q[1019][25]~output_o\ : std_logic;
SIGNAL \Q[1019][26]~output_o\ : std_logic;
SIGNAL \Q[1019][27]~output_o\ : std_logic;
SIGNAL \Q[1019][28]~output_o\ : std_logic;
SIGNAL \Q[1019][29]~output_o\ : std_logic;
SIGNAL \Q[1019][30]~output_o\ : std_logic;
SIGNAL \Q[1019][31]~output_o\ : std_logic;
SIGNAL \Q[1019][32]~output_o\ : std_logic;
SIGNAL \Q[1019][33]~output_o\ : std_logic;
SIGNAL \Q[1019][34]~output_o\ : std_logic;
SIGNAL \Q[1019][35]~output_o\ : std_logic;
SIGNAL \Q[1019][36]~output_o\ : std_logic;
SIGNAL \Q[1019][37]~output_o\ : std_logic;
SIGNAL \Q[1019][38]~output_o\ : std_logic;
SIGNAL \Q[1019][39]~output_o\ : std_logic;
SIGNAL \Q[1018][0]~output_o\ : std_logic;
SIGNAL \Q[1018][1]~output_o\ : std_logic;
SIGNAL \Q[1018][2]~output_o\ : std_logic;
SIGNAL \Q[1018][3]~output_o\ : std_logic;
SIGNAL \Q[1018][4]~output_o\ : std_logic;
SIGNAL \Q[1018][5]~output_o\ : std_logic;
SIGNAL \Q[1018][6]~output_o\ : std_logic;
SIGNAL \Q[1018][7]~output_o\ : std_logic;
SIGNAL \Q[1018][8]~output_o\ : std_logic;
SIGNAL \Q[1018][9]~output_o\ : std_logic;
SIGNAL \Q[1018][10]~output_o\ : std_logic;
SIGNAL \Q[1018][11]~output_o\ : std_logic;
SIGNAL \Q[1018][12]~output_o\ : std_logic;
SIGNAL \Q[1018][13]~output_o\ : std_logic;
SIGNAL \Q[1018][14]~output_o\ : std_logic;
SIGNAL \Q[1018][15]~output_o\ : std_logic;
SIGNAL \Q[1018][16]~output_o\ : std_logic;
SIGNAL \Q[1018][17]~output_o\ : std_logic;
SIGNAL \Q[1018][18]~output_o\ : std_logic;
SIGNAL \Q[1018][19]~output_o\ : std_logic;
SIGNAL \Q[1018][20]~output_o\ : std_logic;
SIGNAL \Q[1018][21]~output_o\ : std_logic;
SIGNAL \Q[1018][22]~output_o\ : std_logic;
SIGNAL \Q[1018][23]~output_o\ : std_logic;
SIGNAL \Q[1018][24]~output_o\ : std_logic;
SIGNAL \Q[1018][25]~output_o\ : std_logic;
SIGNAL \Q[1018][26]~output_o\ : std_logic;
SIGNAL \Q[1018][27]~output_o\ : std_logic;
SIGNAL \Q[1018][28]~output_o\ : std_logic;
SIGNAL \Q[1018][29]~output_o\ : std_logic;
SIGNAL \Q[1018][30]~output_o\ : std_logic;
SIGNAL \Q[1018][31]~output_o\ : std_logic;
SIGNAL \Q[1018][32]~output_o\ : std_logic;
SIGNAL \Q[1018][33]~output_o\ : std_logic;
SIGNAL \Q[1018][34]~output_o\ : std_logic;
SIGNAL \Q[1018][35]~output_o\ : std_logic;
SIGNAL \Q[1018][36]~output_o\ : std_logic;
SIGNAL \Q[1018][37]~output_o\ : std_logic;
SIGNAL \Q[1018][38]~output_o\ : std_logic;
SIGNAL \Q[1018][39]~output_o\ : std_logic;
SIGNAL \Q[1017][0]~output_o\ : std_logic;
SIGNAL \Q[1017][1]~output_o\ : std_logic;
SIGNAL \Q[1017][2]~output_o\ : std_logic;
SIGNAL \Q[1017][3]~output_o\ : std_logic;
SIGNAL \Q[1017][4]~output_o\ : std_logic;
SIGNAL \Q[1017][5]~output_o\ : std_logic;
SIGNAL \Q[1017][6]~output_o\ : std_logic;
SIGNAL \Q[1017][7]~output_o\ : std_logic;
SIGNAL \Q[1017][8]~output_o\ : std_logic;
SIGNAL \Q[1017][9]~output_o\ : std_logic;
SIGNAL \Q[1017][10]~output_o\ : std_logic;
SIGNAL \Q[1017][11]~output_o\ : std_logic;
SIGNAL \Q[1017][12]~output_o\ : std_logic;
SIGNAL \Q[1017][13]~output_o\ : std_logic;
SIGNAL \Q[1017][14]~output_o\ : std_logic;
SIGNAL \Q[1017][15]~output_o\ : std_logic;
SIGNAL \Q[1017][16]~output_o\ : std_logic;
SIGNAL \Q[1017][17]~output_o\ : std_logic;
SIGNAL \Q[1017][18]~output_o\ : std_logic;
SIGNAL \Q[1017][19]~output_o\ : std_logic;
SIGNAL \Q[1017][20]~output_o\ : std_logic;
SIGNAL \Q[1017][21]~output_o\ : std_logic;
SIGNAL \Q[1017][22]~output_o\ : std_logic;
SIGNAL \Q[1017][23]~output_o\ : std_logic;
SIGNAL \Q[1017][24]~output_o\ : std_logic;
SIGNAL \Q[1017][25]~output_o\ : std_logic;
SIGNAL \Q[1017][26]~output_o\ : std_logic;
SIGNAL \Q[1017][27]~output_o\ : std_logic;
SIGNAL \Q[1017][28]~output_o\ : std_logic;
SIGNAL \Q[1017][29]~output_o\ : std_logic;
SIGNAL \Q[1017][30]~output_o\ : std_logic;
SIGNAL \Q[1017][31]~output_o\ : std_logic;
SIGNAL \Q[1017][32]~output_o\ : std_logic;
SIGNAL \Q[1017][33]~output_o\ : std_logic;
SIGNAL \Q[1017][34]~output_o\ : std_logic;
SIGNAL \Q[1017][35]~output_o\ : std_logic;
SIGNAL \Q[1017][36]~output_o\ : std_logic;
SIGNAL \Q[1017][37]~output_o\ : std_logic;
SIGNAL \Q[1017][38]~output_o\ : std_logic;
SIGNAL \Q[1017][39]~output_o\ : std_logic;
SIGNAL \Q[1016][0]~output_o\ : std_logic;
SIGNAL \Q[1016][1]~output_o\ : std_logic;
SIGNAL \Q[1016][2]~output_o\ : std_logic;
SIGNAL \Q[1016][3]~output_o\ : std_logic;
SIGNAL \Q[1016][4]~output_o\ : std_logic;
SIGNAL \Q[1016][5]~output_o\ : std_logic;
SIGNAL \Q[1016][6]~output_o\ : std_logic;
SIGNAL \Q[1016][7]~output_o\ : std_logic;
SIGNAL \Q[1016][8]~output_o\ : std_logic;
SIGNAL \Q[1016][9]~output_o\ : std_logic;
SIGNAL \Q[1016][10]~output_o\ : std_logic;
SIGNAL \Q[1016][11]~output_o\ : std_logic;
SIGNAL \Q[1016][12]~output_o\ : std_logic;
SIGNAL \Q[1016][13]~output_o\ : std_logic;
SIGNAL \Q[1016][14]~output_o\ : std_logic;
SIGNAL \Q[1016][15]~output_o\ : std_logic;
SIGNAL \Q[1016][16]~output_o\ : std_logic;
SIGNAL \Q[1016][17]~output_o\ : std_logic;
SIGNAL \Q[1016][18]~output_o\ : std_logic;
SIGNAL \Q[1016][19]~output_o\ : std_logic;
SIGNAL \Q[1016][20]~output_o\ : std_logic;
SIGNAL \Q[1016][21]~output_o\ : std_logic;
SIGNAL \Q[1016][22]~output_o\ : std_logic;
SIGNAL \Q[1016][23]~output_o\ : std_logic;
SIGNAL \Q[1016][24]~output_o\ : std_logic;
SIGNAL \Q[1016][25]~output_o\ : std_logic;
SIGNAL \Q[1016][26]~output_o\ : std_logic;
SIGNAL \Q[1016][27]~output_o\ : std_logic;
SIGNAL \Q[1016][28]~output_o\ : std_logic;
SIGNAL \Q[1016][29]~output_o\ : std_logic;
SIGNAL \Q[1016][30]~output_o\ : std_logic;
SIGNAL \Q[1016][31]~output_o\ : std_logic;
SIGNAL \Q[1016][32]~output_o\ : std_logic;
SIGNAL \Q[1016][33]~output_o\ : std_logic;
SIGNAL \Q[1016][34]~output_o\ : std_logic;
SIGNAL \Q[1016][35]~output_o\ : std_logic;
SIGNAL \Q[1016][36]~output_o\ : std_logic;
SIGNAL \Q[1016][37]~output_o\ : std_logic;
SIGNAL \Q[1016][38]~output_o\ : std_logic;
SIGNAL \Q[1016][39]~output_o\ : std_logic;
SIGNAL \C~input_o\ : std_logic;
SIGNAL \C~inputclkctrl_outclk\ : std_logic;
SIGNAL \WR~input_o\ : std_logic;
SIGNAL \A[9]~input_o\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst~q\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst1~q\ : std_logic;
SIGNAL \D[2]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst2~q\ : std_logic;
SIGNAL \D[3]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst3~q\ : std_logic;
SIGNAL \D[4]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst4~q\ : std_logic;
SIGNAL \D[5]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst5~q\ : std_logic;
SIGNAL \D[6]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst6~q\ : std_logic;
SIGNAL \D[7]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst7~q\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst8~q\ : std_logic;
SIGNAL \D[9]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst9~q\ : std_logic;
SIGNAL \D[10]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst10~q\ : std_logic;
SIGNAL \D[11]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst11~q\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst12~q\ : std_logic;
SIGNAL \D[13]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst13~q\ : std_logic;
SIGNAL \D[14]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst14~q\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst15~q\ : std_logic;
SIGNAL \D[16]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst16~q\ : std_logic;
SIGNAL \D[17]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst17~q\ : std_logic;
SIGNAL \D[18]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst18~q\ : std_logic;
SIGNAL \D[19]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst19~q\ : std_logic;
SIGNAL \D[20]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst21~q\ : std_logic;
SIGNAL \D[21]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst20~q\ : std_logic;
SIGNAL \D[22]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst22~q\ : std_logic;
SIGNAL \D[23]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst23~q\ : std_logic;
SIGNAL \D[24]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst24~q\ : std_logic;
SIGNAL \D[25]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst25~q\ : std_logic;
SIGNAL \D[26]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst26~q\ : std_logic;
SIGNAL \D[27]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst27~q\ : std_logic;
SIGNAL \D[28]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst28~q\ : std_logic;
SIGNAL \D[29]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst29~q\ : std_logic;
SIGNAL \D[30]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst30~q\ : std_logic;
SIGNAL \D[31]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst31~q\ : std_logic;
SIGNAL \D[32]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst32~q\ : std_logic;
SIGNAL \D[33]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst33~q\ : std_logic;
SIGNAL \D[34]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst34~q\ : std_logic;
SIGNAL \D[35]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst35~q\ : std_logic;
SIGNAL \D[36]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst36~q\ : std_logic;
SIGNAL \D[37]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst37~q\ : std_logic;
SIGNAL \D[38]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst38~q\ : std_logic;
SIGNAL \D[39]~input_o\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst|inst|inst39~q\ : std_logic;
SIGNAL \A[8]~input_o\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ : std_logic;
SIGNAL \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst1~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst2~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst3~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst4~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst5~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst6~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst7~q\ : std_logic;
SIGNAL \D[8]~input_o\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst8~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst9~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst10~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst11~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst12~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst13~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst14~q\ : std_logic;
SIGNAL \D[15]~input_o\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst15~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst16~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst17~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst18~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst19~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst21~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst20~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst22~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst23~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst24~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst25~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst26~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst27~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst28~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst29~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst30~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst31~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst32~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst33~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst34~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst35~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst36~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst37~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst38~q\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst|inst1|inst|inst39~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst1~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst2~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst3~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst4~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst5~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst6~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst7~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst8~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst9~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst10~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst11~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst12~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst13~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst14~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst15~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst16~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst17~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst18~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst19~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst21~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst20~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst22~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst23~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst24~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst25~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst26~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst27~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst28~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst29~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst30~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst31~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst32~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst33~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst34~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst35~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst36~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst37~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst38~q\ : std_logic;
SIGNAL \inst|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst|inst|inst39~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst1~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst2~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst3~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst4~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst5~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst6~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst7~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst8~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst9~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst10~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst11~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst12~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst13~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst14~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst15~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst16~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst17~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst18~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst19~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst21~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst20~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst22~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst23~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst24~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst25~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst26~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst27~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst28~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst29~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst30~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst31~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst32~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst33~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst34~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst35~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst36~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst37~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst38~q\ : std_logic;
SIGNAL \inst|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst|inst1|inst1|inst|inst39~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst1~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst2~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst3~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst4~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst5~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst6~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst7~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst8~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst9~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst10~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst11~q\ : std_logic;
SIGNAL \D[12]~input_o\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst12~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst13~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst14~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst15~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst16~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst17~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst18~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst19~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst21~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst20~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst22~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst23~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst24~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst25~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst26~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst27~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst28~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst29~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst30~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst31~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst32~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst33~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst34~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst35~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst36~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst37~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst38~q\ : std_logic;
SIGNAL \inst1|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst|inst|inst39~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst1~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst2~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst3~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst4~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst5~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst6~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst7~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst8~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst9~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst10~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst11~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst12~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst13~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst14~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst15~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst16~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst17~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst18~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst19~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst21~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst20~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst22~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst23~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst24~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst25~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst26~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst27~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst28~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst29~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst30~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst31~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst32~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst33~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst34~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst35~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst36~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst37~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst38~q\ : std_logic;
SIGNAL \inst1|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst|inst1|inst|inst39~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst1~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst2~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst3~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst4~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst5~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst6~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst7~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst8~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst9~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst10~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst11~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst12~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst13~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst14~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst15~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst16~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst17~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst18~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst19~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst21~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst20~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst22~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst23~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst24~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst25~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst26~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst27~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst28~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst29~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst30~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst31~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst32~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst33~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst34~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst35~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst36~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst37~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst38~q\ : std_logic;
SIGNAL \inst1|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst|inst|inst39~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst1~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst2~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst3~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst4~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst5~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst6~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst7~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst8~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst9~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst10~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst11~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst12~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst13~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst14~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst15~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst16~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst17~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst18~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst19~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst21~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst20~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst22~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst23~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst24~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst25~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst26~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst27~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst28~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst29~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst30~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst31~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst32~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst33~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst34~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst35~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst36~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst37~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst38~q\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\ : std_logic;
SIGNAL \inst1|inst1|inst1|inst|inst39~q\ : std_logic;

BEGIN

Q <= ww_Q;
ww_C <= C;
ww_WR <= WR;
ww_A <= A;
ww_D <= D;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\C~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \C~input_o\);

-- Location: LCCOMB_X25_Y18_N28
\inst|inst|inst1|inst5|inst|inst|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\ = (\D[0]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datac => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\);

-- Location: LCCOMB_X25_Y18_N14
\inst|inst|inst1|inst5|inst|inst|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\ = (\D[1]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\);

-- Location: LCCOMB_X10_Y11_N12
\inst|inst|inst1|inst5|inst|inst|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[2]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\);

-- Location: LCCOMB_X19_Y11_N4
\inst|inst|inst1|inst5|inst|inst|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\ = (\D[3]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[3]~input_o\,
	datac => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N22
\inst|inst|inst1|inst5|inst|inst3|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\ = (\A[8]~input_o\ & \D[16]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datad => \D[16]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N30
\inst|inst|inst1|inst5|inst1|inst|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\ = (\A[8]~input_o\ & \D[21]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datad => \D[21]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\);

-- Location: LCCOMB_X10_Y11_N30
\inst|inst|inst1|inst5|inst1|inst|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\ = (\A[8]~input_o\ & \D[23]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datac => \D[23]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N30
\inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\ = (\D[26]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \D[26]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N22
\inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\ = (\A[8]~input_o\ & \D[31]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[31]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N30
\inst|inst|inst1|inst5|inst1|inst3|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\ = (\A[8]~input_o\ & \D[35]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[35]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\);

-- Location: LCCOMB_X38_Y9_N22
\inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\ = (\D[38]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[38]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\);

-- Location: IOIBUF_X0_Y30_N1
\D[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(0),
	o => \D[0]~input_o\);

-- Location: IOIBUF_X67_Y5_N15
\A[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X0_Y13_N22
\A[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X22_Y0_N22
\D[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(1),
	o => \D[1]~input_o\);

-- Location: IOOBUF_X25_Y43_N30
\Q[1023][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1023][0]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\Q[1023][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1023][1]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\Q[1023][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1023][2]~output_o\);

-- Location: IOOBUF_X22_Y0_N16
\Q[1023][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1023][3]~output_o\);

-- Location: IOOBUF_X67_Y29_N23
\Q[1023][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1023][4]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\Q[1023][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1023][5]~output_o\);

-- Location: IOOBUF_X0_Y19_N23
\Q[1023][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1023][6]~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\Q[1023][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1023][7]~output_o\);

-- Location: IOOBUF_X0_Y35_N9
\Q[1023][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1023][8]~output_o\);

-- Location: IOOBUF_X0_Y27_N2
\Q[1023][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1023][9]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\Q[1023][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1023][10]~output_o\);

-- Location: IOOBUF_X0_Y36_N16
\Q[1023][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1023][11]~output_o\);

-- Location: IOOBUF_X0_Y30_N23
\Q[1023][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1023][12]~output_o\);

-- Location: IOOBUF_X0_Y30_N9
\Q[1023][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1023][13]~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\Q[1023][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1023][14]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\Q[1023][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1023][15]~output_o\);

-- Location: IOOBUF_X0_Y31_N2
\Q[1023][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1023][16]~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\Q[1023][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1023][17]~output_o\);

-- Location: IOOBUF_X0_Y27_N9
\Q[1023][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1023][18]~output_o\);

-- Location: IOOBUF_X0_Y35_N23
\Q[1023][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1023][19]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\Q[1023][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1023][20]~output_o\);

-- Location: IOOBUF_X0_Y36_N2
\Q[1023][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1023][21]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\Q[1023][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1023][22]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\Q[1023][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1023][23]~output_o\);

-- Location: IOOBUF_X3_Y0_N30
\Q[1023][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1023][24]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\Q[1023][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1023][25]~output_o\);

-- Location: IOOBUF_X3_Y0_N9
\Q[1023][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1023][26]~output_o\);

-- Location: IOOBUF_X1_Y43_N16
\Q[1023][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1023][27]~output_o\);

-- Location: IOOBUF_X0_Y30_N16
\Q[1023][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1023][28]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\Q[1023][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1023][29]~output_o\);

-- Location: IOOBUF_X67_Y7_N9
\Q[1023][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1023][30]~output_o\);

-- Location: IOOBUF_X0_Y5_N2
\Q[1023][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1023][31]~output_o\);

-- Location: IOOBUF_X0_Y9_N23
\Q[1023][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1023][32]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\Q[1023][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1023][33]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\Q[1023][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1023][34]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\Q[1023][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1023][35]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\Q[1023][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1023][36]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\Q[1023][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1023][37]~output_o\);

-- Location: IOOBUF_X0_Y10_N9
\Q[1023][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1023][38]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\Q[1023][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1023][39]~output_o\);

-- Location: IOOBUF_X0_Y11_N9
\Q[1022][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1022][0]~output_o\);

-- Location: IOOBUF_X0_Y12_N2
\Q[1022][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1022][1]~output_o\);

-- Location: IOOBUF_X9_Y43_N2
\Q[1022][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1022][2]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\Q[1022][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1022][3]~output_o\);

-- Location: IOOBUF_X0_Y29_N2
\Q[1022][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1022][4]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\Q[1022][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1022][5]~output_o\);

-- Location: IOOBUF_X0_Y16_N16
\Q[1022][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1022][6]~output_o\);

-- Location: IOOBUF_X0_Y31_N16
\Q[1022][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1022][7]~output_o\);

-- Location: IOOBUF_X0_Y15_N9
\Q[1022][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1022][8]~output_o\);

-- Location: IOOBUF_X0_Y16_N23
\Q[1022][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1022][9]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\Q[1022][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1022][10]~output_o\);

-- Location: IOOBUF_X67_Y2_N23
\Q[1022][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1022][11]~output_o\);

-- Location: IOOBUF_X1_Y0_N30
\Q[1022][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1022][12]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\Q[1022][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1022][13]~output_o\);

-- Location: IOOBUF_X1_Y43_N23
\Q[1022][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1022][14]~output_o\);

-- Location: IOOBUF_X67_Y2_N2
\Q[1022][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1022][15]~output_o\);

-- Location: IOOBUF_X67_Y24_N2
\Q[1022][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1022][16]~output_o\);

-- Location: IOOBUF_X67_Y17_N16
\Q[1022][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1022][17]~output_o\);

-- Location: IOOBUF_X0_Y29_N23
\Q[1022][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1022][18]~output_o\);

-- Location: IOOBUF_X0_Y17_N23
\Q[1022][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1022][19]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\Q[1022][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1022][20]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\Q[1022][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1022][21]~output_o\);

-- Location: IOOBUF_X0_Y28_N16
\Q[1022][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1022][22]~output_o\);

-- Location: IOOBUF_X0_Y11_N23
\Q[1022][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1022][23]~output_o\);

-- Location: IOOBUF_X0_Y15_N2
\Q[1022][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1022][24]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\Q[1022][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1022][25]~output_o\);

-- Location: IOOBUF_X25_Y43_N9
\Q[1022][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1022][26]~output_o\);

-- Location: IOOBUF_X67_Y16_N16
\Q[1022][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1022][27]~output_o\);

-- Location: IOOBUF_X32_Y43_N16
\Q[1022][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1022][28]~output_o\);

-- Location: IOOBUF_X32_Y43_N23
\Q[1022][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1022][29]~output_o\);

-- Location: IOOBUF_X32_Y43_N2
\Q[1022][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1022][30]~output_o\);

-- Location: IOOBUF_X67_Y4_N23
\Q[1022][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1022][31]~output_o\);

-- Location: IOOBUF_X43_Y0_N30
\Q[1022][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1022][32]~output_o\);

-- Location: IOOBUF_X43_Y0_N2
\Q[1022][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1022][33]~output_o\);

-- Location: IOOBUF_X67_Y3_N2
\Q[1022][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1022][34]~output_o\);

-- Location: IOOBUF_X43_Y43_N30
\Q[1022][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1022][35]~output_o\);

-- Location: IOOBUF_X43_Y0_N9
\Q[1022][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1022][36]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\Q[1022][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1022][37]~output_o\);

-- Location: IOOBUF_X38_Y43_N23
\Q[1022][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1022][38]~output_o\);

-- Location: IOOBUF_X67_Y13_N2
\Q[1022][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1022][39]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\Q[1021][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1021][0]~output_o\);

-- Location: IOOBUF_X67_Y25_N16
\Q[1021][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1021][1]~output_o\);

-- Location: IOOBUF_X25_Y0_N23
\Q[1021][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1021][2]~output_o\);

-- Location: IOOBUF_X67_Y11_N9
\Q[1021][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1021][3]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\Q[1021][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1021][4]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\Q[1021][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1021][5]~output_o\);

-- Location: IOOBUF_X67_Y26_N23
\Q[1021][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1021][6]~output_o\);

-- Location: IOOBUF_X67_Y29_N9
\Q[1021][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1021][7]~output_o\);

-- Location: IOOBUF_X67_Y19_N16
\Q[1021][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1021][8]~output_o\);

-- Location: IOOBUF_X67_Y20_N23
\Q[1021][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1021][9]~output_o\);

-- Location: IOOBUF_X67_Y19_N9
\Q[1021][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1021][10]~output_o\);

-- Location: IOOBUF_X67_Y30_N2
\Q[1021][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1021][11]~output_o\);

-- Location: IOOBUF_X61_Y43_N2
\Q[1021][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1021][12]~output_o\);

-- Location: IOOBUF_X67_Y34_N2
\Q[1021][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1021][13]~output_o\);

-- Location: IOOBUF_X59_Y43_N16
\Q[1021][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1021][14]~output_o\);

-- Location: IOOBUF_X67_Y38_N9
\Q[1021][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1021][15]~output_o\);

-- Location: IOOBUF_X67_Y28_N23
\Q[1021][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1021][16]~output_o\);

-- Location: IOOBUF_X67_Y20_N16
\Q[1021][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1021][17]~output_o\);

-- Location: IOOBUF_X61_Y43_N30
\Q[1021][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1021][18]~output_o\);

-- Location: IOOBUF_X67_Y31_N23
\Q[1021][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1021][19]~output_o\);

-- Location: IOOBUF_X67_Y27_N16
\Q[1021][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1021][20]~output_o\);

-- Location: IOOBUF_X67_Y26_N9
\Q[1021][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1021][21]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\Q[1021][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1021][22]~output_o\);

-- Location: IOOBUF_X67_Y3_N23
\Q[1021][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1021][23]~output_o\);

-- Location: IOOBUF_X41_Y0_N30
\Q[1021][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1021][24]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\Q[1021][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1021][25]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\Q[1021][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1021][26]~output_o\);

-- Location: IOOBUF_X36_Y43_N23
\Q[1021][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1021][27]~output_o\);

-- Location: IOOBUF_X67_Y7_N2
\Q[1021][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1021][28]~output_o\);

-- Location: IOOBUF_X34_Y0_N30
\Q[1021][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1021][29]~output_o\);

-- Location: IOOBUF_X67_Y2_N9
\Q[1021][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1021][30]~output_o\);

-- Location: IOOBUF_X67_Y3_N16
\Q[1021][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1021][31]~output_o\);

-- Location: IOOBUF_X41_Y0_N16
\Q[1021][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1021][32]~output_o\);

-- Location: IOOBUF_X0_Y7_N23
\Q[1021][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1021][33]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\Q[1021][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1021][34]~output_o\);

-- Location: IOOBUF_X36_Y43_N9
\Q[1021][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1021][35]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\Q[1021][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1021][36]~output_o\);

-- Location: IOOBUF_X59_Y0_N23
\Q[1021][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1021][37]~output_o\);

-- Location: IOOBUF_X0_Y31_N23
\Q[1021][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1021][38]~output_o\);

-- Location: IOOBUF_X20_Y43_N9
\Q[1021][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1021][39]~output_o\);

-- Location: IOOBUF_X67_Y19_N23
\Q[1020][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1020][0]~output_o\);

-- Location: IOOBUF_X67_Y18_N2
\Q[1020][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1020][1]~output_o\);

-- Location: IOOBUF_X67_Y26_N2
\Q[1020][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1020][2]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\Q[1020][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1020][3]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\Q[1020][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1020][4]~output_o\);

-- Location: IOOBUF_X59_Y0_N16
\Q[1020][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1020][5]~output_o\);

-- Location: IOOBUF_X67_Y32_N23
\Q[1020][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1020][6]~output_o\);

-- Location: IOOBUF_X67_Y34_N9
\Q[1020][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1020][7]~output_o\);

-- Location: IOOBUF_X67_Y14_N9
\Q[1020][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1020][8]~output_o\);

-- Location: IOOBUF_X67_Y28_N9
\Q[1020][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1020][9]~output_o\);

-- Location: IOOBUF_X67_Y13_N9
\Q[1020][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1020][10]~output_o\);

-- Location: IOOBUF_X67_Y14_N2
\Q[1020][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1020][11]~output_o\);

-- Location: IOOBUF_X63_Y0_N2
\Q[1020][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1020][12]~output_o\);

-- Location: IOOBUF_X61_Y43_N16
\Q[1020][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1020][13]~output_o\);

-- Location: IOOBUF_X61_Y0_N2
\Q[1020][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1020][14]~output_o\);

-- Location: IOOBUF_X67_Y29_N16
\Q[1020][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1020][15]~output_o\);

-- Location: IOOBUF_X63_Y0_N9
\Q[1020][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1020][16]~output_o\);

-- Location: IOOBUF_X63_Y0_N23
\Q[1020][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1020][17]~output_o\);

-- Location: IOOBUF_X67_Y15_N23
\Q[1020][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1020][18]~output_o\);

-- Location: IOOBUF_X67_Y11_N16
\Q[1020][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1020][19]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\Q[1020][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1020][20]~output_o\);

-- Location: IOOBUF_X67_Y15_N16
\Q[1020][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1020][21]~output_o\);

-- Location: IOOBUF_X61_Y0_N9
\Q[1020][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1020][22]~output_o\);

-- Location: IOOBUF_X0_Y11_N2
\Q[1020][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1020][23]~output_o\);

-- Location: IOOBUF_X67_Y30_N23
\Q[1020][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1020][24]~output_o\);

-- Location: IOOBUF_X3_Y43_N30
\Q[1020][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1020][25]~output_o\);

-- Location: IOOBUF_X0_Y32_N16
\Q[1020][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1020][26]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\Q[1020][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1020][27]~output_o\);

-- Location: IOOBUF_X0_Y18_N9
\Q[1020][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1020][28]~output_o\);

-- Location: IOOBUF_X0_Y36_N23
\Q[1020][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1020][29]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\Q[1020][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1020][30]~output_o\);

-- Location: IOOBUF_X0_Y28_N2
\Q[1020][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1020][31]~output_o\);

-- Location: IOOBUF_X3_Y43_N23
\Q[1020][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1020][32]~output_o\);

-- Location: IOOBUF_X0_Y28_N9
\Q[1020][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1020][33]~output_o\);

-- Location: IOOBUF_X0_Y32_N2
\Q[1020][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1020][34]~output_o\);

-- Location: IOOBUF_X0_Y33_N9
\Q[1020][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1020][35]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\Q[1020][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1020][36]~output_o\);

-- Location: IOOBUF_X0_Y20_N23
\Q[1020][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1020][37]~output_o\);

-- Location: IOOBUF_X1_Y43_N9
\Q[1020][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1020][38]~output_o\);

-- Location: IOOBUF_X67_Y24_N9
\Q[1020][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1020][39]~output_o\);

-- Location: IOOBUF_X0_Y38_N16
\Q[1019][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1019][0]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\Q[1019][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1019][1]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\Q[1019][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1019][2]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\Q[1019][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1019][3]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\Q[1019][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1019][4]~output_o\);

-- Location: IOOBUF_X67_Y25_N23
\Q[1019][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1019][5]~output_o\);

-- Location: IOOBUF_X61_Y43_N9
\Q[1019][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1019][6]~output_o\);

-- Location: IOOBUF_X59_Y0_N30
\Q[1019][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1019][7]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\Q[1019][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1019][8]~output_o\);

-- Location: IOOBUF_X67_Y4_N16
\Q[1019][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1019][9]~output_o\);

-- Location: IOOBUF_X14_Y0_N30
\Q[1019][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1019][10]~output_o\);

-- Location: IOOBUF_X0_Y3_N2
\Q[1019][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1019][11]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\Q[1019][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1019][12]~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\Q[1019][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1019][13]~output_o\);

-- Location: IOOBUF_X0_Y5_N23
\Q[1019][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1019][14]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\Q[1019][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1019][15]~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\Q[1019][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1019][16]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\Q[1019][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1019][17]~output_o\);

-- Location: IOOBUF_X14_Y0_N23
\Q[1019][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1019][18]~output_o\);

-- Location: IOOBUF_X11_Y0_N30
\Q[1019][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1019][19]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\Q[1019][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1019][20]~output_o\);

-- Location: IOOBUF_X14_Y0_N16
\Q[1019][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1019][21]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\Q[1019][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1019][22]~output_o\);

-- Location: IOOBUF_X0_Y5_N9
\Q[1019][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1019][23]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\Q[1019][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1019][24]~output_o\);

-- Location: IOOBUF_X45_Y43_N9
\Q[1019][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1019][25]~output_o\);

-- Location: IOOBUF_X54_Y0_N30
\Q[1019][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1019][26]~output_o\);

-- Location: IOOBUF_X48_Y0_N16
\Q[1019][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1019][27]~output_o\);

-- Location: IOOBUF_X50_Y0_N23
\Q[1019][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1019][28]~output_o\);

-- Location: IOOBUF_X45_Y0_N9
\Q[1019][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1019][29]~output_o\);

-- Location: IOOBUF_X45_Y43_N23
\Q[1019][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1019][30]~output_o\);

-- Location: IOOBUF_X67_Y5_N2
\Q[1019][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1019][31]~output_o\);

-- Location: IOOBUF_X45_Y0_N30
\Q[1019][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1019][32]~output_o\);

-- Location: IOOBUF_X45_Y43_N2
\Q[1019][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1019][33]~output_o\);

-- Location: IOOBUF_X67_Y5_N9
\Q[1019][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1019][34]~output_o\);

-- Location: IOOBUF_X67_Y8_N16
\Q[1019][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1019][35]~output_o\);

-- Location: IOOBUF_X67_Y8_N23
\Q[1019][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1019][36]~output_o\);

-- Location: IOOBUF_X50_Y0_N2
\Q[1019][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1019][37]~output_o\);

-- Location: IOOBUF_X52_Y0_N23
\Q[1019][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1019][38]~output_o\);

-- Location: IOOBUF_X48_Y0_N30
\Q[1019][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1019][39]~output_o\);

-- Location: IOOBUF_X9_Y43_N9
\Q[1018][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1018][0]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\Q[1018][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1018][1]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\Q[1018][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1018][2]~output_o\);

-- Location: IOOBUF_X11_Y43_N30
\Q[1018][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1018][3]~output_o\);

-- Location: IOOBUF_X9_Y0_N30
\Q[1018][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1018][4]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\Q[1018][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1018][5]~output_o\);

-- Location: IOOBUF_X0_Y15_N16
\Q[1018][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1018][6]~output_o\);

-- Location: IOOBUF_X0_Y37_N23
\Q[1018][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1018][7]~output_o\);

-- Location: IOOBUF_X0_Y16_N9
\Q[1018][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1018][8]~output_o\);

-- Location: IOOBUF_X0_Y32_N9
\Q[1018][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1018][9]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\Q[1018][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1018][10]~output_o\);

-- Location: IOOBUF_X0_Y2_N9
\Q[1018][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1018][11]~output_o\);

-- Location: IOOBUF_X0_Y2_N16
\Q[1018][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1018][12]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\Q[1018][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1018][13]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\Q[1018][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1018][14]~output_o\);

-- Location: IOOBUF_X38_Y0_N23
\Q[1018][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1018][15]~output_o\);

-- Location: IOOBUF_X25_Y43_N16
\Q[1018][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1018][16]~output_o\);

-- Location: IOOBUF_X0_Y17_N2
\Q[1018][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1018][17]~output_o\);

-- Location: IOOBUF_X0_Y33_N2
\Q[1018][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1018][18]~output_o\);

-- Location: IOOBUF_X27_Y43_N30
\Q[1018][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1018][19]~output_o\);

-- Location: IOOBUF_X67_Y9_N2
\Q[1018][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1018][20]~output_o\);

-- Location: IOOBUF_X32_Y43_N9
\Q[1018][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1018][21]~output_o\);

-- Location: IOOBUF_X52_Y0_N30
\Q[1018][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1018][22]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\Q[1018][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1018][23]~output_o\);

-- Location: IOOBUF_X0_Y16_N2
\Q[1018][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1018][24]~output_o\);

-- Location: IOOBUF_X0_Y2_N23
\Q[1018][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1018][25]~output_o\);

-- Location: IOOBUF_X67_Y33_N23
\Q[1018][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1018][26]~output_o\);

-- Location: IOOBUF_X38_Y0_N30
\Q[1018][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1018][27]~output_o\);

-- Location: IOOBUF_X32_Y43_N30
\Q[1018][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1018][28]~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\Q[1018][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1018][29]~output_o\);

-- Location: IOOBUF_X67_Y9_N23
\Q[1018][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1018][30]~output_o\);

-- Location: IOOBUF_X67_Y7_N23
\Q[1018][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1018][31]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\Q[1018][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1018][32]~output_o\);

-- Location: IOOBUF_X50_Y0_N9
\Q[1018][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1018][33]~output_o\);

-- Location: IOOBUF_X50_Y0_N16
\Q[1018][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1018][34]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\Q[1018][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1018][35]~output_o\);

-- Location: IOOBUF_X41_Y0_N9
\Q[1018][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1018][36]~output_o\);

-- Location: IOOBUF_X41_Y0_N2
\Q[1018][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1018][37]~output_o\);

-- Location: IOOBUF_X38_Y43_N30
\Q[1018][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1018][38]~output_o\);

-- Location: IOOBUF_X0_Y13_N9
\Q[1018][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|inst1|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1018][39]~output_o\);

-- Location: IOOBUF_X67_Y18_N9
\Q[1017][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1017][0]~output_o\);

-- Location: IOOBUF_X67_Y18_N23
\Q[1017][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1017][1]~output_o\);

-- Location: IOOBUF_X59_Y0_N9
\Q[1017][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1017][2]~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\Q[1017][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1017][3]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\Q[1017][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1017][4]~output_o\);

-- Location: IOOBUF_X59_Y0_N2
\Q[1017][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1017][5]~output_o\);

-- Location: IOOBUF_X61_Y0_N30
\Q[1017][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1017][6]~output_o\);

-- Location: IOOBUF_X67_Y32_N16
\Q[1017][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1017][7]~output_o\);

-- Location: IOOBUF_X27_Y0_N9
\Q[1017][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1017][8]~output_o\);

-- Location: IOOBUF_X27_Y0_N23
\Q[1017][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1017][9]~output_o\);

-- Location: IOOBUF_X27_Y0_N16
\Q[1017][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1017][10]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\Q[1017][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1017][11]~output_o\);

-- Location: IOOBUF_X27_Y0_N2
\Q[1017][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1017][12]~output_o\);

-- Location: IOOBUF_X29_Y0_N30
\Q[1017][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1017][13]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\Q[1017][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1017][14]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\Q[1017][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1017][15]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\Q[1017][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1017][16]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\Q[1017][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1017][17]~output_o\);

-- Location: IOOBUF_X29_Y43_N9
\Q[1017][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1017][18]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\Q[1017][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1017][19]~output_o\);

-- Location: IOOBUF_X34_Y0_N9
\Q[1017][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1017][20]~output_o\);

-- Location: IOOBUF_X29_Y43_N16
\Q[1017][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1017][21]~output_o\);

-- Location: IOOBUF_X25_Y0_N16
\Q[1017][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1017][22]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\Q[1017][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1017][23]~output_o\);

-- Location: IOOBUF_X67_Y10_N23
\Q[1017][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1017][24]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\Q[1017][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1017][25]~output_o\);

-- Location: IOOBUF_X52_Y0_N9
\Q[1017][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1017][26]~output_o\);

-- Location: IOOBUF_X43_Y43_N9
\Q[1017][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1017][27]~output_o\);

-- Location: IOOBUF_X67_Y32_N2
\Q[1017][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1017][28]~output_o\);

-- Location: IOOBUF_X67_Y10_N9
\Q[1017][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1017][29]~output_o\);

-- Location: IOOBUF_X67_Y10_N2
\Q[1017][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1017][30]~output_o\);

-- Location: IOOBUF_X67_Y29_N2
\Q[1017][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1017][31]~output_o\);

-- Location: IOOBUF_X48_Y0_N9
\Q[1017][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1017][32]~output_o\);

-- Location: IOOBUF_X45_Y43_N30
\Q[1017][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1017][33]~output_o\);

-- Location: IOOBUF_X67_Y13_N16
\Q[1017][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1017][34]~output_o\);

-- Location: IOOBUF_X67_Y14_N23
\Q[1017][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1017][35]~output_o\);

-- Location: IOOBUF_X67_Y30_N9
\Q[1017][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1017][36]~output_o\);

-- Location: IOOBUF_X67_Y10_N16
\Q[1017][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1017][37]~output_o\);

-- Location: IOOBUF_X67_Y14_N16
\Q[1017][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1017][38]~output_o\);

-- Location: IOOBUF_X67_Y30_N16
\Q[1017][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1017][39]~output_o\);

-- Location: IOOBUF_X67_Y18_N16
\Q[1016][0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst~q\,
	devoe => ww_devoe,
	o => \Q[1016][0]~output_o\);

-- Location: IOOBUF_X25_Y43_N2
\Q[1016][1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst1~q\,
	devoe => ww_devoe,
	o => \Q[1016][1]~output_o\);

-- Location: IOOBUF_X59_Y43_N9
\Q[1016][2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst2~q\,
	devoe => ww_devoe,
	o => \Q[1016][2]~output_o\);

-- Location: IOOBUF_X67_Y11_N2
\Q[1016][3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q[1016][3]~output_o\);

-- Location: IOOBUF_X18_Y43_N30
\Q[1016][4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst4~q\,
	devoe => ww_devoe,
	o => \Q[1016][4]~output_o\);

-- Location: IOOBUF_X67_Y25_N9
\Q[1016][5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst5~q\,
	devoe => ww_devoe,
	o => \Q[1016][5]~output_o\);

-- Location: IOOBUF_X59_Y43_N2
\Q[1016][6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q[1016][6]~output_o\);

-- Location: IOOBUF_X67_Y33_N2
\Q[1016][7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q[1016][7]~output_o\);

-- Location: IOOBUF_X67_Y28_N16
\Q[1016][8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q[1016][8]~output_o\);

-- Location: IOOBUF_X67_Y20_N9
\Q[1016][9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst9~q\,
	devoe => ww_devoe,
	o => \Q[1016][9]~output_o\);

-- Location: IOOBUF_X61_Y43_N23
\Q[1016][10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst10~q\,
	devoe => ww_devoe,
	o => \Q[1016][10]~output_o\);

-- Location: IOOBUF_X67_Y9_N16
\Q[1016][11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst11~q\,
	devoe => ww_devoe,
	o => \Q[1016][11]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\Q[1016][12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst12~q\,
	devoe => ww_devoe,
	o => \Q[1016][12]~output_o\);

-- Location: IOOBUF_X63_Y0_N16
\Q[1016][13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst13~q\,
	devoe => ww_devoe,
	o => \Q[1016][13]~output_o\);

-- Location: IOOBUF_X67_Y11_N23
\Q[1016][14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst14~q\,
	devoe => ww_devoe,
	o => \Q[1016][14]~output_o\);

-- Location: IOOBUF_X67_Y13_N23
\Q[1016][15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst15~q\,
	devoe => ww_devoe,
	o => \Q[1016][15]~output_o\);

-- Location: IOOBUF_X67_Y7_N16
\Q[1016][16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst16~q\,
	devoe => ww_devoe,
	o => \Q[1016][16]~output_o\);

-- Location: IOOBUF_X67_Y31_N2
\Q[1016][17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst17~q\,
	devoe => ww_devoe,
	o => \Q[1016][17]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\Q[1016][18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst18~q\,
	devoe => ww_devoe,
	o => \Q[1016][18]~output_o\);

-- Location: IOOBUF_X67_Y8_N2
\Q[1016][19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst19~q\,
	devoe => ww_devoe,
	o => \Q[1016][19]~output_o\);

-- Location: IOOBUF_X61_Y0_N16
\Q[1016][20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst21~q\,
	devoe => ww_devoe,
	o => \Q[1016][20]~output_o\);

-- Location: IOOBUF_X67_Y9_N9
\Q[1016][21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst20~q\,
	devoe => ww_devoe,
	o => \Q[1016][21]~output_o\);

-- Location: IOOBUF_X63_Y0_N30
\Q[1016][22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst22~q\,
	devoe => ww_devoe,
	o => \Q[1016][22]~output_o\);

-- Location: IOOBUF_X67_Y8_N9
\Q[1016][23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst23~q\,
	devoe => ww_devoe,
	o => \Q[1016][23]~output_o\);

-- Location: IOOBUF_X67_Y12_N2
\Q[1016][24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst24~q\,
	devoe => ww_devoe,
	o => \Q[1016][24]~output_o\);

-- Location: IOOBUF_X48_Y0_N2
\Q[1016][25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst25~q\,
	devoe => ww_devoe,
	o => \Q[1016][25]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\Q[1016][26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst26~q\,
	devoe => ww_devoe,
	o => \Q[1016][26]~output_o\);

-- Location: IOOBUF_X67_Y28_N2
\Q[1016][27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst27~q\,
	devoe => ww_devoe,
	o => \Q[1016][27]~output_o\);

-- Location: IOOBUF_X67_Y15_N9
\Q[1016][28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst28~q\,
	devoe => ww_devoe,
	o => \Q[1016][28]~output_o\);

-- Location: IOOBUF_X67_Y32_N9
\Q[1016][29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst29~q\,
	devoe => ww_devoe,
	o => \Q[1016][29]~output_o\);

-- Location: IOOBUF_X67_Y16_N9
\Q[1016][30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst30~q\,
	devoe => ww_devoe,
	o => \Q[1016][30]~output_o\);

-- Location: IOOBUF_X43_Y43_N23
\Q[1016][31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst31~q\,
	devoe => ww_devoe,
	o => \Q[1016][31]~output_o\);

-- Location: IOOBUF_X67_Y31_N9
\Q[1016][32]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst32~q\,
	devoe => ww_devoe,
	o => \Q[1016][32]~output_o\);

-- Location: IOOBUF_X67_Y12_N9
\Q[1016][33]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst33~q\,
	devoe => ww_devoe,
	o => \Q[1016][33]~output_o\);

-- Location: IOOBUF_X67_Y12_N16
\Q[1016][34]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst34~q\,
	devoe => ww_devoe,
	o => \Q[1016][34]~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\Q[1016][35]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst35~q\,
	devoe => ww_devoe,
	o => \Q[1016][35]~output_o\);

-- Location: IOOBUF_X50_Y0_N30
\Q[1016][36]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst36~q\,
	devoe => ww_devoe,
	o => \Q[1016][36]~output_o\);

-- Location: IOOBUF_X67_Y16_N23
\Q[1016][37]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst37~q\,
	devoe => ww_devoe,
	o => \Q[1016][37]~output_o\);

-- Location: IOOBUF_X67_Y12_N23
\Q[1016][38]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst38~q\,
	devoe => ww_devoe,
	o => \Q[1016][38]~output_o\);

-- Location: IOOBUF_X67_Y20_N2
\Q[1016][39]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|inst1|inst|inst39~q\,
	devoe => ww_devoe,
	o => \Q[1016][39]~output_o\);

-- Location: IOIBUF_X0_Y21_N1
\C~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C,
	o => \C~input_o\);

-- Location: CLKCTRL_G4
\C~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \C~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \C~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y18_N1
\WR~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WR,
	o => \WR~input_o\);

-- Location: IOIBUF_X22_Y43_N8
\A[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(9),
	o => \A[9]~input_o\);

-- Location: IOIBUF_X0_Y13_N15
\A[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: IOIBUF_X22_Y0_N8
\A[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X0_Y32_N22
\A[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: IOIBUF_X0_Y5_N15
\A[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X56_Y0_N29
\A[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X67_Y5_N22
\A[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: LCCOMB_X56_Y5_N8
\inst|inst|inst|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\ = (\A[2]~input_o\ & (\A[1]~input_o\ & (\A[0]~input_o\ & \A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \A[1]~input_o\,
	datac => \A[0]~input_o\,
	datad => \A[3]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X22_Y13_N12
\inst|inst|inst|inst5|inst|inst|inst|inst4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ = (\A[6]~input_o\ & (\A[4]~input_o\ & (\A[5]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[6]~input_o\,
	datab => \A[4]~input_o\,
	datac => \A[5]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\);

-- Location: LCCOMB_X22_Y13_N30
\inst|inst|inst|inst5|inst|inst|inst|inst4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ = (\A[8]~input_o\ & (\A[9]~input_o\ & (\A[7]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \A[7]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\);

-- Location: LCCOMB_X25_Y18_N0
\inst|inst|inst|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[0]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst|inst|inst|inst~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N1
\inst|inst|inst|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N26
\inst|inst|inst|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[1]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst1~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst|inst|inst|inst1~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N27
\inst|inst|inst|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst1~q\);

-- Location: IOIBUF_X67_Y16_N1
\D[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(2),
	o => \D[2]~input_o\);

-- Location: LCCOMB_X25_Y18_N12
\inst|inst|inst|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst2~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst|inst|inst|inst2~q\,
	datad => \D[2]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X25_Y18_N13
\inst|inst|inst|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst2~q\);

-- Location: IOIBUF_X20_Y0_N15
\D[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(3),
	o => \D[3]~input_o\);

-- Location: LCCOMB_X19_Y11_N16
\inst|inst|inst|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst3~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst|inst|inst|inst|inst3~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N17
\inst|inst|inst|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst3~q\);

-- Location: IOIBUF_X20_Y0_N8
\D[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(4),
	o => \D[4]~input_o\);

-- Location: LCCOMB_X19_Y11_N26
\inst|inst|inst|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst4~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst|inst|inst|inst|inst4~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N27
\inst|inst|inst|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst4~q\);

-- Location: IOIBUF_X67_Y17_N22
\D[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(5),
	o => \D[5]~input_o\);

-- Location: LCCOMB_X19_Y11_N12
\inst|inst|inst|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst1|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst5~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst5~q\,
	datad => \D[5]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X19_Y11_N13
\inst|inst|inst|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst5~q\);

-- Location: IOIBUF_X0_Y18_N15
\D[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(6),
	o => \D[6]~input_o\);

-- Location: LCCOMB_X1_Y19_N16
\inst|inst|inst|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst1|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst6~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst6~q\,
	datad => \D[6]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X1_Y19_N17
\inst|inst|inst|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst6~q\);

-- Location: IOIBUF_X67_Y6_N15
\D[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(7),
	o => \D[7]~input_o\);

-- Location: LCCOMB_X1_Y19_N2
\inst|inst|inst|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst1|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst7~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[7]~input_o\,
	datac => \inst|inst|inst|inst|inst7~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X1_Y19_N3
\inst|inst|inst|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst7~q\);

-- Location: LCCOMB_X1_Y19_N20
\inst|inst|inst|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst1|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[8]~input_o\) # ((\inst|inst|inst|inst|inst8~q\ & !\WR~input_o\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[8]~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst8~q\,
	datad => \WR~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X1_Y19_N21
\inst|inst|inst|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst8~q\);

-- Location: IOIBUF_X61_Y0_N22
\D[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(9),
	o => \D[9]~input_o\);

-- Location: LCCOMB_X1_Y19_N6
\inst|inst|inst|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst1|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst9~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst9~q\,
	datad => \D[9]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X1_Y19_N7
\inst|inst|inst|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst9~q\);

-- Location: IOIBUF_X0_Y14_N1
\D[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(10),
	o => \D[10]~input_o\);

-- Location: LCCOMB_X1_Y19_N0
\inst|inst|inst|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst2|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst10~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst10~q\,
	datad => \D[10]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X1_Y19_N1
\inst|inst|inst|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst10~q\);

-- Location: IOIBUF_X0_Y2_N1
\D[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(11),
	o => \D[11]~input_o\);

-- Location: LCCOMB_X1_Y19_N26
\inst|inst|inst|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst2|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst11~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst11~q\,
	datad => \D[11]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X1_Y19_N27
\inst|inst|inst|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst11~q\);

-- Location: LCCOMB_X1_Y19_N4
\inst|inst|inst|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst2|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[12]~input_o\) # ((\inst|inst|inst|inst|inst12~q\ & !\WR~input_o\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[12]~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst12~q\,
	datad => \WR~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X1_Y19_N5
\inst|inst|inst|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst12~q\);

-- Location: IOIBUF_X0_Y20_N1
\D[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(13),
	o => \D[13]~input_o\);

-- Location: LCCOMB_X1_Y19_N30
\inst|inst|inst|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst2|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst13~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst13~q\,
	datad => \D[13]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X1_Y19_N31
\inst|inst|inst|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst13~q\);

-- Location: IOIBUF_X0_Y19_N15
\D[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(14),
	o => \D[14]~input_o\);

-- Location: LCCOMB_X1_Y19_N8
\inst|inst|inst|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst2|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst14~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst14~q\,
	datad => \D[14]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X1_Y19_N9
\inst|inst|inst|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst14~q\);

-- Location: LCCOMB_X1_Y19_N10
\inst|inst|inst|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst3|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst15~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[15]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst|inst|inst|inst15~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X1_Y19_N11
\inst|inst|inst|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst15~q\);

-- Location: IOIBUF_X67_Y25_N1
\D[16]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(16),
	o => \D[16]~input_o\);

-- Location: LCCOMB_X1_Y19_N28
\inst|inst|inst|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst3|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[16]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst16~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst16~q\,
	datad => \D[16]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X1_Y19_N29
\inst|inst|inst|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst16~q\);

-- Location: IOIBUF_X67_Y6_N22
\D[17]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(17),
	o => \D[17]~input_o\);

-- Location: LCCOMB_X1_Y19_N14
\inst|inst|inst|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst3|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[17]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst17~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst17~q\,
	datad => \D[17]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X1_Y19_N15
\inst|inst|inst|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst17~q\);

-- Location: IOIBUF_X0_Y29_N8
\D[18]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(18),
	o => \D[18]~input_o\);

-- Location: LCCOMB_X1_Y19_N24
\inst|inst|inst|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst3|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[18]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst18~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst18~q\,
	datad => \D[18]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X1_Y19_N25
\inst|inst|inst|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst18~q\);

-- Location: IOIBUF_X0_Y6_N1
\D[19]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(19),
	o => \D[19]~input_o\);

-- Location: LCCOMB_X1_Y19_N18
\inst|inst|inst|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst3|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst19~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst19~q\,
	datad => \D[19]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X1_Y19_N19
\inst|inst|inst|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst19~q\);

-- Location: IOIBUF_X0_Y17_N15
\D[20]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(20),
	o => \D[20]~input_o\);

-- Location: LCCOMB_X1_Y19_N12
\inst|inst|inst|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[20]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst21~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst21~q\,
	datad => \D[20]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X1_Y19_N13
\inst|inst|inst|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst21~q\);

-- Location: IOIBUF_X52_Y0_N1
\D[21]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(21),
	o => \D[21]~input_o\);

-- Location: LCCOMB_X1_Y19_N22
\inst|inst|inst|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[21]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst20~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst20~q\,
	datad => \D[21]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X1_Y19_N23
\inst|inst|inst|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst20~q\);

-- Location: IOIBUF_X0_Y6_N8
\D[22]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(22),
	o => \D[22]~input_o\);

-- Location: LCCOMB_X3_Y7_N24
\inst|inst|inst|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst22~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[22]~input_o\,
	datac => \inst|inst|inst|inst|inst22~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X3_Y7_N25
\inst|inst|inst|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst22~q\);

-- Location: IOIBUF_X0_Y6_N15
\D[23]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(23),
	o => \D[23]~input_o\);

-- Location: LCCOMB_X3_Y7_N18
\inst|inst|inst|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[23]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst23~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[23]~input_o\,
	datac => \inst|inst|inst|inst|inst23~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X3_Y7_N19
\inst|inst|inst|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst23~q\);

-- Location: IOIBUF_X3_Y43_N15
\D[24]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(24),
	o => \D[24]~input_o\);

-- Location: LCCOMB_X3_Y7_N4
\inst|inst|inst|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst24~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[24]~input_o\,
	datac => \inst|inst|inst|inst|inst24~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X3_Y7_N5
\inst|inst|inst|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst24~q\);

-- Location: IOIBUF_X7_Y0_N22
\D[25]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(25),
	o => \D[25]~input_o\);

-- Location: LCCOMB_X3_Y7_N6
\inst|inst|inst|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst1|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[25]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst25~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[25]~input_o\,
	datac => \inst|inst|inst|inst|inst25~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X3_Y7_N7
\inst|inst|inst|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst25~q\);

-- Location: IOIBUF_X0_Y14_N22
\D[26]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(26),
	o => \D[26]~input_o\);

-- Location: LCCOMB_X3_Y7_N16
\inst|inst|inst|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[26]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst26~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[26]~input_o\,
	datac => \inst|inst|inst|inst|inst26~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X3_Y7_N17
\inst|inst|inst|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst26~q\);

-- Location: IOIBUF_X45_Y0_N1
\D[27]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(27),
	o => \D[27]~input_o\);

-- Location: LCCOMB_X3_Y7_N2
\inst|inst|inst|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst27~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst27~q\,
	datad => \D[27]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X3_Y7_N3
\inst|inst|inst|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst27~q\);

-- Location: IOIBUF_X0_Y14_N15
\D[28]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(28),
	o => \D[28]~input_o\);

-- Location: LCCOMB_X3_Y7_N20
\inst|inst|inst|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[28]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst28~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[28]~input_o\,
	datac => \inst|inst|inst|inst|inst28~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X3_Y7_N21
\inst|inst|inst|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst28~q\);

-- Location: IOIBUF_X41_Y0_N22
\D[29]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(29),
	o => \D[29]~input_o\);

-- Location: LCCOMB_X3_Y7_N22
\inst|inst|inst|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst29~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst29~q\,
	datad => \D[29]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X3_Y7_N23
\inst|inst|inst|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst29~q\);

-- Location: IOIBUF_X48_Y0_N22
\D[30]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(30),
	o => \D[30]~input_o\);

-- Location: LCCOMB_X3_Y7_N0
\inst|inst|inst|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst2|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[30]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst30~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst30~q\,
	datad => \D[30]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X3_Y7_N1
\inst|inst|inst|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst30~q\);

-- Location: IOIBUF_X7_Y0_N29
\D[31]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(31),
	o => \D[31]~input_o\);

-- Location: LCCOMB_X3_Y7_N26
\inst|inst|inst|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst31~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[31]~input_o\,
	datac => \inst|inst|inst|inst|inst31~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X3_Y7_N27
\inst|inst|inst|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst31~q\);

-- Location: IOIBUF_X67_Y15_N1
\D[32]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(32),
	o => \D[32]~input_o\);

-- Location: LCCOMB_X3_Y7_N28
\inst|inst|inst|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[32]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst32~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst32~q\,
	datad => \D[32]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X3_Y7_N29
\inst|inst|inst|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst32~q\);

-- Location: IOIBUF_X5_Y0_N29
\D[33]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(33),
	o => \D[33]~input_o\);

-- Location: LCCOMB_X3_Y7_N30
\inst|inst|inst|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[33]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst33~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[33]~input_o\,
	datac => \inst|inst|inst|inst|inst33~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X3_Y7_N31
\inst|inst|inst|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst33~q\);

-- Location: IOIBUF_X7_Y43_N22
\D[34]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(34),
	o => \D[34]~input_o\);

-- Location: LCCOMB_X3_Y7_N8
\inst|inst|inst|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst34~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[34]~input_o\,
	datac => \inst|inst|inst|inst|inst34~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X3_Y7_N9
\inst|inst|inst|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst34~q\);

-- Location: IOIBUF_X3_Y0_N1
\D[35]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(35),
	o => \D[35]~input_o\);

-- Location: LCCOMB_X3_Y7_N10
\inst|inst|inst|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst3|inst|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[35]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst35~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[35]~input_o\,
	datac => \inst|inst|inst|inst|inst35~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X3_Y7_N11
\inst|inst|inst|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst35~q\);

-- Location: IOIBUF_X0_Y12_N15
\D[36]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(36),
	o => \D[36]~input_o\);

-- Location: LCCOMB_X3_Y7_N12
\inst|inst|inst|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[36]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst36~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	datac => \inst|inst|inst|inst|inst36~q\,
	datad => \D[36]~input_o\,
	combout => \inst|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X3_Y7_N13
\inst|inst|inst|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst36~q\);

-- Location: IOIBUF_X7_Y0_N8
\D[37]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(37),
	o => \D[37]~input_o\);

-- Location: LCCOMB_X3_Y7_N14
\inst|inst|inst|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst37~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[37]~input_o\,
	datac => \inst|inst|inst|inst|inst37~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X3_Y7_N15
\inst|inst|inst|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst37~q\);

-- Location: IOIBUF_X0_Y9_N1
\D[38]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(38),
	o => \D[38]~input_o\);

-- Location: LCCOMB_X4_Y11_N24
\inst|inst|inst|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[38]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst38~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[38]~input_o\,
	datac => \inst|inst|inst|inst|inst38~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X4_Y11_N25
\inst|inst|inst|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst38~q\);

-- Location: IOIBUF_X0_Y13_N1
\D[39]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(39),
	o => \D[39]~input_o\);

-- Location: LCCOMB_X4_Y11_N26
\inst|inst|inst|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & ((\D[39]~input_o\) # ((!\WR~input_o\ & \inst|inst|inst|inst|inst39~q\)))) # (!\inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\ & 
-- (((\inst|inst|inst|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[39]~input_o\,
	datac => \inst|inst|inst|inst|inst39~q\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~2_combout\,
	combout => \inst|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X4_Y11_N27
\inst|inst|inst|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst|inst|inst39~q\);

-- Location: IOIBUF_X0_Y15_N22
\A[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(8),
	o => \A[8]~input_o\);

-- Location: LCCOMB_X22_Y13_N28
\inst|inst|inst1|inst5|inst|inst|inst|inst4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ = (\WR~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \WR~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\);

-- Location: LCCOMB_X22_Y13_N16
\inst|inst|inst|inst5|inst|inst|inst|inst4~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\ = (\A[6]~input_o\ & (\A[5]~input_o\ & \A[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[6]~input_o\,
	datac => \A[5]~input_o\,
	datad => \A[4]~input_o\,
	combout => \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\);

-- Location: LCCOMB_X22_Y13_N18
\inst|inst|inst1|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ = (\A[7]~input_o\ & (\inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\ & (!\A[9]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[7]~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\,
	datac => \A[9]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X10_Y11_N16
\inst|inst|inst1|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X10_Y11_N17
\inst|inst|inst1|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst~q\);

-- Location: LCCOMB_X10_Y11_N10
\inst|inst|inst1|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst1~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst1~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X10_Y11_N11
\inst|inst|inst1|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst1~q\);

-- Location: LCCOMB_X10_Y11_N28
\inst|inst|inst1|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst2~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst2~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X10_Y11_N29
\inst|inst|inst1|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst2~q\);

-- Location: LCCOMB_X10_Y11_N22
\inst|inst|inst1|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst3~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst3~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X10_Y11_N23
\inst|inst|inst1|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N22
\inst|inst|inst1|inst5|inst|inst|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\ = (\A[8]~input_o\ & \D[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[4]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\);

-- Location: LCCOMB_X10_Y11_N0
\inst|inst|inst1|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\) # ((\inst|inst|inst1|inst|inst4~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst4~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X10_Y11_N1
\inst|inst|inst1|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst4~q\);

-- Location: LCCOMB_X22_Y13_N14
\inst|inst|inst1|inst5|inst|inst1|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\ = (\A[8]~input_o\ & \D[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datac => \D[5]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\);

-- Location: LCCOMB_X10_Y11_N2
\inst|inst|inst1|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst5~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst5~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X10_Y11_N3
\inst|inst|inst1|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst5~q\);

-- Location: LCCOMB_X1_Y16_N6
\inst|inst|inst1|inst5|inst|inst1|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\ = (\A[8]~input_o\ & \D[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datad => \D[6]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N0
\inst|inst|inst1|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst6~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst6~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X1_Y16_N1
\inst|inst|inst1|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst6~q\);

-- Location: LCCOMB_X1_Y16_N24
\inst|inst|inst1|inst5|inst|inst1|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datad => \D[7]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N2
\inst|inst|inst1|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\) # ((\inst|inst|inst1|inst|inst7~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst7~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X1_Y16_N3
\inst|inst|inst1|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst7~q\);

-- Location: IOIBUF_X56_Y0_N1
\D[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(8),
	o => \D[8]~input_o\);

-- Location: LCCOMB_X1_Y16_N10
\inst|inst|inst1|inst5|inst|inst1|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\ = (\D[8]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \D[8]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N4
\inst|inst|inst1|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst8~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst8~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X1_Y16_N5
\inst|inst|inst1|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst8~q\);

-- Location: LCCOMB_X1_Y16_N12
\inst|inst|inst1|inst5|inst|inst1|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\ = (\A[8]~input_o\ & \D[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datac => \D[9]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N22
\inst|inst|inst1|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst9~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst9~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X1_Y16_N23
\inst|inst|inst1|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst9~q\);

-- Location: LCCOMB_X38_Y9_N2
\inst|inst|inst1|inst5|inst|inst2|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\ = (\D[10]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \D[10]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N8
\inst|inst|inst1|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst10~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst10~q\,
	datad => \inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X1_Y16_N9
\inst|inst|inst1|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst10~q\);

-- Location: LCCOMB_X1_Y2_N6
\inst|inst|inst1|inst5|inst|inst2|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\ = (\A[8]~input_o\ & \D[11]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[11]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N8
\inst|inst|inst1|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst11~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst11~q\,
	datad => \inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X1_Y2_N9
\inst|inst|inst1|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst11~q\);

-- Location: LCCOMB_X1_Y2_N16
\inst|inst|inst1|inst5|inst|inst2|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\ = (\D[12]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[12]~input_o\,
	datac => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N18
\inst|inst|inst1|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\) # ((\inst|inst|inst1|inst|inst12~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst12~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X1_Y2_N19
\inst|inst|inst1|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst12~q\);

-- Location: LCCOMB_X1_Y2_N10
\inst|inst|inst1|inst5|inst|inst2|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\ = (\A[8]~input_o\ & \D[13]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datad => \D[13]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N28
\inst|inst|inst1|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst13~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst13~q\,
	datad => \inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X1_Y2_N29
\inst|inst|inst1|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst13~q\);

-- Location: LCCOMB_X1_Y2_N12
\inst|inst|inst1|inst5|inst|inst2|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\ = (\A[8]~input_o\ & \D[14]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[14]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N22
\inst|inst|inst1|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst14~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst14~q\,
	datad => \inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X1_Y2_N23
\inst|inst|inst1|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst14~q\);

-- Location: IOIBUF_X0_Y20_N15
\D[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(15),
	o => \D[15]~input_o\);

-- Location: LCCOMB_X38_Y9_N12
\inst|inst|inst1|inst5|inst|inst3|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\ = (\A[8]~input_o\ & \D[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datad => \D[15]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N0
\inst|inst|inst1|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst15~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst15~q\,
	datad => \inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X1_Y2_N1
\inst|inst|inst1|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst15~q\);

-- Location: LCCOMB_X26_Y17_N0
\inst|inst|inst1|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\) # ((\inst|inst|inst1|inst|inst16~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst16~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X26_Y17_N1
\inst|inst|inst1|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst16~q\);

-- Location: LCCOMB_X26_Y17_N24
\inst|inst|inst1|inst5|inst|inst3|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[17]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datac => \D[17]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N2
\inst|inst|inst1|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\) # ((\inst|inst|inst1|inst|inst17~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst17~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X26_Y17_N3
\inst|inst|inst1|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst17~q\);

-- Location: LCCOMB_X26_Y17_N18
\inst|inst|inst1|inst5|inst|inst3|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\ = (\A[8]~input_o\ & \D[18]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datac => \D[18]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N20
\inst|inst|inst1|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\) # ((\inst|inst|inst1|inst|inst18~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst18~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X26_Y17_N21
\inst|inst|inst1|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst18~q\);

-- Location: LCCOMB_X26_Y17_N28
\inst|inst|inst1|inst5|inst|inst3|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\ = (\D[19]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[19]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N6
\inst|inst|inst1|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\) # ((\inst|inst|inst1|inst|inst19~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst19~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X26_Y17_N7
\inst|inst|inst1|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst19~q\);

-- Location: LCCOMB_X38_Y9_N6
\inst|inst|inst1|inst5|inst1|inst|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\ = (\A[8]~input_o\ & \D[20]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datad => \D[20]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\);

-- Location: LCCOMB_X26_Y17_N16
\inst|inst|inst1|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\) # ((\inst|inst|inst1|inst|inst21~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst21~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X26_Y17_N17
\inst|inst|inst1|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst21~q\);

-- Location: LCCOMB_X33_Y16_N0
\inst|inst|inst1|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\) # ((\inst|inst|inst1|inst|inst20~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst20~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X33_Y16_N1
\inst|inst|inst1|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst20~q\);

-- Location: LCCOMB_X33_Y16_N24
\inst|inst|inst1|inst5|inst1|inst|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\ = (\D[22]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \D[22]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N26
\inst|inst|inst1|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst22~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst22~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X33_Y16_N27
\inst|inst|inst1|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst22~q\);

-- Location: LCCOMB_X10_Y11_N20
\inst|inst|inst1|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst23~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst23~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X10_Y11_N21
\inst|inst|inst1|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst23~q\);

-- Location: LCCOMB_X1_Y16_N30
\inst|inst|inst1|inst5|inst1|inst|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\ = (\A[8]~input_o\ & \D[24]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datad => \D[24]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\);

-- Location: LCCOMB_X1_Y16_N26
\inst|inst|inst1|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst24~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst24~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X1_Y16_N27
\inst|inst|inst1|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst24~q\);

-- Location: LCCOMB_X1_Y2_N30
\inst|inst|inst1|inst5|inst1|inst1|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\ = (\A[8]~input_o\ & \D[25]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[25]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\);

-- Location: LCCOMB_X1_Y2_N26
\inst|inst|inst1|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst25~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst25~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X1_Y2_N27
\inst|inst|inst1|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst25~q\);

-- Location: LCCOMB_X26_Y17_N10
\inst|inst|inst1|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\) # ((\inst|inst|inst1|inst|inst26~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst26~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X26_Y17_N11
\inst|inst|inst1|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst26~q\);

-- Location: LCCOMB_X33_Y16_N2
\inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[27]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datac => \D[27]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N4
\inst|inst|inst1|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst27~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst27~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X33_Y16_N5
\inst|inst|inst1|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst27~q\);

-- Location: LCCOMB_X33_Y16_N20
\inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\ = (\D[28]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[28]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N22
\inst|inst|inst1|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst28~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst28~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X33_Y16_N23
\inst|inst|inst1|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst28~q\);

-- Location: LCCOMB_X33_Y16_N14
\inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\ = (\D[29]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[29]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N8
\inst|inst|inst1|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst29~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst29~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X33_Y16_N9
\inst|inst|inst1|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst29~q\);

-- Location: LCCOMB_X38_Y9_N0
\inst|inst|inst1|inst5|inst1|inst2|inst|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\ = (\D[30]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[30]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\);

-- Location: LCCOMB_X33_Y16_N18
\inst|inst|inst1|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst30~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst30~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X33_Y16_N19
\inst|inst|inst1|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst30~q\);

-- Location: LCCOMB_X43_Y7_N8
\inst|inst|inst1|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\) # ((\inst|inst|inst1|inst|inst31~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst31~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X43_Y7_N9
\inst|inst|inst1|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst31~q\);

-- Location: LCCOMB_X43_Y7_N16
\inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[32]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[32]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N18
\inst|inst|inst1|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst32~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst32~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X43_Y7_N19
\inst|inst|inst1|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst32~q\);

-- Location: LCCOMB_X43_Y7_N2
\inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\ = (\A[8]~input_o\ & \D[33]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[8]~input_o\,
	datad => \D[33]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N4
\inst|inst|inst1|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst33~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst33~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X43_Y7_N5
\inst|inst|inst1|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst33~q\);

-- Location: LCCOMB_X43_Y7_N12
\inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\ = (\D[34]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[34]~input_o\,
	datac => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N6
\inst|inst|inst1|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst34~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst34~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X43_Y7_N7
\inst|inst|inst1|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst34~q\);

-- Location: LCCOMB_X43_Y7_N24
\inst|inst|inst1|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\) # ((\inst|inst|inst1|inst|inst35~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst35~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X43_Y7_N25
\inst|inst|inst1|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst35~q\);

-- Location: LCCOMB_X38_Y9_N10
\inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\ = (\D[36]~input_o\ & \A[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[36]~input_o\,
	datad => \A[8]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\);

-- Location: LCCOMB_X43_Y7_N10
\inst|inst|inst1|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst36~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst36~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X43_Y7_N11
\inst|inst|inst1|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst36~q\);

-- Location: LCCOMB_X38_Y9_N28
\inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\ = (\A[8]~input_o\ & \D[37]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[8]~input_o\,
	datad => \D[37]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\);

-- Location: LCCOMB_X38_Y9_N16
\inst|inst|inst1|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst37~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst|inst1|inst|inst37~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X38_Y9_N17
\inst|inst|inst1|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst37~q\);

-- Location: LCCOMB_X38_Y9_N18
\inst|inst|inst1|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst38~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst|inst|inst1|inst|inst38~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X38_Y9_N19
\inst|inst|inst1|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst38~q\);

-- Location: LCCOMB_X22_Y13_N0
\inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\ = (\A[8]~input_o\ & \D[39]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datad => \D[39]~input_o\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\);

-- Location: LCCOMB_X22_Y13_N24
\inst|inst|inst1|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst|inst|inst1|inst|inst39~q\)))) # (!\inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst|inst|inst1|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\,
	datac => \inst|inst|inst1|inst|inst39~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X22_Y13_N25
\inst|inst|inst1|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|inst1|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N2
\inst|inst1|inst|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[8]~input_o\ & (\A[9]~input_o\ & (\A[7]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \A[7]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X25_Y18_N30
\inst|inst1|inst|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[0]~input_o\) # ((\inst|inst1|inst|inst|inst~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst1|inst|inst|inst~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N31
\inst|inst1|inst|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N8
\inst|inst1|inst|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[1]~input_o\) # ((\inst|inst1|inst|inst|inst1~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst1|inst|inst|inst1~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N9
\inst|inst1|inst|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst1~q\);

-- Location: LCCOMB_X25_Y18_N18
\inst|inst1|inst|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst2~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst2~q\,
	datad => \D[2]~input_o\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X25_Y18_N19
\inst|inst1|inst|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst2~q\);

-- Location: LCCOMB_X19_Y11_N30
\inst|inst1|inst|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst3~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst|inst1|inst|inst|inst3~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N31
\inst|inst1|inst|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N24
\inst|inst1|inst|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst4~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst|inst1|inst|inst|inst4~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N25
\inst|inst1|inst|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst4~q\);

-- Location: LCCOMB_X19_Y11_N2
\inst|inst1|inst|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst1|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst5~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst1|inst|inst|inst5~q\,
	datad => \D[5]~input_o\,
	combout => \inst|inst1|inst|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X19_Y11_N3
\inst|inst1|inst|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst5~q\);

-- Location: LCCOMB_X62_Y19_N0
\inst|inst1|inst|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst6~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[6]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst6~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X62_Y19_N1
\inst|inst1|inst|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst6~q\);

-- Location: LCCOMB_X62_Y19_N2
\inst|inst1|inst|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst7~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[7]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst7~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X62_Y19_N3
\inst|inst1|inst|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst7~q\);

-- Location: LCCOMB_X62_Y19_N20
\inst|inst1|inst|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[8]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst8~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[8]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst8~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X62_Y19_N21
\inst|inst1|inst|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst8~q\);

-- Location: LCCOMB_X62_Y19_N14
\inst|inst1|inst|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst9~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[9]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst9~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X62_Y19_N15
\inst|inst1|inst|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst9~q\);

-- Location: LCCOMB_X62_Y19_N24
\inst|inst1|inst|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst2|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst10~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[10]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst10~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X62_Y19_N25
\inst|inst1|inst|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst10~q\);

-- Location: LCCOMB_X62_Y19_N18
\inst|inst1|inst|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst11~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[11]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst11~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X62_Y19_N19
\inst|inst1|inst|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst11~q\);

-- Location: LCCOMB_X62_Y19_N12
\inst|inst1|inst|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[12]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst12~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[12]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst12~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X62_Y19_N13
\inst|inst1|inst|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst12~q\);

-- Location: LCCOMB_X62_Y19_N6
\inst|inst1|inst|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst13~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[13]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst13~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X62_Y19_N7
\inst|inst1|inst|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst13~q\);

-- Location: LCCOMB_X62_Y19_N8
\inst|inst1|inst|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst14~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[14]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst14~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X62_Y19_N9
\inst|inst1|inst|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst14~q\);

-- Location: LCCOMB_X62_Y19_N26
\inst|inst1|inst|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst3|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst15~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[15]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst15~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X62_Y19_N27
\inst|inst1|inst|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst15~q\);

-- Location: LCCOMB_X62_Y19_N28
\inst|inst1|inst|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[16]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst16~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[16]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst16~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X62_Y19_N29
\inst|inst1|inst|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst16~q\);

-- Location: LCCOMB_X62_Y19_N22
\inst|inst1|inst|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[17]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst17~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[17]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst17~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X62_Y19_N23
\inst|inst1|inst|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst17~q\);

-- Location: LCCOMB_X62_Y19_N16
\inst|inst1|inst|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[18]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst18~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[18]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst18~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X62_Y19_N17
\inst|inst1|inst|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst18~q\);

-- Location: LCCOMB_X62_Y19_N10
\inst|inst1|inst|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst19~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[19]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst19~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X62_Y19_N11
\inst|inst1|inst|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst19~q\);

-- Location: LCCOMB_X62_Y19_N4
\inst|inst1|inst|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[20]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst21~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[20]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst21~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X62_Y19_N5
\inst|inst1|inst|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst21~q\);

-- Location: LCCOMB_X62_Y19_N30
\inst|inst1|inst|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[21]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst20~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[21]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst20~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X62_Y19_N31
\inst|inst1|inst|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst20~q\);

-- Location: LCCOMB_X39_Y7_N0
\inst|inst1|inst|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst22~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[22]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst22~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X39_Y7_N1
\inst|inst1|inst|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst22~q\);

-- Location: LCCOMB_X39_Y7_N18
\inst|inst1|inst|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[23]~input_o\) # ((\inst|inst1|inst|inst|inst23~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[23]~input_o\,
	datac => \inst|inst1|inst|inst|inst23~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X39_Y7_N19
\inst|inst1|inst|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst23~q\);

-- Location: LCCOMB_X39_Y7_N4
\inst|inst1|inst|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst24~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[24]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst24~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X39_Y7_N5
\inst|inst1|inst|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst24~q\);

-- Location: LCCOMB_X39_Y7_N30
\inst|inst1|inst|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[25]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst25~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[25]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst25~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X39_Y7_N31
\inst|inst1|inst|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst25~q\);

-- Location: LCCOMB_X39_Y7_N8
\inst|inst1|inst|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[26]~input_o\) # ((\inst|inst1|inst|inst|inst26~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[26]~input_o\,
	datac => \inst|inst1|inst|inst|inst26~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X39_Y7_N9
\inst|inst1|inst|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst26~q\);

-- Location: LCCOMB_X39_Y7_N26
\inst|inst1|inst|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst27~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst27~q\,
	datad => \D[27]~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X39_Y7_N27
\inst|inst1|inst|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst27~q\);

-- Location: LCCOMB_X39_Y7_N20
\inst|inst1|inst|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[28]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst28~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[28]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst28~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X39_Y7_N21
\inst|inst1|inst|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst28~q\);

-- Location: LCCOMB_X39_Y7_N14
\inst|inst1|inst|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst29~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst29~q\,
	datad => \D[29]~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X39_Y7_N15
\inst|inst1|inst|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst29~q\);

-- Location: LCCOMB_X39_Y7_N16
\inst|inst1|inst|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[30]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst30~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst30~q\,
	datad => \D[30]~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X39_Y7_N17
\inst|inst1|inst|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst30~q\);

-- Location: LCCOMB_X39_Y7_N10
\inst|inst1|inst|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst31~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst31~q\,
	datad => \D[31]~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X39_Y7_N11
\inst|inst1|inst|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst31~q\);

-- Location: LCCOMB_X39_Y7_N28
\inst|inst1|inst|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[32]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst32~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst32~q\,
	datad => \D[32]~input_o\,
	combout => \inst|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X39_Y7_N29
\inst|inst1|inst|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst32~q\);

-- Location: LCCOMB_X39_Y7_N22
\inst|inst1|inst|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[33]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst33~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[33]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst33~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X39_Y7_N23
\inst|inst1|inst|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst33~q\);

-- Location: LCCOMB_X39_Y7_N24
\inst|inst1|inst|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst34~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[34]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst34~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X39_Y7_N25
\inst|inst1|inst|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst34~q\);

-- Location: LCCOMB_X39_Y7_N2
\inst|inst1|inst|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[35]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst35~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[35]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst35~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X39_Y7_N3
\inst|inst1|inst|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst35~q\);

-- Location: LCCOMB_X39_Y7_N12
\inst|inst1|inst|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[36]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst36~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[36]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst36~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X39_Y7_N13
\inst|inst1|inst|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst36~q\);

-- Location: LCCOMB_X39_Y7_N6
\inst|inst1|inst|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst37~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[37]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst|inst|inst37~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X39_Y7_N7
\inst|inst1|inst|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst37~q\);

-- Location: LCCOMB_X21_Y17_N24
\inst|inst1|inst|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[38]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst38~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[38]~input_o\,
	datac => \inst|inst1|inst|inst|inst38~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X21_Y17_N25
\inst|inst1|inst|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst38~q\);

-- Location: LCCOMB_X21_Y17_N26
\inst|inst1|inst|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[39]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst|inst|inst39~q\)))) # (!\inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[39]~input_o\,
	datac => \inst|inst1|inst|inst|inst39~q\,
	datad => \inst|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X21_Y17_N27
\inst|inst1|inst|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N20
\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[8]~input_o\ & (!\A[9]~input_o\ & (\A[7]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \A[7]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X25_Y18_N20
\inst|inst1|inst1|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[0]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N21
\inst|inst1|inst1|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N6
\inst|inst1|inst1|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[1]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst1~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst1~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N7
\inst|inst1|inst1|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst1~q\);

-- Location: LCCOMB_X60_Y18_N8
\inst|inst1|inst1|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst2~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst2~q\,
	datad => \D[2]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N9
\inst|inst1|inst1|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst2~q\);

-- Location: LCCOMB_X19_Y11_N20
\inst|inst1|inst1|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst3~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst|inst1|inst1|inst|inst3~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N21
\inst|inst1|inst1|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N14
\inst|inst1|inst1|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst4~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst|inst1|inst1|inst|inst4~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N15
\inst|inst1|inst1|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst4~q\);

-- Location: LCCOMB_X60_Y18_N26
\inst|inst1|inst1|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst5~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[5]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst5~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X60_Y18_N27
\inst|inst1|inst1|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst5~q\);

-- Location: LCCOMB_X60_Y18_N28
\inst|inst1|inst1|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst6~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[6]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst6~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X60_Y18_N29
\inst|inst1|inst1|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst6~q\);

-- Location: LCCOMB_X60_Y18_N6
\inst|inst1|inst1|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst7~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst7~q\,
	datad => \D[7]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N7
\inst|inst1|inst1|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst7~q\);

-- Location: LCCOMB_X62_Y11_N24
\inst|inst1|inst1|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[8]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst8~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[8]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst8~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X62_Y11_N25
\inst|inst1|inst1|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst8~q\);

-- Location: LCCOMB_X62_Y11_N2
\inst|inst1|inst1|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst9~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[9]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst9~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X62_Y11_N3
\inst|inst1|inst1|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst9~q\);

-- Location: LCCOMB_X62_Y11_N4
\inst|inst1|inst1|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst10~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[10]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst10~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X62_Y11_N5
\inst|inst1|inst1|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst10~q\);

-- Location: LCCOMB_X62_Y11_N22
\inst|inst1|inst1|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst11~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[11]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst11~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X62_Y11_N23
\inst|inst1|inst1|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst11~q\);

-- Location: LCCOMB_X62_Y11_N8
\inst|inst1|inst1|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[12]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst12~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[12]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst12~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X62_Y11_N9
\inst|inst1|inst1|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst12~q\);

-- Location: LCCOMB_X62_Y11_N10
\inst|inst1|inst1|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst13~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[13]~input_o\,
	datac => \inst|inst1|inst1|inst|inst13~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X62_Y11_N11
\inst|inst1|inst1|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst13~q\);

-- Location: LCCOMB_X62_Y11_N20
\inst|inst1|inst1|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst14~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[14]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst14~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X62_Y11_N21
\inst|inst1|inst1|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst14~q\);

-- Location: LCCOMB_X62_Y11_N14
\inst|inst1|inst1|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst15~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[15]~input_o\,
	datac => \inst|inst1|inst1|inst|inst15~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X62_Y11_N15
\inst|inst1|inst1|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst15~q\);

-- Location: LCCOMB_X62_Y11_N0
\inst|inst1|inst1|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[16]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst16~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[16]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst16~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X62_Y11_N1
\inst|inst1|inst1|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst16~q\);

-- Location: LCCOMB_X62_Y11_N26
\inst|inst1|inst1|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[17]~input_o\) # ((\inst|inst1|inst1|inst|inst17~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[17]~input_o\,
	datab => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst1|inst1|inst|inst17~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X62_Y11_N27
\inst|inst1|inst1|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst17~q\);

-- Location: LCCOMB_X62_Y11_N12
\inst|inst1|inst1|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[18]~input_o\) # ((\inst|inst1|inst1|inst|inst18~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[18]~input_o\,
	datab => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst|inst1|inst1|inst|inst18~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X62_Y11_N13
\inst|inst1|inst1|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst18~q\);

-- Location: LCCOMB_X62_Y11_N6
\inst|inst1|inst1|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst19~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[19]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst19~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X62_Y11_N7
\inst|inst1|inst1|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst19~q\);

-- Location: LCCOMB_X62_Y11_N16
\inst|inst1|inst1|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[20]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst21~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[20]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst21~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X62_Y11_N17
\inst|inst1|inst1|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst21~q\);

-- Location: LCCOMB_X62_Y11_N18
\inst|inst1|inst1|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[21]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst20~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[21]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst20~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X62_Y11_N19
\inst|inst1|inst1|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst20~q\);

-- Location: LCCOMB_X62_Y11_N28
\inst|inst1|inst1|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst22~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[22]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst22~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X62_Y11_N29
\inst|inst1|inst1|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst22~q\);

-- Location: LCCOMB_X62_Y11_N30
\inst|inst1|inst1|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[23]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst23~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[23]~input_o\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst23~q\,
	datad => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X62_Y11_N31
\inst|inst1|inst1|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst23~q\);

-- Location: LCCOMB_X3_Y16_N16
\inst|inst1|inst1|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst24~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst24~q\,
	datad => \D[24]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X3_Y16_N17
\inst|inst1|inst1|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst24~q\);

-- Location: LCCOMB_X3_Y16_N18
\inst|inst1|inst1|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[25]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst25~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst25~q\,
	datad => \D[25]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X3_Y16_N19
\inst|inst1|inst1|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst25~q\);

-- Location: LCCOMB_X3_Y16_N20
\inst|inst1|inst1|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[26]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst26~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst26~q\,
	datad => \D[26]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X3_Y16_N21
\inst|inst1|inst1|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst26~q\);

-- Location: LCCOMB_X3_Y16_N14
\inst|inst1|inst1|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst27~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst27~q\,
	datad => \D[27]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X3_Y16_N15
\inst|inst1|inst1|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst27~q\);

-- Location: LCCOMB_X3_Y16_N24
\inst|inst1|inst1|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[28]~input_o\) # ((\inst|inst1|inst1|inst|inst28~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[28]~input_o\,
	datac => \inst|inst1|inst1|inst|inst28~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X3_Y16_N25
\inst|inst1|inst1|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst28~q\);

-- Location: LCCOMB_X3_Y16_N2
\inst|inst1|inst1|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst29~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst29~q\,
	datad => \D[29]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X3_Y16_N3
\inst|inst1|inst1|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst29~q\);

-- Location: LCCOMB_X3_Y16_N12
\inst|inst1|inst1|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[30]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst30~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst30~q\,
	datad => \D[30]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X3_Y16_N13
\inst|inst1|inst1|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst30~q\);

-- Location: LCCOMB_X3_Y16_N30
\inst|inst1|inst1|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst31~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst31~q\,
	datad => \D[31]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X3_Y16_N31
\inst|inst1|inst1|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst31~q\);

-- Location: LCCOMB_X3_Y16_N0
\inst|inst1|inst1|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[32]~input_o\) # ((\inst|inst1|inst1|inst|inst32~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[32]~input_o\,
	datac => \inst|inst1|inst1|inst|inst32~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X3_Y16_N1
\inst|inst1|inst1|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst32~q\);

-- Location: LCCOMB_X3_Y16_N26
\inst|inst1|inst1|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[33]~input_o\) # ((\inst|inst1|inst1|inst|inst33~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[33]~input_o\,
	datac => \inst|inst1|inst1|inst|inst33~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X3_Y16_N27
\inst|inst1|inst1|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst33~q\);

-- Location: LCCOMB_X3_Y16_N4
\inst|inst1|inst1|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst34~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst34~q\,
	datad => \D[34]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X3_Y16_N5
\inst|inst1|inst1|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst34~q\);

-- Location: LCCOMB_X3_Y16_N6
\inst|inst1|inst1|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[35]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst35~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst35~q\,
	datad => \D[35]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X3_Y16_N7
\inst|inst1|inst1|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst35~q\);

-- Location: LCCOMB_X3_Y16_N8
\inst|inst1|inst1|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[36]~input_o\) # ((\inst|inst1|inst1|inst|inst36~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[36]~input_o\,
	datac => \inst|inst1|inst1|inst|inst36~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X3_Y16_N9
\inst|inst1|inst1|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst36~q\);

-- Location: LCCOMB_X3_Y16_N10
\inst|inst1|inst1|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst37~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst37~q\,
	datad => \D[37]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X3_Y16_N11
\inst|inst1|inst1|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst37~q\);

-- Location: LCCOMB_X3_Y16_N28
\inst|inst1|inst1|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[38]~input_o\) # ((!\WR~input_o\ & \inst|inst1|inst1|inst|inst38~q\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst|inst1|inst1|inst|inst38~q\,
	datad => \D[38]~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X3_Y16_N29
\inst|inst1|inst1|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst38~q\);

-- Location: LCCOMB_X3_Y16_N22
\inst|inst1|inst1|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[39]~input_o\) # ((\inst|inst1|inst1|inst|inst39~q\ & !\WR~input_o\)))) # (!\inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst|inst1|inst1|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \D[39]~input_o\,
	datac => \inst|inst1|inst1|inst|inst39~q\,
	datad => \WR~input_o\,
	combout => \inst|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X3_Y16_N23
\inst|inst1|inst1|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst1|inst1|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N22
\inst1|inst|inst|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[7]~input_o\ & (\inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[7]~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X22_Y13_N8
\inst1|inst|inst|inst5|inst|inst|inst|inst4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ = (\A[8]~input_o\ & (\A[9]~input_o\ & \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\);

-- Location: LCCOMB_X25_Y18_N16
\inst1|inst|inst|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[0]~input_o\) # ((\inst1|inst|inst|inst|inst~q\ & !\WR~input_o\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst|inst|inst~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N17
\inst1|inst|inst|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N2
\inst1|inst|inst|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[1]~input_o\) # ((\inst1|inst|inst|inst|inst1~q\ & !\WR~input_o\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst|inst|inst1~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N3
\inst1|inst|inst|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst1~q\);

-- Location: LCCOMB_X60_Y18_N0
\inst1|inst|inst|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst2~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[2]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst2~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N1
\inst1|inst|inst|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst2~q\);

-- Location: LCCOMB_X19_Y11_N0
\inst1|inst|inst|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst3~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst1|inst|inst|inst|inst3~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N1
\inst1|inst|inst|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N18
\inst1|inst|inst|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst4~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst1|inst|inst|inst|inst4~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N19
\inst1|inst|inst|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst4~q\);

-- Location: LCCOMB_X60_Y18_N2
\inst1|inst|inst|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst1|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst5~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[5]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst5~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X60_Y18_N3
\inst1|inst|inst|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst5~q\);

-- Location: LCCOMB_X60_Y18_N4
\inst1|inst|inst|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst1|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst6~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[6]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst6~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X60_Y18_N5
\inst1|inst|inst|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst6~q\);

-- Location: LCCOMB_X60_Y18_N14
\inst1|inst|inst|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst1|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst7~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[7]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst7~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N15
\inst1|inst|inst|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst7~q\);

-- Location: LCCOMB_X15_Y4_N24
\inst1|inst|inst|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst1|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[8]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst8~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst8~q\,
	datad => \D[8]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X15_Y4_N25
\inst1|inst|inst|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst8~q\);

-- Location: LCCOMB_X15_Y4_N10
\inst1|inst|inst|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst1|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst9~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst9~q\,
	datad => \D[9]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X15_Y4_N11
\inst1|inst|inst|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst9~q\);

-- Location: LCCOMB_X15_Y4_N28
\inst1|inst|inst|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst2|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst10~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst10~q\,
	datad => \D[10]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X15_Y4_N29
\inst1|inst|inst|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst10~q\);

-- Location: LCCOMB_X15_Y4_N30
\inst1|inst|inst|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst2|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst11~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst11~q\,
	datad => \D[11]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X15_Y4_N31
\inst1|inst|inst|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst11~q\);

-- Location: IOIBUF_X67_Y3_N8
\D[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(12),
	o => \D[12]~input_o\);

-- Location: LCCOMB_X15_Y4_N8
\inst1|inst|inst|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst2|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[12]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst12~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst12~q\,
	datad => \D[12]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X15_Y4_N9
\inst1|inst|inst|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst12~q\);

-- Location: LCCOMB_X15_Y4_N2
\inst1|inst|inst|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst2|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst13~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst13~q\,
	datad => \D[13]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X15_Y4_N3
\inst1|inst|inst|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst13~q\);

-- Location: LCCOMB_X15_Y4_N4
\inst1|inst|inst|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst2|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst14~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst14~q\,
	datad => \D[14]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X15_Y4_N5
\inst1|inst|inst|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst14~q\);

-- Location: LCCOMB_X15_Y4_N14
\inst1|inst|inst|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst3|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst15~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst15~q\,
	datad => \D[15]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X15_Y4_N15
\inst1|inst|inst|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst15~q\);

-- Location: LCCOMB_X15_Y4_N16
\inst1|inst|inst|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst3|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[16]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst16~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst16~q\,
	datad => \D[16]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X15_Y4_N17
\inst1|inst|inst|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst16~q\);

-- Location: LCCOMB_X15_Y4_N26
\inst1|inst|inst|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst3|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[17]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst17~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst17~q\,
	datad => \D[17]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X15_Y4_N27
\inst1|inst|inst|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst17~q\);

-- Location: LCCOMB_X15_Y4_N12
\inst1|inst|inst|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst3|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[18]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst18~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst18~q\,
	datad => \D[18]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X15_Y4_N13
\inst1|inst|inst|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst18~q\);

-- Location: LCCOMB_X15_Y4_N6
\inst1|inst|inst|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst|inst3|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst19~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst19~q\,
	datad => \D[19]~input_o\,
	combout => \inst1|inst|inst|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X15_Y4_N7
\inst1|inst|inst|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst19~q\);

-- Location: LCCOMB_X15_Y4_N0
\inst1|inst|inst|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[20]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst21~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst21~q\,
	datad => \D[20]~input_o\,
	combout => \inst1|inst|inst|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X15_Y4_N1
\inst1|inst|inst|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst21~q\);

-- Location: LCCOMB_X15_Y4_N18
\inst1|inst|inst|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[21]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst20~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst20~q\,
	datad => \D[21]~input_o\,
	combout => \inst1|inst|inst|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X15_Y4_N19
\inst1|inst|inst|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst20~q\);

-- Location: LCCOMB_X15_Y4_N20
\inst1|inst|inst|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst22~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst22~q\,
	datad => \D[22]~input_o\,
	combout => \inst1|inst|inst|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X15_Y4_N21
\inst1|inst|inst|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst22~q\);

-- Location: LCCOMB_X15_Y4_N22
\inst1|inst|inst|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[23]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst23~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst23~q\,
	datad => \D[23]~input_o\,
	combout => \inst1|inst|inst|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X15_Y4_N23
\inst1|inst|inst|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst23~q\);

-- Location: LCCOMB_X46_Y8_N0
\inst1|inst|inst|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst24~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[24]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst24~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X46_Y8_N1
\inst1|inst|inst|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst24~q\);

-- Location: LCCOMB_X46_Y8_N2
\inst1|inst|inst|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst1|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[25]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst25~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[25]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst25~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X46_Y8_N3
\inst1|inst|inst|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst25~q\);

-- Location: LCCOMB_X46_Y8_N20
\inst1|inst|inst|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[26]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst26~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[26]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst26~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X46_Y8_N21
\inst1|inst|inst|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst26~q\);

-- Location: LCCOMB_X46_Y8_N6
\inst1|inst|inst|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst27~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[27]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst27~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X46_Y8_N7
\inst1|inst|inst|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst27~q\);

-- Location: LCCOMB_X46_Y8_N16
\inst1|inst|inst|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[28]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst28~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[28]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst28~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X46_Y8_N17
\inst1|inst|inst|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst28~q\);

-- Location: LCCOMB_X46_Y8_N10
\inst1|inst|inst|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst29~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst|inst|inst29~q\,
	datad => \D[29]~input_o\,
	combout => \inst1|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X46_Y8_N11
\inst1|inst|inst|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst29~q\);

-- Location: LCCOMB_X46_Y8_N12
\inst1|inst|inst|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst2|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[30]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst30~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[30]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst30~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X46_Y8_N13
\inst1|inst|inst|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst30~q\);

-- Location: LCCOMB_X46_Y8_N14
\inst1|inst|inst|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst31~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[31]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst31~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X46_Y8_N15
\inst1|inst|inst|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst31~q\);

-- Location: LCCOMB_X46_Y8_N24
\inst1|inst|inst|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[32]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst32~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[32]~input_o\,
	datac => \inst1|inst|inst|inst|inst32~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X46_Y8_N25
\inst1|inst|inst|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst32~q\);

-- Location: LCCOMB_X46_Y8_N18
\inst1|inst|inst|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[33]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst33~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[33]~input_o\,
	datac => \inst1|inst|inst|inst|inst33~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X46_Y8_N19
\inst1|inst|inst|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst33~q\);

-- Location: LCCOMB_X46_Y8_N4
\inst1|inst|inst|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst34~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[34]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst34~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X46_Y8_N5
\inst1|inst|inst|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst34~q\);

-- Location: LCCOMB_X46_Y8_N22
\inst1|inst|inst|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst3|inst|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[35]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst35~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[35]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst35~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X46_Y8_N23
\inst1|inst|inst|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst35~q\);

-- Location: LCCOMB_X46_Y8_N8
\inst1|inst|inst|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[36]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst36~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[36]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst36~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X46_Y8_N9
\inst1|inst|inst|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst36~q\);

-- Location: LCCOMB_X46_Y8_N26
\inst1|inst|inst|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst37~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[37]~input_o\,
	datac => \inst1|inst|inst|inst|inst37~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X46_Y8_N27
\inst1|inst|inst|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst37~q\);

-- Location: LCCOMB_X46_Y8_N28
\inst1|inst|inst|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[38]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst38~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[38]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst38~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X46_Y8_N29
\inst1|inst|inst|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst38~q\);

-- Location: LCCOMB_X46_Y8_N30
\inst1|inst|inst|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & ((\D[39]~input_o\) # ((!\WR~input_o\ & \inst1|inst|inst|inst|inst39~q\)))) # (!\inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\ & 
-- (((\inst1|inst|inst|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[39]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst|inst|inst|inst39~q\,
	datad => \inst1|inst|inst|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X46_Y8_N31
\inst1|inst|inst|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N26
\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[7]~input_o\ & (\inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\ & (!\A[9]~input_o\ & \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[7]~input_o\,
	datab => \inst|inst|inst|inst5|inst|inst|inst|inst4~3_combout\,
	datac => \A[9]~input_o\,
	datad => \inst|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X10_Y11_N6
\inst1|inst|inst1|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X10_Y11_N7
\inst1|inst|inst1|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst~q\);

-- Location: LCCOMB_X10_Y11_N8
\inst1|inst|inst1|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst1~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst1~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X10_Y11_N9
\inst1|inst|inst1|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst1~q\);

-- Location: LCCOMB_X10_Y11_N26
\inst1|inst|inst1|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst2~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst3|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst2~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X10_Y11_N27
\inst1|inst|inst1|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst2~q\);

-- Location: LCCOMB_X10_Y11_N4
\inst1|inst|inst1|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst3~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst3~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X10_Y11_N5
\inst1|inst|inst1|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst3~q\);

-- Location: LCCOMB_X10_Y11_N14
\inst1|inst|inst1|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst4~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst5|inst~0_combout\,
	datac => \inst1|inst|inst1|inst|inst4~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X10_Y11_N15
\inst1|inst|inst1|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst4~q\);

-- Location: LCCOMB_X10_Y11_N24
\inst1|inst|inst1|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst1|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst5~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst1|inst|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst5~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X10_Y11_N25
\inst1|inst|inst1|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst5~q\);

-- Location: LCCOMB_X1_Y16_N28
\inst1|inst|inst1|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst6~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst6~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst1|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X1_Y16_N29
\inst1|inst|inst1|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst6~q\);

-- Location: LCCOMB_X1_Y16_N14
\inst1|inst|inst1|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst7~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst1|inst3|inst~0_combout\,
	datac => \inst1|inst|inst1|inst|inst7~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X1_Y16_N15
\inst1|inst|inst1|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst7~q\);

-- Location: LCCOMB_X1_Y16_N16
\inst1|inst|inst1|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst8~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst8~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst4|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X1_Y16_N17
\inst1|inst|inst1|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst8~q\);

-- Location: LCCOMB_X1_Y16_N18
\inst1|inst|inst1|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst9~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst9~q\,
	datad => \inst|inst|inst1|inst5|inst|inst1|inst5|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X1_Y16_N19
\inst1|inst|inst1|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst9~q\);

-- Location: LCCOMB_X38_Y9_N20
\inst1|inst|inst1|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst2|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst10~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst10~q\,
	datad => \inst|inst|inst1|inst5|inst|inst2|inst|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X38_Y9_N21
\inst1|inst|inst1|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst10~q\);

-- Location: LCCOMB_X1_Y2_N4
\inst1|inst|inst1|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst11~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst2|inst1|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst11~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X1_Y2_N5
\inst1|inst|inst1|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst11~q\);

-- Location: LCCOMB_X1_Y2_N14
\inst1|inst|inst1|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst12~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst2|inst3|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst12~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X1_Y2_N15
\inst1|inst|inst1|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst12~q\);

-- Location: LCCOMB_X1_Y2_N24
\inst1|inst|inst1|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst13~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst2|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst13~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X1_Y2_N25
\inst1|inst|inst1|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst13~q\);

-- Location: LCCOMB_X1_Y2_N2
\inst1|inst|inst1|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst14~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst2|inst5|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst14~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X1_Y2_N3
\inst1|inst|inst1|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst14~q\);

-- Location: LCCOMB_X38_Y9_N30
\inst1|inst|inst1|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst3|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst15~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst15~q\,
	datad => \inst|inst|inst1|inst5|inst|inst3|inst|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X38_Y9_N31
\inst1|inst|inst1|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst15~q\);

-- Location: LCCOMB_X26_Y17_N12
\inst1|inst|inst1|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst16~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst3|inst1|inst~0_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst16~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X26_Y17_N13
\inst1|inst|inst1|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst16~q\);

-- Location: LCCOMB_X26_Y17_N14
\inst1|inst|inst1|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst17~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst17~q\,
	datad => \inst|inst|inst1|inst5|inst|inst3|inst3|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X26_Y17_N15
\inst1|inst|inst1|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst17~q\);

-- Location: LCCOMB_X26_Y17_N8
\inst1|inst|inst1|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst18~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst18~q\,
	datad => \inst|inst|inst1|inst5|inst|inst3|inst4|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X26_Y17_N9
\inst1|inst|inst1|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst18~q\);

-- Location: LCCOMB_X26_Y17_N26
\inst1|inst|inst1|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst19~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst19~q\,
	datad => \inst|inst|inst1|inst5|inst|inst3|inst5|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X26_Y17_N27
\inst1|inst|inst1|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst19~q\);

-- Location: LCCOMB_X38_Y9_N24
\inst1|inst|inst1|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst21~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst21~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst|inst|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X38_Y9_N25
\inst1|inst|inst1|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst21~q\);

-- Location: LCCOMB_X33_Y16_N12
\inst1|inst|inst1|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst20~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst|inst1|inst~0_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst20~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X33_Y16_N13
\inst1|inst|inst1|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst20~q\);

-- Location: LCCOMB_X33_Y16_N6
\inst1|inst|inst1|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst22~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst22~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst|inst3|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X33_Y16_N7
\inst1|inst|inst1|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst22~q\);

-- Location: LCCOMB_X10_Y11_N18
\inst1|inst|inst1|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst23~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst23~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X10_Y11_N19
\inst1|inst|inst1|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst23~q\);

-- Location: LCCOMB_X1_Y16_N20
\inst1|inst|inst1|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst24~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst24~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst|inst5|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X1_Y16_N21
\inst1|inst|inst1|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst24~q\);

-- Location: LCCOMB_X1_Y2_N20
\inst1|inst|inst1|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst25~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst1|inst|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst25~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X1_Y2_N21
\inst1|inst|inst1|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst25~q\);

-- Location: LCCOMB_X26_Y17_N4
\inst1|inst|inst1|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst26~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst1|inst1|inst~0_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst26~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X26_Y17_N5
\inst1|inst|inst1|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst26~q\);

-- Location: LCCOMB_X33_Y16_N16
\inst1|inst|inst1|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst27~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst27~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst1|inst3|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X33_Y16_N17
\inst1|inst|inst1|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst27~q\);

-- Location: LCCOMB_X33_Y16_N10
\inst1|inst|inst1|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst28~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst28~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst1|inst4|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X33_Y16_N11
\inst1|inst|inst1|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst28~q\);

-- Location: LCCOMB_X33_Y16_N28
\inst1|inst|inst1|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst29~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst1|inst5|inst~0_combout\,
	datac => \inst1|inst|inst1|inst|inst29~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X33_Y16_N29
\inst1|inst|inst1|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst29~q\);

-- Location: LCCOMB_X38_Y9_N26
\inst1|inst|inst1|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst30~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst30~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X38_Y9_N27
\inst1|inst|inst1|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst30~q\);

-- Location: LCCOMB_X43_Y7_N28
\inst1|inst|inst1|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst31~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst2|inst1|inst~0_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst31~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X43_Y7_N29
\inst1|inst|inst1|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst31~q\);

-- Location: LCCOMB_X43_Y7_N14
\inst1|inst|inst1|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst32~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst32~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst3|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X43_Y7_N15
\inst1|inst|inst1|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst32~q\);

-- Location: LCCOMB_X43_Y7_N0
\inst1|inst|inst1|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst33~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst33~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst4|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X43_Y7_N1
\inst1|inst|inst1|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst33~q\);

-- Location: LCCOMB_X43_Y7_N26
\inst1|inst|inst1|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst34~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst34~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst2|inst5|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X43_Y7_N27
\inst1|inst|inst1|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst34~q\);

-- Location: LCCOMB_X43_Y7_N20
\inst1|inst|inst1|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst35~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst3|inst|inst~0_combout\,
	datab => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst|inst1|inst|inst35~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X43_Y7_N21
\inst1|inst|inst1|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst35~q\);

-- Location: LCCOMB_X38_Y9_N4
\inst1|inst|inst1|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst36~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst36~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst3|inst1|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X38_Y9_N5
\inst1|inst|inst1|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst36~q\);

-- Location: LCCOMB_X38_Y9_N14
\inst1|inst|inst1|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst37~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst37~q\,
	datad => \inst|inst|inst1|inst5|inst1|inst3|inst3|inst~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X38_Y9_N15
\inst1|inst|inst1|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst37~q\);

-- Location: LCCOMB_X38_Y9_N8
\inst1|inst|inst1|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\) # ((!\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\ & 
-- \inst1|inst|inst1|inst|inst38~q\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|inst1|inst5|inst1|inst3|inst4|inst~0_combout\,
	datab => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	datac => \inst1|inst|inst1|inst|inst38~q\,
	datad => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X38_Y9_N9
\inst1|inst|inst1|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst38~q\);

-- Location: LCCOMB_X22_Y13_N10
\inst1|inst|inst1|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\) # ((\inst1|inst|inst1|inst|inst39~q\ & 
-- !\inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\)))) # (!\inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst|inst1|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \inst|inst|inst1|inst5|inst1|inst3|inst5|inst~0_combout\,
	datac => \inst1|inst|inst1|inst|inst39~q\,
	datad => \inst|inst|inst1|inst5|inst|inst|inst|inst4~1_combout\,
	combout => \inst1|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X22_Y13_N11
\inst1|inst|inst1|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst|inst1|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|inst1|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N4
\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[8]~input_o\ & (\A[9]~input_o\ & \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X25_Y18_N4
\inst1|inst1|inst|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[0]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N5
\inst1|inst1|inst|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N22
\inst1|inst1|inst|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[1]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst1~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst1~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N23
\inst1|inst1|inst|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst1~q\);

-- Location: LCCOMB_X60_Y18_N24
\inst1|inst1|inst|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst2~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[2]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst2~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N25
\inst1|inst1|inst|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst2~q\);

-- Location: LCCOMB_X19_Y11_N28
\inst1|inst1|inst|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst3~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst1|inst1|inst|inst|inst3~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N29
\inst1|inst1|inst|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N6
\inst1|inst1|inst|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst4~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst1|inst1|inst|inst|inst4~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N7
\inst1|inst1|inst|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst4~q\);

-- Location: LCCOMB_X60_Y18_N18
\inst1|inst1|inst|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst1|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst5~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[5]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst5~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X60_Y18_N19
\inst1|inst1|inst|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst5~q\);

-- Location: LCCOMB_X60_Y18_N12
\inst1|inst1|inst|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst6~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[6]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst6~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X60_Y18_N13
\inst1|inst1|inst|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst6~q\);

-- Location: LCCOMB_X60_Y18_N22
\inst1|inst1|inst|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst7~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[7]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst7~q\,
	datad => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N23
\inst1|inst1|inst|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst7~q\);

-- Location: LCCOMB_X30_Y4_N16
\inst1|inst1|inst|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[8]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst8~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst8~q\,
	datad => \D[8]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X30_Y4_N17
\inst1|inst1|inst|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst8~q\);

-- Location: LCCOMB_X30_Y4_N2
\inst1|inst1|inst|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst9~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst9~q\,
	datad => \D[9]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X30_Y4_N3
\inst1|inst1|inst|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst9~q\);

-- Location: LCCOMB_X30_Y4_N4
\inst1|inst1|inst|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst2|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst10~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst10~q\,
	datad => \D[10]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X30_Y4_N5
\inst1|inst1|inst|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst10~q\);

-- Location: LCCOMB_X30_Y4_N30
\inst1|inst1|inst|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst11~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst11~q\,
	datad => \D[11]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X30_Y4_N31
\inst1|inst1|inst|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst11~q\);

-- Location: LCCOMB_X30_Y4_N24
\inst1|inst1|inst|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[12]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst12~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst12~q\,
	datad => \D[12]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X30_Y4_N25
\inst1|inst1|inst|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst12~q\);

-- Location: LCCOMB_X30_Y4_N26
\inst1|inst1|inst|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst13~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst13~q\,
	datad => \D[13]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X30_Y4_N27
\inst1|inst1|inst|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst13~q\);

-- Location: LCCOMB_X30_Y4_N28
\inst1|inst1|inst|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst14~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst14~q\,
	datad => \D[14]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X30_Y4_N29
\inst1|inst1|inst|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst14~q\);

-- Location: LCCOMB_X30_Y4_N14
\inst1|inst1|inst|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst3|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst15~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst15~q\,
	datad => \D[15]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X30_Y4_N15
\inst1|inst1|inst|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst15~q\);

-- Location: LCCOMB_X30_Y4_N8
\inst1|inst1|inst|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[16]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst16~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst16~q\,
	datad => \D[16]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X30_Y4_N9
\inst1|inst1|inst|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst16~q\);

-- Location: LCCOMB_X30_Y4_N10
\inst1|inst1|inst|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[17]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst17~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst17~q\,
	datad => \D[17]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X30_Y4_N11
\inst1|inst1|inst|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst17~q\);

-- Location: LCCOMB_X30_Y4_N12
\inst1|inst1|inst|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[18]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst18~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst18~q\,
	datad => \D[18]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X30_Y4_N13
\inst1|inst1|inst|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst18~q\);

-- Location: LCCOMB_X30_Y4_N6
\inst1|inst1|inst|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst19~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst19~q\,
	datad => \D[19]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X30_Y4_N7
\inst1|inst1|inst|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst19~q\);

-- Location: LCCOMB_X30_Y4_N0
\inst1|inst1|inst|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[20]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst21~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst21~q\,
	datad => \D[20]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X30_Y4_N1
\inst1|inst1|inst|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst21~q\);

-- Location: LCCOMB_X30_Y4_N18
\inst1|inst1|inst|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[21]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst20~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst20~q\,
	datad => \D[21]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X30_Y4_N19
\inst1|inst1|inst|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst20~q\);

-- Location: LCCOMB_X30_Y4_N20
\inst1|inst1|inst|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst22~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst22~q\,
	datad => \D[22]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X30_Y4_N21
\inst1|inst1|inst|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst22~q\);

-- Location: LCCOMB_X30_Y4_N22
\inst1|inst1|inst|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[23]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst23~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst23~q\,
	datad => \D[23]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X30_Y4_N23
\inst1|inst1|inst|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst23~q\);

-- Location: LCCOMB_X45_Y10_N8
\inst1|inst1|inst|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst24~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst24~q\,
	datad => \D[24]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X45_Y10_N9
\inst1|inst1|inst|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst24~q\);

-- Location: LCCOMB_X45_Y10_N18
\inst1|inst1|inst|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[25]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst25~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst25~q\,
	datad => \D[25]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X45_Y10_N19
\inst1|inst1|inst|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst25~q\);

-- Location: LCCOMB_X45_Y10_N4
\inst1|inst1|inst|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[26]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst26~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst26~q\,
	datad => \D[26]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X45_Y10_N5
\inst1|inst1|inst|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst26~q\);

-- Location: LCCOMB_X45_Y10_N14
\inst1|inst1|inst|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst27~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst27~q\,
	datad => \D[27]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X45_Y10_N15
\inst1|inst1|inst|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst27~q\);

-- Location: LCCOMB_X45_Y10_N0
\inst1|inst1|inst|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[28]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst28~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst28~q\,
	datad => \D[28]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X45_Y10_N1
\inst1|inst1|inst|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst28~q\);

-- Location: LCCOMB_X45_Y10_N26
\inst1|inst1|inst|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst29~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst29~q\,
	datad => \D[29]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X45_Y10_N27
\inst1|inst1|inst|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst29~q\);

-- Location: LCCOMB_X45_Y10_N12
\inst1|inst1|inst|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[30]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst30~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst30~q\,
	datad => \D[30]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X45_Y10_N13
\inst1|inst1|inst|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst30~q\);

-- Location: LCCOMB_X45_Y10_N22
\inst1|inst1|inst|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst31~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst31~q\,
	datad => \D[31]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X45_Y10_N23
\inst1|inst1|inst|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst31~q\);

-- Location: LCCOMB_X45_Y10_N16
\inst1|inst1|inst|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[32]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst32~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst32~q\,
	datad => \D[32]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X45_Y10_N17
\inst1|inst1|inst|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst32~q\);

-- Location: LCCOMB_X45_Y10_N2
\inst1|inst1|inst|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[33]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst33~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst33~q\,
	datad => \D[33]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X45_Y10_N3
\inst1|inst1|inst|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst33~q\);

-- Location: LCCOMB_X45_Y10_N28
\inst1|inst1|inst|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst34~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst34~q\,
	datad => \D[34]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X45_Y10_N29
\inst1|inst1|inst|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst34~q\);

-- Location: LCCOMB_X45_Y10_N30
\inst1|inst1|inst|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[35]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst35~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst35~q\,
	datad => \D[35]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X45_Y10_N31
\inst1|inst1|inst|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst35~q\);

-- Location: LCCOMB_X45_Y10_N24
\inst1|inst1|inst|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[36]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst36~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst36~q\,
	datad => \D[36]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X45_Y10_N25
\inst1|inst1|inst|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst36~q\);

-- Location: LCCOMB_X45_Y10_N10
\inst1|inst1|inst|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst37~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst37~q\,
	datad => \D[37]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X45_Y10_N11
\inst1|inst1|inst|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst37~q\);

-- Location: LCCOMB_X45_Y10_N20
\inst1|inst1|inst|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[38]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst38~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst38~q\,
	datad => \D[38]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X45_Y10_N21
\inst1|inst1|inst|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst38~q\);

-- Location: LCCOMB_X45_Y10_N6
\inst1|inst1|inst|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[39]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst|inst|inst39~q\)))) # (!\inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst|inst|inst39~q\,
	datad => \D[39]~input_o\,
	combout => \inst1|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X45_Y10_N7
\inst1|inst1|inst|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst|inst|inst39~q\);

-- Location: LCCOMB_X22_Y13_N6
\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ = (!\A[8]~input_o\ & (!\A[9]~input_o\ & \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[8]~input_o\,
	datab => \A[9]~input_o\,
	datac => \inst1|inst|inst|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\);

-- Location: LCCOMB_X25_Y18_N24
\inst1|inst1|inst1|inst5|inst|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[0]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst|inst6~combout\);

-- Location: FF_X25_Y18_N25
\inst1|inst1|inst1|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst~q\);

-- Location: LCCOMB_X25_Y18_N10
\inst1|inst1|inst1|inst5|inst|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[1]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst1~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst1~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\);

-- Location: FF_X25_Y18_N11
\inst1|inst1|inst1|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst1~q\);

-- Location: LCCOMB_X60_Y18_N16
\inst1|inst1|inst1|inst5|inst|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[2]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst2~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst2~q\,
	datad => \D[2]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N17
\inst1|inst1|inst1|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst2~q\);

-- Location: LCCOMB_X19_Y11_N8
\inst1|inst1|inst1|inst5|inst|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[3]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst3~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[3]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst3~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\);

-- Location: FF_X19_Y11_N9
\inst1|inst1|inst1|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst3~q\);

-- Location: LCCOMB_X19_Y11_N10
\inst1|inst1|inst1|inst5|inst|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[4]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst4~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[4]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst4~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\);

-- Location: FF_X19_Y11_N11
\inst1|inst1|inst1|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst4~q\);

-- Location: LCCOMB_X60_Y18_N10
\inst1|inst1|inst1|inst5|inst|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[5]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst5~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & 
-- (((\inst1|inst1|inst1|inst|inst5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst5~q\,
	datad => \D[5]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\);

-- Location: FF_X60_Y18_N11
\inst1|inst1|inst1|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst5~q\);

-- Location: LCCOMB_X60_Y18_N20
\inst1|inst1|inst1|inst5|inst|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[6]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst6~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst6~q\,
	datad => \D[6]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\);

-- Location: FF_X60_Y18_N21
\inst1|inst1|inst1|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst6~q\);

-- Location: LCCOMB_X60_Y18_N30
\inst1|inst1|inst1|inst5|inst|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[7]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst7~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datab => \WR~input_o\,
	datac => \inst1|inst1|inst1|inst|inst7~q\,
	datad => \D[7]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\);

-- Location: FF_X60_Y18_N31
\inst1|inst1|inst1|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst7~q\);

-- Location: LCCOMB_X62_Y8_N0
\inst1|inst1|inst1|inst5|inst|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[8]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst8~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst8~q\,
	datad => \D[8]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\);

-- Location: FF_X62_Y8_N1
\inst1|inst1|inst1|inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst8~q\);

-- Location: LCCOMB_X62_Y8_N2
\inst1|inst1|inst1|inst5|inst|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[9]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst9~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst9~q\,
	datad => \D[9]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\);

-- Location: FF_X62_Y8_N3
\inst1|inst1|inst1|inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst9~q\);

-- Location: LCCOMB_X62_Y8_N20
\inst1|inst1|inst1|inst5|inst|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[10]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst10~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst10~q\,
	datad => \D[10]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\);

-- Location: FF_X62_Y8_N21
\inst1|inst1|inst1|inst|inst10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst10~q\);

-- Location: LCCOMB_X62_Y8_N22
\inst1|inst1|inst1|inst5|inst|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[11]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst11~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[11]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst11~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\);

-- Location: FF_X62_Y8_N23
\inst1|inst1|inst1|inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst11~q\);

-- Location: LCCOMB_X62_Y8_N16
\inst1|inst1|inst1|inst5|inst|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[12]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst12~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst12~q\,
	datad => \D[12]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\);

-- Location: FF_X62_Y8_N17
\inst1|inst1|inst1|inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst12~q\);

-- Location: LCCOMB_X62_Y8_N26
\inst1|inst1|inst1|inst5|inst|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[13]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst13~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst13~q\,
	datad => \D[13]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\);

-- Location: FF_X62_Y8_N27
\inst1|inst1|inst1|inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst13~q\);

-- Location: LCCOMB_X62_Y8_N12
\inst1|inst1|inst1|inst5|inst|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[14]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst14~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst14~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[14]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst14~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\);

-- Location: FF_X62_Y8_N13
\inst1|inst1|inst1|inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst14~q\);

-- Location: LCCOMB_X62_Y8_N14
\inst1|inst1|inst1|inst5|inst|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[15]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst15~q\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst15~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[15]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst15~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\);

-- Location: FF_X62_Y8_N15
\inst1|inst1|inst1|inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst15~q\);

-- Location: LCCOMB_X62_Y8_N8
\inst1|inst1|inst1|inst5|inst|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[16]~input_o\) # ((\inst1|inst1|inst1|inst|inst16~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst16~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[16]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst16~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\);

-- Location: FF_X62_Y8_N9
\inst1|inst1|inst1|inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst16~q\);

-- Location: LCCOMB_X62_Y8_N10
\inst1|inst1|inst1|inst5|inst|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[17]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst17~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst17~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst17~q\,
	datad => \D[17]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\);

-- Location: FF_X62_Y8_N11
\inst1|inst1|inst1|inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst17~q\);

-- Location: LCCOMB_X62_Y8_N28
\inst1|inst1|inst1|inst5|inst|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[18]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst18~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst18~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[18]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst18~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\);

-- Location: FF_X62_Y8_N29
\inst1|inst1|inst1|inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst18~q\);

-- Location: LCCOMB_X62_Y8_N6
\inst1|inst1|inst1|inst5|inst|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[19]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst19~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst19~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[19]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst19~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\);

-- Location: FF_X62_Y8_N7
\inst1|inst1|inst1|inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst19~q\);

-- Location: LCCOMB_X62_Y8_N24
\inst1|inst1|inst1|inst5|inst1|inst|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[20]~input_o\) # ((\inst1|inst1|inst1|inst|inst21~q\ & !\WR~input_o\)))) # (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ 
-- & (((\inst1|inst1|inst1|inst|inst21~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[20]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst21~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\);

-- Location: FF_X62_Y8_N25
\inst1|inst1|inst1|inst|inst21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst21~q\);

-- Location: LCCOMB_X62_Y8_N18
\inst1|inst1|inst1|inst5|inst1|inst|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[21]~input_o\) # ((\inst1|inst1|inst1|inst|inst20~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst20~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[21]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst20~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\);

-- Location: FF_X62_Y8_N19
\inst1|inst1|inst1|inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst20~q\);

-- Location: LCCOMB_X62_Y8_N4
\inst1|inst1|inst1|inst5|inst1|inst|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[22]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst22~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst22~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[22]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst22~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\);

-- Location: FF_X62_Y8_N5
\inst1|inst1|inst1|inst|inst22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst22~q\);

-- Location: LCCOMB_X62_Y8_N30
\inst1|inst1|inst1|inst5|inst1|inst|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[23]~input_o\) # ((\inst1|inst1|inst1|inst|inst23~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst23~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[23]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst23~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\);

-- Location: FF_X62_Y8_N31
\inst1|inst1|inst1|inst|inst23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst23~q\);

-- Location: LCCOMB_X46_Y12_N16
\inst1|inst1|inst1|inst5|inst1|inst|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[24]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst24~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst24~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[24]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst24~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\);

-- Location: FF_X46_Y12_N17
\inst1|inst1|inst1|inst|inst24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst24~q\);

-- Location: LCCOMB_X46_Y12_N26
\inst1|inst1|inst1|inst5|inst1|inst1|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[25]~input_o\) # ((\inst1|inst1|inst1|inst|inst25~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst25~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[25]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst25~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\);

-- Location: FF_X46_Y12_N27
\inst1|inst1|inst1|inst|inst25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst1|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst25~q\);

-- Location: LCCOMB_X46_Y12_N12
\inst1|inst1|inst1|inst5|inst1|inst1|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[26]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst26~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst26~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[26]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst26~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\);

-- Location: FF_X46_Y12_N13
\inst1|inst1|inst1|inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst1|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst26~q\);

-- Location: LCCOMB_X46_Y12_N14
\inst1|inst1|inst1|inst5|inst1|inst1|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[27]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst27~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst27~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst27~q\,
	datad => \D[27]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\);

-- Location: FF_X46_Y12_N15
\inst1|inst1|inst1|inst|inst27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst1|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst27~q\);

-- Location: LCCOMB_X46_Y12_N24
\inst1|inst1|inst1|inst5|inst1|inst1|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[28]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst28~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst28~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[28]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst28~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\);

-- Location: FF_X46_Y12_N25
\inst1|inst1|inst1|inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst1|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst28~q\);

-- Location: LCCOMB_X46_Y12_N2
\inst1|inst1|inst1|inst5|inst1|inst1|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[29]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst29~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst29~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[29]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst29~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\);

-- Location: FF_X46_Y12_N3
\inst1|inst1|inst1|inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst1|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst29~q\);

-- Location: LCCOMB_X46_Y12_N4
\inst1|inst1|inst1|inst5|inst1|inst2|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[30]~input_o\) # ((\inst1|inst1|inst1|inst|inst30~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst30~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[30]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst30~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\);

-- Location: FF_X46_Y12_N5
\inst1|inst1|inst1|inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst2|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst30~q\);

-- Location: LCCOMB_X46_Y12_N22
\inst1|inst1|inst1|inst5|inst1|inst2|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[31]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst31~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst31~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[31]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst31~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\);

-- Location: FF_X46_Y12_N23
\inst1|inst1|inst1|inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst2|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst31~q\);

-- Location: LCCOMB_X46_Y12_N8
\inst1|inst1|inst1|inst5|inst1|inst2|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[32]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst32~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst32~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[32]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst32~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\);

-- Location: FF_X46_Y12_N9
\inst1|inst1|inst1|inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst2|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst32~q\);

-- Location: LCCOMB_X46_Y12_N10
\inst1|inst1|inst1|inst5|inst1|inst2|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[33]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst33~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst33~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[33]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst33~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\);

-- Location: FF_X46_Y12_N11
\inst1|inst1|inst1|inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst2|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst33~q\);

-- Location: LCCOMB_X46_Y12_N28
\inst1|inst1|inst1|inst5|inst1|inst2|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[34]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst34~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst34~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst34~q\,
	datad => \D[34]~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\);

-- Location: FF_X46_Y12_N29
\inst1|inst1|inst1|inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst2|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst34~q\);

-- Location: LCCOMB_X46_Y12_N6
\inst1|inst1|inst1|inst5|inst1|inst3|inst|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[35]~input_o\) # ((\inst1|inst1|inst1|inst|inst35~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst35~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[35]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst35~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\);

-- Location: FF_X46_Y12_N7
\inst1|inst1|inst1|inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst3|inst|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst35~q\);

-- Location: LCCOMB_X46_Y12_N0
\inst1|inst1|inst1|inst5|inst1|inst3|inst1|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[36]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst36~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst36~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[36]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst36~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\);

-- Location: FF_X46_Y12_N1
\inst1|inst1|inst1|inst|inst36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst3|inst1|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst36~q\);

-- Location: LCCOMB_X46_Y12_N18
\inst1|inst1|inst1|inst5|inst1|inst3|inst3|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[37]~input_o\) # ((!\WR~input_o\ & \inst1|inst1|inst1|inst|inst37~q\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst37~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~input_o\,
	datab => \D[37]~input_o\,
	datac => \inst1|inst1|inst1|inst|inst37~q\,
	datad => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\);

-- Location: FF_X46_Y12_N19
\inst1|inst1|inst1|inst|inst37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst3|inst3|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst37~q\);

-- Location: LCCOMB_X46_Y12_N20
\inst1|inst1|inst1|inst5|inst1|inst3|inst4|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[38]~input_o\) # ((\inst1|inst1|inst1|inst|inst38~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst38~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[38]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst38~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\);

-- Location: FF_X46_Y12_N21
\inst1|inst1|inst1|inst|inst38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst3|inst4|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst38~q\);

-- Location: LCCOMB_X46_Y12_N30
\inst1|inst1|inst1|inst5|inst1|inst3|inst5|inst6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \inst1|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\ = (\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & ((\D[39]~input_o\) # ((\inst1|inst1|inst1|inst|inst39~q\ & !\WR~input_o\)))) # 
-- (!\inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\ & (((\inst1|inst1|inst1|inst|inst39~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[39]~input_o\,
	datab => \inst1|inst1|inst1|inst5|inst|inst|inst|inst4~0_combout\,
	datac => \inst1|inst1|inst1|inst|inst39~q\,
	datad => \WR~input_o\,
	combout => \inst1|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\);

-- Location: FF_X46_Y12_N31
\inst1|inst1|inst1|inst|inst39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C~inputclkctrl_outclk\,
	d => \inst1|inst1|inst1|inst5|inst1|inst3|inst5|inst6~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|inst1|inst|inst39~q\);

ww_Q(1023)(0) <= \Q[1023][0]~output_o\;

ww_Q(1023)(1) <= \Q[1023][1]~output_o\;

ww_Q(1023)(2) <= \Q[1023][2]~output_o\;

ww_Q(1023)(3) <= \Q[1023][3]~output_o\;

ww_Q(1023)(4) <= \Q[1023][4]~output_o\;

ww_Q(1023)(5) <= \Q[1023][5]~output_o\;

ww_Q(1023)(6) <= \Q[1023][6]~output_o\;

ww_Q(1023)(7) <= \Q[1023][7]~output_o\;

ww_Q(1023)(8) <= \Q[1023][8]~output_o\;

ww_Q(1023)(9) <= \Q[1023][9]~output_o\;

ww_Q(1023)(10) <= \Q[1023][10]~output_o\;

ww_Q(1023)(11) <= \Q[1023][11]~output_o\;

ww_Q(1023)(12) <= \Q[1023][12]~output_o\;

ww_Q(1023)(13) <= \Q[1023][13]~output_o\;

ww_Q(1023)(14) <= \Q[1023][14]~output_o\;

ww_Q(1023)(15) <= \Q[1023][15]~output_o\;

ww_Q(1023)(16) <= \Q[1023][16]~output_o\;

ww_Q(1023)(17) <= \Q[1023][17]~output_o\;

ww_Q(1023)(18) <= \Q[1023][18]~output_o\;

ww_Q(1023)(19) <= \Q[1023][19]~output_o\;

ww_Q(1023)(20) <= \Q[1023][20]~output_o\;

ww_Q(1023)(21) <= \Q[1023][21]~output_o\;

ww_Q(1023)(22) <= \Q[1023][22]~output_o\;

ww_Q(1023)(23) <= \Q[1023][23]~output_o\;

ww_Q(1023)(24) <= \Q[1023][24]~output_o\;

ww_Q(1023)(25) <= \Q[1023][25]~output_o\;

ww_Q(1023)(26) <= \Q[1023][26]~output_o\;

ww_Q(1023)(27) <= \Q[1023][27]~output_o\;

ww_Q(1023)(28) <= \Q[1023][28]~output_o\;

ww_Q(1023)(29) <= \Q[1023][29]~output_o\;

ww_Q(1023)(30) <= \Q[1023][30]~output_o\;

ww_Q(1023)(31) <= \Q[1023][31]~output_o\;

ww_Q(1023)(32) <= \Q[1023][32]~output_o\;

ww_Q(1023)(33) <= \Q[1023][33]~output_o\;

ww_Q(1023)(34) <= \Q[1023][34]~output_o\;

ww_Q(1023)(35) <= \Q[1023][35]~output_o\;

ww_Q(1023)(36) <= \Q[1023][36]~output_o\;

ww_Q(1023)(37) <= \Q[1023][37]~output_o\;

ww_Q(1023)(38) <= \Q[1023][38]~output_o\;

ww_Q(1023)(39) <= \Q[1023][39]~output_o\;

ww_Q(1022)(0) <= \Q[1022][0]~output_o\;

ww_Q(1022)(1) <= \Q[1022][1]~output_o\;

ww_Q(1022)(2) <= \Q[1022][2]~output_o\;

ww_Q(1022)(3) <= \Q[1022][3]~output_o\;

ww_Q(1022)(4) <= \Q[1022][4]~output_o\;

ww_Q(1022)(5) <= \Q[1022][5]~output_o\;

ww_Q(1022)(6) <= \Q[1022][6]~output_o\;

ww_Q(1022)(7) <= \Q[1022][7]~output_o\;

ww_Q(1022)(8) <= \Q[1022][8]~output_o\;

ww_Q(1022)(9) <= \Q[1022][9]~output_o\;

ww_Q(1022)(10) <= \Q[1022][10]~output_o\;

ww_Q(1022)(11) <= \Q[1022][11]~output_o\;

ww_Q(1022)(12) <= \Q[1022][12]~output_o\;

ww_Q(1022)(13) <= \Q[1022][13]~output_o\;

ww_Q(1022)(14) <= \Q[1022][14]~output_o\;

ww_Q(1022)(15) <= \Q[1022][15]~output_o\;

ww_Q(1022)(16) <= \Q[1022][16]~output_o\;

ww_Q(1022)(17) <= \Q[1022][17]~output_o\;

ww_Q(1022)(18) <= \Q[1022][18]~output_o\;

ww_Q(1022)(19) <= \Q[1022][19]~output_o\;

ww_Q(1022)(20) <= \Q[1022][20]~output_o\;

ww_Q(1022)(21) <= \Q[1022][21]~output_o\;

ww_Q(1022)(22) <= \Q[1022][22]~output_o\;

ww_Q(1022)(23) <= \Q[1022][23]~output_o\;

ww_Q(1022)(24) <= \Q[1022][24]~output_o\;

ww_Q(1022)(25) <= \Q[1022][25]~output_o\;

ww_Q(1022)(26) <= \Q[1022][26]~output_o\;

ww_Q(1022)(27) <= \Q[1022][27]~output_o\;

ww_Q(1022)(28) <= \Q[1022][28]~output_o\;

ww_Q(1022)(29) <= \Q[1022][29]~output_o\;

ww_Q(1022)(30) <= \Q[1022][30]~output_o\;

ww_Q(1022)(31) <= \Q[1022][31]~output_o\;

ww_Q(1022)(32) <= \Q[1022][32]~output_o\;

ww_Q(1022)(33) <= \Q[1022][33]~output_o\;

ww_Q(1022)(34) <= \Q[1022][34]~output_o\;

ww_Q(1022)(35) <= \Q[1022][35]~output_o\;

ww_Q(1022)(36) <= \Q[1022][36]~output_o\;

ww_Q(1022)(37) <= \Q[1022][37]~output_o\;

ww_Q(1022)(38) <= \Q[1022][38]~output_o\;

ww_Q(1022)(39) <= \Q[1022][39]~output_o\;

ww_Q(1021)(0) <= \Q[1021][0]~output_o\;

ww_Q(1021)(1) <= \Q[1021][1]~output_o\;

ww_Q(1021)(2) <= \Q[1021][2]~output_o\;

ww_Q(1021)(3) <= \Q[1021][3]~output_o\;

ww_Q(1021)(4) <= \Q[1021][4]~output_o\;

ww_Q(1021)(5) <= \Q[1021][5]~output_o\;

ww_Q(1021)(6) <= \Q[1021][6]~output_o\;

ww_Q(1021)(7) <= \Q[1021][7]~output_o\;

ww_Q(1021)(8) <= \Q[1021][8]~output_o\;

ww_Q(1021)(9) <= \Q[1021][9]~output_o\;

ww_Q(1021)(10) <= \Q[1021][10]~output_o\;

ww_Q(1021)(11) <= \Q[1021][11]~output_o\;

ww_Q(1021)(12) <= \Q[1021][12]~output_o\;

ww_Q(1021)(13) <= \Q[1021][13]~output_o\;

ww_Q(1021)(14) <= \Q[1021][14]~output_o\;

ww_Q(1021)(15) <= \Q[1021][15]~output_o\;

ww_Q(1021)(16) <= \Q[1021][16]~output_o\;

ww_Q(1021)(17) <= \Q[1021][17]~output_o\;

ww_Q(1021)(18) <= \Q[1021][18]~output_o\;

ww_Q(1021)(19) <= \Q[1021][19]~output_o\;

ww_Q(1021)(20) <= \Q[1021][20]~output_o\;

ww_Q(1021)(21) <= \Q[1021][21]~output_o\;

ww_Q(1021)(22) <= \Q[1021][22]~output_o\;

ww_Q(1021)(23) <= \Q[1021][23]~output_o\;

ww_Q(1021)(24) <= \Q[1021][24]~output_o\;

ww_Q(1021)(25) <= \Q[1021][25]~output_o\;

ww_Q(1021)(26) <= \Q[1021][26]~output_o\;

ww_Q(1021)(27) <= \Q[1021][27]~output_o\;

ww_Q(1021)(28) <= \Q[1021][28]~output_o\;

ww_Q(1021)(29) <= \Q[1021][29]~output_o\;

ww_Q(1021)(30) <= \Q[1021][30]~output_o\;

ww_Q(1021)(31) <= \Q[1021][31]~output_o\;

ww_Q(1021)(32) <= \Q[1021][32]~output_o\;

ww_Q(1021)(33) <= \Q[1021][33]~output_o\;

ww_Q(1021)(34) <= \Q[1021][34]~output_o\;

ww_Q(1021)(35) <= \Q[1021][35]~output_o\;

ww_Q(1021)(36) <= \Q[1021][36]~output_o\;

ww_Q(1021)(37) <= \Q[1021][37]~output_o\;

ww_Q(1021)(38) <= \Q[1021][38]~output_o\;

ww_Q(1021)(39) <= \Q[1021][39]~output_o\;

ww_Q(1020)(0) <= \Q[1020][0]~output_o\;

ww_Q(1020)(1) <= \Q[1020][1]~output_o\;

ww_Q(1020)(2) <= \Q[1020][2]~output_o\;

ww_Q(1020)(3) <= \Q[1020][3]~output_o\;

ww_Q(1020)(4) <= \Q[1020][4]~output_o\;

ww_Q(1020)(5) <= \Q[1020][5]~output_o\;

ww_Q(1020)(6) <= \Q[1020][6]~output_o\;

ww_Q(1020)(7) <= \Q[1020][7]~output_o\;

ww_Q(1020)(8) <= \Q[1020][8]~output_o\;

ww_Q(1020)(9) <= \Q[1020][9]~output_o\;

ww_Q(1020)(10) <= \Q[1020][10]~output_o\;

ww_Q(1020)(11) <= \Q[1020][11]~output_o\;

ww_Q(1020)(12) <= \Q[1020][12]~output_o\;

ww_Q(1020)(13) <= \Q[1020][13]~output_o\;

ww_Q(1020)(14) <= \Q[1020][14]~output_o\;

ww_Q(1020)(15) <= \Q[1020][15]~output_o\;

ww_Q(1020)(16) <= \Q[1020][16]~output_o\;

ww_Q(1020)(17) <= \Q[1020][17]~output_o\;

ww_Q(1020)(18) <= \Q[1020][18]~output_o\;

ww_Q(1020)(19) <= \Q[1020][19]~output_o\;

ww_Q(1020)(20) <= \Q[1020][20]~output_o\;

ww_Q(1020)(21) <= \Q[1020][21]~output_o\;

ww_Q(1020)(22) <= \Q[1020][22]~output_o\;

ww_Q(1020)(23) <= \Q[1020][23]~output_o\;

ww_Q(1020)(24) <= \Q[1020][24]~output_o\;

ww_Q(1020)(25) <= \Q[1020][25]~output_o\;

ww_Q(1020)(26) <= \Q[1020][26]~output_o\;

ww_Q(1020)(27) <= \Q[1020][27]~output_o\;

ww_Q(1020)(28) <= \Q[1020][28]~output_o\;

ww_Q(1020)(29) <= \Q[1020][29]~output_o\;

ww_Q(1020)(30) <= \Q[1020][30]~output_o\;

ww_Q(1020)(31) <= \Q[1020][31]~output_o\;

ww_Q(1020)(32) <= \Q[1020][32]~output_o\;

ww_Q(1020)(33) <= \Q[1020][33]~output_o\;

ww_Q(1020)(34) <= \Q[1020][34]~output_o\;

ww_Q(1020)(35) <= \Q[1020][35]~output_o\;

ww_Q(1020)(36) <= \Q[1020][36]~output_o\;

ww_Q(1020)(37) <= \Q[1020][37]~output_o\;

ww_Q(1020)(38) <= \Q[1020][38]~output_o\;

ww_Q(1020)(39) <= \Q[1020][39]~output_o\;

ww_Q(1019)(0) <= \Q[1019][0]~output_o\;

ww_Q(1019)(1) <= \Q[1019][1]~output_o\;

ww_Q(1019)(2) <= \Q[1019][2]~output_o\;

ww_Q(1019)(3) <= \Q[1019][3]~output_o\;

ww_Q(1019)(4) <= \Q[1019][4]~output_o\;

ww_Q(1019)(5) <= \Q[1019][5]~output_o\;

ww_Q(1019)(6) <= \Q[1019][6]~output_o\;

ww_Q(1019)(7) <= \Q[1019][7]~output_o\;

ww_Q(1019)(8) <= \Q[1019][8]~output_o\;

ww_Q(1019)(9) <= \Q[1019][9]~output_o\;

ww_Q(1019)(10) <= \Q[1019][10]~output_o\;

ww_Q(1019)(11) <= \Q[1019][11]~output_o\;

ww_Q(1019)(12) <= \Q[1019][12]~output_o\;

ww_Q(1019)(13) <= \Q[1019][13]~output_o\;

ww_Q(1019)(14) <= \Q[1019][14]~output_o\;

ww_Q(1019)(15) <= \Q[1019][15]~output_o\;

ww_Q(1019)(16) <= \Q[1019][16]~output_o\;

ww_Q(1019)(17) <= \Q[1019][17]~output_o\;

ww_Q(1019)(18) <= \Q[1019][18]~output_o\;

ww_Q(1019)(19) <= \Q[1019][19]~output_o\;

ww_Q(1019)(20) <= \Q[1019][20]~output_o\;

ww_Q(1019)(21) <= \Q[1019][21]~output_o\;

ww_Q(1019)(22) <= \Q[1019][22]~output_o\;

ww_Q(1019)(23) <= \Q[1019][23]~output_o\;

ww_Q(1019)(24) <= \Q[1019][24]~output_o\;

ww_Q(1019)(25) <= \Q[1019][25]~output_o\;

ww_Q(1019)(26) <= \Q[1019][26]~output_o\;

ww_Q(1019)(27) <= \Q[1019][27]~output_o\;

ww_Q(1019)(28) <= \Q[1019][28]~output_o\;

ww_Q(1019)(29) <= \Q[1019][29]~output_o\;

ww_Q(1019)(30) <= \Q[1019][30]~output_o\;

ww_Q(1019)(31) <= \Q[1019][31]~output_o\;

ww_Q(1019)(32) <= \Q[1019][32]~output_o\;

ww_Q(1019)(33) <= \Q[1019][33]~output_o\;

ww_Q(1019)(34) <= \Q[1019][34]~output_o\;

ww_Q(1019)(35) <= \Q[1019][35]~output_o\;

ww_Q(1019)(36) <= \Q[1019][36]~output_o\;

ww_Q(1019)(37) <= \Q[1019][37]~output_o\;

ww_Q(1019)(38) <= \Q[1019][38]~output_o\;

ww_Q(1019)(39) <= \Q[1019][39]~output_o\;

ww_Q(1018)(0) <= \Q[1018][0]~output_o\;

ww_Q(1018)(1) <= \Q[1018][1]~output_o\;

ww_Q(1018)(2) <= \Q[1018][2]~output_o\;

ww_Q(1018)(3) <= \Q[1018][3]~output_o\;

ww_Q(1018)(4) <= \Q[1018][4]~output_o\;

ww_Q(1018)(5) <= \Q[1018][5]~output_o\;

ww_Q(1018)(6) <= \Q[1018][6]~output_o\;

ww_Q(1018)(7) <= \Q[1018][7]~output_o\;

ww_Q(1018)(8) <= \Q[1018][8]~output_o\;

ww_Q(1018)(9) <= \Q[1018][9]~output_o\;

ww_Q(1018)(10) <= \Q[1018][10]~output_o\;

ww_Q(1018)(11) <= \Q[1018][11]~output_o\;

ww_Q(1018)(12) <= \Q[1018][12]~output_o\;

ww_Q(1018)(13) <= \Q[1018][13]~output_o\;

ww_Q(1018)(14) <= \Q[1018][14]~output_o\;

ww_Q(1018)(15) <= \Q[1018][15]~output_o\;

ww_Q(1018)(16) <= \Q[1018][16]~output_o\;

ww_Q(1018)(17) <= \Q[1018][17]~output_o\;

ww_Q(1018)(18) <= \Q[1018][18]~output_o\;

ww_Q(1018)(19) <= \Q[1018][19]~output_o\;

ww_Q(1018)(20) <= \Q[1018][20]~output_o\;

ww_Q(1018)(21) <= \Q[1018][21]~output_o\;

ww_Q(1018)(22) <= \Q[1018][22]~output_o\;

ww_Q(1018)(23) <= \Q[1018][23]~output_o\;

ww_Q(1018)(24) <= \Q[1018][24]~output_o\;

ww_Q(1018)(25) <= \Q[1018][25]~output_o\;

ww_Q(1018)(26) <= \Q[1018][26]~output_o\;

ww_Q(1018)(27) <= \Q[1018][27]~output_o\;

ww_Q(1018)(28) <= \Q[1018][28]~output_o\;

ww_Q(1018)(29) <= \Q[1018][29]~output_o\;

ww_Q(1018)(30) <= \Q[1018][30]~output_o\;

ww_Q(1018)(31) <= \Q[1018][31]~output_o\;

ww_Q(1018)(32) <= \Q[1018][32]~output_o\;

ww_Q(1018)(33) <= \Q[1018][33]~output_o\;

ww_Q(1018)(34) <= \Q[1018][34]~output_o\;

ww_Q(1018)(35) <= \Q[1018][35]~output_o\;

ww_Q(1018)(36) <= \Q[1018][36]~output_o\;

ww_Q(1018)(37) <= \Q[1018][37]~output_o\;

ww_Q(1018)(38) <= \Q[1018][38]~output_o\;

ww_Q(1018)(39) <= \Q[1018][39]~output_o\;

ww_Q(1017)(0) <= \Q[1017][0]~output_o\;

ww_Q(1017)(1) <= \Q[1017][1]~output_o\;

ww_Q(1017)(2) <= \Q[1017][2]~output_o\;

ww_Q(1017)(3) <= \Q[1017][3]~output_o\;

ww_Q(1017)(4) <= \Q[1017][4]~output_o\;

ww_Q(1017)(5) <= \Q[1017][5]~output_o\;

ww_Q(1017)(6) <= \Q[1017][6]~output_o\;

ww_Q(1017)(7) <= \Q[1017][7]~output_o\;

ww_Q(1017)(8) <= \Q[1017][8]~output_o\;

ww_Q(1017)(9) <= \Q[1017][9]~output_o\;

ww_Q(1017)(10) <= \Q[1017][10]~output_o\;

ww_Q(1017)(11) <= \Q[1017][11]~output_o\;

ww_Q(1017)(12) <= \Q[1017][12]~output_o\;

ww_Q(1017)(13) <= \Q[1017][13]~output_o\;

ww_Q(1017)(14) <= \Q[1017][14]~output_o\;

ww_Q(1017)(15) <= \Q[1017][15]~output_o\;

ww_Q(1017)(16) <= \Q[1017][16]~output_o\;

ww_Q(1017)(17) <= \Q[1017][17]~output_o\;

ww_Q(1017)(18) <= \Q[1017][18]~output_o\;

ww_Q(1017)(19) <= \Q[1017][19]~output_o\;

ww_Q(1017)(20) <= \Q[1017][20]~output_o\;

ww_Q(1017)(21) <= \Q[1017][21]~output_o\;

ww_Q(1017)(22) <= \Q[1017][22]~output_o\;

ww_Q(1017)(23) <= \Q[1017][23]~output_o\;

ww_Q(1017)(24) <= \Q[1017][24]~output_o\;

ww_Q(1017)(25) <= \Q[1017][25]~output_o\;

ww_Q(1017)(26) <= \Q[1017][26]~output_o\;

ww_Q(1017)(27) <= \Q[1017][27]~output_o\;

ww_Q(1017)(28) <= \Q[1017][28]~output_o\;

ww_Q(1017)(29) <= \Q[1017][29]~output_o\;

ww_Q(1017)(30) <= \Q[1017][30]~output_o\;

ww_Q(1017)(31) <= \Q[1017][31]~output_o\;

ww_Q(1017)(32) <= \Q[1017][32]~output_o\;

ww_Q(1017)(33) <= \Q[1017][33]~output_o\;

ww_Q(1017)(34) <= \Q[1017][34]~output_o\;

ww_Q(1017)(35) <= \Q[1017][35]~output_o\;

ww_Q(1017)(36) <= \Q[1017][36]~output_o\;

ww_Q(1017)(37) <= \Q[1017][37]~output_o\;

ww_Q(1017)(38) <= \Q[1017][38]~output_o\;

ww_Q(1017)(39) <= \Q[1017][39]~output_o\;

ww_Q(1016)(0) <= \Q[1016][0]~output_o\;

ww_Q(1016)(1) <= \Q[1016][1]~output_o\;

ww_Q(1016)(2) <= \Q[1016][2]~output_o\;

ww_Q(1016)(3) <= \Q[1016][3]~output_o\;

ww_Q(1016)(4) <= \Q[1016][4]~output_o\;

ww_Q(1016)(5) <= \Q[1016][5]~output_o\;

ww_Q(1016)(6) <= \Q[1016][6]~output_o\;

ww_Q(1016)(7) <= \Q[1016][7]~output_o\;

ww_Q(1016)(8) <= \Q[1016][8]~output_o\;

ww_Q(1016)(9) <= \Q[1016][9]~output_o\;

ww_Q(1016)(10) <= \Q[1016][10]~output_o\;

ww_Q(1016)(11) <= \Q[1016][11]~output_o\;

ww_Q(1016)(12) <= \Q[1016][12]~output_o\;

ww_Q(1016)(13) <= \Q[1016][13]~output_o\;

ww_Q(1016)(14) <= \Q[1016][14]~output_o\;

ww_Q(1016)(15) <= \Q[1016][15]~output_o\;

ww_Q(1016)(16) <= \Q[1016][16]~output_o\;

ww_Q(1016)(17) <= \Q[1016][17]~output_o\;

ww_Q(1016)(18) <= \Q[1016][18]~output_o\;

ww_Q(1016)(19) <= \Q[1016][19]~output_o\;

ww_Q(1016)(20) <= \Q[1016][20]~output_o\;

ww_Q(1016)(21) <= \Q[1016][21]~output_o\;

ww_Q(1016)(22) <= \Q[1016][22]~output_o\;

ww_Q(1016)(23) <= \Q[1016][23]~output_o\;

ww_Q(1016)(24) <= \Q[1016][24]~output_o\;

ww_Q(1016)(25) <= \Q[1016][25]~output_o\;

ww_Q(1016)(26) <= \Q[1016][26]~output_o\;

ww_Q(1016)(27) <= \Q[1016][27]~output_o\;

ww_Q(1016)(28) <= \Q[1016][28]~output_o\;

ww_Q(1016)(29) <= \Q[1016][29]~output_o\;

ww_Q(1016)(30) <= \Q[1016][30]~output_o\;

ww_Q(1016)(31) <= \Q[1016][31]~output_o\;

ww_Q(1016)(32) <= \Q[1016][32]~output_o\;

ww_Q(1016)(33) <= \Q[1016][33]~output_o\;

ww_Q(1016)(34) <= \Q[1016][34]~output_o\;

ww_Q(1016)(35) <= \Q[1016][35]~output_o\;

ww_Q(1016)(36) <= \Q[1016][36]~output_o\;

ww_Q(1016)(37) <= \Q[1016][37]~output_o\;

ww_Q(1016)(38) <= \Q[1016][38]~output_o\;

ww_Q(1016)(39) <= \Q[1016][39]~output_o\;
END structure;



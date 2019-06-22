-- Copyright (C) 1991-2012 Altera Corporation
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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/18/2012 05:00:30"
                                                            
-- Vhdl Test Bench template for design  :  Lab1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab1_vhd_tst IS
END Lab1_vhd_tst;
ARCHITECTURE Lab1_arch OF Lab1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL D : STD_LOGIC_VECTOR(0 TO 12);
SIGNAL F0 : STD_LOGIC;
SIGNAL F1 : STD_LOGIC;
SIGNAL F2 : STD_LOGIC;
SIGNAL RG : STD_LOGIC_VECTOR(0 TO 12);
COMPONENT Lab1
	PORT (
	CLK : IN STD_LOGIC;
	D : IN STD_LOGIC_VECTOR(0 TO 12);
	F0 : IN STD_LOGIC;
	F1 : IN STD_LOGIC;
	F2 : IN STD_LOGIC;
	RG : OUT STD_LOGIC_VECTOR(0 TO 12)
	);
END COMPONENT;
BEGIN
	i1 : Lab1
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	D => D,
	F0 => F0,
	F1 => F1,
	F2 => F2,
	RG => RG
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Lab1_arch;

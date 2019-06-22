library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram5 is
	port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC4 : in STD_LOGIC_VECTOR(3 downto 0);
		DC3 : in STD_LOGIC_VECTOR(3 downto 0);
		DC2 : in STD_LOGIC_VECTOR(3 downto 0);
		DC1 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC;
		BI  : out STD_LOGIC
	);
end ram5;

architecture Behavior of ram5 is
	component ram4 port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC4 : in STD_LOGIC_VECTOR(3 downto 0);
		DC3 : in STD_LOGIC_VECTOR(3 downto 0);
		DC2 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(1 downto 0);
		BI  : out STD_LOGIC );
	end component;
	
begin
	U1_ram4: ram4 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC(1) => DC1(3), DC(0) => DC, BI => BI);
	U2_ram4: ram4 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC(1) => DC1(2), DC(0) => DC, BI => BI);
	U3_ram4: ram4 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC(1) => DC1(1), DC(0) => DC, BI => BI);
	U4_ram4: ram4 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC(1) => DC1(0), DC(0) => DC, BI => BI);
end Behavior;
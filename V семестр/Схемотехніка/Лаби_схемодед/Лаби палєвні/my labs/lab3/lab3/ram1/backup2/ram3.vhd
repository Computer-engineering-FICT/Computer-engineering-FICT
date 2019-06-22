library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram3 is
	port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC4 : in STD_LOGIC_VECTOR(3 downto 0);
		DC3 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(2 downto 0);
		BI  : out STD_LOGIC
	);
end ram3;

architecture Behavior of ram3 is
	component ram2 port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC4 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(3 downto 0);
		BI  : out STD_LOGIC );
	end component;
	
begin
	U1_ram2: ram2 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC(3) => DC3(3), DC(2 downto 0) => DC, BI => BI);
	U2_ram2: ram2 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC(3) => DC3(2), DC(2 downto 0) => DC, BI => BI);
	U3_ram2: ram2 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC(3) => DC3(1), DC(2 downto 0) => DC, BI => BI);
	U4_ram2: ram2 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC(3) => DC3(0), DC(2 downto 0) => DC, BI => BI);
end Behavior;
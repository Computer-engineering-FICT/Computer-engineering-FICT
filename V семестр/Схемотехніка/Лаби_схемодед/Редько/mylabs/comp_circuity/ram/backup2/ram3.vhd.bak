library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram2 is
	port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC4 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(3 downto 0);
		BI  : out STD_LOGIC
	);
end ram2;

architecture Behavior of ram2 is
	component ram1 port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(4 downto 0);
		BI  : out STD_LOGIC );
	end component;
	
begin
	U1_ram1: ram1 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC(4) => DC4(3), DC(3 downto 0) => DC, BI => BI);
	U1_ram2: ram1 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC(4) => DC4(2), DC(3 downto 0) => DC, BI => BI);
	U1_ram3: ram1 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC(4) => DC4(1), DC(3 downto 0) => DC, BI => BI);
	U1_ram4: ram1 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC(4) => DC4(0), DC(3 downto 0) => DC, BI => BI);
end Behavior;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram1 is
	port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC5 : in STD_LOGIC_VECTOR(3 downto 0);
		DC : in STD_LOGIC_VECTOR(4 downto 0);
		BI  : out STD_LOGIC
	);
end ram1;

architecture Behavior of ram1 is
	component ram01 port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC : in STD_LOGIC_VECTOR(5 downto 0);
		BI  : out STD_LOGIC );
	end component;
	
begin
	U1_ram01: ram01 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC(5) => DC5(3), DC(4 downto 0) => DC, BI => BI);
	U2_ram01: ram01 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC(5) => DC5(2), DC(4 downto 0) => DC, BI => BI);
	U3_ram01: ram01 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC(5) => DC5(1), DC(4 downto 0) => DC, BI => BI);
	U4_ram01: ram01 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC(5) => DC5(0), DC(4 downto 0) => DC, BI => BI);
end Behavior;
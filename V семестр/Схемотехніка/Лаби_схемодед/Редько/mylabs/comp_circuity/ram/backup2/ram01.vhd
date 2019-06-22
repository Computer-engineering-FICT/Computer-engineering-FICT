library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram01 is
	port (
		CLK : in STD_LOGIC;
		WR : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DC : in STD_LOGIC_VECTOR(5 downto 0);
		BI  : out STD_LOGIC
	);
end ram01;

architecture Behavior of ram01 is
	component et port (
		CLK : in STD_LOGIC;
		WR0 : in STD_LOGIC;
		RD  : in STD_LOGIC;
		DI  : in STD_LOGIC;
		A12 : in STD_LOGIC;
		DCA : in STD_LOGIC_VECTOR(5 downto 0);
		Et  : out STD_LOGIC );
	end component;

begin
	U_Et1: et port map
		(CLK => CLK, WR0 => WR, RD => RD, DI => DI, A12 => A12, DCA => DC, Et => BI);
	U_Et2: et port map
		(CLK => CLK, WR0 => WR, RD => RD, DI => DI, A12 => not A12, DCA => DC, Et => BI);
end Behavior;
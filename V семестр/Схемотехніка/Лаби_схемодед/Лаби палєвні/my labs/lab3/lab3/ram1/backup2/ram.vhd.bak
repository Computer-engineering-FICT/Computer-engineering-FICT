library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram6 is
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
		DC0 : in STD_LOGIC_VECTOR(3 downto 0);
		BI  : out STD_LOGIC
	);
end ram6;

architecture Behavior of ram6 is
	component ram5 port (
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
		BI  : out STD_LOGIC );
	end component;
	
begin
	U1_ram5: ram5 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC1 => DC1, DC => DC0(3), BI => BI);
	U2_ram5: ram5 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC1 => DC1, DC => DC0(2), BI => BI);
	U3_ram5: ram5 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC1 => DC1, DC => DC0(1), BI => BI);
	U4_ram5: ram5 port map
		(CLK => CLK, WR => WR, RD => RD, DI => DI, A12 => A12, 
		DC5 => DC5, DC4 => DC4, DC3 => DC3, DC2 => DC2, DC1 => DC1, DC => DC0(0), BI => BI);
end Behavior;
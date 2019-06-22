library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ram is
	port (
		CLK : in STD_LOGIC;
		WE  : in STD_LOGIC;
		A   : in STD_LOGIC_VECTOR(12 downto 0);
		D   : in STD_LOGIC_VECTOR(14 downto 0);
		Q 	 : out STD_LOGIC_VECTOR(14 downto 0)
	);
end ram;

architecture Behavior of ram is
	component ram6 port (
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
		BI  : out STD_LOGIC );
	end component;
	
	component dc2_4 port (
		A : in STD_LOGIC_VECTOR(1 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
	end component;
	
	signal wr, rd : STD_LOGIC;
	
	signal aa : STD_LOGIC_VECTOR(3 downto 0);
	signal bb : STD_LOGIC_VECTOR(3 downto 0);
	signal cc : STD_LOGIC_VECTOR(3 downto 0);
	signal dd : STD_LOGIC_VECTOR(3 downto 0);
	signal ee : STD_LOGIC_VECTOR(3 downto 0);
	signal ff : STD_LOGIC_VECTOR(3 downto 0);
begin
	wr <= we;
	rd <= not we;
	
	U1_DC2_4: dc2_4 port map ( A(1) => A(11), A(0) => A(10), Y => aa(3 downto 0) );
	U2_DC2_4: dc2_4 port map ( A(1) => A(9), A(0) => A(8), Y => bb(3 downto 0) );
	U3_DC2_4: dc2_4 port map ( A(1) => A(7), A(0) => A(6), Y => cc(3 downto 0) );
	U4_DC2_4: dc2_4 port map ( A(1) => A(5), A(0) => A(4), Y => dd(3 downto 0) );
	U5_DC2_4: dc2_4 port map ( A(1) => A(3), A(0) => A(2), Y => ee(3 downto 0) );
	U6_DC2_4: dc2_4 port map ( A(1) => A(1), A(0) => A(0), Y => ff(3 downto 0) );
	
	U_RAM: for i in 14 downto 0 generate
		U_RAM6: ram6 port map
			( CLK => CLK, WR => wr, RD => rd, DI => D(i), A12 => A(12), 
				DC5 => aa(3 downto 0), DC4 => bb(3 downto 0),
				DC3 => cc(3 downto 0), DC2 => dd(3 downto 0),
				DC1 => ee(3 downto 0), DC0 => ff(3 downto 0), BI => Q(i) );
	end generate;
	
end Behavior;
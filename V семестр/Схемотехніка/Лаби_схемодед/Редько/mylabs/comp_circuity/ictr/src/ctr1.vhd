library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ctr1 is port (
	CLK : in STD_LOGIC; --синхросигнал
	Ci : in STD_LOGIC; -- перенос
	F : in STD_LOGIC_VECTOR(3 downto 0); -- управление
	Di : in STD_LOGIC; -- входное данное
	C_i_plus_1 : out STD_LOGIC; -- выход cчетчика
	Qi : out STD_LOGIC
); 
end entity;

architecture Behavior of ctr1 is
	COMPONENT DFF PORT (
		d   : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      clrn: IN STD_LOGIC;
      prn : IN STD_LOGIC;
      q   : OUT STD_LOGIC );
	END COMPONENT;
	
	signal Dt, R, Q : STD_LOGIC;
	constant gnd : STD_LOGIC := '0';
begin

	Dt <= ( (Di and F(3) and F(1)) or (Q and not Ci) or (not Q and Ci and not F(3))
			or (not Q and Ci and F(1)) );
	R <= F(3) and not F(1) and F(0);
	
	DFFcomp: DFF port map
			( d => Dt, clk => CLK, clrn => R, prn => gnd, 	q => Q );
	Qi <= Q;
	
	C_i_plus_1 <= Ci and Q;
	
end Behavior;
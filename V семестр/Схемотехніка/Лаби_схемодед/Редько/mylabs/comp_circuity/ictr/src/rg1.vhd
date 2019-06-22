library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rg1 is port (
	CLK : in STD_LOGIC; --синхросигнал
	F : in STD_LOGIC_VECTOR(3 downto 0); -- управление
	Di : in STD_LOGIC; -- входное данное
	Si : in STD_LOGIC;
	Qi : out STD_LOGIC
); 
end entity;

architecture Behavior of rg1 is
	COMPONENT DFF PORT (
		d   : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      clrn: IN STD_LOGIC;
      prn : IN STD_LOGIC;
      q   : OUT STD_LOGIC );
	END COMPONENT;
	
	signal Dt, R : STD_LOGIC;
	constant gnd : STD_LOGIC := '0';
begin

	Dt <= ( (Di and F(3) and F(1)) or (not F(3) and Si) or (not F(1) and Si) );
	R <= F(3) and F(0);
	
	DFFcomp: DFF port map
			( d => Dt, clk => CLK, clrn => R, prn => gnd, 	q => Qi );
	
end Behavior;
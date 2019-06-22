library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shu is port (
	D : in STD_LOGIC_VECTOR(14 downto 0);
	FSH : in STD_LOGIC;
	Rl : in STD_LOGIC;
	Q : out STD_LOGIC_VECTOR(14 downto 0);
	R0 : out STD_LOGIC
	);
end entity;

architecture Behavior of shu is
	COMPONENT DFF PORT (
		d   : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      clrn: IN STD_LOGIC;
      prn : IN STD_LOGIC;
      q   : OUT STD_LOGIC );
	END COMPONENT;
	
	constant gnd : STD_LOGIC := '0';
begin
	U_DFF: DFF port map
		( d => D(0), clk => FSH, clrn => gnd, prn => gnd, q => R0 );
	U_SHU1: entity work.SHU1 port map
		( Di => Rl, D_i_plus_1 => D(14), FSH => FSH, Qi => Q(14));
	SHR: for i in 14 downto 1 generate
		U_SHU: entity work.SHU1 port map
			( Di => D(i), D_i_plus_1 => D(i - 1), FSH => FSH, Qi => Q(i - 1));
	end generate;
end Behavior;
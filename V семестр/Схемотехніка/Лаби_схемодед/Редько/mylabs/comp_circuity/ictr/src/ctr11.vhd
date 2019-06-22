library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ctr11 is
	port (
		CLK : in STD_LOGIC;
		F : in STD_LOGIC_VECTOR(3 downto 0);
		D : in STD_LOGIC_VECTOR(14 downto 4);
		C4 : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(14 downto 4)
	);
end ctr11;

architecture Behavior of ctr11 is
	signal c : STD_LOGIC_VECTOR(15 downto 4);
	signal qq : STD_LOGIC_VECTOR(14 downto 4);
begin
	CT0: entity work.ctr1 port map
			(CLK => CLK, Ci => C4, F => F, Di => D(4), C_i_plus_1 => c(5), Qi => qq(4));
	CT : for i in 5 to 14 generate
		CT1: entity work.ctr1 port map
			(CLK => CLK, Ci => c(i), F => F, Di => D(i), C_i_plus_1 => c(i + 1), Qi => qq(i));
	end generate;
	Q <= qq;
end Behavior;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rg4 is
	port (
		CLK : in STD_LOGIC;
		F : in STD_LOGIC_VECTOR(3 downto 0);
		D : in STD_LOGIC_VECTOR(3 downto 0);
		S : in STD_LOGIC_VECTOR(3 downto 0);
		Q : out STD_LOGIC_VECTOR(3 downto 0)
	);
end rg4;

architecture Behavior of rg4 is
begin
	RG : for i in 0 to 3 generate
		REG1: entity work.rg1 port map
			(CLK => CLK, F => F, Di => D(i), Si => S(i), Qi => Q(i));
	end generate;
end Behavior;
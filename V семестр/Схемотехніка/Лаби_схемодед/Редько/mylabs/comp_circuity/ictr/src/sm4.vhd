library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sm4 is
	port (
		Q : in STD_LOGIC_VECTOR(3 downto 0); 	--даное с регистра
		F : in STD_LOGIC_VECTOR(3 downto 0); 	-- инкремент
		S : out STD_LOGIC_VECTOR(3 downto 0); 	-- сумма
		C4 : out STD_LOGIC 							--перенос
	);
end sm4;

architecture Behavior of sm4 is
	constant gnd : STD_LOGIC := '0';
	signal qii : STD_LOGIC_VECTOR(3 downto 0);
begin
	SUM0: entity work.sm1 port map
		( Fi => F(0), Qi => Q(0), q_i => gnd, q_i_plus_1 => qii(0), Si => s(0));
	SUM3: for i in 1 to 3 generate
		SUM1: entity work.sm1 port map
		( Fi => F(i), Qi => Q(i), q_i => qii(i - 1), q_i_plus_1 => qii(i), Si => s(i));
	end generate;
	
	C4 <= qii(3);
	
end Behavior;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ictr is -- Instruction counter
	port (
		CLK : in STD_LOGIC; -- синхровход
		D : in STD_LOGIC_VECTOR(14 downto 0); -- адрес перехода
		F : in STD_LOGIC_VECTOR(3 downto 0); -- функция
		A : out STD_LOGIC_VECTOR(14 downto 0) -- выходной адрес
	);
end ictr;

architecture Behavior of ictr is
	signal s : STD_LOGIC_VECTOR(3 downto 0);
	signal c : STD_LOGIC;
	signal q : STD_LOGIC_VECTOR(14 downto 0);
begin
		SM : entity work.sm4 port map
			(Q => q(3 downto 0), F => F, C4 => c, S => s);
		RG : entity work.rg4 port map
			(CLK => CLK, F => F, D => D(3 downto 0), S => s, Q => q(3 downto 0));
		CTR : entity work.ctr11 port map
			(CLK => CLK, F => F, D => D(14 downto 4), C4 => c, Q => q(14 downto 4));
		A <= q;
end Behavior;
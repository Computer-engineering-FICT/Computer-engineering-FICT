
library IEEE;

use IEEE.STD_LOGIC_1164.all;



architecture OR64_BEH of OR64_SC is

	component OR8_SC is
		port (D : in STD_LOGIC_VECTOR(7 downto 0); Z : out STD_LOGIC);
	end component;
	
	signal zi : STD_LOGIC_VECTOR(7 downto 0);
begin
	
	OR64: for i in 0 to 7 generate
		OR8: entity work.OR8_SC(OR8_BEH) port map
		(D => D(8 * i + 7 downto 8 * i), Z => zi(i));
	end generate;
	
	Z <= not(zi(7) or zi(6) or zi(5) or zi(4) or zi(3) or zi(2) or zi(1) or zi(0));
	
end OR64_BEH;
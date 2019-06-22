
library IEEE;
use IEEE.STD_LOGIC_1164.all;

architecture LSM64_LSM of LSM64 is

	signal pi, qi, di : STD_LOGIC_VECTOR(67 downto 0);
	signal c : STD_LOGIC_VECTOR(68 downto 0);
	
begin
	
	C0: entity work.PLM_4(PLM4_C0) port map
		(A => F(0), B => F(1), C => F(2), D => F(3), Y => c(0));
	
	pi(63 downto 0) <= P;
	pi(64) <= P(63);
	pi(65) <= pi(64);
	pi(67 downto 66) <= (others => 'Z');
	
	qi(63 downto 0) <= Q;
	qi(64) <= Q(63);
	qi(65) <= qi(64);
	qi(67 downto 66) <= (others => 'Z');

		
	LSM64: for i in 0 to 16 generate
		LSM_4: entity work.LSM4(LSM4_LSM) port map
			(
			F => F(3 downto 0), P => pi(4 * i + 3 downto 4 * i),
			Q => qi(4 * i + 3 downto 4 * i), C0 => c(4 * i), 
			CI => c(4 * i + 4), D => di(4 * i + 3 downto 4 * i)
			);
	end generate;
	
	OR64_S_C: entity work.OR64_SC(OR64_BEH) port map
		(D => di(63 downto 0), Z => Z);
	
	SI <= di(65) and F(2);
	OVR <= di(64) xor di(65);
	D <= di(63 downto 0);
	
end LSM64_LSM;
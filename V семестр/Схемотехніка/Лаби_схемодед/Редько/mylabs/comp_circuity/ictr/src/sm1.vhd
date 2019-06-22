library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sm1 is
	port (
		Fi : in STD_LOGIC;
		Qi : in STD_LOGIC;
		q_i  : in STD_LOGIC;
		q_i_plus_1 : out STD_LOGIC;
		Si : out STD_LOGIC
	);
end sm1;


architecture Behavior of sm1 is
begin
	q_i_plus_1 <= ( (Qi and Fi) or (Qi and q_i) or (Fi and q_i) );
	Si <= ( (not Qi and not Fi and q_i) or (not Qi and Fi and not q_i) or 
		(Qi and not Fi and not q_i) or (Qi and Fi and q_i) );
end Behavior;
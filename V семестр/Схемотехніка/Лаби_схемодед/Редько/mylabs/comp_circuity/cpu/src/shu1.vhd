library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shu1 is port (
	Di : in STD_LOGIC;
	D_i_plus_1 : in STD_LOGIC;
	FSH : in STD_LOGIC;
	Qi : out STD_LOGIC
	);
end entity;

architecture Behavior of shu1 is	
begin
	Qi <= ( (Di and not FSH) or (D_i_plus_1 and FSH) );
end Behavior;
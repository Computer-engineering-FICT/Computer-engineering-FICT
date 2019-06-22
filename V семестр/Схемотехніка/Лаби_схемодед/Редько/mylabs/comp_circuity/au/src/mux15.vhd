library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux15 is port (
		A : in STD_LOGIC_VECTOR(14 downto 0);
		B : in STD_LOGIC_VECTOR(14 downto 0);
		sel : in STD_LOGIC;
		Y : out STD_LOGIC_VECTOR(14 downto 0)
	);
end entity;

architecture Behavior of mux15 is	
	
begin
	U_MUX: for i in 14 downto 0 generate
		Y(i) <= ( (sel and A(i)) or (not sel and B(i)) );
	end generate;
end Behavior;
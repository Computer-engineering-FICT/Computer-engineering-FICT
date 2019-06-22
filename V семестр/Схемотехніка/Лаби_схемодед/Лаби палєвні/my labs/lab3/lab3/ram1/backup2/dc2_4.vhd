library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dc2_4 is
	port (
		A : in STD_LOGIC_VECTOR(1 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
end dc2_4;

architecture Behavior of dc2_4 is
begin
	Y(3) <= not A(0) and not A(1);
	Y(2) <= not A(0) and A(1);
	Y(1) <= A(0) and not A(1);
	Y(0) <= A(0) and A(1);
	
end Behavior;
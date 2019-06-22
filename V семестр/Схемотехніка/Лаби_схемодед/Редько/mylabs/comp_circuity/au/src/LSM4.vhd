library IEEE;

use IEEE.STD_LOGIC_1164.all;

entity LSM4 is
	port
		(
		F : in STD_LOGIC_VECTOR(3 downto 0);
		P : in STD_LOGIC_VECTOR(3 downto 0);
		Q : in STD_LOGIC_VECTOR(3 downto 0);
		C0 : in STD_LOGIC;
		CI : out STD_LOGIC;
		D : out STD_LOGIC_VECTOR(3 downto 0)
		); 
end LSM4;

library IEEE;

use IEEE.STD_LOGIC_1164.all;

entity LSM64 is
	port
		(
		F : in STD_LOGIC_VECTOR(3 downto 0);
		P : in STD_LOGIC_VECTOR(63 downto 0);
		Q : in STD_LOGIC_VECTOR(63 downto 0);
		D : out STD_LOGIC_VECTOR(63 downto 0);
		OVR : out STD_LOGIC;
		Z : out STD_LOGIC;
		SI : out STD_LOGIC
		); 
end LSM64;
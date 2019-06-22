library IEEE;

use IEEE.STD_LOGIC_1164.all;

-- Описание обьекта PLM с 6 входами и 2 выходами

entity PLM_6_2 is
	generic ( td: TIME := 0 ns );	-- задержка
	port
	( 
		A : in STD_LOGIC;		-- входные переменные
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		F : in STD_LOGIC;
		Y0 : out STD_LOGIC;		-- результат
		Y1 : out STD_LOGIC
	);
end PLM_6_2;
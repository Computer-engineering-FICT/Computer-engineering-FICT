library IEEE;

use IEEE.STD_LOGIC_1164.all;

-- Описание обьекта PLM с 4 входами

entity PLM_4 is
	generic ( td: TIME := 0 ns );	-- задержка
	port
	( 
		A : in STD_LOGIC;		-- входные переменные
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		Y : out STD_LOGIC		-- результат
	);
end PLM_4;
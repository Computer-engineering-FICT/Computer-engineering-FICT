
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package RED_lib is

-- Описание обьекта PLM с 3 входами
entity PLM_3 is
	generic ( td: TIME := 0 ns );	-- задержка
	port
	( 
		A : in STD_LOGIC;		-- входные переменные
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		Y : out STD_LOGIC		-- результат
	);
end PLM_3;

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

	-- Описание обьекта PLM с 5 входами

entity PLM_5 is
	generic ( td: TIME := 0 ns );	-- задержка
	port
	( 
		A : in STD_LOGIC;		-- входные переменные
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		Y : out STD_LOGIC		-- результат
	);
end PLM_5;

-- Описание обьекта PLM с 6 входами
entity PLM_6 is
	generic ( td: TIME := 0 ns );	-- задержка
	port
	( 
		A : in STD_LOGIC;		-- входные переменные
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		F : in STD_LOGIC;
		Y : out STD_LOGIC		-- результат
	);
end PLM_6;

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

end RED_lib;


package body RED_lib is

end RED_lib; 
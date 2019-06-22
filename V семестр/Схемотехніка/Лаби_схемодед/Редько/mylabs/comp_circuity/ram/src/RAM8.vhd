
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RAM8 is
	port (
		CLK : in STD_LOGIC; 								-- синхровход 
		WR  : in STD_LOGIC;  							-- сигнал записи
		AP  : in STD_LOGIC_VECTOR(2 downto 0);		-- адрес канала P для чтения
		AQ  : in STD_LOGIC_VECTOR(2 downto 0);		-- адрес канала Q для записи
		AD  : in STD_LOGIC_VECTOR(2 downto 0);		-- адрес канала D для чтения
		P   : out STD_LOGIC_VECTOR(14 downto 0);	-- данное канала P
		Q   : in STD_LOGIC_VECTOR (14 downto 0);	-- данное канала Q
		D   : out STD_LOGIC_VECTOR(14 downto 0);	-- данное канала D
		OE  : in STD_LOGIC								-- сигнал выдачи прочитанного слова
		);
end RAM8;

architecture Behavior of RAM8 is
	type RAMARR is array(7 downto 0, 14 downto 0) of STD_LOGIC;
	signal y: RAMARR;
	signal ce: STD_LOGIC_VECTOR(7 downto 0);
	signal pp: STD_LOGIC_VECTOR(14 downto 0);
	signal dd: STD_LOGIC_VECTOR(14 downto 0);
	constant gnd: STD_LOGIC := '0';
	
	component MUX8 is port(D0, D1, D2, D3, D4, D5, D6, D7: in STD_LOGIC; -- входы
			A: in STD_LOGIC_VECTOR(2 downto 0); -- адрес
			Q: out STD_LOGIC); 					-- выход данного
	end component;
	
	component FDRE  is port(Q: out STD_LOGIC; -- триггер
			D : in STD_LOGIC;
			C : in STD_LOGIC;
			CE: in STD_LOGIC;
			R : in STD_LOGIC);
	end component;
	
	component TRI port (
		A_IN : in STD_LOGIC;
      OE: in STD_LOGIC;
      A_OUT: out STD_LOGIC
	);
	end component;

begin 
	-- дешифратор адреса 
	U_DC0: entity work.PLM_4(PLM4_DC0)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(0));
	U_DC1: entity work.PLM_4(PLM4_DC1)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(1));
	U_DC2: entity work.PLM_4(PLM4_DC2)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(2));
	U_DC3: entity work.PLM_4(PLM4_DC3)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(3));
	U_DC4: entity work.PLM_4(PLM4_DC4)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(4));
	U_DC5: entity work.PLM_4(PLM4_DC5)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(5));
	U_DC6: entity work.PLM_4(PLM4_DC6)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(6));
	U_DC7: entity work.PLM_4(PLM4_DC7)
		port map(D => WR, C => AQ(2), B => AQ(1), A => AQ(0), Y => ce(7));
	
	-- массив регистров
	U_FM: for i in 0 to 7 generate
		U_RG: for j in 0 to 14 generate 
			U_TT: FDRE port map(D => Q(j), 		-- входное данное
								C => CLK, 		-- синхросигнал
								CE => ce(i),	-- разрешение записи
								R => gnd,	 	-- сброс не используется
								Q => y(i,j)); 	-- выходы триггеров
		end generate;
	end generate;
	
	-- выходные мультиплексоры
	U_MUX: for i in 0 to 14 generate 
		MUXD: MUX8 port map(D0 => y(0,i), D1 => y(1,i), D2 => y(2,i), D3 => y(3,i), 
					D4 => y(4,i), D5 => y(5,i), D6 => y(6,i), D7 => y(7,i), 
					A => AD, -- адрес
					Q => dd(i)); -- адрес канала D
		MUXP: MUX8 port map(D0 => y(0,i), D1 => y(1,i), D2 => y(2,i), D3 => y(3,i), 
					D4 => y(4,i), D5 => y(5,i), D6 => y(6,i), D7 => y(7,i), 
					A => AP, -- адрес
					Q => pp(i)); -- выход канала P
		TRI_P: TRI port map(A_IN => pp(i), OE => OE, A_OUT => P(i));
		TRI_D: TRI port map(A_IN => dd(i), OE => OE, A_OUT => D(i));
	end generate;

end Behavior;
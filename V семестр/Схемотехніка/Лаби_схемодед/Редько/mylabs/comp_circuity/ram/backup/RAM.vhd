
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RAM is
	port (
		CLK : in STD_LOGIC; 								-- синхровход 
		WR  : in STD_LOGIC;  							-- сигнал записи
		AP  : in STD_LOGIC_VECTOR(13 downto 0);	-- адрес канала P для чтения
		AQ  : in STD_LOGIC_VECTOR(13 downto 0);	-- адрес канала Q для записи
		AD  : in STD_LOGIC_VECTOR(13 downto 0);	-- адрес канала D для чтения
		P   : out STD_LOGIC_VECTOR(14 downto 0);	-- данное канала P
		Q   : in STD_LOGIC_VECTOR (14 downto 0);	-- данное канала Q
		D   : out STD_LOGIC_VECTOR(14 downto 0);	-- данное канала D
		OE  : in STD_LOGIC								-- сигнал выдачи прочитанного слова
		);
end RAM;

architecture Behavior of RAM is

begin 
	RAMemory: entity work.RAM8 port map
		
end Behavior;
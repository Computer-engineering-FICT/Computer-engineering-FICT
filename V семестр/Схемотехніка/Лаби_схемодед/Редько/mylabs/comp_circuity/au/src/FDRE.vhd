
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FDRE is				-- �������
	port (
		Q: out STD_LOGIC;	-- ������ ��������
		C : in STD_LOGIC;	-- ������������
		D : in STD_LOGIC;	-- ������� ������
		CE: in STD_LOGIC;	-- ���������� ������
		R : in STD_LOGIC);	-- �����
end FDRE;


architecture FDRE_BEH of FDRE is
begin
	
	process(C, R)
	begin
		if R = '1' then 
			Q <= '0'; 
		elsif C = '1' and C'event then 
			if CE = '1' then
				Q <= D; 
			end if; 
		end if; 
	end process;
	
end FDRE_BEH;

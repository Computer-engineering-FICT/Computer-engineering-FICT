library IEEE;

use IEEE.STD_LOGIC_1164.all;

-- �������� ������� PLM � 6 �������

entity PLM_6 is
	generic ( td: TIME := 0 ns );	-- ��������
	port
	( 
		A : in STD_LOGIC;		-- ������� ����������
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		F : in STD_LOGIC;
		Y : out STD_LOGIC		-- ���������
	);
end PLM_6;
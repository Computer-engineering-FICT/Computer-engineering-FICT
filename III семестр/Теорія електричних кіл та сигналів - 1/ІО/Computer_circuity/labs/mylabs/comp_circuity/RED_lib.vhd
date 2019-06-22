
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package RED_lib is

-- �������� ������� PLM � 3 �������
entity PLM_3 is
	generic ( td: TIME := 0 ns );	-- ��������
	port
	( 
		A : in STD_LOGIC;		-- ������� ����������
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		Y : out STD_LOGIC		-- ���������
	);
end PLM_3;

-- �������� ������� PLM � 4 �������
entity PLM_4 is
	generic ( td: TIME := 0 ns );	-- ��������
	port
	( 
		A : in STD_LOGIC;		-- ������� ����������
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		Y : out STD_LOGIC		-- ���������
	);
end PLM_4;

	-- �������� ������� PLM � 5 �������

entity PLM_5 is
	generic ( td: TIME := 0 ns );	-- ��������
	port
	( 
		A : in STD_LOGIC;		-- ������� ����������
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		Y : out STD_LOGIC		-- ���������
	);
end PLM_5;

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

-- �������� ������� PLM � 6 ������� � 2 ��������
entity PLM_6_2 is
	generic ( td: TIME := 0 ns );	-- ��������
	port
	( 
		A : in STD_LOGIC;		-- ������� ����������
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		E : in STD_LOGIC;
		F : in STD_LOGIC;
		Y0 : out STD_LOGIC;		-- ���������
		Y1 : out STD_LOGIC
	);
end PLM_6_2;

end RED_lib;


package body RED_lib is

end RED_lib; 
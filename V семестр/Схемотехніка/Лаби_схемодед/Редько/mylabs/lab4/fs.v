entity PLM_4 is
generic( 
	td:time:=1 ns);   -- ��������
	A : in BIT;             -- ������� ����������
	B : in BIT; 
	C : in BIT; 
	D : in BIT; 
	Y : out BIT); -- ���������
end PLM_4;

architecture PLM_DC0 of PLM_4 is  
begin     
	Y<=(D and not C and not B and not A) after td;
end PLM_DC0; 
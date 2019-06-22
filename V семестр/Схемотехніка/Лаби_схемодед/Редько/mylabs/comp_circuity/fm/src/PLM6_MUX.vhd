
architecture PLM6_MUX of PLM_6 is
begin
	
	Y <= (C and not B and not A)	-- 0-� ����
	or(D and not B and A)			-- 1-� ����
	or(E and B and not A)			-- 2-� ����
	or(F and B and A)				-- 3-� ����
	after td;						-- �������� ��������
	
end PLM6_MUX;
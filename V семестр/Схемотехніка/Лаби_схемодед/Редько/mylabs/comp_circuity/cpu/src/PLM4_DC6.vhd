

architecture PLM4_DC6 of PLM_4 is
begin
	
	Y <= (D and C and B and not A) after td;
	
end PLM4_DC6;
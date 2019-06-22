

architecture PLM4_DC4 of PLM_4 is
begin
	
	Y <= (D and C and not B and not A) after td;
	
end PLM4_DC4;
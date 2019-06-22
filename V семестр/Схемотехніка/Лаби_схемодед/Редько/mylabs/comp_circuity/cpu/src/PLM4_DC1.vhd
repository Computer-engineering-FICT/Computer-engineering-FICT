

architecture PLM4_DC1 of PLM_4 is
begin
	
	Y <= (D and not C and not B and A) after td;
	
end PLM4_DC1;
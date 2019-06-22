

architecture PLM4_DC3 of PLM_4 is
begin
	
	Y <= (D and not C and B and A) after td;
	
end PLM4_DC3;
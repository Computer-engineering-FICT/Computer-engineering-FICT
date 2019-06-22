

architecture PLM4_DC5 of PLM_4 is
begin
	
	Y <= (D and C and not B and A) after td;
	
end PLM4_DC5;

architecture PLM4_DC0 of PLM_4 is
begin
	
	Y <= (D and not C and not B and not A) after td;
	
end PLM4_DC0;
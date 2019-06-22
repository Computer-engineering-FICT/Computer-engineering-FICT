
architecture PLM3_MUX of PLM_3 is
begin
	
	Y <= (B and not A) or (C and A) after td;
	
end PLM3_MUX;
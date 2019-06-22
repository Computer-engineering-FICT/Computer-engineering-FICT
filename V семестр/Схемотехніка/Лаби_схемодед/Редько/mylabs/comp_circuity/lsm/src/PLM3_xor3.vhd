					
architecture PLM3_xor3 of PLM_3 is
begin
	--  Ci Yi Xi
	--  C  B  A 
	Y <= ((C and A and B) or (not C and A and not B) or (C and not A and not B) or (not C and not A and B))
		after td; -- задержка элемента
end PLM3_xor3;
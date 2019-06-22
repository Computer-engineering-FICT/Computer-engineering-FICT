					
architecture PLM4_Ci of PLM_4 is
begin
	-- F2 Ci Yi Xi
	-- D  C  B  A
	Y <= ( D and ((A and B) or (A and C) or (B and C)) )  after td;
end PLM4_Ci;
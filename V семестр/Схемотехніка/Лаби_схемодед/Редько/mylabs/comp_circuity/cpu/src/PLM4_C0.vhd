					
architecture PLM4_C0 of PLM_4 is
begin
	-- F3 F2 F1 F0
	-- D  C  B  A 
	Y <= 
	(
	  (not D and ((C and B and not A) or (C and not B and A)))
	)  after td; -- задержка элемента
end PLM4_C0;
					
architecture PLM5_Y of PLM_5 is
begin
	-- F3 F2 F1 F0 Q
	-- E  D  C  B  A
	Y <= 
	(
	(A and not B and not C and D and not E) or
	(not A and B and not C and D and not E) or
	(A and not B and not C and not D and E)
	)  after td; -- задержка элемента
end PLM5_Y;

architecture PLM6_X of PLM_6 is
begin
	-- F3 F2 F1 F0 Q  P
	-- F  E  D  C  B  A
	Y <= 
	(
	(not A and not B and not D and not E and not F) or
	(not B and C and not E and not F) or
	(not A and B and not C and D and not E and not F) or
	(not A and C and not D and not E and not F) or
	(A and not C and not D and not E and F) or
	(A and not C and E and not F) or
	(A and B and not D and not E and F) or
	(A and not D and E and not F) or
	(A and C and D and not E and not F)
	)  after td; -- задержка элемента
end PLM6_X;
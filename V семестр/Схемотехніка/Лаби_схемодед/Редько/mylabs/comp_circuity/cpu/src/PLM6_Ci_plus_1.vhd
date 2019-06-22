
architecture PLM6_Ci_plus_1 of PLM_6 is
begin
	-- F2 Ci Yi-1 Xi-1 Yi Xi
	-- F  E   D    C   B  A
	Y <= 
	(
	(F and A and B) or
	(F and A and C and D) or
	(F and A and C and E) or
	(F and A and D and E) or
	(F and B and C and E) or
	(F and B and C and E) or
	(F and B and D and E)
	)  after td; -- задержка элемента
end PLM6_Ci_plus_1;
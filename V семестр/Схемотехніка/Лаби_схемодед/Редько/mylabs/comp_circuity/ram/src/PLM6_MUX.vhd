
architecture PLM6_MUX of PLM_6 is
begin
	
	Y <= (C and not B and not A)	-- 0-й вход
	or(D and not B and A)			-- 1-й вход
	or(E and B and not A)			-- 2-й вход
	or(F and B and A)				-- 3-й вход
	after td;						-- задержка элемента
	
end PLM6_MUX;
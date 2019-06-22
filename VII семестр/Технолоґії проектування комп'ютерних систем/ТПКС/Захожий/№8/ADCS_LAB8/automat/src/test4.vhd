entity automat is
	port (Q3, Q2, Q1, X2, X1: in BIT; Y1, Y2, Y3, D3, D2, D1: out BIT);
end automat;
architecture functions of automat is
begin
	Y1 <= ((not Q3) and Q2 and Q2);
	Y2 <= (not((not((not Q3) and (not Q2) and (not Q1))) and (not((not Q3) and Q2 and Q1)) and (not((not Q3) and Q2 and Q1))));
	Y3 <= ((not Q3) and (not Q2) and Q1);
	D3 <= (not((not((not Q2) and (not Q1) and (not X2))) and (not(Q2 and Q1 and (not X2))) and (not(Q2 and Q1 and (not X2)))));
	D2 <= (not((not(Q3 and Q2 and Q2)) and (not(((not Q3) and Q1 and (not X1)) and ((not X2) and (not X2) and (not X2)) and ((not X2) and (not X2) and (not X2)))) and (not((not Q1) and (not X1) and (not X1)))));
	D1 <= ((not Q3) and (not X1) and X2);
end functions;
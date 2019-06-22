entity automat is
	port (Q2, Q1, X1: in BIT; Y1, Y2, D2, D1: out BIT);
end automat;
architecture functions of automat is
begin
	Y1 <= ((not Q2) and Q1 and Q1);
	Y2 <= (Q2 and Q1 and Q1);
	D2 <= ((not Q2) and Q1 and X1);
	D1 <= (not((not(Q2 and Q1 and Q1)) and (not((not Q2) and X1 and X1)) and (not((not Q2) and X1 and X1))));
end functions;
entity automat is
	port (Q3, Q2, Q1, X1: in BIT; Y1, Y2, Y3, D3, D2, D1: out BIT);
end automat;
architecture functions of automat is
begin
	Y1 <= ((not Q3) and (not Q2) and (not Q1));
	Y2 <= ((not Q3) and (not Q2) and (not Q2));
	Y3 <= ((not Q3) and Q2 and (not Q1));
	D3 <= (Q2 and (not Q1) and (not Q1));
	D2 <= ((not Q3) and (not Q1) and X1);
	D1 <= (((not Q3) and (not Q2) and (not Q1)) and ((not X1) and (not X1) and (not X1)) and ((not X1) and (not X1) and (not X1)));
end functions;
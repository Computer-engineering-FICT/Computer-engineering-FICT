entity automat is
	port (Q4, Q3, Q2, Q1, X1, X3, X2: in BIT; Y1, Y2, Y3, Y4, D4, D3, D2, D1: out BIT);
end automat;
architecture functions of automat is
begin
	Y1 <= (((not Q4) and (not Q3) and (not Q2)) and (Q1 and Q1 and Q1) and (Q1 and Q1 and Q1));
	Y2 <= (((not Q4) and (not Q3) and Q2) and ((not Q1) and (not Q1) and (not Q1)) and ((not Q1) and (not Q1) and (not Q1)));
	Y3 <= (((not Q4) and Q3 and (not Q2)) and ((not Q1) and (not Q1) and (not Q1)) and ((not Q1) and (not Q1) and (not Q1)));
	Y4 <= ((Q4 and (not Q3) and (not Q2)) and ((not Q1) and (not Q1) and (not Q1)) and ((not Q1) and (not Q1) and (not Q1)));
	D4 <= (((not Q4) and (not Q3) and (not Q2)) and ((not Q1) and (not X1) and (not X3)) and ((not Q1) and (not X1) and (not X3)));
	D3 <= (((not Q4) and (not Q3) and (not Q2)) and ((not Q1) and (not X1) and X3) and ((not Q1) and (not X1) and X3));
	D2 <= (((not Q4) and (not Q3) and (not Q2)) and ((not Q1) and X1 and (not X2)) and ((not Q1) and X1 and (not X2)));
	D1 <= (((not Q4) and (not Q3) and (not Q2)) and ((not Q1) and X1 and X2) and ((not Q1) and X1 and X2));
end functions;
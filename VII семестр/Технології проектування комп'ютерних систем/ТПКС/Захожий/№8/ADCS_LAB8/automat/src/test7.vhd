entity automat is
	port (Q1, Q2: in BIT; Y1, Y2, D2, D1: out BIT);
end automat;
architecture functions of automat is
begin
	Y1 <= (Q1);
	Y2 <= (Q2 and Q1 and Q1);
	D2 <= (Q1);
	D1 <= ((not Q2));
end functions;
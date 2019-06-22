entity AND3 is
	port(
		IN1 : in bit;
		IN2 : in bit;
		IN3 : in bit;
		OUT1 : out bit
	);
end AND3;

architecture BEH of AND3 is
begin
	OUT1 <= IN1 and IN2 and IN3;
end BEH;

entity OR3 is
	port(
		IN1 : in bit;
		IN2 : in bit;
		IN3 : in bit;
		OUT1 : out bit
	);
end OR3;

architecture BEH of OR3 is
begin
	OUT1 <= IN1 or IN2 or IN3;
end BEH;

entity JK is
	port(
		J : in bit;
		K : in bit;
		CLK : in bit;
		Q : inout bit
	);
end JK;

architecture BEH of JK is
begin
	process (CLK)
	begin
		if (CLK'event and CLK = '1') then
			if (J = '0' and K = '0') then Q <= Q;
			elsif (J = '1' and K = '0') then Q <= '1';
			elsif (J = '0' and K = '1') then Q <= '0';
			elsif (J = '1' and K = '1') then Q <= not(Q);
			end if;
		end if;
	end process;
end BEH;

entity J2 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		J2 : out bit
	);
end J2;

architecture BEH of J2 is
signal notQ1, S1 : bit;
begin
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ1, Q0, Q0, S1);
	L2: entity OR3(BEH) port map (S1, S1, S1, J2);
end BEH;

entity K2 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		K2 : out bit
	);
end K2;

architecture BEH of K2 is
signal notQ0, notX2, S1, S2, S3, S4 : bit;
begin
	notQ0 <= not Q0;
	notX2 <= not X2;
	L1: entity AND3(BEH) port map (Q2, Q1, notQ0, S1);
	L2: entity AND3(BEH) port map (Q2, Q1, Q0, S2);
	L3: entity AND3(BEH) port map (notX2, notX2, notX2, S3);
	L4: entity AND3(BEH) port map (S2, S3, S3, S4);
	L5: entity OR3(BEH) port map (S1, S4, S4, K2);
end BEH;

entity J1 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		J1 : out bit
	);
end J1;

architecture BEH of J1 is
signal notQ2, notQ1, S1, S2, S3, S4 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (Q2, Q0, Q0, S1);
	L2: entity AND3(BEH) port map (notQ2, notQ1, Q0, S2);
	L3: entity AND3(BEH) port map (X1, X1, X1, S3);
	L4: entity AND3(BEH) port map (S2, S3, S3, S4);
	L5: entity OR3(BEH) port map (S1, S4, S4, J1);
end BEH;

entity K1 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		K1 : out bit
	);
end K1;

architecture BEH of K1 is
signal notQ2, notQ0, S1, S2, S3, S4 : bit;
begin
	notQ2 <= not Q2;
	notQ0 <= not Q0;
	L1: entity AND3(BEH) port map (notQ2, Q0, Q0, S1);
	L2: entity AND3(BEH) port map (notQ2, Q1, notQ0, S2);
	L3: entity AND3(BEH) port map (X1, X2, X2, S3);
	L4: entity AND3(BEH) port map (S2, S3, S3, S4);
	L5: entity OR3(BEH) port map (S1, S4, S4, K1);
end BEH;

entity J0 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		J0 : out bit
	);
end J0;

architecture BEH of J0 is
signal notQ2, notQ1, S1, S2 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, notQ1, S1);
	L2: entity AND3(BEH) port map (Q2, Q1, Q1, S2);
	L3: entity OR3(BEH) port map (S1, S2, S2, J0);
end BEH;

entity K0 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		K0 : out bit
	);
end K0;

architecture BEH of K0 is
signal S1 : bit;
begin
	L1: entity AND3(BEH) port map (Q2, Q1, Q1, S1);
	L2: entity OR3(BEH) port map (S1, S1, S1, K0);
end BEH;

entity Q2 is
	port(
		J2 : in bit;
		K2 : in bit;
		CLK : in bit;
		Q2 : inout bit
	);
end Q2;

architecture BEH of Q2 is
begin
	L1: entity JK(BEH) port map(J2, K2, CLK, Q2);
end BEH;

entity Q1 is
	port(
		J1 : in bit;
		K1 : in bit;
		CLK : in bit;
		Q1 : inout bit
	);
end Q1;

architecture BEH of Q1 is
begin
	L1: entity JK(BEH) port map(J1, K1, CLK, Q1);
end BEH;

entity Q0 is
	port(
		J0 : in bit;
		K0 : in bit;
		CLK : in bit;
		Q0 : inout bit
	);
end Q0;

architecture BEH of Q0 is
begin
	L1: entity JK(BEH) port map(J0, K0, CLK, Q0);
end BEH;

entity Y1 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y1 : out bit
	);
end Y1;

architecture BEH of Y1 is
signal notQ2, notQ1, S1, S2, S3 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, Q0, S1);
	L2: entity AND3(BEH) port map (X1, X1, X1, S2);
	L3: entity AND3(BEH) port map (S1, S2, S2, S3);
	L4: entity OR3(BEH) port map (S3, S3, S3, Y1);
end BEH;

entity Y3 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y3 : out bit
	);
end Y3;

architecture BEH of Y3 is
signal notQ2, notQ1, S1, S2 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, Q0, S1);
	L2: entity AND3(BEH) port map (Q2, Q1, Q0, S2);
	L3: entity OR3(BEH) port map (S1, S2, S2, Y3);
end BEH;

entity Y5 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y5 : out bit
	);
end Y5;

architecture BEH of Y5 is
signal S1 : bit;
begin
	L1: entity AND3(BEH) port map (Q2, Q1, Q0, S1);
	L2: entity OR3(BEH) port map (S1, S1, S1, Y5);
end BEH;

entity Y7 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y7 : out bit
	);
end Y7;

architecture BEH of Y7 is
signal notQ2, notQ1, S1, S2, S3 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, Q0, S1);
	L2: entity AND3(BEH) port map (X1, X1, X1, S2);
	L3: entity AND3(BEH) port map (S1, S2, S2, S3);
	L4: entity OR3(BEH) port map (S3, S3, S3, Y7);
end BEH;

entity Y8 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y8 : out bit
	);
end Y8;

architecture BEH of Y8 is
signal notQ2, notQ1, S1, S2 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, Q0, S1);
	L2: entity AND3(BEH) port map (Q2, Q1, Q0, S2);
	L3: entity OR3(BEH) port map (S1, S2, S2, Y8);
end BEH;

entity Y9 is
	port(
		Q2 : in bit;
		Q1 : in bit;
		Q0 : in bit;
		X1 : in bit;
		X2 : in bit;
		Y9 : out bit
	);
end Y9;

architecture BEH of Y9 is
signal notQ2, notQ1, S1 : bit;
begin
	notQ2 <= not Q2;
	notQ1 <= not Q1;
	L1: entity AND3(BEH) port map (notQ2, notQ1, Q0, S1);
	L2: entity OR3(BEH) port map (S1, S1, S1, Y9);
end BEH;

entity UPPER is
	port(
		CLK : in bit;
		Q2 : inout bit;
		Q1 : inout bit;
		Q0 : inout bit;
		X1 : in bit;
		X2 : in bit;
		Y1 : out bit;
		Y3 : out bit;
		Y5 : out bit;
		Y7 : out bit;
		Y8 : out bit;
		Y9 : out bit
	);
end UPPER;

architecture BEH of UPPER is
signal J2, K2, SQ2, J1, K1, SQ1, J0, K0, SQ0 : bit;
begin
	SQ2 <= Q2;
	SQ1 <= Q1;
	SQ0 <= Q0;

	L1: entity Y1(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y1);
	L2: entity Y3(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y3);
	L3: entity Y5(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y5);
	L4: entity Y7(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y7);
	L5: entity Y8(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y8);
	L6: entity Y9(BEH) port map (SQ2, SQ1, SQ0, X1, X2, Y9);

	L7: entity J2(BEH) port map (SQ2, SQ1, SQ0, X1, X2, J2);
	L8: entity K2(BEH) port map (SQ2, SQ1, SQ0, X1, X2, K2);
	L9: entity J1(BEH) port map (SQ2, SQ1, SQ0, X1, X2, J1);
	L10: entity K1(BEH) port map (SQ2, SQ1, SQ0, X1, X2, K1);
	L11: entity J0(BEH) port map (SQ2, SQ1, SQ0, X1, X2, J0);
	L12: entity K0(BEH) port map (SQ2, SQ1, SQ0, X1, X2, K0);

	L13: entity Q2(BEH) port map (J2, K2, CLK, Q2);
	L14: entity Q1(BEH) port map (J1, K1, CLK, Q1);
	L15: entity Q0(BEH) port map (J0, K0, CLK, Q0);
end BEH;


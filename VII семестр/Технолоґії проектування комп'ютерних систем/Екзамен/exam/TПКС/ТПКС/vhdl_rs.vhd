
entity MyEntity is
	port (
		Q3 : in bit; 
		Q2 : in bit; 
		Q1 : in bit; 
		X1 : in bit; 

		Y1 : out bit; 
		Y2 : out bit; 
		Y3 : out bit; 
		Y4 : out bit; 
		R3 : out bit; 
		R2 : out bit; 
		R1 : out bit;
		S3 : out bit; 
		S2 : out bit; 
		S1 : out bit
	);
end entity MyEntity;

architecture MyArchitecture of MyEntity is
	signal S_0,S_1,S_2,S_3 : bit;
begin
	-- Y1
	P_0: process(Q3,Q2,Q1)
	begin
		Y1 <=  not Q3 and not Q2 and Q1;
	end process P_0;

	-- Y2
	P_1: process(Q3,Q2,Q1)
	begin
		Y2 <= not Q3 and Q2 and Q1;
	end process P_1;

	-- Y3
	P_2: process(Q3,Q2,Q1)
	begin
		Y3 <= Q3 and not Q2 and Q1;
	end process P_2;

	-- Y4
	P_3: process(Q3,Q2,Q1)
	begin
		Y4 <=  not Q3 and Q2 and not Q1;
	end process P_3;

	-- R1
	P_4: process(Q3,Q2,Q1)
	begin
		R1 <=  Q3 and Q2 and not Q1;
	end process P_4;

	-- R2
	P_5: process(Q3,Q2,Q1)
	begin
		R2 <=  not Q3 and Q2 and not Q1;
	end process P_5;

	-- R3
	P_6: process(Q3,Q2,Q1)
	begin
		S_0 <= not Q2 and Q2 and Q1;
	end process P_6;

	P_7: process(Q3,Q2,Q1)
	begin
		S_1 <=  Q3 and not Q2 and Q1;
	end process P_7;

	P_8: process(S_0,S_1)
	begin
		R3 <=  S_0 or S_1;
	end process P_8;

	-- S1
	P_9: process(Q3,Q2,Q1,X1)
	begin
		S1 <=  not Q3 and not Q2 and Q1 and X1;
	end process P_9;

	-- S2
	P_10: process(Q3,Q2,Q1,X1)
	begin
		S_2 <= not Q3 and not Q2 and Q1 and not X1;
	end process P_10;

	P_11: process(Q3,Q2,Q1)
	begin
		S_3 <= Q3 and not Q2 and not Q1;
	end process P_11;

	P_12: process(S_3,S_2)
	begin
		S2 <= S_3 or S_2;
	end process P_12;

	-- S3
	P_13: process(Q3,Q2,Q1)
	begin
		S3 <=  not Q3 and not Q2 and not Q1;
	end process P_13;

end architecture MyArchitecture;

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
		J3 : out bit; 
		J2 : out bit; 
		J1 : out bit; 
		K3 : out bit; 
		K2 : out bit; 
		K1 : out bit
	);
end entity MyEntity;

architecture MyArchitecture of MyEntity is
	signal S_0,S_1,S_2,S_3,S_4,S_5,S_6 : bit;
begin
	-- Y1
	P_0: process(Q3,Q2,Q1)
	begin
		Y1 <=  not Q3 and not Q2 and not Q1;
	end process P_0;

	-- Y2
	P_1: process(Q3,Q2,Q1,X1)
	begin
		Y2 <= not Q3 and not Q2 and Q1 and not X1;
	end process P_1;

	-- Y3
	P_2: process(Q3,Q2,Q1)
	begin
		Y3 <= not Q3 and not Q2 and Q1 and X1;
	end process P_2;

	-- Y4
	P_3: process(Q3,Q2,Q1)
	begin
		Y4 <=  not Q3 and Q2 and Q1;
	end process P_3;

	-- J1
	P_4: process(Y3)
	begin
		J1 <= Y3;
	end process P_4;

	-- J2
	P_5: process(Q3,Q2,Q1,X1)
	begin
		S_1 <=  not Q3 and not Q2 and Q1 and not X1;
	end process P_5;

	P_6: process(Q3,Q2,Q1)
	begin
		S_2 <=  Q3 and not Q2 and not Q1;
	end process P_6;

	P_7: process(S_1,S_2)
	begin
		J2 <= S_1 or S_2;
	end process P_7;

	-- J3
	P_8: process(Q3,Q2,Q1)
	begin
		S_3 <=  not Q3 and not Q2 and not Q1;
	end process P_8;

	P_9: process(Q3,Q2,Q1)
	begin
		S_4 <=  Q3 and Q2 and not Q1;
	end process P_9;

	P_10: process(S_3,S_4)
	begin
		J3 <= S_3 or S_4;
	end process P_10;

	-- K1
	P_11: process(Q3,Q2,Q1)
	begin
		K1 <=  Q3 and Q2 and Q1;
	end process P_11;

	-- K2
	P_12: process(Q3,Q2,Q1)
	begin
		K2 <=  not Q3 and Q2 and not Q1;
	end process P_12;

	-- K3
	P_13: process(Q3,Q2,Q1)
	begin
		S_5 <=  not Q3 and Q2 and Q1;
	end process P_13;

	P_14: process(Q3,Q2,Q1)
	begin
		S_6 <=  Q3 and not Q2 and Q1;
	end process P_14;

	P_15: process(S_5,S_6)
	begin
		K3 <= S_5 or S_6;
	end process P_15;

end architecture MyArchitecture;
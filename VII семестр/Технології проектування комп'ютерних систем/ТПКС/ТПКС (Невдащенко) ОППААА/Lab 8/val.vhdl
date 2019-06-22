library ieee; use ieee.std_logic_1164.all;
entity automat is
port(
	Q3  : in STD_LOGIC;
	Q2  : in STD_LOGIC;
	Q1  : in STD_LOGIC;
	x1  : in STD_LOGIC;
	x2  : in STD_LOGIC;
	Y1  : out STD_LOGIC;
	Y2  : out STD_LOGIC;
	Y3  : out STD_LOGIC;
	Y4  : out STD_LOGIC;
	T1  : out STD_LOGIC;
	T2  : out STD_LOGIC;
	T3  : out STD_LOGIC
);
end automat;
architecture functions of automat is
begin
	Y1 <= not(not( (not Q3 ) and (not Q2 ) and Q1) );
	Y2 <= not(not( (not Q3 ) and Q2 and Q1) );
	Y3 <= not(not( (not Q3 ) and Q2 and (not Q1 )) );
	Y4 <= not(not(  Q3 and (not Q2 ) and (not Q1 )) );
	T1 <= not (not ( not(not( (not Q3 ) and Q2 and Q1 and x2) ) ) and not (  Q3 and (not Q2 ) and (not Q1 ) ) );
	T2 <= not (not ( not(not( not(not( (not Q3 ) and (not Q2 ) and Q1 and (not x1 )) ) and ) ) ) and not (  Q3 and Q2 and Q1 ) and not ( (not Q3 ) and Q2 and (not Q1 ) ) ;
	T3 <= not (not ( not(not( (not Q3 ) and Q2 and Q1 and (not x2 )) ) ) and not ( (not Q3 ) and (not Q2 ) and (not Q1 ) ) and not (  Q3 and (not Q2 ) and Q1 ) );
end functions;

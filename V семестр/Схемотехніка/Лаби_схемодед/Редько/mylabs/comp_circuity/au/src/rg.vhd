library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rg is port (
		D : in STD_LOGIC_VECTOR(14 downto 0);
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(14 downto 0)
	);
end entity;

architecture Behavior of rg is	
	
	component FDRE is port (
		Q: out STD_LOGIC;	-- ������ ��������
		C : in STD_LOGIC;	-- ������������
		D : in STD_LOGIC;	-- ������� ������
		CE: in STD_LOGIC;	-- ���������� ������
		R : in STD_LOGIC);	-- �����
	end component;
	
	constant gnd : STD_LOGIC := '0';
begin
	AC: for i in 14 downto 0 generate
		REG: FDRE port map
			( Q => Q(i), C => CLK, D => D(i), CE => CE, R => gnd );
	end generate;
end Behavior;
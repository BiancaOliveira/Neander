library ieee;
use ieee.std_logic_1164.all;

entity add_8 is
	port(
		A, B : in  std_logic_vector(7 downto 0);
		S    : out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of add_8 is
	
	component add_1 is
		port(
			A, B, Cin : in  std_logic;	
			S, Cout   : out std_logic
		);
	end component;

	signal sC : std_logic_vector(7 downto 0);
begin

	u0 : add_1 port map(A(0), B(0), '0', S(0), sC(0));
	u1 : add_1 port map(A(1), B(1), sC(0), S(1), sC(1));
	u2 : add_1 port map(A(2), B(2), sC(1), S(2), sC(2));
	u3 : add_1 port map(A(3), B(3), sC(2), S(3), sC(3));
	u4 : add_1 port map(A(4), B(4), sC(3), S(4), sC(4));
	u5 : add_1 port map(A(5), B(5), sC(4), S(5), sC(5));
	u6 : add_1 port map(A(6), B(6), sC(5), S(6), sC(6));
	u7 : add_1 port map(A(7), B(7), sC(6), S(7), sC(7));
	
end architecture;

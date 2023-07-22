library ieee;
use ieee.std_logic_1164.all;

entity 	DECODE is
	port(

		Inst : in std_logic_vector(7 downto 0);
		S    : out std_logic_vector(10 downto 0)
		--snop,ssta, slda, sadd, sor, sand, snot, sjmp, sjn, sjz, shlt
	);
end entity;

architecture behavior of DECODE is
begin
	S(10) <= (not(Inst(7)) and not(Inst(6)) and not(Inst(5)) and not(Inst(4)));
	S(9)  <= (not(Inst(7)) and not(Inst(6)) and not(Inst(5)) and Inst(4));
	S(8)  <= (not(Inst(7)) and not(Inst(6)) and Inst(5) and not(Inst(4)));
	S(7)  <= (not(Inst(7)) and not(Inst(6)) and Inst(5) and Inst(4));
	S(6)  <= (not(Inst(7)) and Inst(6) and not(Inst(5)) and not(Inst(4)));
	S(5)  <= (not(Inst(7)) and Inst(6) and not(Inst(5)) and Inst(4));
	S(4)  <= (not(Inst(7)) and Inst(6) and Inst(5) and not(Inst(4)));
	S(3)  <= (Inst(7) and not(Inst(6)) and not(Inst(5)) and not(Inst(4)));
	S(2)  <= (Inst(7) and not(Inst(6)) and not(Inst(5)) and Inst(4));
	S(1)  <= (Inst(7) and not(Inst(6)) and Inst(5) and not(Inst(4)));
	S(0)  <= (Inst(7) and Inst(6) and Inst(5) and Inst(4));
	
end architecture;

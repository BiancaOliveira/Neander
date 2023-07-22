library ieee;
use ieee.std_logic_1164.all;

entity mux_2x8 is
    	port(
        	E0, E1 : in  std_logic_vector(7 downto 0);
        	Sel    : in std_logic; 
        	S      : out std_logic_vector(7 downto 0)
    	);
end entity;

architecture behavior of mux_2x8 is

	component mux_2x1 is
        	port (
            		E0, E1, Sel : in  std_logic;
        		S           : out std_logic
        	);
	end component;
begin

	u0 : mux_2x1 port map(E0(0), E1(0), Sel, S(0));
    	u1 : mux_2x1 port map(E0(1), E1(1), Sel, S(1));
    	u2 : mux_2x1 port map(E0(2), E1(2), Sel, S(2));
    	u3 : mux_2x1 port map(E0(3), E1(3), Sel, S(3));
    	u4 : mux_2x1 port map(E0(4), E1(4), Sel, S(4));
    	u5 : mux_2x1 port map(E0(5), E1(5), Sel, S(5));
    	u6 : mux_2x1 port map(E0(6), E1(6), Sel, S(6));
    	u7 : mux_2x1 port map(E0(7), E1(7), Sel, S(7));
    	
end architecture;

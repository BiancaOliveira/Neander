library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port (
		clk : in  std_logic;
		cl  : in  std_logic;
		S   : out std_logic_vector(2 downto 0)
	); 	
end entity;

architecture behavior of contador is
	
	component ffjk is
	     	port(
		       	j, k   : in std_logic;
			clk    : in std_logic;
		       	pr, cl : in std_logic;
			q, nq  : out std_logic
	    	);
	end component;
	
	component ctrl is
		port (
			Q : in std_logic_vector(2 downto 0);
			J : out std_logic_vector(2 downto 0);
			K : out std_logic_vector(2 downto 0)
		); 	
	end component;
    	
    	signal sJ, sK :  std_logic_vector(2 downto 0);
    	signal sQ, snQ:  std_logic_vector(2 downto 0);
begin

    	u1 : ffjk port map(sJ(2),sK(2), clk, '1', cl, sQ(2), snQ(2));
    	u2 : ffjk port map(sJ(1),sK(1), clk, '1', cl, sQ(1), snQ(1));
    	u3 : ffjk port map(sJ(0),sK(0), clk, '1', cl, sQ(0), snQ(0));
    	u0 : ctrl port map(sQ, sJ, sK);
    	S <= sQ;
    	
end architecture;

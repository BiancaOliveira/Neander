library ieee;
use ieee.std_logic_1164.all;

entity ff_tipo_d is
	port (
		D, clk : in  std_logic;
		pr, cl : in  std_logic;
		Q, nQ  : out std_logic
	); 	
end entity;

architecture behavior of ff_tipo_d is
	
	component ffjk is
	     	port(
	       	j, k   : in std_logic;
		clk    : in std_logic;
	       	pr, cl : in std_logic;
		q, nq  : out std_logic
	    );
	end component;
    	
    	signal notD : std_logic;
begin

    	notD <= not D;
    	u0 : ffjk port map(D, notD, clk, pr, cl, Q, nQ);
    	
end architecture;

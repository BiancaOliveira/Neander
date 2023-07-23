library ieee;
use ieee.std_logic_1164.all;

entity registrador_1 is
    	port(
        	D0, RW, clk, pr, cl : in  std_logic;
        	S                   : out std_logic    
    	);
end entity;

architecture behavior of registrador_1 is
	
	component mux_2x1 is
		port (
			E0, E1, Sel : in  std_logic;
			S           : out std_logic
		);
	end component;
	
	component ff_tipo_d is
		port (
			D, clk : in  std_logic;
			pr, cl : in  std_logic;
			Q, nQ  : out std_logic
		); 
	end component;

	signal sMux, sQ, snQ : std_logic;
begin

    	umux : mux_2x1  port map(sQ, D0, RW, sMux);
    	uffd : ff_tipo_d port map(sMux, clk, pr, cl, sQ, snQ);
    	S <= sQ;

end architecture;

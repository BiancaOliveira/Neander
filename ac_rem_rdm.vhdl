library ieee;
use ieee.std_logic_1164.all;

entity registrador_8 is
	port(
        	D           : in std_logic_vector(7 downto 0);
		RW, clk, cl : in  std_logic;
        	S           : out std_logic_vector(7 downto 0)    
    	);
end entity;

architecture behavior of registrador_8 is
	
	component registrador_1 is
        	port(
        		D0, RW, clk, pr, cl : in  std_logic;
        		S                   : out std_logic    
    		);
    	end component;
begin

	u0 : registrador_1 port map(D(0), RW, clk,'1', cl, S(0));
	u1 : registrador_1 port map(D(1), RW, clk,'1', cl, S(1));
	u2 : registrador_1 port map(D(2), RW, clk,'1', cl, S(2));
	u3 : registrador_1 port map(D(3), RW, clk,'1', cl, S(3));
	u4 : registrador_1 port map(D(4), RW, clk,'1', cl, S(4));
	u5 : registrador_1 port map(D(5), RW, clk,'1', cl, S(5));
	u6 : registrador_1 port map(D(6), RW, clk,'1', cl, S(6));
	u7 : registrador_1 port map(D(7), RW, clk,'1', cl, S(7));
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity flags is
	port(
        	D           : in std_logic_vector(1 downto 0);
		RW, clk, cl : in  std_logic;
        	S           : out std_logic_vector(1 downto 0)    
    	);
end entity;

architecture behavior of flags is

	component registrador_1 is
        	port(
        		D0, RW, clk,pr, cl : in  std_logic;
        		S                   : out std_logic    
    		);
    	end component;
begin

	u1 : registrador_1 port map(D(1), RW, clk, '1', cl, S(1));
	u0 : registrador_1 port map(D(0), RW, clk, cl,'1', S(0));
    
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity ctrl is
	port (
		Q : in std_logic_vector(2 downto 0);
		J : out std_logic_vector(2 downto 0);
		K : out std_logic_vector(2 downto 0)
	); 	
end entity;

architecture behavior of ctrl is
begin
	J(2) <= Q(1) and Q(0);
    	K(2) <= Q(1) and Q(0);
    	
    	J(1) <= Q(0);
    	K(1) <= Q(0);
    	
    	J(0) <= '1';
    	K(0) <= '1';
end architecture;

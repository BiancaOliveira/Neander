library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
	port (
        	E0, E1, Sel : in  std_logic;
        	S           : out std_logic
    	);
end entity;

architecture behavior of mux_2x1 is
begin

    	S <= (E0 and (not Sel)) or (E1 and Sel);
    	
end architecture;

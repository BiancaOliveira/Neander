library ieee;
use ieee.std_logic_1164.all;

entity detector_NZ is
	port (
		S  : in  std_logic_vector(7 downto 0);
		NZ : out std_logic_vector(1 downto 0)
	);
end entity;

architecture behavior of detector_NZ is
begin

	NZ(1) <= S(7);
	NZ(0) <= not(S(7) or S(6) or S(5) or S(4) or S(3) or S(2) or S(1) or S(0));
	
end architecture;

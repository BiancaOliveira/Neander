library ieee;
use ieee.std_logic_1164.all;

entity mux5x8 is
	port(
		SLAD  : in  std_logic_vector(7 downto 0);
		SADD  : in  std_logic_vector(7 downto 0);
		SOR   : in  std_logic_vector(7 downto 0);
		SAND  : in  std_logic_vector(7 downto 0);
		SNOT  : in  std_logic_vector(7 downto 0);
		ULAop : in  std_logic_vector(2 downto 0);
		S     : out std_logic_vector(7 downto 0)   
    	);
end entity;

architecture behavior of mux5x8 is
begin

	S <= SLAD when ULAop = "000" else SADD when ULAop = "001" else SOR when ULAop = "010" else SAND when ULAop = "011" else SNOT when ULAop = "100" else "00000000" ;

end architecture;

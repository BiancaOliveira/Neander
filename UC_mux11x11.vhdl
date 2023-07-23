library ieee;
use ieee.std_logic_1164.all;

entity mux11x11 is
	port(
		SHLT  : in  std_logic_vector(7 downto 0);
		SJZ   : in  std_logic_vector(7 downto 0);
		SJN   : in  std_logic_vector(7 downto 0);
		SJMP  : in  std_logic_vector(7 downto 0);
		SNOT  : in  std_logic_vector(7 downto 0);
		SOR   : in  std_logic_vector(7 downto 0);
		SAND  : in  std_logic_vector(7 downto 0);
		SADD  : in  std_logic_vector(7 downto 0);
		SLDA  : in  std_logic_vector(7 downto 0);
		SSTA  : in  std_logic_vector(7 downto 0);
		SNOP : in  std_logic_vector(7 downto 0);
		ULAop : in  std_logic_vector(10 downto 0);
		S     : out std_logic_vector(10 downto 0)   
    	);
end entity;

architecture behavior of mux11x11 is
begin

	S <= SHLT when ULAop  = "00000000001" 
	 else SJZ when ULAop  = "00000000010"
	 else SJN when ULAop  = "00000000100" 
	 else SJMP when ULAop = "00000001000"
	 else SNOT when ULAop = "00000010000"
	 else SOR when ULAop  = "00000100000"
	 else SAND when ULAop = "00001000000"
	 else SADD when ULAop = "00010000000"
	 else SLDA when ULAop = "00100000000"
	 else SSTA when ULAop = "01000000000"
	 else SNOP when ULAop = "10000000000"
	 else (others => 'Z');

end architecture;

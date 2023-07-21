library ieee;
use ieee.std_logic_1164.all;


entity TB_detector_NZ is
end entity;

architecture teste of TB_detector_NZ is
	

	component detector_NZ is
		port (
			S : in  std_logic_vector(7 downto 0);
			NZ    : out std_logic_vector(1 downto 0)
		);
	end component;

	signal sS :  std_logic_vector(7 downto 0);
	signal sNZ :  std_logic_vector(1 downto 0);

begin
	udetector : detector_NZ port map(sS, sNZ);


   	tb : process
    begin
	
		sS <= "10000001"; --Negativo sNZ[1] == 1 sNZ[0] == 0
		
		wait for 10 ns;

		sS <= "00000000"; --Zero sNZ[1] == 0 sNZ[0] == 1

		wait for 10 ns;

		sS <= "00001111"; --Positivo sNZ[1] == 0 sNZ[0] == 0

		wait for 10 ns;
		

	end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;


entity TB_alu is
end entity;

architecture teste of TB_alu is
	

	component alu is
		port(
			X,Y  : in  std_logic_vector(7 downto 0);
			ULAop : in  std_logic_vector(2 downto 0);
			NZ   : out std_logic_vector(1 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;

	signal sX, sY    :  std_logic_vector(7 downto 0);
	signal sULAop :  std_logic_vector(2 downto 0);
	signal sNZ : std_logic_vector(1 downto 0);
	signal sS :  std_logic_vector(7 downto 0);

begin
	ualu : alu port map(sX, sY, sULAop, sNZ, sS);


   tb : process
    begin
	
		sX   <= "01000000"; 
		sY   <= "01000001";
		
		
		sULAop <= "000";
		wait for 10 ns;

		sULAop <= "001";
		wait for 10 ns;

		sULAop <= "010";
		wait for 10 ns;
		
		sULAop <= "011";
		wait for 10 ns;

		sULAop <= "100";
		wait for 10 ns;
		
		sULAop <= "111";
		wait for 10 ns;
		
	
		

	end process;
end architecture;

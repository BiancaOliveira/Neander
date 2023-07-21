library ieee;
use ieee.std_logic_1164.all;


entity TB_add is
end entity;

architecture teste of TB_add is
	component add_8 is
		port (
			A, B  : in  std_logic_vector(7 downto 0);
			S     : out std_logic_vector(7 downto 0)
		);
	end component;


	signal sA, sB  :  std_logic_vector(7 downto 0);
	signal sS :  std_logic_vector(7 downto 0);

begin
	usoma : add_8 port map(sA, sB, sS);


   	tb : process
    begin
	
		sA <= "10000001";
		sB <= "01111110";
		wait for 10 ns;

		sA <= "00000000";
		sB <= "11111111";
		wait for 10 ns;

		sA <= "00001111";
		sB <= "11010010";
		wait for 10 ns;
		

	end process;
end architecture;
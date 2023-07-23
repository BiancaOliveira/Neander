library ieee;
use ieee.std_logic_1164.all;


entity TB_cont is
end entity;

architecture contador of TB_cont is

	constant cicloClock : time := 20 ns;
	
	component contador is
		port (
			clk : in  std_logic;
			cl  : in  std_logic;
			S   : out std_logic_vector(2 downto 0)
		); 
	end component;

	signal rst : std_logic := '1';
	signal sclk : std_logic := '0';
	signal sS   : std_logic_vector(2 downto 0);

begin
	sclk <= not(sclk) after cicloClock/2;
	u : contador port map(sclk,rst,sS);

	tb : process
	begin
		rst <= '0';
		wait for cicloClock;
		rst <= '1';
		wait for cicloClock*7;
		rst <= '0';
		wait for cicloClock;
		rst <= '1';
		
		
		
		wait;
	end process;
end architecture;

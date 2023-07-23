library ieee;
use ieee.std_logic_1164.all;


entity TB_NEANDER is
end entity;

architecture contador of TB_NEANDER is

	constant cicloClock : time := 20 ns;
	
	component NEANDER is
		port(
			rst, clk    : in    std_logic

		);
	end component;

	signal rst : std_logic := '1';
	signal clk : std_logic := '0';


begin
	clk <= not(clk) after cicloClock/2;
	uNEANDER : NEANDER port map(rst, clk);

	tb : process
	begin
		--reset inicial
		rst <= '0';
		wait for cicloClock;
		rst <= '1';
		
		wait;
	end process;
end architecture;

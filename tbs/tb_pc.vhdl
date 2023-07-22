library ieee;
use ieee.std_logic_1164.all;

entity TB_pc is
end entity;

architecture teste of TB_pc is
	
	constant cicloClock : time := 20 ns;
	component PC is
		port(
			rst, clk : in    std_logic;
			RW       : in    std_logic;
			BarInc   : in    std_logic;
			Barr     : in std_logic_vector(7 downto 0);
			Ende     : out   std_logic_vector(7 downto 0)
		);
	end component;

	signal srst : std_logic := '0';
    	signal sclk : std_logic := '0';
	signal sRW, sBarInc : std_logic;
	signal sBarr, sEnde :std_logic_vector(7 downto 0);

begin
	uPC : PC port map(srst, sclk ,sRW, sBarInc, sBarr, sEnde );

	
	tb : process
	begin
		
		-- aguarda reset concluir
		wait for cicloClock;    -- 20 ns 
		-- Le  PC = 0
		sRW <= '0';
		sBarInc <= '1';
		
		wait for cicloClock;    -- 40 ns
		-- Inclementa +1 em PC e grava
		--sBarInc <= '1';
		sRW <= '1';
		
		wait for cicloClock;    -- 60 ns
		-- Inclementa +1 em PC
		wait for cicloClock;    -- 80 ns
		-- Le  PC
		sRW <= '0';
		-- Le do barramento jmp
		wait for cicloClock;    -- 100 ns
		sBarr <= "00000101"; --jmp 5
		sBarInc <= '0';
		sRW <= '1';
		
		wait for cicloClock;    -- 120 ns
		-- le
		sRW <= '0';
		
		wait for cicloClock;    -- 140 ns
		-- Inclementa +1 em PC e grava
		sBarInc <= '1';
		sRW <= '1';
		wait for cicloClock;    -- 60 ns
		
		sRW <= '0';
		
		wait;
		

	end process;
	
	-- o clock ainda pulsa!
	sclk <= not(sclk) after cicloClock / 2;

	-- processo para reset
	process
	begin
		-- reset inicial
		srst <= '0';
		wait for cicloClock;
		srst <= '1';
		wait;
	end process;
end architecture;

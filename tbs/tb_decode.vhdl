library ieee;
use ieee.std_logic_1164.all;

entity TB_decode is
end entity;

architecture teste of TB_decode is
	
	constant cicloClock : time := 20 ns;
	component Decode is
		port(
			Inst : in std_logic_vector(7 downto 0);
			S    : out std_logic_vector(10 downto 0)
		);
	end component;

	signal sInst :std_logic_vector(7 downto 0);
	signal sS    :std_logic_vector(10 downto 0);
	

begin
	uDecode : Decode port map(sInst, sS);

	tb : process
	begin
		
		sInst<= "00000000"; --nop s = 10000000000
		wait for cicloClock/2;    -- 10 ns
		
		sInst<= "00010000"; --sta s = 01000000000
		wait for cicloClock/2;    -- 20 ns
		
		sInst<= "00100000"; --lda s = 00100000000
		wait for cicloClock/2;    -- 30 ns
		
		sInst<= "00110000"; --add s = 00010000000
		wait for cicloClock/2;    -- 40 ns
		
		sInst<= "01000000"; --or  s = 00001000000
		wait for cicloClock/2;    -- 50 ns
		
		sInst<= "01010000"; --and s = 00000100000
		wait for cicloClock/2;    -- 60 ns
		
		sInst<= "01100000"; --not s = 00000010000
		wait for cicloClock/2;    -- 70 ns
		
		sInst<= "10000000"; --jmp s = 00000001000
		wait for cicloClock/2;    -- 80 ns
		 
		sInst<= "10010000"; --jn  s = 00000000100
		wait for cicloClock/2;    -- 90 ns

		sInst<= "10100000"; --jz  s = 00000000010
		wait for cicloClock/2;    -- 100 ns
		
		sInst<= "11110000"; --hlt s = 0000000001
		wait for cicloClock/2;    -- 110 ns
		wait;

	end process;
	
end architecture;

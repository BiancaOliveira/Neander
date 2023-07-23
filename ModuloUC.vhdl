library ieee;
use ieee.std_logic_1164.all;

entity CONTROLE is
	port(
		rst, clk     : in    std_logic;
		IR_nrw       : in    std_logic;
		NZ           : in std_logic_vector(1 downto 0);
		BarramentoD  : in std_logic_vector(7 downto 0);
		BarramentoC  : out std_logic_vector(10 downto 0)
	);
end entity;

architecture behavior of CONTROLE is
	
	component DECODE is
		port(

			Inst : in std_logic_vector(7 downto 0);
			S    : out std_logic_vector(10 downto 0)
			--snop,ssta, slda, sadd, sor, sand, snot, sjmp, sjn, sjz, shlt
		);
	end component;
	
	component registrador_8 is
		port(
			D           : in std_logic_vector(7 downto 0);
			RW, clk, cl : in  std_logic;
			S           : out std_logic_vector(7 downto 0)    
	    	);
	end component;
	
	component UC is
		port(
			rst, clk    : in std_logic;
			Dec         : in std_logic_vector(10 downto 0);
			NZ          : in std_logic_vector(1 downto 0);
			BarramentoC :out std_logic_vector(10 downto 0)
		);
	end component;
	

	signal sIR  : std_logic_vector(7 downto 0);
	signal sDec : std_logic_vector(10 downto 0);
begin

	uIR     : registrador_8 port map(BarramentoD, IR_nrw, clk, rst, sIR);
	uDECODE : DECODE port map(sIR, sDec);
	uUC     : UC port map(rst, clk, sDec, NZ, BarramentoC);

	
	
end architecture;

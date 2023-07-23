library ieee;
use ieee.std_logic_1164.all;

entity NEANDER is
	port(
		rst, clk    : in    std_logic

	);
end entity;

architecture behavior of NEANDER is
	
	component ULA is
		port(
			rst, clk    : in    std_logic;
			AC_nrw     : in    std_logic;
			Ula_op     : in    std_logic_vector(2 downto 0);
			MEM_nrw    : in    std_logic;
			Flags_nz   : out   std_logic_vector(1 downto 0);
			Barramento : inout std_logic_vector(7 downto 0)
		);
	end component;
	
	component MEM is
		port(
			rst, clk   : in    std_logic;
			nbarrPC    : in    std_logic;
			REM_nrw    : in    std_logic;
			MEM_nrw    : in    std_logic;
			RDM_nrw    : in    std_logic;
			End_PC     : in    std_logic_vector(7 downto 0);       
			End_Barr   : in    std_logic_vector(7 downto 0);
			Barramento : inout std_logic_vector(7 downto 0)
		);
	end component;
	
	component PC is
		port(
			rst, clk : in    std_logic;
			RW       : in    std_logic;
			BarInc   : in    std_logic;
			Barr     : in std_logic_vector(7 downto 0);
			Ende     : out   std_logic_vector(7 downto 0)
		);
	end component;
	
	component CONTROLE is
		port(
			rst, clk     : in    std_logic;
			IR_nrw       : in    std_logic;
			NZ           : in std_logic_vector(1 downto 0);
			BarramentoD  : in std_logic_vector(7 downto 0);
			BarramentoC  : out std_logic_vector(10 downto 0)
		);
	end component;
	

	signal sBarramentoD, sEndPC : std_logic_vector(7 downto 0);
	signal sBarramentoC : std_logic_vector(10 downto 0);
	signal sULA_op      : std_logic_vector(2 downto 0);
	signal sNZ          : std_logic_vector(1 downto 0);
begin
	sULA_op(2) <= sBarramentoC(8);
	sULA_op(1) <= sBarramentoC(7);
	sULA_op(0) <= sBarramentoC(6);
	
	uULA  : ULA port map(rst, clk,sBarramentoC(4), sULA_op, sBarramentoC(3), sNZ, sBarramentoD);
	uPC   : PC  port map(rst, clk,sBarramentoC(5), sBarramentoC(10), sBarramentoD, sEndPC);
	uMEM  : MEM port map(rst, clk,sBarramentoC(9), sBarramentoC(2), sBarramentoC(3), sBarramentoC(1), sEndPC, sBarramentoD, sBarramentoD);
	uCONT : CONTROLE port map(rst, clk,sBarramentoC(0), sNZ, sBarramentoD, sBarramentoC);
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity MEM is
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
end entity;

architecture behavior of MEM is
	
	component mux_2x8 is
	    	port(
			E0, E1 : in  std_logic_vector(7 downto 0);
			Sel    : in std_logic; 
			S      : out std_logic_vector(7 downto 0)
	    	);
	end component;
	
	component registrador_8 is
		port(
			D           : in std_logic_vector(7 downto 0);
			RW, clk, cl : in  std_logic;
			S           : out std_logic_vector(7 downto 0)    
	    	);
	end component;
	
	component as_ram is
		port(
			addr  : in    std_logic_vector(7 downto 0);
			data  : inout std_logic_vector(7 downto 0);
			notrw : in    std_logic;
			reset : in    std_logic
		);
	end component;
	
	signal sMux, sREM, sRDM, s_mem2rdm: std_logic_vector(7 downto 0);

begin
	
	Barramento <= sRDM when MEM_nrw='0' else (others => 'Z');
	s_mem2rdm <= Barramento when MEM_nrw = '1'else (others => 'Z');
	
	MUX     : mux_2x8 port map(End_Barr,End_PC,nbarrPC, sMux);
	REMmar  : registrador_8 port map(sMux,REM_nrw,clk, rst,sREM);
	Memoria : as_ram port map(sREM,s_mem2rdm, MEM_nrw, rst);
	RDMmbr  : registrador_8 port map(s_mem2rdm,RDM_nrw,clk, rst,sRDM);
	
	
end architecture;

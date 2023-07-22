library ieee;
use ieee.std_logic_1164.all;

entity PC is
	port(
		rst, clk : in    std_logic;
		RW       : in    std_logic;
		BarInc   : in    std_logic;
		Barr     : in std_logic_vector(7 downto 0);
		Ende     : out   std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of PC is
	
	component registrador_8 is
		port(
			D           : in std_logic_vector(7 downto 0);
			RW, clk, cl : in  std_logic;
			S           : out std_logic_vector(7 downto 0)    
	    	);
	end component;
	
	component mux_2x8 is
	    	port(
			E0, E1 : in  std_logic_vector(7 downto 0);
			Sel    : in std_logic; 
			S      : out std_logic_vector(7 downto 0)
	    	);
	end component;
	
	component add_8 is
		port(
			A, B : in  std_logic_vector(7 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;
	

	signal sEnde, sADD, sMux  : std_logic_vector(7 downto 0);

begin

	
	ADD  :  add_8  port map("00000001",sEnde, sADD);
	MUX  : mux_2x8 port map(Barr,sADD,BarInc, sMux);
	u1PC : registrador_8 port map(sMux, RW, clk, rst, sEnde);
	Ende <= sEnde;


	
end architecture;

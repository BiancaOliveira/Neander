library ieee;
use ieee.std_logic_1164.all;

entity ULA is
	port(
		rst, clk    : in    std_logic;
		AC_nrw     : in    std_logic;
		Ula_op     : in    std_logic_vector(2 downto 0);
		MEM_nrw    : in    std_logic;
		Flags_nz   : out   std_logic_vector(1 downto 0);
		Barramento : inout std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of ULA is
	
	component alu is
		port(
			X,Y   : in  std_logic_vector(7 downto 0);
			ULAop : in  std_logic_vector(2 downto 0);
			NZ    : out std_logic_vector(1 downto 0);
			S     : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component registrador_8 is
		port(
			D           : in std_logic_vector(7 downto 0);
			RW, clk, cl : in  std_logic;
			S           : out std_logic_vector(7 downto 0)    
	    	);
	end component;
	
	component flags is
		port(
			D           : in std_logic_vector(1 downto 0);
			RW, clk, cl : in  std_logic;
			S           : out std_logic_vector(1 downto 0)    
	    	);
	end component;
	

	signal sUla, sAC : std_logic_vector(7 downto 0);
	signal sUla_NZ   : std_logic_vector(1 downto 0);
begin

	Barramento <= sAC when MEM_nrw='1' else (others => 'Z');
	
	u0AC : registrador_8 port map(sUla, AC_nrw, clk, rst, sAC);
	u1   : alu port map(sAC, Barramento, Ula_op, sUla_NZ, sUla);
	u2   : flags port map(sUla_NZ, AC_nrw, clk, rst, Flags_nz);
	
end architecture;

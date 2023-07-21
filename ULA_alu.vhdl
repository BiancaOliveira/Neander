library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port(
		X,Y   : in  std_logic_vector(7 downto 0);
		ULAop : in  std_logic_vector(2 downto 0);
		NZ    : out std_logic_vector(1 downto 0);
		S     : out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of alu is
	
	component not_8 is
		port (
			A : in  std_logic_vector(7 downto 0);
			S : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component and_8 is
		port (
			A, B : in  std_logic_vector(7 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component or_8 is
		port (
			A,B : in  std_logic_vector(7 downto 0);
			S   : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component add_8 is
		port(
			A, B : in  std_logic_vector(7 downto 0);
			S    : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component detector_NZ is
		port (
			S  : in  std_logic_vector(7 downto 0);
			NZ : out std_logic_vector(1 downto 0)
		);
	end component;
	
	component mux5x8 is
	    port(
		SLAD  : in  std_logic_vector(7 downto 0);
		SADD  : in  std_logic_vector(7 downto 0);
		SOR   : in  std_logic_vector(7 downto 0);
		SAND  : in  std_logic_vector(7 downto 0);
		SNOT  : in  std_logic_vector(7 downto 0);
		ULAop : in  std_logic_vector(2 downto 0);
		S     : out std_logic_vector(7 downto 0)   
	    );
	end component;

	signal sSNOT, sSAND, sSOR, sSADD, sS : std_logic_vector(7 downto 0);
begin

	u0 : not_8 port map(X,sSNOT);
	u1 : and_8 port map(X,Y, sSAND);
	u2 : or_8  port map(X,Y, sSOR);
	u3 : add_8  port map(X,Y, sSADD);
	u4 : mux5x8 port map(Y, sSADD, sSOR, sSAND, sSNOT,ULAop,sS);
	u5 : detector_NZ port map(sS,NZ);
	S <= sS;
	
end architecture;

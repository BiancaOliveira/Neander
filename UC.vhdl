library ieee;
use ieee.std_logic_1164.all;

entity UC is
	port(
		rst, clk : in std_logic;
		Dec      : in std_logic_vector(10 downto 0);
		NZ       : in std_logic_vector(1 downto 0);
		BarramentoC : inout std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of ULA is
	
	component nop_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component sta_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component lda_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component add_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component and_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component or_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component not_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component jmp_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component jn_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component jz_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			N     : in std_logic;
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component jz_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			Z     : in std_logic;
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component hlt_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;
	
	component contador is
		port (
			clk : in  std_logic;
			cl  : in  std_logic;
			S   : out std_logic_vector(2 downto 0)
		);
	end component;
	
	component mux11x11 is
		port(
			SHLT  : in  std_logic_vector(7 downto 0);
			SJZ   : in  std_logic_vector(7 downto 0);
			SJN   : in  std_logic_vector(7 downto 0);
			SJMP  : in  std_logic_vector(7 downto 0);
			SNOT  : in  std_logic_vector(7 downto 0);
			SOR   : in  std_logic_vector(7 downto 0);
			SAND  : in  std_logic_vector(7 downto 0);
			SADD  : in  std_logic_vector(7 downto 0);
			SLDA  : in  std_logic_vector(7 downto 0);
			SSTA  : in  std_logic_vector(7 downto 0);
			SNOP  : in  std_logic_vector(7 downto 0);
			ULAop : in  std_logic_vector(10 downto 0);
			S     : out std_logic_vector(10 downto 0)   
	    	);
	end component;
	

	signal sNop, sSta, sLda, sAdd, sAnd, sOr, sNot, sJmp, sJn, sJz, sHlt: std_logic_vector(10 downto 0);
	signal sCont   : std_logic_vector(2 downto 0);
begin
	ucont: contador port map(clk, rst,sCont);
	
	unop: nop_uc port map(sCont,sNop);
	usta: sta_uc port map(sCont,sSta);
	ulda: lda_uc port map(sCont,sLda);
	uadd: add_uc port map(sCont,sAdd);
	uand: and_uc port map(sCont,sAnd);
	uor : or_uc  port map(sCont,sOr);
	unot: not_uc port map(sCont,sNot);
	ujmp: jmp_uc port map(sCont,sJmp);
	ujn : jn_uc  port map(sCont, NZ[1],sJn);
	ujz : jz_uc  port map(sCont, NZ[0],sJz);
	uhlt: hlt_uc  port map(sCont,sHlt);
	
	umux: mux11x11 port map(sHlt, sJz, sJn, sJmp, sNot, sOr, sAnd, sAdd, sLda, sSta, sNop,  Dec, BarramentoC);
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;


entity TB_add is
end entity;

architecture teste of TB_add is
	

	component add_uc is
		port(

			Ciclo : in std_logic_vector(2 downto 0);
			S     : out std_logic_vector(10 downto 0)
			--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
		);
	end component;

	signal sCiclo :  std_logic_vector(2 downto 0);
	signal sS     :  std_logic_vector(10 downto 0);

begin
	uadd : add_uc port map(sCiclo, sS);


	tb : process
	begin
	
		sCiclo   <= "000";
		wait for 20 ns;
		
		sCiclo   <= "001";
		wait for 20 ns;
		
		sCiclo   <= "010";
		wait for 20 ns;
		
		sCiclo   <= "011";
		wait for 20 ns;
		
		sCiclo   <= "100";
		wait for 20 ns;
		
		sCiclo   <= "101";
		wait for 20 ns;
		
		sCiclo   <= "110";
		wait for 20 ns;
		
		sCiclo   <= "111";
		wait for 20 ns;
		wait;
	end process;
end architecture;

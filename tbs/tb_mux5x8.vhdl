library ieee;
use ieee.std_logic_1164.all;


entity TB_mux5x8 is
end entity;

architecture teste of TB_mux5x8 is
	

	component mux5x8 is
		port(
			SLAD   : in  std_logic_vector(7 downto 0);
			SADD   : in  std_logic_vector(7 downto 0);
			SOR    : in  std_logic_vector(7 downto 0);
			SAND   : in  std_logic_vector(7 downto 0);
			SNOT   : in  std_logic_vector(7 downto 0);
			ULA_op : in  std_logic_vector(2 downto 0);
			S_R    : out std_logic_vector(7 downto 0)   
		);
	end component;

	signal sSLAD, sSADD, sSOR, sSAND, sSNOT :  std_logic_vector(7 downto 0);
	signal sULA_op :  std_logic_vector(2 downto 0);
	signal sS_R :  std_logic_vector(7 downto 0);

begin
	umux : mux5x8 port map(sSLAD, sSADD, sSOR, sSAND, sSNOT, sULA_op, sS_R);


   	tb : process
    begin
	
		sSLAD   <= "00000000"; 
		sSADD   <= "00000001";
		sSOR    <= "00000010";
		sSAND   <= "00000011";
		sSNOT   <= "00000100";
		sULA_op <= "000";
		wait for 10 ns;

		sULA_op <= "001";
		wait for 10 ns;

		sULA_op <= "010";
		wait for 10 ns;
		
		sULA_op <= "011";
		wait for 10 ns;

		sULA_op <= "100";
		wait for 10 ns;
		
		sULA_op <= "111";
		wait for 10 ns;
		
	
		

	end process;
end architecture;

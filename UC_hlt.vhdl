library ieee;
use ieee.std_logic_1164.all;

entity 	hlt_uc is
	port(

		Ciclo : in std_logic_vector(2 downto 0);
		S     : out std_logic_vector(10 downto 0)
		--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
	);
end entity;

architecture behavior of hlt_uc is
begin
	S(10) <= '1'; -- barr/inc
	S(9)  <= '1'; --barr/PC
	S(8)  <= '0';-- ULAop[8-6]
	S(7)  <= '0';
	S(6)  <= '0';
	S(5)  <= '0'; -- PC_rw
	S(4)  <= '0';  --AC_rw
	S(3)  <= '0'; --MEM_rw
	S(2)  <= '0'; --REM_rw
	S(1)  <= '0';--RDM_rw
	S(0)  <= '0'; --RI_rw
end architecture;

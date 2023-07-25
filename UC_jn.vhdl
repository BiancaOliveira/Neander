library ieee;
use ieee.std_logic_1164.all;

entity 	jn_uc is
	port(

		Ciclo : in std_logic_vector(2 downto 0);
		N     : in std_logic;
		S     : out std_logic_vector(10 downto 0)
		--barr/inc, barr/PC, ULAop[8-6], PC_rw, AC_rw, MEM_rw, REM_rw, RDM_rw, RI_rw
	);
end entity;

architecture behavior of jn_uc is
begin
	u : process (N, Ciclo)
	begin
		if (N = '1') then
			S(10) <= not(Ciclo(2)) or Ciclo(1) or not(Ciclo(0)); -- barr/inc
			S(9)  <= '1'; --barr/PC
			S(8)  <= '0';-- ULAop[8-6]
			S(7)  <= '0';
			S(6)  <= '0';
			S(5)  <= not(Ciclo(1)) and  Ciclo(0); -- PC_rw
			S(4)  <= '0'; --AC_rw
			S(3)  <= '0'; --MEM_rw
			S(2)  <= (not(Ciclo(2)) and not(Ciclo(1))  and not(Ciclo(0))) or (not(Ciclo(2)) and Ciclo(1) and Ciclo(0)); --REM_rw
			S(1)  <= not(Ciclo(1)) and (Ciclo(2) xor Ciclo(0));  --RDM_rw
			S(0)  <= not(Ciclo(2)) and Ciclo(1) and not(Ciclo(0)); --RI_rw
		else
			S(10) <= '1'; -- barr/inc
			S(9)  <= '1'; --barr/PC
			S(8)  <= '0';-- ULAop[8-6]
			S(7)  <= '0';
			S(6)  <= '0';
			S(5)  <= not(Ciclo(2)) and Ciclo(0); -- PC_rw
			S(4)  <= '0';  --AC_rw
			S(3)  <= '0'; --MEM_rw
			S(2)  <= not(Ciclo(1)) and not(Ciclo(2)) and not(Ciclo(0)); --REM_rw
			S(1)  <= not(Ciclo(2)) and not(Ciclo(1)) and Ciclo(0);--RDM_rw
			S(0)  <= not(Ciclo(2)) and Ciclo(1) and not(Ciclo(0)); --RI_rw
		end if;
	end process;
end architecture;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:49 06/27/2017 
-- Design Name: 
-- Module Name:    controleur_PID - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library modules;
use modules.usr_package.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controleur_PID is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           Ek0, Ek1, Ek2 : in  STD_LOGIC_VECTOR (31 downto 0);
           u : out  STD_LOGIC_vector(15 downto 0);
           termine, occupe, transfert_dac : out  STD_LOGIC);
end controleur_PID;

architecture Behavioral of controleur_PID is

constant kp : std_logic_vector(31 downto 0) := "00000000000000110010100011110101";
constant ki : std_logic_vector(31 downto 0) := "00000000000001010101010001111010";
constant kd : std_logic_vector(31 downto 0) := "00000000000001001010101110000101";

type etat_FSM_PID is (attente, latch_erreur, latch_res1, latch_res_sortie, demarrer_dac, attente_dac, fin);
signal etat_present, etat_suivant : etat_FSM_PID;

signal add1, add2, Ek0_int, Ek1_int, Ek2_int : std_logic_vector(31 downto 0);
signal mult1, mult2, mult3 : std_logic_vector(63 downto 0);
signal sortie_reg_partie1, sortie_reg_partie2, sortie_reg_partie3, sortie_reg_partie1_int, sortie_reg_partie2_int,
			sortie_reg_partie3_int, addition, soustraction : std_logic_vector(15 downto 0);

signal reset_reg, en_latch1, en_latch2 : std_logic;

begin

--conversion complément 2 entrées add
Ek0_int <= not(Ek0) + 1 when Ek0(15) = '1' else
			  Ek0;
			  
Ek1_int <= not(Ek1) + 1 when Ek1(15) = '1' else
			  Ek1;

Ek2_int <= not(Ek2) + 1 when Ek2(15) = '1' else
			  Ek2;			  

--partie 1 équation
add1 <= kp + ki + kd;
mult1 <= Ek0_int * add1;

registre_partie1 : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => en_latch1, d => mult1(47 downto 32), q_out => sortie_reg_partie1);

--partie 2 équation
add2 <= kp + kd + kd;
mult2 <= Ek1_int * add2;

registre_partie2 : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => en_latch1, d => mult2(47 downto 32), q_out => sortie_reg_partie2);

--partie 3 équation
mult3 <= Ek2_int * kd;

registre_partie3 : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => en_latch1, d => mult3(47 downto 32), q_out => sortie_reg_partie3);

--conversion complément 2 sortie registre
sortie_reg_partie1_int <= not(sortie_reg_partie1) + 1 when Ek0(15) = '1' else
								  sortie_reg_partie1;
								  
sortie_reg_partie2_int <= not(sortie_reg_partie2) + 1 when Ek1(15) = '1' else
								  sortie_reg_partie2;

sortie_reg_partie3_int <= not(sortie_reg_partie3) + 1 when Ek2(15) = '1' else
								  sortie_reg_partie3;	
								  
--soustraction addition sortie registre
soustraction <= sortie_reg_partie1_int + (not(sortie_reg_partie2_int) + 1);

addition <= sortie_reg_partie3_int + soustraction;

--registre de sortie
registre_action : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => en_latch2, d => addition, q_out => u);

--machine à état de la gestion d'un cycle d'asservissement
process(clk, reset)
begin
	if(reset = '0') then	
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, termine_dac)
begin
	case etat_present is
		when attente =>
			reset_reg <= '0';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= latch_erreur;
			else
				etat_suivant <= attente;
			end if;
			
		when latch_erreur =>
			reset_reg <= '1';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_res1;
		
		when latch_res1 =>
			reset_reg <= '1';
			en_latch1 <= '1';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_res_sortie;
			
		when latch_res_sortie =>
			reset_reg <= '1';
			en_latch1 <= '0';
			en_latch2 <= '1';
			transfert_dac <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= demarrer_dac;
		
		when demarrer_dac =>
			reset_reg <= '1';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_dac;
		
		when attente_dac =>
			reset_reg <= '1';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '1';
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_dac;
			end if;
			
		when fin =>
			reset_reg <= '0';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_reg <= '0';
			en_latch1 <= '0';
			en_latch2 <= '0';
			transfert_dac <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;

--trouver les constantes de l'asservissement
end Behavioral;


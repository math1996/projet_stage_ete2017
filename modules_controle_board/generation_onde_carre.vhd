----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:30:14 05/22/2017 
-- Design Name: 
-- Module Name:    generation_onde_carre - Behavioral 
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

entity generation_onde_carre is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           nombre_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           duty_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_coup_horloge_par_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  occupe, termine, demarrer_transfert : out std_logic);
end generation_onde_carre;

architecture Behavioral of generation_onde_carre is

--dans ce cas-ci, on génère à l'Infinie pour les tests
type etat_fsm_onde_carre is (attente, load_input, partie_positive, attente_dac1, attente_positive, partie_negative, attente_dac2, attente_negative, verification_fin, fin);
signal etat_present, etat_suivant : etat_fsm_onde_carre;

signal compte_nb_coup_horloge_par_cycle, duty_cycle_int, nb_coup_horloge_par_cycle_int, nombre_cycle_int, compte_nombre_cycle : std_logic_vector(31 downto 0);
signal resultat_pos, resultat_neg, amplitude_int, offset_int : std_logic_vector(15 downto 0);
signal enable_compteur_nchpc, reset_compteur_nchpc, enable_compteur_nc, reset_compteur_nc, start_load, reset_input: std_logic;

begin

--compteur du nb de coup d'horloge par cycle
compteur_nb_coup_horloge_par_cyle : compteurNbits generic map(32) port map(clk => clk, enable => enable_compteur_nchpc,
																									reset => reset_compteur_nchpc, output =>compte_nb_coup_horloge_par_cycle);
																									
--compteur du nombre de cycle effectué																								
compteur_nb_cycle : compteurNbits generic map(32) port map(clk => clk, enable => enable_compteur_nc, reset => reset_compteur_nc, output => compte_nombre_cycle);

--ajouter l'offset
add_offset_partie_pos : addition_offset port map(amplitude => amplitude_int, offset => offset_int, resultat => resultat_pos);
add_offset_partie_neg : addition_offset port map(amplitude => (not(amplitude_int) + 1), offset => offset_int, resultat => resultat_neg);

--registre pour loader les entrées
registre_nb_cycle : registreNbits generic map(32) port map(clk => clk, en => start_load,  reset => reset_input, d => nombre_cycle, q_out => nombre_cycle_int);
registre_duty_cycle : registreNbits generic map(32) port map(clk => clk, en => start_load, reset => reset_input, d => duty_cycle, q_out => duty_cycle_int);
registre_nchpc : registreNbits generic map(32) port map(clk => clk, en => start_load, reset => reset_input, d => nb_coup_horloge_par_cycle, q_out => nb_coup_horloge_par_cycle_int);
registre_amplitude : registreNbits generic map(16) port map(clk => clk, en => start_load, reset => reset_input, d => amplitude, q_out => amplitude_int);
registre_offset : registreNbits generic map(16) port map(clk => clk, en => start_load, reset => reset_input, d => offset, q_out => offset_int);

--machine à état générant l'onde carrée
process(clk, reset)
begin
	if(reset = '0') then	
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, compte_nb_coup_horloge_par_cycle, compte_nombre_cycle, termine_dac,
			start, duty_cycle_int, nb_coup_horloge_par_cycle_int, nombre_cycle_int, resultat_pos, resultat_neg)
begin
	case etat_present is
		when attente =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '0';
			termine <= '0';
			start_load <= '0';
			reset_input <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
		
		when load_input =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '0';
			termine <= '0';
			start_load <= '1';
			reset_input <= '1';
			etat_suivant <= partie_positive;
		
		when partie_positive =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '1';
			demarrer_transfert <= '1';
			onde_genere <= resultat_pos;
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac1;
			
		when attente_dac1 =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= resultat_pos;
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then
				etat_suivant <= attente_positive;
			else
				etat_suivant <= attente_dac1;
			end if;
			
		when attente_positive =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(compte_nb_coup_horloge_par_cycle >= duty_cycle_int) then
				etat_suivant <= partie_negative;
			else
				etat_suivant <= attente_positive;
			end if;
			
		when partie_negative =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '1';
			onde_genere <= resultat_neg;
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac2;
			
		when attente_dac2 =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= resultat_neg;
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then
				etat_suivant <= attente_negative;
			else
				etat_suivant <= attente_dac2;
			end if;
			
		when attente_negative =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(compte_nb_coup_horloge_par_cycle >= nb_coup_horloge_par_cycle_int) then
				etat_suivant <= verification_fin;
			else
				etat_suivant <= attente_negative;
			end if;
		
		when verification_fin =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '1';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '1';
			termine <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(compte_nombre_cycle >= nombre_cycle_int) then
				etat_suivant <= fin;
			else
				etat_suivant <= partie_positive;
			end if;
			
		when fin =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '1';
			onde_genere <= (others => '0');
			occupe <= '1';
			termine <= '1';
			start_load <= '0';
			reset_input <= '0';
			etat_suivant <= attente;
					
		when others =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			onde_genere <= (others => '0');
			occupe <= '0';
			termine <= '0';
			start_load <= '0';
			reset_input <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:00 05/24/2017 
-- Design Name: 
-- Module Name:    generation_onde_triangle - Behavioral 
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

entity generation_onde_triangle is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           pas_comptage : in  STD_LOGIC_VECTOR (15 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
			  nombre_cycle : in std_logic_vector(7 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  demarrer_transfert, occupe, termine : out std_logic);
end generation_onde_triangle;

architecture Behavioral of generation_onde_triangle is

type etat_onde_triangle is (attente, load_input, partie_up_pos, attente_dac1_pos, attente_partie_up_pos, partie_down_pos, attente_dac2_pos, attente_partie_down_pos, 
										 partie_up_neg, attente_dac1_neg, attente_partie_up_neg, partie_down_neg, attente_dac2_neg, attente_partie_down_neg, verification_fin, fin, compter_cycle);
signal etat_present, etat_suivant : etat_onde_triangle;

signal compte_attente, temps_attente_int : std_logic_vector(31 downto 0);
signal enable_nc, reset_nc, enable_co, reset_co, mode_co, signe_partie, choix_signe, reset_attente,
			enable_attente, cmp_seuil, cmp_attente, cmp_zero, cmp_fin, start_load, reset_input: std_logic;
signal onde_genere_int, resultat_pos, resultat_neg, pas_comptage_int, amplitude_int, offset_int : std_logic_vector(15 downto 0);
signal compte_nb_cycle, nombre_cycle_int : std_logic_vector(7 downto 0);			

begin

--compteurs
compteur_nb_cycle : compteurNbits generic map(8) port map(clk => clk, enable => enable_nc, reset => reset_nc, output => compte_nb_cycle);
compteur_onde : compteurNbits_mode generic map(16) port map(clk => clk, reset => reset_co, enable => enable_co, mode => mode_co, pas => pas_comptage_int, compteur_out => onde_genere_int);
compteur_attente : compteurNbits generic map(32) port map( clk => clk, enable => enable_attente, reset => reset_attente, output => compte_attente);

--ajouter l'offset
add_offset_partie_pos : addition_offset port map(amplitude => onde_genere_int, offset => offset_int, resultat => resultat_pos);
add_offset_partie_neg : addition_offset port map(amplitude => (not(onde_genere_int) +1) , offset => offset_int, resultat => resultat_neg);

--registre pour loader les entrées que l'ont va utiliser
registre_temps_attente : registreNbits generic map(32) port map(clk => clk, en => start_load,  reset => reset_input, d => temps_attente, q_out => temps_attente_int);
registre_pas_comptage : registreNbits generic map(16) port map(clk => clk, en => start_load, reset => reset_input, d => pas_comptage, q_out => pas_comptage_int);
registre_amplitude : registreNbits generic map(16) port map(clk => clk, en => start_load, reset => reset_input, d => amplitude, q_out => amplitude_int);
registre_offset : registreNbits generic map(16) port map(clk => clk, en => start_load, reset => reset_input, d => offset, q_out => offset_int);
registre_nombre_cycle : registreNbits generic map(8) port map(clk => clk, en => start_load, reset => reset_input, d => nombre_cycle, q_out => nombre_cycle_int);

--sortie de l'onde générée
onde_genere <= resultat_pos when choix_signe = '0' else
					resultat_neg;

--omparateur du seuil (arrêt de comptage)				
cmp_seuil <= '1' when onde_genere_int >= amplitude_int else
				 '0';

--comparateur du nb de cycle à attentre	
cmp_attente <= '1' when compte_attente >= temps_attente_int else
					'0';

--comparateur que l'on est rendu à 0
cmp_zero <= '1' when onde_genere_int = "00000000000000000000000000000000" else
				'0';

--comparateur du nombre de cycle généré
cmp_fin <= '1' when compte_nb_cycle >= nombre_cycle_int else
				'0';

--machine à état de la génération de l'onde triangulaire
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, termine_dac, cmp_seuil, cmp_attente, cmp_zero, cmp_fin)
begin
	case etat_present is 
		when attente =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '0';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '0';
			if(start = '1') then 
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
		
		when load_input =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '1';
			reset_input <= '1';
			etat_suivant <= compter_cycle;
		
		when compter_cycle =>
			enable_nc <= '1';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= partie_up_pos;
			
		when partie_up_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac1_pos;
			
		when attente_dac1_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then	
				etat_suivant <= attente_partie_up_pos;
			else
				etat_suivant <= attente_dac1_pos;
			end if;
			
		when attente_partie_up_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(cmp_seuil = '1' and cmp_attente = '1') then
				etat_suivant <=partie_down_pos;
			elsif(cmp_seuil = '0' and cmp_attente = '1') then
				etat_suivant <= partie_up_pos;
			else
				etat_suivant <= attente_partie_up_pos;
			end if;
			
		when partie_down_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac2_pos;
			
		when attente_dac2_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then
				etat_suivant <= attente_partie_down_pos;
			else
				etat_suivant <= attente_dac2_pos;
			end if;
		
		when attente_partie_down_pos =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '1';
			if(cmp_zero = '1' and cmp_attente = '1') then
				etat_suivant <= partie_up_neg;
			elsif(cmp_zero = '0' and cmp_attente = '1') then
				etat_suivant <= partie_down_pos;
			else
				etat_suivant <= attente_partie_down_pos;
			end if;
			
		when partie_up_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac1_neg;
			
		when attente_dac1_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then	
				etat_suivant <= attente_partie_up_neg;
			else
				etat_suivant <= attente_dac1_neg;
			end if;
			
		when attente_partie_up_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			if(cmp_seuil = '1' and cmp_attente = '1') then
				etat_suivant <=partie_down_neg;
			elsif(cmp_seuil = '0' and cmp_attente = '1') then
				etat_suivant <= partie_up_neg;
			else
				etat_suivant <= attente_partie_up_neg;
			end if;
			
		when partie_down_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			etat_suivant <= attente_dac2_neg;
			
		when attente_dac2_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			if(termine_dac = '1') then
				etat_suivant <= attente_partie_down_neg;
			else
				etat_suivant <= attente_dac2_neg;
			end if;
		
		when attente_partie_down_neg =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			if(cmp_zero = '1' and cmp_attente = '1') then
				etat_suivant <= verification_fin;
			elsif(cmp_zero = '0' and cmp_attente = '1') then
				etat_suivant <= partie_down_neg;
			else
				etat_suivant <= attente_partie_down_neg;
			end if;
			
		when verification_fin =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			choix_signe <= '1';
			start_load <= '0';
			reset_input <= '1';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= compter_cycle;
			end if;
			
			
		when fin =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '1';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '0';
			etat_suivant <= attente;
		
		when others =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '0';
			termine <= '0';
			choix_signe <= '0';
			start_load <= '0';
			reset_input <= '0';
			etat_suivant <= attente;
	end case;			
end process;

end Behavioral;


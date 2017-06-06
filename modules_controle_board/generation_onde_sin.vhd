----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:18:53 05/30/2017 
-- Design Name: 
-- Module Name:    generation_onde_sin - Behavioral 
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

entity generation_onde_sin is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           pas : in  STD_LOGIC_VECTOR (7 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
			  nombre_cycle : in std_logic_vector(7 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
           demarrer_transfert, occupe, termine : out  STD_LOGIC);
end generation_onde_sin;

architecture Behavioral of generation_onde_sin is

constant bin_1024 : std_logic_vector(10 downto 0) := "10000000000";

type etat_gen_onde_sin is (attente, load_input, compter_cycle, partie_pos, attente_dac1, attente_pos, partie_neg,
										attente_dac2, attente_neg, verification_fin, fin, reset_compteur_lut);
signal etat_present, etat_suivant : etat_gen_onde_sin;

signal compteur_LUT : std_logic_vector(9 downto 0);
signal valeur_int, offset_int, resultat_pos, resultat_neg, amplitude_int, amplitude_onde : std_logic_vector(15 downto 0);
signal reset_LUT, enable_LUT, start_load, reset_input, cmp_attente, cmp_fin_LUT, cmp_fin,
			reset_attente, enable_attente, reset_nc, enable_nc, mode : std_logic;
signal pas_int, compteur_nb_cycle, nombre_cycle_int : std_logic_vector(7 downto 0);
signal temps_attente_int, compteur_attente, multiplication_amplitude : std_logic_vector(31 downto 0);
signal seuil, seuil_test : std_logic_vector(10 downto 0);

begin

--LUT contenant les valeurs du signal sinusoïdal normalisé
valeurs_sin : LUT_1024_sin port map(adresse => compteur_LUT, valeur => valeur_int);

--compteur permettant d'accérder à la LUT
compteur_acces_LUT : compteurNbits_mode generic map(10) port map(clk => clk, reset => reset_LUT, enable => enable_LUT, mode => '0',
																						pas => "00" & pas_int, compteur_out => compteur_LUT);
--compteur du temps d'attente
compteur_attente_DAC : compteurNbits generic map(32) port map(clk => clk, reset => reset_attente, enable => enable_attente, output => compteur_attente);		

--compteur du nombre de cycles
compteur_cycle	: compteurNbits generic map(8) port map(clk => clk, reset => reset_nc, enable => enable_nc, output => compteur_nb_cycle);																		
																						
--registre des input
registre_temps_attente : registreNbits generic map(32) port map(clk => clk, reset => reset_input, en => start_load, d => temps_attente, q_out => temps_attente_int);																					
registre_pas : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => start_load, d => pas, q_out => pas_int);																					
registre_amplitude : registreNbits generic map(16) port map(clk => clk, reset => reset_input, en => start_load, d => amplitude, q_out => amplitude_int);																					
registre_offset : registreNbits generic map(16) port map(clk => clk, reset => reset_input, en => start_load, d => offset, q_out => offset_int);	
registre_nb_cycle : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => start_load, d => nombre_cycle, q_out => nombre_cycle_int);

--multiplier l'amplitude avec la valeur normalisée																			
multiplication_amplitude <= amplitude_int * valeur_int;
amplitude_onde <= multiplication_amplitude(25 downto 10);

--ajouter l'offset
add_offset_partie_pos : addition_offset port map(amplitude => amplitude_onde, offset => offset_int, resultat => resultat_pos);
add_offset_partie_neg : addition_offset port map(amplitude => (not(amplitude_onde) +1) , offset => offset_int, resultat => resultat_neg);

seuil <= bin_1024 - pas_int;

--comparateurs
cmp_attente <= '1' when compteur_attente >= temps_attente_int else
					'0';
					
cmp_fin_LUT <= '1' when ('0' & compteur_LUT) >= seuil else
					'0';
				
cmp_fin <= '1' when compteur_nb_cycle >= nombre_cycle_int else
				'0';

--sortie pour le DAC
onde_genere <= resultat_pos when mode = '0' else
					resultat_neg;
					
					
--machine à état gérant la génération de l'onde sinusoïdale
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_attente, cmp_fin, cmp_fin_LUT, termine_dac)
begin
	case etat_present is
		when attente =>
			start_load <= '0';
			reset_input <= '0';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '0';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when load_input =>
			start_load <= '1';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '0';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= compter_cycle;
		
		when compter_cycle =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '1';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= partie_pos;
			
		when partie_pos =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '1';
			reset_LUT <= '1';
			enable_LUT <= '1';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_dac1;
			
		when attente_dac1 =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '1';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= attente_pos;
			else
				etat_suivant <= attente_dac1;
			end if;
			
		when attente_pos =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '1';
			enable_LUT <= '0';
			reset_attente <= '1';
			enable_attente <= '1';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_attente = '1' and cmp_fin_LUT = '1') then
				etat_suivant <= reset_compteur_lut;
			elsif(cmp_attente = '1' and cmp_fin_LUT = '0') then
				etat_suivant <= partie_pos;
			else
				etat_suivant <= attente_pos;
			end if;
			
		when reset_compteur_lut =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= partie_neg;
		
		when partie_neg =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '1';
			reset_LUT <= '1';
			enable_LUT <= '1';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_dac2;
			
		when attente_dac2 =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '1';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '1';
			occupe <= '1';
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= attente_neg;
			else
				etat_suivant <= attente_dac2;
			end if;
			
		when attente_neg =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '1';
			enable_LUT <= '0';
			reset_attente <= '1';
			enable_attente <= '1';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '1';
			occupe <= '1';
			termine <= '0';
			if(cmp_attente = '1' and cmp_fin_LUT = '1') then
				etat_suivant <= verification_fin;
			elsif(cmp_attente = '1' and cmp_fin_LUT = '0') then
				etat_suivant <= partie_neg;
			else
				etat_suivant <= attente_neg;
			end if;
	
		when verification_fin =>
			start_load <= '0';
			reset_input <= '1';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '1';
			enable_nc <= '0';
			mode <= '1';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= compter_cycle;
			end if;
			
		when fin =>
			start_load <= '0';
			reset_input <= '0';
			demarrer_transfert <= '1';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '0';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others => 
			start_load <= '0';
			reset_input <= '0';
			demarrer_transfert <= '0';
			reset_LUT <= '0';
			enable_LUT <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			reset_nc <= '0';
			enable_nc <= '0';
			mode <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
		
	end case;		
end process; 

end Behavioral;


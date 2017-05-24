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
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  demarrer_transfert, occupe, termine : out std_logic);
end generation_onde_triangle;

architecture Behavioral of generation_onde_triangle is

type etat_onde_triangle is (attente, partie_up, attente_dac1, attente_partie_up, partie_down, attente_dac2, attente_partie_down, inverser);
signal etat_present, etat_suivant : etat_onde_triangle;

signal compte_attente : std_logic_vector(31 downto 0);
signal enable_nc, reset_nc, enable_co, reset_co, mode_co, signe_partie,
			enable_signe_partie, reset_signe_partie, choix_signe, reset_attente,
			enable_attente, cmp_seuil, cmp_attente, cmp_zero : std_logic;
signal onde_genere_int, resultat_pos, resultat_neg : std_logic_vector(15 downto 0);
signal compte_nb_cycle : std_logic_vector(7 downto 0);			

begin

compteur_nb_cycle : compteurNbits generic map(8) port map(clk => clk, enable => enable_nc, reset => reset_nc, output => compte_nb_cycle);
compteur_onde : compteurNbits_mode generic map(16) port map(clk => clk, reset => reset_co, enable => enable_co, mode => mode_co, pas => pas_comptage, compteur_out => onde_genere_int);
compteur_attente : compteurNbits generic map(32) port map( clk => clk, enable => enable_attente, reset => reset_attente, output => compte_attente);
registre_partie_pos_neg : registre1bit port map(clk => clk, d => not(choix_signe), en => enable_signe_partie, reset => reset_signe_partie, q_out => choix_signe);

add_offset_partie_pos : addition_offset port map(amplitude => onde_genere_int, offset => offset, resultat => resultat_pos);
add_offset_partie_neg : addition_offset port map(amplitude => (not(onde_genere_int) +1) , offset => offset, resultat => resultat_neg);

onde_genere <= resultat_pos when choix_signe = '0' else
					resultat_neg;
					
cmp_seuil <= '1' when onde_genere_int >= amplitude else
				 '0';
				 
cmp_attente <= '1' when compte_attente >= temps_attente else
					'0';

cmp_zero <= '1' when onde_genere_int = "00000000000000000000000000000000" else
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

process(etat_present, start, termine_dac, cmp_seuil, cmp_attente, cmp_zero)
begin
	case etat_present is 
		when attente =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_signe_partie <= '0';
			reset_signe_partie <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then 
				etat_suivant <= partie_up;
			else
				etat_suivant <= attente;
			end if;
			
		when partie_up =>
			enable_nc <= '1';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '0';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_dac1;
			
		when attente_dac1 =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			if(termine_dac = '1') then	
				etat_suivant <= attente_partie_up;
			else
				etat_suivant <= attente_dac1;
			end if;
			
		when attente_partie_up =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '0';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_seuil = '1' and cmp_attente = '1') then
				etat_suivant <=partie_down;
			elsif(cmp_seuil = '0' and cmp_attente = '1') then
				etat_suivant <= partie_up;
			else
				etat_suivant <= attente_partie_up;
			end if;
			
		when partie_down =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '1';
			reset_co <= '1';
			mode_co <= '1';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_dac2;
			
		when attente_dac2 =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_partie_down;
		
		when attente_partie_down =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '1';
			mode_co <= '1';
			enable_signe_partie <= '0';
			reset_signe_partie <= '1';
			enable_attente <= '1';
			reset_attente <= '1';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_zero = '1' and cmp_attente = '1') then
				etat_suivant <= inverser;
			elsif(cmp_zero = '0' and cmp_attente = '1') then
				etat_suivant <= partie_down;
			else
				etat_suivant <= attente_partie_down;
			end if;
			
		when inverser =>
			enable_nc <= '0';
			reset_nc <= '1';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_signe_partie <= '1';
			reset_signe_partie <= '1';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= partie_up;
		
		when others =>
			enable_nc <= '0';
			reset_nc <= '0';
			enable_co <= '0';
			reset_co <= '0';
			mode_co <= '0';
			enable_signe_partie <= '0';
			reset_signe_partie <= '0';
			enable_attente <= '0';
			reset_attente <= '0';
			demarrer_transfert <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
		--reste à faire la partie de décrémenter de la partie_pos, ensuite switcher vers le négatif, recommencer!
	end case;			
end process;

end Behavioral;


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
           nb_cycle : in  STD_LOGIC_VECTOR (7 downto 0);
           duty_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_coup_horloge_par_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  occupe, termine, demarrer_transfert : out std_logic);
end generation_onde_carre;

architecture Behavioral of generation_onde_carre is

--dans ce cas-ci, on génère à l'Infinie pour les tests
type etat_fsm_onde_carre is (attente, partie_positive, attente_dac1, attente_positive, partie_negative, attente_dac2, attente_negative);
signal etat_present, etat_suivant : etat_fsm_onde_carre;

signal compte_nb_coup_horloge_par_cycle : std_logic_vector(31 downto 0);
signal compte_nb_cycle : std_logic_vector(7 downto 0);
signal resultat_pos, resultat_neg : std_logic_vector(15 downto 0);
signal enable_compteur_nchpc, reset_compteur_nchpc, enable_compteur_nc, reset_compteur_nc, mode : std_logic;

begin

compteur_nb_coup_horloge_par_cyle : compteurNbits generic map(32) port map(clk => clk, enable => enable_compteur_nchpc,
																									reset => reset_compteur_nchpc, output =>compte_nb_coup_horloge_par_cycle);
																									
compteur_nb_cycle : compteurNbits generic map(8) port map(clk => clk, enable => enable_compteur_nc, reset => reset_compteur_nc, output => compte_nb_cycle);

onde_genere <= resultat_pos when mode = '0' else
					resultat_neg;

add_offset_partie_pos : addition_offset port map(amplitude => amplitude, offset => offset, resultat => resultat_pos);
add_offset_partie_neg : addition_offset port map(amplitude => (not(amplitude) + 1), offset => offset, resultat => resultat_neg);


process(clk, reset)
begin
	if(reset = '0') then	
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, compte_nb_coup_horloge_par_cycle, compte_nb_cycle, termine_dac, start, duty_cycle, nb_coup_horloge_par_cycle )
begin
	case etat_present is
		when attente =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '0';
			if(start = '1') then
				etat_suivant <= partie_positive;
			else
				etat_suivant <= attente;
			end if;
			
		when partie_positive =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '1';
			mode <= '0';
			etat_suivant <= attente_dac1;
			
		when attente_dac1 =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '0';
			if(termine_dac = '1') then
				etat_suivant <= attente_positive;
			else
				etat_suivant <= attente_dac1;
			end if;
			
		when attente_positive =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '0';
			if(compte_nb_coup_horloge_par_cycle >= duty_cycle) then
				etat_suivant <= partie_negative;
			else
				etat_suivant <= attente_positive;
			end if;
			
		when partie_negative =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '1';
			mode <= '1';
			etat_suivant <= attente_dac2;
			
		when attente_dac2 =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '1';
			if(termine_dac = '1') then
				etat_suivant <= attente_negative;
			else
				etat_suivant <= attente_dac2;
			end if;
			
		when attente_negative =>
			reset_compteur_nchpc <= '1';
			enable_compteur_nchpc <= '1';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '1';
			if(compte_nb_coup_horloge_par_cycle >= nb_coup_horloge_par_cycle) then
				etat_suivant <= partie_positive;
			else
				etat_suivant <= attente_negative;
			end if;
			
		when others =>
			reset_compteur_nchpc <= '0';
			enable_compteur_nchpc <= '0';
			reset_compteur_nc <= '0';
			enable_compteur_nc <= '0';
			demarrer_transfert <= '0';
			mode <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:09 05/17/2017 
-- Design Name: 
-- Module Name:    FSM_conversion_seq_choix_canaux_adc12bits - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_conversion_seq_choix_canaux_adc12bits is
    Port ( clk, start, reset, termine_rdc_config, termine_rdc_recup : in  STD_LOGIC;
           choix_canaux : in  STD_LOGIC_VECTOR (7 downto 0);
			  nb_cycle_conversion : std_logic_vector (31 downto 0);
           termine, demarrer_transfert, demarrer_recup : out  STD_LOGIC;
           load : out  STD_LOGIC_VECTOR (15 downto 0));
end FSM_conversion_seq_choix_canaux_adc12bits;

architecture Behavioral of FSM_conversion_seq_choix_canaux_adc12bits is

type etat_FSM_choix_canaux_seq_adc12bits is (attente,start_RR1, RR1, start_RR2, RR2, start_SR, SR, start_CR, CR,
															demarrer_conversion, attente_conversion, fin, verification_fin);
signal etat_present, etat_suivant : etat_FSM_choix_canaux_seq_adc12bits;

signal enable_compteur_nb_cycle_conv, reset_compteur_nb_cycle_conv, cmp_fin_conversion : std_logic;
signal compte_nb_cycle_conversion : std_logic_vector(31 downto 0);
begin

--compteur du nb de cycle de conversion
compteur_nb_cycle_conversion : compteurNbits generic map(32) port map(clk => clk, enable => enable_compteur_nb_cycle_conv,
																							reset => reset_compteur_nb_cycle_conv, output => compte_nb_cycle_conversion);

--comparateurs
cmp_fin_conversion <= '1' when compte_nb_cycle_conversion >= nb_cycle_conversion else
							 '0';

--machine à état de la conversion séquentielle des canaux
process(clk, reset)
begin 
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, etat_present, termine_rdc_config, termine_rdc_recup, choix_canaux, cmp_fin_conversion)
begin
	case etat_present is
		when attente =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			if(start = '1') then
				etat_suivant <= start_RR1;
			else
				etat_suivant <= attente;
			end if;
		
		when start_RR1 =>
			demarrer_transfert <= '1';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= RR1;
			
		when RR1 =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= b"1_01_01010101_00000";
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			if(termine_RDC_config = '1') then
				etat_suivant <= start_RR2;
			else
				etat_suivant <= RR1;
			end if;
			
		when start_RR2 =>
			demarrer_transfert <= '1';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= RR2;
			
		when RR2 =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= b"1_10_01010101_00000";
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			if(termine_RDC_config = '1') then
				etat_suivant <= start_SR;
			else
				etat_suivant <= RR2;
			end if;
		
		when start_SR =>
			demarrer_transfert <= '1';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= SR;
			
		when SR =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= b"1_11" & choix_canaux & "00000";
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			if(termine_rdc_config = '1') then
				etat_suivant <= start_CR;
			else
				etat_suivant <= SR;
			end if;
			
		when start_CR =>
			demarrer_transfert <= '1';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= CR;
			
		when CR =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= b"1_00_000_00_00_0_1_01_0_0";
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			if(termine_rdc_config = '1') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= CR;
			end if;
		
		when demarrer_conversion =>
			demarrer_transfert <= '0';
			demarrer_recup <= '1';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_cycle_conv <= '1';
			etat_suivant <= attente_conversion;
			
		when attente_conversion =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_cycle_conv <= '0';
			if(termine_RDC_recup = '1') then
				etat_suivant <= verification_fin;
			else
				etat_suivant <= attente_conversion;
			end if;
			
		when verification_fin =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_cycle_conv <= '0';
			if(cmp_fin_conversion = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= demarrer_conversion;
			end if;
			
		when fin =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '1';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= attente;
			
		when others =>
			demarrer_transfert <= '0';
			demarrer_recup <= '0';
			load <= (others => '0');
			termine <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			etat_suivant <= attente;
			
	end case;
end process;

end Behavioral;


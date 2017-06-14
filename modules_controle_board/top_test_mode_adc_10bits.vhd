----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:26 06/13/2017 
-- Design Name: 
-- Module Name:    top_test_mode_adc_10bits - Behavioral 
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

entity top_test_mode_adc_10bits is
    Port ( clk, reset, DOUT, SSTRB, rx : in  STD_LOGIC;
           occupe, termine, CS, SCLK, DIN, SHDN, tx : out  STD_LOGIC);
end top_test_mode_adc_10bits;

architecture Behavioral of top_test_mode_adc_10bits is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_mode_adc10bits is (attente, attente_param_1CH, attente_param_seq, demarrer_conversion, attente_conversion, fin,
												demarrage_envoie, attente_envoie, verification_fin);
signal etat_present, etat_suivant : etat_test_mode_adc10bits;

signal clk_int, new_data_int, start_seq_int, donne_conversion_pret, reset_compteur, enable_compteur, reset_mode,
		 enable_mode, reset_buffer_rx, cmp_param_1CH, cmp_param_seq, reset_adc, start_adc, occupe_adc, termine_adc, decalage_envoie,
		 occupe_envoie, termine_envoie, start_envoie, reset_compteur_envoie, enable_compteur_envoie, cmp_fin_envoie: std_logic;
signal data_conversion, data_out_int: std_logic_vector(15 downto 0);
signal canal_conversion : std_logic_vector(2 downto 0);
signal data_recu, sequence_conversion : std_logic_vector(7 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(5 downto 0);
signal compte_buffer_rx, nb_canaux_int : std_logic_vector(3 downto 0);
signal mode_int : std_logic_vector(1 downto 0);
signal nb_cycle_conversion_int : std_logic_vector(31 downto 0);
signal compteur_envoie : std_logic_vector(5 downto 0);

begin

--signaux sortie
occupe <= occupe_adc;

--diviseur d'horloge à 1.5625 MHz
diviseur_horloge : diviseur_clk generic map (4) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

--module de controle de l'ADC 10 bits
ctrl_adc10bits : top_controle_adc_10bits port map(clk => clk_int, reset => reset_adc, start => start_adc, DOUT => DOUT, SSTRB => SSTRB, canal_conversion => canal_conversion,
																  sequence_conversion => sequence_conversion, mode_conversion => mode_int, nb_cycle_conversion => nb_cycle_conversion_int,
																  nb_canaux_conversion => nb_canaux_int, donnee_conversion_pret => donne_conversion_pret, DIN => DIN, SCLK => SCLK, CS => CS,
																  SHDN => SHDN, occupe => occupe_adc, termine => termine_adc, donnee_conversion => data_conversion);

--compteur du buffer rx
compteur_buffer_rx : compteurNbits generic map(4) port map(clk => clk_int, reset => reset_compteur, enable => (enable_compteur and new_data_int), output => compte_buffer_rx);

--modules de communication série rx
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);
buffer_rx : buffer_8xM generic map(6) port map(clk => clk_int, enable => new_data_int, reset => (reset_buffer_rx and reset), input => data_recu,
																output => output_buffer_rx);	

--registre du mode
registre_mode : registreNbits generic map(2) port map(clk => clk_int, reset => (reset_mode and reset) , en => (enable_mode and new_data_int),
																		d => 	data_recu(1 downto 0), q_out => mode_int);															

--comparateurs
cmp_param_1CH <= '1' when compte_buffer_rx >= 5 else
					  '0';
					  
cmp_param_seq <= '1' when compte_buffer_rx >= 6 else
					  '0';
					  
cmp_fin_envoie <= '1' when compteur_envoie >= 32 else
						'0';

--assignation des signaux pour le buffer de réception
canal_conversion <= output_buffer_rx(4)(2 downto 0);
sequence_conversion <= output_buffer_rx(5);
nb_cycle_conversion_int <= output_buffer_rx(3) & output_buffer_rx(2) & output_buffer_rx(1) & output_buffer_rx(0);
nb_canaux_int <= output_buffer_rx(4)(3 downto 0);

--buffer tampon de récupération des données
buffer_recup : memoire_tampon_NxM generic map(16,32) port map(clk => clk_int, enable => (donne_conversion_pret or decalage_envoie), reset => reset,
																				  input => data_conversion, output => data_out_int);	

--communication série tx
com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => start_envoie, data => data_out_int, tx => tx,
																				occupe => occupe_envoie, termine	=> termine_envoie);
--compteur du nombre de donnée envoyée
compteur_data_envoie : compteurNbits generic map(6) port map(clk => clk_int, reset => reset_compteur_envoie, enable => enable_compteur_envoie, output => compteur_envoie);

--machine à état de la gestion des données recu
process(reset, clk_int)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;	

process(etat_present, mode_int, cmp_param_1CH, cmp_param_seq, termine_adc, termine_envoie, cmp_fin_envoie)
begin
	case etat_present is
		when attente =>
			reset_buffer_rx <= '1';
			reset_mode<= '1';
			enable_mode <= '1';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			if(mode_int = "01") then
				etat_suivant <= attente_param_1CH;
			elsif(mode_int = "10") then
				etat_suivant <= attente_param_seq;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_param_1CH =>
			reset_buffer_rx <= '1';
			reset_mode<= '1';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			if(cmp_param_1CH = '1') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= attente_param_1CH;
			end if;
			
		when attente_param_seq =>
			reset_buffer_rx <= '1';
			reset_mode<= '1';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			if(cmp_param_seq = '1') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= attente_param_seq;
			end if;
		
		when demarrer_conversion =>
			reset_buffer_rx <= '1';
			reset_mode<= '1';
			enable_mode <= '0';
			reset_adc <= '1';
			start_adc <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			etat_suivant <= attente_conversion;
		
		
		when attente_conversion =>
			reset_buffer_rx <= '1';
			reset_mode<= '1';
			enable_mode <= '0';
			reset_adc <= '1';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			if(termine_adc = '1') then
				etat_suivant <= demarrage_envoie;
			else
				etat_suivant <= attente_conversion;
			end if;
		
		when demarrage_envoie =>
			reset_buffer_rx <= '0';
			reset_mode<= '0';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '1';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '1';
			enable_compteur_envoie <= '1';
			etat_suivant <= attente_envoie;
			
		when attente_envoie =>
			reset_buffer_rx <= '0';
			reset_mode<= '0';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '1';
			enable_compteur_envoie <= '0';
			if(termine_envoie = '1') then
				etat_suivant <= verification_fin;
			else
				etat_suivant <= attente_envoie;
			end if;
			
		when verification_fin =>
			reset_buffer_rx <= '0';
			reset_mode<= '0';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '1';
			reset_compteur_envoie <= '1';
			enable_compteur_envoie <= '0';
			if(cmp_fin_envoie = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= demarrage_envoie;
			end if;
			
			
		when fin =>
			reset_buffer_rx <= '0';
			reset_mode<= '0';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '1';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			etat_suivant <= attente;
		
		when others => 
			reset_buffer_rx <= '0';
			reset_mode<= '0';
			enable_mode <= '0';
			reset_adc <= '0';
			start_adc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			termine <= '0';
			start_envoie <= '0';
			decalage_envoie <= '0';
			reset_compteur_envoie <= '0';
			enable_compteur_envoie <= '0';
			etat_suivant <= attente;
	end case;	
end process;	
end Behavioral;


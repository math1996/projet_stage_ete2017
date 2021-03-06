----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:11:19 07/28/2017 
-- Design Name: 
-- Module Name:    top_test_coubre_CV_oversampling - Behavioral 
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

entity top_test_coubre_CV_oversampling is
    Port ( clk, reset, rx, DOUT_12bits, DOUT_10bits, SSTRB_10bits : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           CS_12bits, DIN_12bits, SCLK_12bits : out  STD_LOGIC;
           CS_10bits, DIN_10bits, SCLK_10bits, SHDN_10bits : out  STD_LOGIC;
           BPB_dac, OSR1_dac, OSR2_dac, RSTB_dac, MUTEB_dac,FSYNC_dac,DIN_dac,SCLK_dac : out  STD_LOGIC;
           SCLk_pot, CS_pot, SDI : out  STD_LOGIC;
           occupe, termine, conversion_adc12bits, pente_onde_tri, reg_start_adc10bits  : out std_logic;--, reg_start_adc10bits : out  STD_LOGIC;
           test_output_led : out  STD_LOGIC_VECTOR (2 downto 0);
			  led_etat : out std_logic_vector(3 downto 0));
end top_test_coubre_CV_oversampling;

architecture Behavioral of top_test_coubre_CV_oversampling is
component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_courbe_CV_oversampling is (attente, attente_param_onde, latch_param_onde, attente_param_adc, latch_param_adc, attente_onde, attente_start_adc10bits,
								attente_start_adc12bits, attente_start_gen, fin, demarrer_envoie1, demarrer_envoie2, attente_envoie1, attente_envoie2, demarrer_clk_10bits);
signal etat_present, etat_suivant : etat_courbe_CV_oversampling;

signal clk_25MHZ, clk_12MHZ,clk_adc10bits, new_data_int, reset_buffer_rx, enable_compteur_buffer, reset_compteur_buffer, reset_input, enable_input, reset_gen, demarrer_gen,
		cmp_attente_carre,cmp_attente_tri, cmp_attente_sin,cmp_attente_pulse, reset_reg_choix, enable_reg_choix, occupe_gen, termine_gen, enable_param_onde,
		cmp_fin_attente_param, reset_adc, start_adc12bits, occupe_adc12bits, termine_adc12bits, donnee_adc12bits_pret, enable_param_adc, cmp_attente_param_adc,
		start_adc10bits, donnee_adc10bits_pret, occupe_adc10bits, termine_adc10bits, occupe_envoie, termine_envoie, start_envoie, enable_attente, reset_attente,
		cmp_fin_start_adc10bits, reset_termine, enable_input_envoie, mode_envoie, cmp_fin, start_gain, occupe_pot, termine_pot, pret_envoie, occupe_oversampling,
		start_clk_adc10bits, clk_781KHZ, occupe_int	: std_logic;
		 
signal data_recu, pas_comptage_sin_int, sequence_int, valeur_gain_int  : std_logic_vector(7 downto 0);
signal compte_buffer: std_logic_vector(4 downto 0);
signal clk_out : std_logic_vector(5 downto 0);
signal mode, canal_int, signal_termine : std_logic_vector(2 downto 0);
signal mode_int : std_logic_vector(1 downto 0);
signal amplitude_int, offset_int, pas_comptage_tri_int, donne_conversion_adc12bits, donne_conversion_adc10bits, data_int,
		donne_adc12bits_int, donne_adc10bits_int, donnee_oversample_adc12bits : std_logic_vector(15 downto 0);
signal duty_cycle_carre_int, nb_coup_horloge_par_cycle_carre_int, temps_attente_tri_int, temps_attente_sin_int, nb_cycle_int,
		 nb_cycle_12bits_int, nb_cycle_10bits_int, attente_diviseur_clk_int, compte_attente_start : std_logic_vector(31 downto 0);
signal choix_clk_pulse_int : std_logic_vector(3 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(16 downto 0);
signal choix_oversampling_int : std_logic_vector(2 downto 0);

begin

--Faire un module de COM SPI et tester sans envoyer sur le port s�rie!! => probl�me?
--Le module fonctionne presque comme il est

--signaux de sortie
occupe <= occupe_pot or occupe_gen or occupe_adc12bits or occupe_adc10bits or occupe_envoie or occupe_oversampling or occupe_int;
termine <= termine_gen or termine_pot;
conversion_adc12bits <= donnee_adc12bits_pret;
test_output_led <= signal_termine;

--diviseur d'horloge � 25 MHz
diviseur_horloge : compteurNbits generic map(6) port map(clk => clk, reset => reset, enable => '1', output => clk_out);
clk_25MHZ <= clk_out(0);
clk_12MHZ <= clk_out(1);

--diviseur d'horloge pour l'ADC 10 bits
div_clk_precision : diviseur_clk_precision port map(clk => clk, reset => reset, start => start_clk_adc10bits, temps_attente => attente_diviseur_clk_int, clk_out => clk_adc10bits);

--comparateurs
cmp_attente_carre <= '1' when compte_buffer >= 17 else
							'0';
							
cmp_attente_tri <= '1' when compte_buffer >= 15 else
						 '0';
						 
cmp_attente_sin <= '1' when compte_buffer >= 14 else
						 '0';
						 
cmp_attente_pulse <= '1' when compte_buffer >= 16 else
							'0';
							
cmp_attente_param_adc <= '1' when compte_buffer >= 15 else
								 '0';
								 
cmp_fin_start_adc10bits	<= '1' when compte_attente_start >  (attente_diviseur_clk_int(30 downto 0) & '0') else
									'0';
									
cmp_fin_attente_param <= cmp_attente_carre when mode = "001" else
								 cmp_attente_tri when mode = "010" else
								 cmp_attente_sin when mode = "011" else
								 cmp_attente_pulse when mode = "100" else
								 '0';

cmp_fin <= '1' when signal_termine = "111" else
			  '0';
								 
data_int <= donne_adc12bits_int when mode_envoie = '0' else
				donne_adc10bits_int;

--registre du latch du start de l'ADC 10 bits
reg_latch_start : registre1bit port map(clk => clk_adc10bits, reset => reset, en => start_adc10bits, d => '1', q_out => reg_start_adc10bits);

--module de controle de la r�sistance variable
potentiometre_dig : controle_spi_potentiostat port map(clk => clk_25MHZ, reset => reset, start => start_gain, load_in => valeur_gain_int, CLK_OUT => SCLK_pot,
																		CS => CS_pot, SDI => SDI, occupe => occupe_pot, termine => termine_pot);
--module de communication s�rie
com_serie_rx : serial_rx port map(clk => clk_25MHZ, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--buffer de r�ception des donn�es de configuration des formes d'onde
buffer_rx : buffer_8xM generic map(17) port map(clk => clk_25MHZ, enable => new_data_int, reset => (reset_buffer_rx and reset), input => data_recu, output => output_buffer_rx);

--compteur du nombre de donn�es re�us dans le buffer
compteur_buffer : compteurNbits generic map(5) port map(clk => clk_25MHZ, enable => (new_data_int and enable_compteur_buffer), reset => reset_compteur_buffer,
																				output => compte_buffer);

--compteur de l'attente pour le start de l'ADC 10 bits
compteur_start : compteurNbits generic map(32) port map(clk => clk_25MHZ, enable => enable_attente, reset => reset_attente, output => compte_attente_start);

--module de g�n�ration de forme d'onde
generation_forme_onde : top_generation_forme_onde port map(clk => clk_25MHZ, reset => reset_gen, start => demarrer_gen, nb_cycle => nb_cycle_int, choix_onde => mode,
																			  amplitude => amplitude_int, offset => offset_int, duty_cycle_carre => duty_cycle_carre_int, 
																			  nb_coup_horloge_par_cycle_carre => nb_coup_horloge_par_cycle_carre_int, pas_comptage_tri => pas_comptage_tri_int,
																			  temps_attente_tri => temps_attente_tri_int, temps_attente_sin => temps_attente_sin_int,
																			  pas_comptage_sin => pas_comptage_sin_int, choix_clk_pulse => choix_clk_pulse_int, occupe => occupe_gen, termine => termine_gen,
																			  FSYNC => FSYNC_dac, SCLK => SCLK_dac, DIN => DIN_dac, OSR1 => OSR1_dac, OSR2 => OSR2_dac, BPB => BPB_dac,
																			  MUTEB => MUTEB_dac, RSTB => RSTB_dac, pente_onde_tri => pente_onde_tri);

--module de controle de l'ADC 12 bits 
controle_adc12bits : top_controle_adc_12bits port map(clk => clk_12MHZ, reset => reset_adc, start => start_adc12bits, DOUT => DOUT_12bits, canal_conversion => canal_int,
																	  sequence_conversion => sequence_int, mode_conversion => mode_int, nb_cycle_conversion => nb_cycle_12bits_int,
																	   donne_conversion_pret => donnee_adc12bits_pret , CS => CS_12bits, SCLK => SCLK_12bits,
																	  DIN => DIN_12bits, occupe => occupe_adc12bits, termine => termine_adc12bits, donne_conversion => donne_conversion_adc12bits);

--module de controle de l'ADC 10 bits
controle_adc10bits : top_controle_adc_10bits port map(clk => clk_adc10bits, reset => reset_adc, start => start_adc10bits, DOUT => DOUT_10bits, SSTRB => SSTRB_10bits,
																	   canal_conversion => canal_int, sequence_conversion => sequence_int, mode_conversion => mode_int, 
																		nb_cycle_conversion => nb_cycle_10bits_int,
																		donnee_conversion_pret => donnee_adc10bits_pret, DIN => DIN_10bits, SCLK => SCLK_10bits, SHDN => SHDN_10bits,
																		CS => CS_10bits, occupe => occupe_adc10bits, termine => termine_adc10bits, donnee_conversion => donne_conversion_adc10bits);

--module oversampling courant
module_oversampling : oversampling_N port map(clk => clk_adc10bits, reset => reset_adc, enable_rdc => donnee_adc10bits_pret, data_in => donne_conversion_adc12bits, choix_oversampling => choix_oversampling_int, 
															data_rdy => pret_envoie, occupe => occupe_oversampling, data_out => donnee_oversample_adc12bits);
															
--registre de sortie des modules du signal termine
registre_termine_gen : registre1bit	port map(clk => clk_25MHZ, reset => reset_adc, en => termine_gen, d => termine_gen, q_out => signal_termine(0));
registre_termine_adc12bits : registre1bit port map(clk => clk_12MHZ, reset => reset_adc, en => termine_adc12bits, d => termine_adc12bits, q_out => signal_termine(1));
registre_termine_adc10bits : registre1bit port map(clk => clk_adc10bits, reset => reset_adc, en => termine_adc10bits, d => termine_adc10bits, q_out => signal_termine(2));
																 
--module d'envoie sur le port s�rie (tx)
com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_25MHZ, reset => reset, start => start_envoie, data => data_int, tx => tx,
																		    occupe => occupe_envoie, termine => termine_envoie);																	 

--registre pour envoyer les donn�es
registre_envoie_courant : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset, en => enable_input_envoie, d => 	donnee_oversample_adc12bits,
																					  q_out => donne_adc12bits_int);
registre_envoie_tension : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset, en => enable_input_envoie, d => donne_conversion_adc10bits,
																					  q_out => donne_adc10bits_int);
																					  
--registre du choix de type d'onde
registre_choix_onde : registreNbits generic map(3) port map(clk => clk_25MHZ, reset => (reset_reg_choix and reset), en => (enable_reg_choix and new_data_int),
									d => data_recu(2 downto 0), q_out => mode);

--registres des param�tre g�n�raux des ondes
registre_amplitude : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(4) & output_buffer_rx(3)), q_out => amplitude_int);
									
registre_offset : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(2) & output_buffer_rx(1)), q_out => offset_int);	

registre_nb_cycle : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(8) & output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5)), q_out => nb_cycle_int);	
									
--registres des param�tres de l'onde carr�e							
registre_duty_cycle_carre : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(16) & output_buffer_rx(15) & output_buffer_rx(14) & output_buffer_rx(13)), q_out => duty_cycle_carre_int);	
									
registre_nb_coup_horloge_par_cycle_int_carre : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(12) & output_buffer_rx(11) & output_buffer_rx(10) & output_buffer_rx(9)),
									q_out => nb_coup_horloge_par_cycle_carre_int);	
						
--registres des param�tres de l'onde triangulaire	
registre_pas_comptage_tri : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(14) & output_buffer_rx(13)), q_out => pas_comptage_tri_int);

registre_temps_attente_tri : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(12) & output_buffer_rx(11) & output_buffer_rx(10) & output_buffer_rx(9)), q_out => temps_attente_tri_int);										

--registres des param�tres de l'onde sinuso�dale
registre_temps_attente_sin : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(13) & output_buffer_rx(12) & output_buffer_rx(11) & output_buffer_rx(10)), q_out => temps_attente_sin_int);

registre_pas_sin : registreNbits generic map(8) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => output_buffer_rx(9), q_out => pas_comptage_sin_int);	
									
--registres des param�tres de l'onde triangulaire puls�e
registre_choix_clk_pulse : registreNbits generic map(4) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => output_buffer_rx(15)(3 downto 0), q_out => choix_clk_pulse_int);

--registres des param�tres des ADC
registre_canal_conv : registreNbits generic map(3) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d => output_buffer_rx(8)(2 downto 0), q_out => canal_int);
									
registre_seq_conv : registreNbits generic map(8) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d => output_buffer_rx(12), q_out => sequence_int);									

registre_mode_conv : registreNbits generic map(2) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d => output_buffer_rx(14)(1 downto 0), q_out => mode_int);

registre_nb_cycle_12bits : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d => (output_buffer_rx(11) & output_buffer_rx(10) & output_buffer_rx(9) & output_buffer_rx(8)), q_out => nb_cycle_12bits_int);

registre_nb_cycle_10bits : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d => (output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5) & output_buffer_rx(4)), q_out => nb_cycle_10bits_int);

registre_attente_diviseur_clk : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc,
									d =>(output_buffer_rx(3) & output_buffer_rx(2) & output_buffer_rx(1) & output_buffer_rx(0)), q_out => attente_diviseur_clk_int);
--registre du gain de r�sistance
registre_gain : registreNbits generic map(8) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde, d => output_buffer_rx(0),
									q_out => valeur_gain_int);

--registre du param�tre de l'oversampling
registre_choix_oversampling : registreNbits generic map(3) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_adc, d => output_buffer_rx(13)(2 downto 0),
									q_out => choix_oversampling_int);
									
--machine � �tat de la gestion du test
process(reset, clk_25MHZ)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_25MHZ'event and clk_25MHZ = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, new_data_int, cmp_fin_attente_param, cmp_fin_start_adc10bits, cmp_attente_param_adc,
		 pret_envoie, termine_envoie, cmp_fin)
begin
	case etat_present is
		when attente =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '1';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '0';
--			led_etat <= "0000";
			if(new_data_int = '1') then
				etat_suivant <= attente_param_onde;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_param_onde =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_gain <= '0';
			start_envoie <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0001";
			if(cmp_fin_attente_param = '1') then
				etat_suivant <= latch_param_onde;
			else
				etat_suivant <= attente_param_onde;
			end if;
			
		when latch_param_onde =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '1';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '1';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0010";
			etat_suivant <= attente_param_adc;
			
		when attente_param_adc =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0011";
			if(cmp_attente_param_adc = '1') then
				etat_suivant <= latch_param_adc;
			else
				etat_suivant <= attente_param_adc;
			end if;
			
		when latch_param_adc =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '1';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0100";
			etat_suivant <= demarrer_clk_10bits;
			
		when demarrer_clk_10bits =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '1';
			occupe_int <= '1';
--			led_etat <= "0101";
			etat_suivant <= attente_start_adc10bits;
			
		when attente_start_adc10bits =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '1';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '1';
			enable_attente <= '1';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0110";
			if(cmp_fin_start_adc10bits = '1') then
				etat_suivant <= attente_start_adc12bits;
			else
				etat_suivant <= attente_start_adc10bits;
			end if;
			
		when attente_start_adc12bits =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '1';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "0111";
			etat_suivant <= attente_start_gen;
			
		when attente_start_gen =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '1';
			reset_adc <= '1';
			start_adc12bits <= '1';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1000";
			etat_suivant <= attente_onde;
			
		when attente_onde =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1001";
			if(pret_envoie = '1' and cmp_fin = '0') then
				etat_suivant <= demarrer_envoie1;
			elsif(pret_envoie = '0' and cmp_fin = '1') then
				etat_suivant <= fin;
			elsif(pret_envoie = '1' and cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde;
			end if;
			
	
		when demarrer_envoie1 =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '1';
			mode_envoie <= '0';
			start_envoie <= '1';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1010";
			etat_suivant <= attente_envoie1;
			
		when attente_envoie1 =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1011";
			if(termine_envoie = '1') then
				etat_suivant <= demarrer_envoie2;
			else
				etat_suivant <= attente_envoie1;
			end if;
			
		when demarrer_envoie2 =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '1';
			start_envoie <= '1';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1100";
			etat_suivant <= attente_envoie2;
			
		when attente_envoie2 =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_adc <= '1';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '1';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1101";
			if(termine_envoie = '1') then
				etat_suivant <= attente_onde;
			else
				etat_suivant <= attente_envoie2;
			end if;
			
		when fin =>
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1110";
			etat_suivant <= attente;
		
		when others =>
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_adc <= '0';
			start_adc12bits <= '0';
			start_adc10bits <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			enable_param_adc <= '0';
			reset_attente <= '0';
			enable_attente <= '0';
			enable_input_envoie <= '0';
			mode_envoie <= '0';
			start_envoie <= '0';
			start_gain <= '0';
			start_clk_adc10bits <= '0';
			occupe_int <= '1';
--			led_etat <= "1111";
			etat_suivant <= attente;
	end case;	
end process;


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:20:06 06/02/2017 
-- Design Name: 
-- Module Name:    top_generation_onde - Behavioral 
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

entity top_generation_onde is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end top_generation_onde;

architecture Behavioral of top_generation_onde is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_gen_forme_onde is(attente, attente_param_carre, attente_param_tri, attente_param_sin, attente_param_pulse,latch_param_carre,
									latch_param_sin, latch_param_tri, latch_param_pulse, attente_onde_carre, attente_onde_tri, attente_onde_sin,
									attente_onde_pulse, fin);
signal etat_present, etat_suivant : etat_gen_forme_onde;

signal clk_int, new_data_int, reset_buffer_rx, enable_compteur_buffer, reset_compteur_buffer, start_transfert_int,
		 occupe_dac, termine_dac, reset_onde_carre, start_onde_carre, occupe_onde_carre, termine_onde_carre, start_dac_onde_carre,
		 reset_onde_tri, start_onde_tri, start_dac_onde_tri, occupe_onde_tri, termine_onde_tri, reset_onde_sin,
		 start_onde_sin, start_dac_onde_sin, occupe_onde_sin, termine_onde_sin, reset_onde_pulse, enable_onde_pulse,
		 en_param_carre, en_param_tri, en_param_sin, en_param_pulse, reset_input, reset_reg_choix, enable_reg_choix : std_logic;
		 
signal cmp_attente_carre, cmp_attente_tri, cmp_attente_sin, cmp_attente_pulse : std_logic;
			
signal data_recu, nb_cycle_onde_carre, nb_cycle_onde_tri, pas_onde_sin, nb_cycle_onde_sin : std_logic_vector(7 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(12 downto 0);
signal compte_buffer : std_logic_vector(3 downto 0);
signal onde_carre_int, load_int, amplitude_onde_carre, offset_onde_carre, amplitude_onde_tri, offset_onde_tri,
		 pas_comptage_onde_tri, onde_tri_int, amplitude_onde_sin, offset_onde_sin, onde_sin_int, onde_tri_pulse_int : std_logic_vector(15 downto 0);
signal nb_coup_horloge_par_cycle_onde_carre, duty_cycle_onde_carre, temps_attente_onde_tri,
		 temps_attente_onde_sin : std_logic_vector(31 downto 0);
signal choix_horloge_pulse : std_logic_vector(3 downto 0);
signal mode : std_logic_vector(2 downto 0);
		 
begin

--assignation des signaux et sorties
occupe <= occupe_dac or occupe_onde_carre or occupe_onde_tri or occupe_onde_sin;

--Vérifier s'il faut les changer
cmp_attente_carre <= '1' when compte_buffer >= 13 else
							'0';
							
cmp_attente_tri <= '1' when compte_buffer >= 11 else
						 '0';
						 
cmp_attente_sin <= '1' when compte_buffer >= 10 else
						 '0';
						 
cmp_attente_pulse <= '1' when compte_buffer >= 12 else
							'0';

--diviseur d'horloge à 25 MHz
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

--module de communication série
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--buffer de réception des données de configuration des formes d'onde
buffer_rx : buffer_8xM generic map(13) port map(clk => clk_int, enable => new_data_int, reset => (reset_buffer_rx and reset), input => data_recu, output => output_buffer_rx);

--compteur du nombre de données reçus dans le buffer
compteur_buffer : compteurNbits generic map(4) port map(clk => clk_int, enable => (new_data_int and enable_compteur_buffer), reset => reset_compteur_buffer,
																				output => compte_buffer);
																				
--module	de controle SPI du DAC 16 bits
ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);																			

--module de génération d'une onde carrée
gen_onde_carre : generation_onde_carre port map(clk => clk_int, reset => reset_onde_carre, start => start_onde_carre, termine_dac => termine_dac,
																nombre_cycle => nb_cycle_onde_carre, duty_cycle => duty_cycle_onde_carre,
																nb_coup_horloge_par_cycle => nb_coup_horloge_par_cycle_onde_carre,
																amplitude => amplitude_onde_carre, offset => offset_onde_carre, onde_genere => onde_carre_int, 
																occupe => occupe_onde_carre, termine => termine_onde_carre,
																demarrer_transfert => start_dac_onde_carre);
																
--module de génération d'une onde triangulaire
gen_onde_triangle : generation_onde_triangle port map(clk => clk_int, reset => reset_onde_tri, start => start_onde_tri, termine_dac => termine_dac,
																		temps_attente => temps_attente_onde_tri, pas_comptage => pas_comptage_onde_tri, 
																		amplitude => amplitude_onde_tri,offset => offset_onde_tri, onde_genere => onde_tri_int, 
																		demarrer_transfert => start_dac_onde_tri, nombre_cycle => nb_cycle_onde_tri, occupe => occupe_onde_tri,
																		termine => termine_onde_tri); 	

--module de génération d'une onde sinusoïdale
gen_onde_sinus : generation_onde_sin port map(clk => clk_int, reset => reset_onde_sin, start => start_onde_sin, termine_dac => termine_dac,
															temps_attente => temps_attente_onde_sin, pas => pas_onde_sin, amplitude => amplitude_onde_sin, 
															offset => offset_onde_sin, nombre_cycle => nb_cycle_onde_sin, onde_genere => onde_sin_int,
															demarrer_transfert => start_dac_onde_sin, occupe => occupe_onde_sin, termine => termine_onde_sin);
															
--module de génération de l'onde triangulaire pulsée
gen_onde_pulse : generation_pulse port map(clk => clk_int, reset => reset_onde_pulse, enable => enable_onde_pulse, onde_tri => onde_tri_int,
														 offset_tri => offset_onde_tri, choix_horloge => choix_horloge_pulse, onde_tri_pulse => onde_tri_pulse_int);

--registre du choix de type d'onde
registre_choix_onde : registreNbits generic map(3) port map(clk => clk_int, reset => (reset_reg_choix and reset), en => (enable_reg_choix and new_data_int),
									d => data_recu(2 downto 0), q_out => mode);

--registres des paramètres de l'onde carrée
registre_nb_cycle_carre : registreNbits generic map(8) port map(clk => clk_int, reset => reset_input, en => en_param_carre,
									d => output_buffer_rx(12), q_out => nb_cycle_onde_carre);	
									
registre_duty_cycle_carre : registreNbits generic map(32) port map(clk => clk_int, reset => reset_input, en => en_param_carre,
									d => (output_buffer_rx(11) & output_buffer_rx(10) & output_buffer_rx(9) & output_buffer_rx(8)), q_out => duty_cycle_onde_carre);	
									
registre_nb_coup_horloge_par_cycle_int_carre : registreNbits generic map(32) port map(clk => clk_int, reset => reset_input, en => en_param_carre,
									d => (output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5) & output_buffer_rx(4)),
									q_out => nb_coup_horloge_par_cycle_onde_carre);	
									
registre_amplitude_carre : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_carre,
									d => (output_buffer_rx(3) & output_buffer_rx(2)), q_out => amplitude_onde_carre);
									
registre_offset_carre : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_carre,
									d => (output_buffer_rx(1) & output_buffer_rx(0)) , q_out => offset_onde_carre);
						
--registres des paramètres de l'onde triangulaire									
registre_nb_cycle_tri : registreNbits generic map(8) port map(clk => clk_int, reset => reset_input, en => en_param_tri,
									d => output_buffer_rx(10), q_out => nb_cycle_onde_tri);	
									
registre_amplitude_tri : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_tri,
									d => (output_buffer_rx(9) & output_buffer_rx(8)), q_out => amplitude_onde_tri);	

registre_offset_tri : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_tri,
									d => (output_buffer_rx(7) & output_buffer_rx(6)), q_out => offset_onde_tri);	

registre_pas_comptage_tri : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_tri,
									d => (output_buffer_rx(5) & output_buffer_rx(4)), q_out => pas_comptage_onde_tri);

registre_temps_attente_tri : registreNbits generic map(32) port map(clk => clk_int, reset => reset_input, en => en_param_tri,
									d => (output_buffer_rx(3) & output_buffer_rx(2) & output_buffer_rx(1) & output_buffer_rx(0)), q_out => temps_attente_onde_tri);										

--registres des paramètres de l'onde sinusoïdale
registre_nb_cycle_sin : registreNbits generic map(8) port map(clk => clk_int, reset => reset_input, en => en_param_sin,
									d => output_buffer_rx(9), q_out => nb_cycle_onde_sin);	

registre_temps_attente_sin : registreNbits generic map(32) port map(clk => clk_int, reset => reset_input, en => en_param_sin,
									d => (output_buffer_rx(8) & output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5)), q_out => temps_attente_onde_sin);

registre_pas_sin : registreNbits generic map(8) port map(clk => clk_int, reset => reset_input, en => en_param_sin,
									d => output_buffer_rx(4), q_out => pas_onde_sin);	

registre_amplitude_sin : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_sin,
									d => (output_buffer_rx(3) & output_buffer_rx(2)), q_out => amplitude_onde_sin);
									
registre_offset_sin : registreNbits generic map(16) port map(clk => clk_int, reset => reset_input, en => en_param_sin,
									d => (output_buffer_rx(1) & output_buffer_rx(0)), q_out => offset_onde_sin);	

--registres des paramètres de l'onde triangulaire pulsée
registre_choix_clk_pulse : registreNbits generic map(4) port map(clk => clk_int, reset => reset_input, en => en_param_pulse,
									d => output_buffer_rx(11)(3 downto 0), q_out => choix_horloge_pulse);

--machine à état qui gère la génération des formes d'Ondes
process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, mode, cmp_attente_carre, cmp_attente_tri, cmp_attente_sin, cmp_attente_pulse,
			termine_onde_carre, termine_onde_tri, termine_onde_sin, start_dac_onde_carre, start_dac_onde_tri,
			start_dac_onde_sin, onde_carre_int, onde_tri_int, onde_sin_int, onde_tri_pulse_int, new_data_int)
begin
	case etat_present is
		when attente =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '1';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '0';
			termine <= '0';
			load_int <= (others => '0');
			if(mode = "001") then
				etat_suivant <= attente_param_carre;
			elsif(mode = "010") then
				etat_suivant <= attente_param_tri;
			elsif(mode = "011") then
				etat_suivant <= attente_param_sin;
			elsif(mode = "100") then
				etat_suivant <= attente_param_pulse;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_param_carre =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= (others => '0');
			if(cmp_attente_carre = '1') then
				etat_suivant <= latch_param_carre;
			else
				etat_suivant <= attente_param_carre;
			end if;
			
		when latch_param_carre =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_carre;
			reset_onde_carre <= '1';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '1';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_carre_int;
			etat_suivant <= attente_onde_carre;
			
		when attente_onde_carre =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_carre;
			reset_onde_carre <= '1';
			start_onde_carre <= '1';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_carre_int;
			if(termine_onde_carre = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde_carre;
			end if;
		
		when attente_param_tri =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= (others => '0');
			if(cmp_attente_tri = '1') then
				etat_suivant <= latch_param_tri;
			else
				etat_suivant <= attente_param_tri;
			end if;
			
		when latch_param_tri =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_tri;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '1';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '1';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_tri_int;
			etat_suivant <= attente_onde_tri;
			
		when attente_onde_tri =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_tri;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '1';
			start_onde_tri <= '1';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_tri_int;
			if(termine_onde_tri = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde_tri;
			end if;
			
		when attente_param_sin =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= (others => '0');
			if(cmp_attente_sin = '1') then
				etat_suivant <= latch_param_sin;
			else
				etat_suivant <= attente_param_sin;
			end if;
			
		when latch_param_sin =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_sin;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '1';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '1';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_sin_int;
			etat_suivant <= attente_onde_sin;
			
		when attente_onde_sin =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_sin;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '1';
			start_onde_sin <= '1';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_sin_int;
			if(termine_onde_sin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde_sin;
			end if;
			
		when attente_param_pulse =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= (others => '0');
			if(cmp_attente_pulse = '1') then
				etat_suivant <= latch_param_pulse;
			else
				etat_suivant <= attente_param_pulse;
			end if;
			
		when latch_param_pulse =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_tri;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '1';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '1';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '1';
			en_param_sin <= '0';
			en_param_pulse <= '1';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_tri_pulse_int;
			etat_suivant <= attente_onde_pulse;
			
		when attente_onde_pulse =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= start_dac_onde_tri;
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '1';
			start_onde_tri <= '1';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '1';
			enable_onde_pulse <= '1';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '1';
			termine <= '0';
			load_int <= onde_tri_pulse_int;
			if(termine_onde_tri = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde_pulse;
			end if;
		
		when fin =>
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= '1';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '0';
			termine <= '1';
			load_int <= (others => '0');
			etat_suivant <= attente;
			
		when others => 
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			start_transfert_int <= '0';
			reset_onde_carre <= '0';
			start_onde_carre <= '0';
			reset_onde_tri <= '0';
			start_onde_tri <= '0';
			reset_onde_sin <= '0';
			start_onde_sin <= '0';
			reset_onde_pulse <= '0';
			enable_onde_pulse <= '0';
			en_param_carre <= '0';
			en_param_tri <= '0';
			en_param_sin <= '0';
			en_param_pulse <= '0';
			reset_input <= '0';
			termine <= '0';
			load_int <= (others => '0');
			etat_suivant <= attente;
	end case;	
end process;					
	
end Behavioral;


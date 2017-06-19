----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:35 06/19/2017 
-- Design Name: 
-- Module Name:    top_test_courbe_CV - Behavioral 
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

entity top_test_courbe_CV is
    Port ( clk, reset, rx : in  STD_LOGIC; --DOUT_12bits, DOUT_10bits, SSTRB_10bits 
           --tx, CS_12bits, DIN_12bits, SCLk_12bits : out  STD_LOGIC;
           --CS_10bits, DIN_10bits, SCLK_10bits, SHDN_10bits : out  STD_LOGIC;
           BPB_dac, OSR1_dac, OSR2_dac, RSTB_dac, MUTEb_dac, FSYNC_dac, DIN_dac, SCLK_dac : out  STD_LOGIC;
           occupe, termine : out  STD_LOGIC);
end top_test_courbe_CV;

architecture Behavioral of top_test_courbe_CV is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_courbe_CV is (attente, attente_param, latch_param, attente_onde, fin);
signal etat_present, etat_suivant : etat_courbe_CV;

signal clk_25MHZ, new_data_int, reset_buffer_rx, enable_compteur_buffer, reset_compteur_buffer, reset_input, enable_input, reset_gen, demarrer_gen, cmp_attente_carre,
		 cmp_attente_tri, cmp_attente_sin,cmp_attente_pulse, reset_reg_choix, enable_reg_choix, occupe_gen, termine_gen, enable_param_onde, cmp_fin_attente_param: std_logic;
		 
signal data_recu, pas_comptage_sin_int, nb_cycle_int : std_logic_vector(7 downto 0);
signal compte_buffer : std_logic_vector(3 downto 0);
signal mode : std_logic_vector(2 downto 0);
signal amplitude_int, offset_int, pas_comptage_tri_int : std_logic_vector(15 downto 0);
signal duty_cycle_carre_int, nb_coup_horloge_par_cycle_carre_int, temps_attente_tri_int, temps_attente_sin_int : std_logic_vector(31 downto 0);
signal choix_clk_pulse_int : std_logic_vector(3 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(12 downto 0);

begin

--signaux de sortie
occupe <= occupe_gen;
termine <= termine_gen;

--diviseur d'horloge à 25 MHz
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_25MHZ);

--comparateurs
cmp_attente_carre <= '1' when compte_buffer >= 13 else
							'0';
							
cmp_attente_tri <= '1' when compte_buffer >= 11 else
						 '0';
						 
cmp_attente_sin <= '1' when compte_buffer >= 10 else
						 '0';
						 
cmp_attente_pulse <= '1' when compte_buffer >= 12 else
							'0';
							
cmp_fin_attente_param <= cmp_attente_carre when mode = "001" else
								 cmp_attente_tri when mode = "010" else
								 cmp_attente_sin when mode = "011" else
								 cmp_attente_pulse when mode = "100" else
								 '0';
								 
--module de communication série
com_serie_rx : serial_rx port map(clk => clk_25MHZ, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--buffer de réception des données de configuration des formes d'onde
buffer_rx : buffer_8xM generic map(13) port map(clk => clk_25MHZ, enable => new_data_int, reset => (reset_buffer_rx and reset), input => data_recu, output => output_buffer_rx);

--compteur du nombre de données reçus dans le buffer
compteur_buffer : compteurNbits generic map(4) port map(clk => clk_25MHZ, enable => (new_data_int and enable_compteur_buffer), reset => reset_compteur_buffer,
																				output => compte_buffer);

--module de génération de forme d'onde
generation_forme_onde : top_generation_forme_onde port map(clk => clk_25MHZ, reset => reset_gen, start => demarrer_gen, nb_cycle => nb_cycle_int, choix_onde => mode,
																			  amplitude => amplitude_int, offset => offset_int, duty_cycle_carre => duty_cycle_carre_int, 
																			  nb_coup_horloge_par_cycle_carre => nb_coup_horloge_par_cycle_carre_int, pas_comptage_tri => pas_comptage_tri_int,
																			  temps_attente_tri => temps_attente_tri_int, temps_attente_sin => temps_attente_sin_int,
																			  pas_comptage_sin => pas_comptage_sin_int, choix_clk_pulse => choix_clk_pulse_int, occupe => occupe_gen, termine => termine_gen,
																			  FSYNC => FSYNC_dac, SCLK => SCLK_dac, DIN => DIN_dac, OSR1 => OSR1_dac, OSR2 => OSR2_dac, BPB => BPB_dac,
																			  MUTEB => MUTEB_dac, RSTB => RSTB_dac);
																
--registre du choix de type d'onde
registre_choix_onde : registreNbits generic map(3) port map(clk => clk_25MHZ, reset => (reset_reg_choix and reset), en => (enable_reg_choix and new_data_int),
									d => data_recu(2 downto 0), q_out => mode);

--registres des paramètre généraux des ondes
registre_amplitude : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(3) & output_buffer_rx(2)), q_out => amplitude_int);
									
registre_offset : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(1) & output_buffer_rx(0)), q_out => offset_int);	

registre_nb_cycle : registreNbits generic map(8) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => output_buffer_rx(4), q_out => nb_cycle_int);	
									
--registres des paramètres de l'onde carrée							
registre_duty_cycle_carre : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(12) & output_buffer_rx(11) & output_buffer_rx(10) & output_buffer_rx(9)), q_out => duty_cycle_carre_int);	
									
registre_nb_coup_horloge_par_cycle_int_carre : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(8) & output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5)),
									q_out => nb_coup_horloge_par_cycle_carre_int);	
						
--registres des paramètres de l'onde triangulaire	
registre_pas_comptage_tri : registreNbits generic map(16) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(10) & output_buffer_rx(9)), q_out => pas_comptage_tri_int);

registre_temps_attente_tri : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(8) & output_buffer_rx(7) & output_buffer_rx(6) & output_buffer_rx(5)), q_out => temps_attente_tri_int);										

--registres des paramètres de l'onde sinusoïdale
registre_temps_attente_sin : registreNbits generic map(32) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => (output_buffer_rx(9) & output_buffer_rx(8) & output_buffer_rx(7) & output_buffer_rx(6)), q_out => temps_attente_sin_int);

registre_pas_sin : registreNbits generic map(8) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => output_buffer_rx(5), q_out => pas_comptage_sin_int);	
									
--registres des paramètres de l'onde triangulaire pulsée
registre_choix_clk_pulse : registreNbits generic map(4) port map(clk => clk_25MHZ, reset => reset_input, en => enable_param_onde,
									d => output_buffer_rx(11)(3 downto 0), q_out => choix_clk_pulse_int);
									
--machine à état de la gestion du test
process(reset, clk_25MHZ)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_25MHZ'event and clk_25MHZ = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, new_data_int, cmp_fin_attente_param, termine_gen)
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
			reset_input <= '0';
			enable_param_onde <= '0';
			if(new_data_int = '1') then
				etat_suivant <= attente_param;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_param =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '1';
			reset_compteur_buffer <= '1';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			if(cmp_fin_attente_param = '1') then
				etat_suivant <= latch_param;
			else
				etat_suivant <= attente_param;
			end if;
			
		when latch_param =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '1';
			reset_input <= '1';
			enable_param_onde <= '1';
			etat_suivant <= attente_onde;
			
		when attente_onde =>
			reset_buffer_rx <= '1';
			reset_reg_choix <= '1';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '1';
			demarrer_gen <= '0';
			reset_input <= '1';
			enable_param_onde <= '0';
			if(termine_gen = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_onde;
			end if;
			
		when fin =>
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			etat_suivant <= attente;
		
		when others =>
			reset_buffer_rx <= '0';
			reset_reg_choix <= '0';
			enable_reg_choix <= '0';
			enable_compteur_buffer <= '0';
			reset_compteur_buffer <= '0';
			reset_gen <= '0';
			demarrer_gen <= '0';
			reset_input <= '0';
			enable_param_onde <= '0';
			etat_suivant <= attente;
	end case;	
end process;								
end Behavioral;


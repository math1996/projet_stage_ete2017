----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:50 08/01/2017 
-- Design Name: 
-- Module Name:    test_operation_matricielle - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_operation_matricielle is
    Port ( clk, reset, rx : in  STD_LOGIC;
			  led_test : out std_logic_vector(31 downto 0);
           tx, occupe, termine, enable_ram_test : out  STD_LOGIC;
			  LED_test_etat : out std_logic_vector(4 downto 0));
end test_operation_matricielle;

architecture Behavioral of test_operation_matricielle is

type etat_test_operation_matricielle is (attente, latch_operation, attente_nb_data_num_matrice, latch_param, demarrer_attente_data_matrice1,demarrer_attente_data_matrice2,
														attente_data_matrice1, attente_data_matrice2, demarrer_add_sous, demarrer_mult_epe, demarrer_mult_mat, attente_operation, choix_operation, fin, demarrer_envoie1,
														attente_envoie1, compter_envoie, verif_fin);
signal etat_present, etat_suivant : etat_test_operation_matricielle;

signal data_recu, data_recu_int : std_logic_vector(7 downto 0);
signal num_ligne_mat1, num_ligne_mat2, num_col_mat2 : std_logic_vector(2 downto 0);
signal ligne_mat1, ligne_mat2, col_mat2: ligne_matrice_16bits(3 downto 0);

signal reset_buffer, new_data_int, enable_stockage, enable_stockage_mat1, enable_stockage_mat2, reset_operation, start_add_sous, choix_add_sous_int,
		 data_rdy_add_sous, occupe_add_sous, termine_add_sous, start_mult_epe, data_rdy_mult_epe, occupe_mult_epe, termine_mult_epe,
		 start_mult_mat, occupe_mult_mat, termine_mult_mat, data_rdy_mult_mat, reset_compteur_param, enable_compteur_param, reset_input, enable_input,
		 num_matrice, cmp_attente_param, reset_compteur_ligne, enable_reg_op, termine_operation, termine_envoie_reg,
		 cmp_fin_data, compter_ligne_add_sous, compter_ligne_mult_epe, reset_envoie, start_envoie, occupe_envoie, termine_envoie, occupe_int,
		 start_attente_matrice, occupe_fsm_recup, termine_fsm_recup, occupe_rx, reset_compte_envoie, enable_compte_envoie, cmp_fin_envoie, enable_ram: std_logic;
signal compte_ligne_int, compte_ligne_seul   : std_logic_vector(2 downto 0);
signal compte_colonne_int : std_logic_vector(2 downto 0);
signal operation, compte_param : std_logic_vector(1 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(1 downto 0);
signal nb_data_matrice, nb_data_matrice1, nb_data_matrice2, compte_nb_data : std_logic_vector(7 downto 0);
signal resultat_operation_mux, resultat_mult_epe, resultat_mult_mat, data_envoie : std_logic_vector(31 downto 0);
signal resultat_add_sous : std_logic_vector(15 downto 0);
signal output_buffer_recup_operation : tableau_memoire_32bits(15 downto 0);
signal matrice1, matrice2 : tableau_memoire(15 downto 0);

signal element_mat1_int, element_mat2_int : std_logic_vector(15 downto 0);
signal numero_element_mat1_int : std_logic_vector(3 downto 0);
signal numero_element_mat2_int : std_logic_vector(3 downto 0);

--signaux pour empêcher les warning des expressions
signal reset_buffer_int, reset_compteur_param_int, enable_compteur_param_int : std_logic;
signal input_int : std_logic_vector(15 downto 0);

begin

--assignation signaux de sortie
occupe <= occupe_mult_mat or occupe_fsm_recup or occupe_rx or occupe_envoie;
led_test <= data_envoie;
enable_ram_test <= enable_ram;

--signaux pour experessions
reset_buffer_int <= reset_buffer and reset;
reset_compteur_param_int <= reset_compteur_param and reset;
enable_compteur_param_int <= enable_compteur_param and new_data_int;
input_int <= output_buffer_rx(1) & output_buffer_rx(0);

data_recu <= data_recu_int(0) & data_recu_int(1) & data_recu_int(2) & data_recu_int(3) & data_recu_int(4) & data_recu_int(5) & data_recu_int(6) & data_recu_int(7);

--module de communication série
com_serie_rx : receveur_UART port map(clk => clk, reset => reset, rx => rx, data_out => data_recu_int, data_rdy => new_data_int, occupe => occupe_rx);

--multiplication matricielle
mult_mat_pipeline : multiplication_matricielle_pipeline_NxM_MxS generic map(4,4,4,16) port map(clk => clk, reset => reset_operation, start => start_mult_mat, 
						element_mat1 => element_mat1_int, element_mat2 => element_mat2_int, numero_element_mat1 => numero_element_mat1_int, numero_element_mat2 => numero_element_mat2_int,
						resultat => resultat_operation_mux, occupe => occupe_mult_mat, termine => termine_mult_mat, data_rdy => data_rdy_mult_mat, changer_element => enable_ram);

--buffer de réception du port série
buffer_rx : buffer_8xM generic map(2) port map(clk => clk, enable => new_data_int, reset => reset_buffer_int, input => data_recu, output => output_buffer_rx);

--buffer de récupération du résultats
buffer_recup_resultat_operation : memoire_tampon_32xM generic map(16) port map(clk => clk, reset => reset_operation, enable => data_rdy_mult_mat,
																										input => resultat_operation_mux, output => output_buffer_recup_operation);
																										
--registre du nombre de données de la matrice1
registre_nb_data_matrice1 : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => enable_input, d => output_buffer_rx(1), q_out => nb_data_matrice1);

--registre du nombre de données de la matrice2
registre_nb_data_matrice2 : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => enable_input, d => output_buffer_rx(0), q_out => nb_data_matrice2);

--compteur des paramètres recu
compteur_param : compteurNbits generic map(2) port map(clk => clk, reset => reset_compteur_param_int, enable => enable_compteur_param_int, output => compte_param);

--matrice 1
matrice1_stockage : memoire_tampon_16xM generic map(16) port map(clk => clk, enable => enable_stockage_mat1, reset => reset_buffer_int, input => input_int,
																			output => matrice1);
																			
--matrice 2
matrice2_stockage : memoire_tampon_16xM generic map(16) port map(clk => clk, enable => enable_stockage_mat2, reset => reset_buffer_int, input => input_int,
																			output => matrice2);
--comparateurs 
cmp_attente_param <= '1' when compte_param >= 2 else
							'0';

cmp_fin_envoie <= '1' when compte_nb_data >= "00001111" else
						'0';	--changer lorsque l'on change de taille de matrice
						
--mux du buffer de récupération (envoie)
data_envoie <= output_buffer_recup_operation(0) when compte_nb_data = "00000000" else
					output_buffer_recup_operation(1) when compte_nb_data = "00000001" else
					output_buffer_recup_operation(2) when compte_nb_data = "00000010" else
					output_buffer_recup_operation(3) when compte_nb_data = "00000011" else
					output_buffer_recup_operation(4) when compte_nb_data = "00000100" else
					output_buffer_recup_operation(5) when compte_nb_data = "00000101" else
					output_buffer_recup_operation(6) when compte_nb_data = "00000110" else
					output_buffer_recup_operation(7) when compte_nb_data = "00000111" else
					output_buffer_recup_operation(8) when compte_nb_data = "00001000" else
					output_buffer_recup_operation(9) when compte_nb_data = "00001001" else
					output_buffer_recup_operation(10) when compte_nb_data = "00001010" else
					output_buffer_recup_operation(11) when compte_nb_data = "00001011" else
					output_buffer_recup_operation(12) when compte_nb_data = "00001100" else
					output_buffer_recup_operation(13) when compte_nb_data = "00001101" else
					output_buffer_recup_operation(14) when compte_nb_data = "00001110" else
					output_buffer_recup_operation(15) when compte_nb_data = "00001111" else
					(others => '0');

--mux de la matrice1
element_mat1_int <= matrice1(0) when numero_element_mat1_int = "0000" else
						  matrice1(1) when numero_element_mat1_int = "0001" else
						  matrice1(2) when numero_element_mat1_int = "0010" else
						  matrice1(3) when numero_element_mat1_int = "0011" else
						  matrice1(4) when numero_element_mat1_int = "0100" else
						  matrice1(5) when numero_element_mat1_int = "0101" else
						  matrice1(6) when numero_element_mat1_int = "0110" else
						  matrice1(7) when numero_element_mat1_int = "0111" else
						  matrice1(8) when numero_element_mat1_int = "1000" else
						  matrice1(9) when numero_element_mat1_int = "1001" else
						  matrice1(10) when numero_element_mat1_int = "1010" else
						  matrice1(11) when numero_element_mat1_int = "1011" else
						  matrice1(12) when numero_element_mat1_int = "1100" else
						  matrice1(13) when numero_element_mat1_int = "1101" else
						  matrice1(14) when numero_element_mat1_int = "1110" else
						  matrice1(15);
						  
element_mat2_int <= matrice2(0) when numero_element_mat2_int = "0000" else
						  matrice2(1) when numero_element_mat2_int = "0001" else
						  matrice2(2) when numero_element_mat2_int = "0010" else
						  matrice2(3) when numero_element_mat2_int = "0011" else
						  matrice2(4) when numero_element_mat2_int = "0100" else
						  matrice2(5) when numero_element_mat2_int = "0101" else
						  matrice2(6) when numero_element_mat2_int = "0110" else
						  matrice2(7) when numero_element_mat2_int = "0111" else
						  matrice2(8) when numero_element_mat2_int = "1000" else
						  matrice2(9) when numero_element_mat2_int = "1001" else
						  matrice2(10) when numero_element_mat2_int = "1010" else
						  matrice2(11) when numero_element_mat2_int = "1011" else
						  matrice2(12) when numero_element_mat2_int = "1100" else
						  matrice2(13) when numero_element_mat2_int = "1101" else
						  matrice2(14) when numero_element_mat2_int = "1110" else
						  matrice2(15);						  
--
--data_envoie <= output_buffer_recup_operation(15);

--compteur du nombre de donnée envoyées
compteur_nb_data_envoie : compteurNbits generic map(8) port map(clk => clk, reset => reset_compte_envoie, enable => enable_compte_envoie, output => compte_nb_data);

--FSM de l'attente d'une matrice sur le prot série (RX)
recup_matrice_rx : FSM_recup_matrice_rx port map(clk => clk, reset => reset, start => start_attente_matrice, new_data_int => new_data_int, nb_data => nb_data_matrice,
																latch_data => enable_stockage, occupe => occupe_fsm_recup, termine => termine_fsm_recup);
--module d'envoie sur le port série
com_serie_tx : transmetteur_UART_Noctets generic map(4) port map(clk => clk, reset => reset_envoie, start => start_envoie, data_in => data_envoie, occupe => occupe_envoie,
																						termine => termine_envoie, tx => tx);
																						
--reg_test termine envoie
reg_test_envoie : registre1bit port map(clk => clk, reset => reset, en => termine_envoie, d => termine_envoie, q_out => termine_envoie_reg);																						
--machine à état de la gestion du test
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, new_data_int, cmp_attente_param, termine_mult_mat,termine_fsm_recup, enable_stockage, cmp_fin_envoie, termine_envoie,
			nb_data_matrice1, nb_data_matrice2)
begin
	case etat_present is
		when attente =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '1';
			enable_compteur_param <= '1';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '0';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00000";
			if(new_data_int = '1') then
				etat_suivant <= attente_nb_data_num_matrice;
			else
				etat_suivant <= attente;
			end if;
			
--		--récupérer l'opération
--		when latch_operation =>
--			reset_buffer <= '1';
--			enable_stockage_mat1 <= '0';
--			enable_stockage_mat2 <= '0';
--			reset_operation <= '0';
----			start_add_sous <= '0';
----			start_mult_epe <= '0';
--			start_mult_mat <= '0';
----			reset_compteur_ligne <= '0';
--			reset_input <= '1';
--			enable_input <= '0';
----			enable_reg_op <= '1';
--			reset_compteur_param <= '0';
--			enable_compteur_param <= '0';
--			start_attente_matrice <= '0';
--			reset_envoie <= '0';
--			start_envoie <= '0';
--			termine <= '0';
--			occupe_int <= '1';
--			reset_compte_envoie <= '0';
--			enable_compte_envoie <= '0';
--			LED_test_etat <= "00001";
--			etat_suivant <= attente_nb_data_num_matrice;
		
		when attente_nb_data_num_matrice =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '1';
			enable_compteur_param <= '1';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00010";
			if(cmp_attente_param = '1') then
				etat_suivant <= latch_param;
			else
				etat_suivant <= attente_nb_data_num_matrice;
			end if;
			
		when latch_param =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '1';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00011";
			etat_suivant <= demarrer_attente_data_matrice1;

		--récupérer les données des matrices
		when demarrer_attente_data_matrice1 =>
			nb_data_matrice <= nb_data_matrice1;
			reset_buffer <= '1';
			enable_stockage_mat1 <= enable_stockage;
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '1';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00100";
			etat_suivant <= attente_data_matrice1;
			
		when attente_data_matrice1=>
			nb_data_matrice <= nb_data_matrice1;
			reset_buffer <= '1';
			enable_stockage_mat1 <= enable_stockage;
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00101";
			if(termine_fsm_recup = '1') then
				etat_suivant <= demarrer_attente_data_matrice2;
			else
				etat_suivant <= attente_data_matrice1;
			end if;
		
		when demarrer_attente_data_matrice2 =>
			nb_data_matrice <= nb_data_matrice2;
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= enable_stockage;
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '1';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00110";
			etat_suivant <= attente_data_matrice2;
			
		when attente_data_matrice2 =>
			nb_data_matrice <= nb_data_matrice2;
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= enable_stockage;
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "00111";
			if(termine_fsm_recup = '1') then
				etat_suivant <= demarrer_mult_mat;
			else
				etat_suivant <= attente_data_matrice2;
			end if;
			
	
		--choisir l'opération et démarrer en conséquence
--		when choix_operation =>
--			reset_buffer <= '1';
--			enable_stockage_mat1 <= '0';
--			enable_stockage_mat2 <= '0';
--			reset_operation <= '0';
----			start_add_sous <= '0';
----			start_mult_epe <= '0';
--			start_mult_mat <= '0';
----			reset_compteur_ligne <= '0';
--			reset_input <= '1';
--			enable_input <= '0';
----			enable_reg_op <= '0';
--			reset_compteur_param <= '0';
--			enable_compteur_param <= '0';
--			start_attente_matrice <= '0';
--			reset_envoie <= '0';
--			start_envoie <= '0';
--			termine <= '0';
--			occupe_int <= '1';
--			reset_compte_envoie <= '0';
--			enable_compte_envoie <= '0';
--			LED_test_etat <= "01000";
--			if(operation = "00")then
--				etat_suivant <= demarrer_add_sous;
--			elsif(operation = "01") then
--				etat_suivant <= demarrer_add_sous;
--			elsif(operation = "10") then
--				etat_suivant <= demarrer_mult_epe;
--			else
--				etat_suivant <= demarrer_mult_mat;
--			end if;
--			
--		when demarrer_add_sous =>
--			reset_buffer <= '1';
--			enable_stockage_mat1 <= '0';
--			enable_stockage_mat2 <= '0';
--			reset_operation <= '1';
----			start_add_sous <= '1';
----			start_mult_epe <= '0';
--			start_mult_mat <= '0';
----			reset_compteur_ligne <= '1';
--			reset_input <= '1';
--			enable_input <= '0';
----			enable_reg_op <= '0';
--			reset_compteur_param <= '0';
--			enable_compteur_param <= '0';
--			start_attente_matrice <= '0';
--			reset_envoie <= '0';
--			start_envoie <= '0';
--			termine <= '0';
--			occupe_int <= '1';
--			reset_compte_envoie <= '0';
--			enable_compte_envoie <= '0';
--			LED_test_etat <= "01001";
--			etat_suivant <= attente_operation;
--			
--		when demarrer_mult_epe =>
--			reset_buffer <= '1';
--			enable_stockage_mat1 <= '0';
--			enable_stockage_mat2 <= '0';
--			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '1';
--			start_mult_mat <= '0';
--			reset_compteur_ligne <= '1';
--			reset_input <= '1';
--			enable_input <= '0';
--			enable_reg_op <= '0';
--			reset_compteur_param <= '0';
--			enable_compteur_param <= '0';
--			start_attente_matrice <= '0';
--			reset_envoie <= '0';
--			start_envoie <= '0';
--			termine <= '0';
--			occupe_int <= '1';
--			reset_compte_envoie <= '0';
--			enable_compte_envoie <= '0';
--			LED_test_etat <= "01010";
--			etat_suivant <= attente_operation;
			
		when demarrer_mult_mat =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '1';
--			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "01011";
			etat_suivant <= attente_operation;
		
		--attendre la fin de l'opération		
		when attente_operation =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '1';
--			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "01100";
			if(termine_mult_mat= '1') then
				etat_suivant <= demarrer_envoie1;
			else
				etat_suivant <= attente_operation;
			end if;
	
		--modifier pour ne pas utiliser le module transmetteur_UART_Noctets, cause problème!!, envoie à l'infinie sur le port série, mulitplication marche supposément!!
		when demarrer_envoie1 =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			start_attente_matrice <= '0';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_envoie <= '1';
			start_envoie <= '1';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '1';
			enable_compte_envoie <= '0';
			LED_test_etat <= "01101";
			etat_suivant <= attente_envoie1;
			
		when attente_envoie1 =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			start_attente_matrice <= '0';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_envoie <= '1';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '1';
			enable_compte_envoie <= '0';
			LED_test_etat <= "01110";
			if(termine_envoie = '1' and cmp_fin_envoie = '1') then
				etat_suivant <= fin;
			elsif(termine_envoie = '1' and cmp_fin_envoie = '0') then
				etat_suivant <= compter_envoie;
			else
				etat_suivant <= attente_envoie1;
			end if;
			
			
		when compter_envoie =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '1';
			start_attente_matrice <= '0';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '1';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_envoie <= '1';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '1';
			reset_compte_envoie <= '1';
			enable_compte_envoie <= '1';
			LED_test_etat <= "01111";
			etat_suivant <= demarrer_envoie1;
			
--		when verif_fin =>
--			nb_data_matrice <= (others => '0');
--			reset_buffer <= '1';
--			start_attente_matrice <= '0';
--			enable_stockage_mat1 <= '0';
--			enable_stockage_mat2 <= '0';
--			reset_operation <= '1';
----			start_add_sous <= '0';
----			start_mult_epe <= '0';
--			start_mult_mat <= '0';
----			reset_compteur_ligne <= '0';
--			reset_input <= '1';
--			enable_input <= '0';
----			enable_reg_op <= '0';
--			reset_compteur_param <= '0';
--			enable_compteur_param <= '0';
--			reset_envoie <= '1';
--			start_envoie <= '0';
--			termine <= '0';
--			--occupe_int <= '1';
--			reset_compte_envoie <= '1';
--			enable_compte_envoie <= '0';
--			LED_test_etat <= "10000";
--			if(cmp_fin_envoie = '1') then
--				etat_suivant <= fin;
--			else
--				etat_suivant <= compter_envoie;
--			end if;
			
		when fin =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '0';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '1';
			--occupe_int <= '1';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "10001";
			etat_suivant <= attente;
			
		when others =>
			nb_data_matrice <= (others => '0');
			reset_buffer <= '0';
			enable_stockage_mat1 <= '0';
			enable_stockage_mat2 <= '0';
			reset_operation <= '0';
--			start_add_sous <= '0';
--			start_mult_epe <= '0';
			start_mult_mat <= '0';
--			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
--			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			start_attente_matrice <= '0';
			reset_envoie <= '0';
			start_envoie <= '0';
			termine <= '0';
			--occupe_int <= '0';
			reset_compte_envoie <= '0';
			enable_compte_envoie <= '0';
			LED_test_etat <= "10010";
			etat_suivant <= attente;
	end case;		
end process;

--*******
--déroulement :
--attendre l'opération, la latcher
--attendre le nb de donnée à lacther dans la matrice et le numéro de la matrice (0 ou 1)
--attendre les 16 bits de données de la matrice, latcher et compter le nb de donnée, vérifier si on a fini
--lorsque l'on a fini, on revient à attendre le nb de données et le numéro de matrice
--attendre les 16 bits, latcher et compter, vérifier si on a fini
--démarrer l'opération selon celle qui est dans le registre lorsque l'on a fini la récupération (compteur == 1, plusieurs compteurs)
--attendre la fin de l'opération, récupérer toutes les données dans un buffer (sur 32 bits, car la multiplication est sur 32 bits, plus grand)
--envoyer les données sur le port série
--terminer le traitement lorsque l'on a envoyé toutes les données
--*******

						
end Behavioral;


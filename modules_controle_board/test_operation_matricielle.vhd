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
           tx, occupe, termine : out  STD_LOGIC;
			  resultat_add_sous_out : out std_logic_vector(15 downto 0);
			  resultat_mult_epe_out: out std_logic_vector(31 downto 0);
			  resultat_mult_mat_out : out std_logic_vector(31 downto 0));
end test_operation_matricielle;

architecture Behavioral of test_operation_matricielle is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_operation_matricielle is (attente, latch_operation, attente_nb_data_num_matrice, latch_param, attente_data_matrice, latch_data, verif_fin_data,
														demarrer_add_sous, demarrer_mult_epe, demarrer_mult_mat, attente_operation, choix_operation, fin);
signal etat_present, etat_suivant : etat_test_operation_matricielle;

signal data_recu : std_logic_vector(7 downto 0);
signal num_ligne_mat1, num_ligne_mat2, num_col_mat2 : std_logic_vector(2 downto 0);
signal ligne_mat1, ligne_mat2, col_mat2: ligne_matrice_16bits(3 downto 0);

signal reset_buffer, new_data_int, enable_stockage_mat, enable_stockage_mat1, enable_stockage_mat2, reset_operation, start_add_sous, choix_add_sous_int,
		 data_rdy_add_sous, occupe_add_sous, termine_add_sous, start_mult_epe, data_rdy_mult_epe, occupe_mult_epe, termine_mult_epe,
		 start_mult_mat, occupe_mult_mat, termine_mult_mat, data_rdy_mult_mat, reset_compteur_param, enable_compteur_param, reset_input, enable_input,
		 num_matrice, cmp_attente_param, reset_compteur_ligne, enable_reg_op, reset_compteur_nb_data, enable_compteur_nb_data, termine_operation,
		 cmp_fin_data, compter_ligne_add_sous, compter_ligne_mult_epe : std_logic;
signal compte_ligne_int, compte_ligne_seul  : std_logic_vector(2 downto 0);
signal compte_colonne_int : std_logic_vector(2 downto 0);
signal operation, compte_param : std_logic_vector(1 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(1 downto 0);
signal nb_data_matrice, compte_nb_data : std_logic_vector(7 downto 0);

begin

--assignation signaux de sortie
occupe <= occupe_add_sous or occupe_mult_epe or occupe_mult_mat;
termine_operation <= termine_add_sous or termine_mult_epe or termine_mult_mat;

--module de communication série
com_serie_rx : serial_rx port map(clk => clk, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--module de stockage des matrices
stockage_matrice1 : matrice_NxM generic map(4,4) port map(input_element => (output_buffer_rx(1) & output_buffer_rx(0)), clk => clk, reset => (reset_buffer and reset), enable => enable_stockage_mat1,
							numero_ligne => num_ligne_mat1, ligne => ligne_mat1, numero_colonne => (others => '0'), colonne => open);
							
stockage_matrice2 : matrice_NxM generic map(4,4) port map(input_element => (output_buffer_rx(1) & output_buffer_rx(0)), clk => clk, reset => (reset_buffer and reset), enable => enable_stockage_mat2,
							numero_ligne => num_ligne_mat2, ligne => ligne_mat2, numero_colonne => num_col_mat2, colonne => col_mat2);							

--module d'addition/soustraction matricielle
add_sous_matricielle : addition_soustraction_matrice_NxM generic map(4,4) port map(clk => clk, reset => reset_operation, start => start_add_sous,
							choix_add_sous => operation(0), ligne_matrice1 => ligne_mat1, ligne_matrice2 => ligne_mat2, resultat => resultat_add_sous_out,
							donnee_prete => data_rdy_add_sous, compter_ligne => compter_ligne_add_sous, occupe => occupe_add_sous, termine => termine_add_sous);
							
--module de multiplication élément par élément
mult_epe : multiplication_epe_matrice_NxM generic map(4,4) port map(clk => clk, reset => reset_operation, start => start_mult_epe, ligne_matrice1 => ligne_mat1,
							ligne_matrice2 => ligne_mat2, resultat => resultat_mult_epe_out, donnee_prete => data_rdy_mult_epe, compter_ligne => compter_ligne_mult_epe,
							occupe => occupe_mult_epe, termine => termine_mult_epe);
							
--module de multiplication matricielle
mult_matricielle : multiplication_matricielle_NxM generic map(4,4,4) port map(clk => clk, reset => reset_operation, start => start_mult_mat, ligne_matrice1 => ligne_mat1,
							colonne_matrice2 => col_mat2, resultat => resultat_mult_mat_out, donnee_prete => data_rdy_mult_mat, occupe => occupe_mult_mat, termine => termine_mult_mat,
							compte_ligne => compte_ligne_int, compte_colonne => compte_colonne_int);

--compteur lignes
compteur_lignes : compteurNbits generic map(3) port map(clk => clk, reset => reset_compteur_ligne, enable => (data_rdy_add_sous or data_rdy_mult_epe), output => compte_ligne_seul);

--mux du numero de ligne
num_ligne_mat1 <= compte_ligne_int when operation = "11" else
						compte_ligne_seul;
						
num_ligne_mat2 <= compte_ligne_seul;

num_col_mat2 <= compte_colonne_int;

--buffer de réception du port série
buffer_rx : buffer_8xM generic map(2) port map(clk => clk, enable => new_data_int, reset => (reset_buffer and reset), input => data_recu, output => output_buffer_rx);

--registre du mode (opération)
registre_operation : registreNbits generic map(2) port map(clk => clk, reset => reset_input, en => enable_reg_op, d => output_buffer_rx(0)(1 downto 0), q_out => operation);

--registre du nombre de données de la matrice 
registre_nb_data_matrice : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => enable_input, d => output_buffer_rx(1), q_out => nb_data_matrice);

--registre du numéro de matrice
registre_numero_matrice : registre1bit port map(clk => clk, reset => reset_input, en => enable_input, d => output_buffer_rx(0)(0), q_out => num_matrice);

--compteur des paramètres recu
compteur_param : compteurNbits generic map(2) port map(clk => clk, reset => reset_compteur_param, enable => (enable_compteur_param and new_data_int), output => compte_param);

--compteur du nombre de data recu
compteur_data_recu : compteurNbits generic map(8) port map(clk => clk, reset => reset_compteur_nb_data, enable => enable_compteur_nb_data, output => compte_nb_data);

--comparateurs 
cmp_attente_param <= '1' when compte_param >= 2 else
							'0';
							
cmp_fin_data <= '1' when compte_nb_data >= nb_data_matrice else
					 '0';
								 
--multiplexer les entrées du buffer
enable_stockage_mat1 <= enable_stockage_mat when num_matrice = '0'	else
								'0';

enable_stockage_mat2 <= enable_stockage_mat when num_matrice = '1' else
								'0';
							
--machine à état de la gestion du test
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, new_data_int, cmp_attente_param, cmp_fin_data, operation, termine_operation, num_matrice)
begin
	case etat_present is
		when attente =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(new_data_int = '1') then
				etat_suivant <= latch_operation;
			else
				etat_suivant <= attente;
			end if;
			
		when latch_operation =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '1';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			etat_suivant <= attente_nb_data_num_matrice;
		
		when attente_nb_data_num_matrice =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '1';
			enable_compteur_param <= '1';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(cmp_attente_param = '1') then
				etat_suivant <= latch_param;
			else
				etat_suivant <= attente_nb_data_num_matrice;
			end if;
			
		when latch_param =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '1';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			etat_suivant <= attente_data_matrice;
			
		when attente_data_matrice =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '1';
			enable_compteur_param <= '1';
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(cmp_attente_param = '1') then
				etat_suivant <= latch_data;
			else
				etat_suivant <= attente_data_matrice;
			end if;
			
		when latch_data =>
			reset_buffer <= '1';
			enable_stockage_mat <= '1';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '1';
			termine <= '0';
			etat_suivant <= verif_fin_data;
			
		when verif_fin_data =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(cmp_fin_data = '1' and num_matrice = '0') then
				etat_suivant <= attente_nb_data_num_matrice;
			elsif(cmp_fin_data = '1' and num_matrice = '1') then
				etat_suivant <= choix_operation;
			else
				etat_suivant <= attente_data_matrice;
			end if;
			
		when choix_operation =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(operation = "00")then
				etat_suivant <= demarrer_add_sous;
			elsif(operation = "01") then
				etat_suivant <= demarrer_add_sous;
			elsif(operation = "10") then
				etat_suivant <= demarrer_mult_epe;
			else
				etat_suivant <= demarrer_mult_mat;
			end if;
			
		when demarrer_add_sous =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '1';
			start_add_sous <= '1';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			etat_suivant <= attente_operation;
			
		when demarrer_mult_epe =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '1';
			start_add_sous <= '0';
			start_mult_epe <= '1';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			etat_suivant <= attente_operation;
			
		when demarrer_mult_mat =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '1';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '1';
			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			etat_suivant <= attente_operation;
			
		when attente_operation =>
			reset_buffer <= '1';
			enable_stockage_mat <= '0';
			reset_operation <= '1';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '1';
			reset_input <= '1';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
			if(termine_operation = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_operation;
			end if;
			
		when fin =>
			reset_buffer <= '0';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_buffer <= '0';
			enable_stockage_mat <= '0';
			reset_operation <= '0';
			start_add_sous <= '0';
			start_mult_epe <= '0';
			start_mult_mat <= '0';
			reset_compteur_ligne <= '0';
			reset_input <= '0';
			enable_input <= '0';
			enable_reg_op <= '0';
			reset_compteur_param <= '0';
			enable_compteur_param <= '0';
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			termine <= '0';
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


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
           tx, occupe, termine : out  STD_LOGIC);
end test_operation_matricielle;

architecture Behavioral of test_operation_matricielle is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

signal input_mat1, input_mat2 : std_logic_vector(15 downto 0);
signal data_recu : std_logic_vector(7 downto 0);
signal num_ligne_mat1, num_ligne_mat2, num_col_mat1, num_col_mat2 : std_logic_vector(1 downto 0);
signal ligne_mat1, ligne_mat2, col_mat1, col_mat2, resultat_add_sous: ligne_matrice_16bits(3 downto 0);
signal resultat_mult_epe : ligne_matrice_32bits(3 downto 0);
signal resultat_mult_mat : std_logic_vector(31 downto 0);

signal reset_buffer, new_data_int, enable_stockage_mat1, enable_stockage_mat2, reset_operation, start_add_sous, choix_add_sous_int,
		 data_rdy_add_sous, occupe_add_sous, termine_add_sous, start_mult_epe, data_rdy_mult_epe, occupe_mult_epe, termine_mult_epe,
		 start_mult_mat, occupe_mult_mat, termine_mult_mat, data_rdy_mult_mat: std_logic;

begin

--assignation signaux de sortie
occupe <= occupe_add_sous or occupe_mult_epe or occupe_mult_mat;
termine <= termine_add_sous or termine_mult_epe or termine_mult_mat;

--module de communication série
com_serie_rx : serial_rx port map(clk => clk, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--module de stockage des matrices
stockage_matrice1 : matrice_NxM generic map(4,4) port map(input_element => input_mat1, clk => clk, reset => reset_buffer, enable => enable_stockage_mat1,
							numero_ligne => num_ligne_mat1, ligne => ligne_mat1, numero_colonne => num_col_mat1, colonne => col_mat1);
							
stockage_matrice2 : matrice_NxM generic map(4,4) port map(input_element => input_mat2, clk => clk, reset => reset_buffer, enable => enable_stockage_mat2,
							numero_ligne => num_ligne_mat2, ligne => ligne_mat2, numero_colonne => num_col_mat2, colonne => col_mat2);							

--module d'addition/soustraction matricielle
add_sous_matricielle : addition_soustraction_matrice_NxM generic map(4,4) port map(clk => clk, reset => reset_operation, start => start_add_sous,
							choix_add_sous => choix_add_sous_int, ligne_matrice1 => ligne_mat1, ligne_matrice2 => ligne_mat2, ligne_resultat => resultat_add_sous,
							donnee_prete => data_rdy_add_sous, occupe => occupe_add_sous, termine => termine_add_sous);
							
--module de multiplication élément par élément
mult_epe : multiplication_epe_matrice_NxM generic map(4,4) port map(clk => clk, reset => reset_operation, start => start_mult_epe, ligne_matrice1 => ligne_mat1,
							ligne_matrice2 => ligne_mat2, ligne_resultat => resultat_mult_epe, donnee_prete => data_rdy_mult_epe, occupe => occupe_mult_epe, termine => termine_mult_epe);
							
--module de multiplication matricielle
mult_matricielle : multiplication_matricielle_NxM generic map(4,4,4) port map(clk => clk, reset => reset_operation, start => start_mult_mat, ligne_matrice1 => ligne_mat1,
							colonne_matrice2 => col_mat2, resultat => resultat_mult_mat, donnee_prete => data_rdy_mult_mat, occupe => occupe_mult_mat, termine => termine_mult_mat);

--compteur colonnes
--compteur_colonne : compteurNbits generic map(clk => clk, reset => reset_compteur_op, enable => 
end Behavioral;


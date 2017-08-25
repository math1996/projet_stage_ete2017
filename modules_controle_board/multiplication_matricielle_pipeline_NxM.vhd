----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:05 08/22/2017 
-- Design Name: 
-- Module Name:    multiplication_matricielle_pipeline_NxM - Behavioral 
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
use IEEE.math_real.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplication_matricielle_pipeline_NxM_MxS is
generic(N,M,S: integer := 4; largeur_data  : integer := 16);
    Port ( clk, start, reset : in  STD_LOGIC;
           element_mat1 : in  STD_LOGIC_VECTOR (largeur_data - 1 downto 0);
           element_mat2 : in  STD_LOGIC_VECTOR (largeur_data - 1 downto 0);
           numero_element_mat1 : out  STD_LOGIC_VECTOR ((integer(ceil(log2(real(N*M))))) - 1 downto 0);
           numero_element_mat2 : out  STD_LOGIC_VECTOR ((integer(ceil(log2(real(M*S))))) - 1 downto 0);
			  resultat : out std_logic_vector((2*largeur_data) - 1 downto 0);
           occupe, termine, data_rdy, changer_element : out  STD_LOGIC);
end multiplication_matricielle_pipeline_NxM_MxS;
 
architecture Behavioral of multiplication_matricielle_pipeline_NxM_MxS is

type etat_mult_mat_pipeline is (attente, latch_data, multiplier, additionner, verif_fin_avance, verif_fin_col, verif_fin_ligne, compter_col,
												compter_ligne, compter_avance, changer_element_etat, latch_numero, fin);
signal etat_present, etat_suivant : etat_mult_mat_pipeline;

signal reset_compte_ligne, enable_compte_ligne, reset_compte_col, enable_compte_col, reset_compte_avance, enable_compte_avance,
		reset_reg_add, enable_reg_add, reset_numero, enable_numero, reset_input, enable_input, cmp_fin_avance, cmp_fin_col, cmp_fin_ligne: std_logic;
signal compte_ligne : std_logic_vector(integer(ceil(log2(real(N*M)))) -1  downto 0);
signal element_mat1_int, element_mat2_int, element_mat1_unsigned, element_mat2_unsigned : std_logic_vector(largeur_data -1 downto 0);
signal compte_col : std_logic_vector(integer(ceil(log2(real(M*S)))) -1  downto 0);
signal compte_avance : std_logic_vector((integer(ceil(log2(real(M))))) downto 0);
signal multiplication_element, multiplication_element_unsigned, addition_element, reg_addition_element : std_logic_vector((2*largeur_data) - 1 downto 0);
signal mult_numero_mat1, numero_element_mat1_int : std_logic_vector(2*(integer(ceil(log2(real(N*M))))) -1  downto 0);
signal mult_numero_mat2 : std_logic_vector((integer(ceil(log2(real(M*S)))) + (integer(ceil(log2(real(M)))))) downto 0);
signal numero_element_mat2_int : std_logic_vector((integer(ceil(log2(real(M*S)))) + (integer(ceil(log2(real(M)))))) downto 0);

begin



--compteur ligne
compteur_ligne : compteurNbits generic map(integer(ceil(log2(real(N*M))))) port map(clk => clk, reset => reset_compte_ligne, enable => enable_compte_ligne, output => compte_ligne);

--compteur colonne
compteur_colonne : compteurNbits generic map(integer(ceil(log2(real(M*S))))) port map(clk => clk, reset => reset_compte_col, enable => enable_compte_col, output => compte_col);

--compteur d'avance dans la ligne/colonne
compteur_avance : compteurNbits generic map((integer(ceil(log2(real(M))))) + 1) port map(clk => clk, reset => reset_compte_avance, enable => enable_compte_avance, output => compte_avance);

--additionneur
addition_element <= multiplication_element + reg_addition_element;

--multiplication
--ajouter des registres entre pour augmenter la fréquence!!!
element_mat1_unsigned <= (not(element_mat1_int) + 1) when element_mat1_int(largeur_data -1) = '1' else
								 element_mat1_int;
								 
element_mat2_unsigned <= (not(element_mat2_int) + 1) when element_mat2_int(largeur_data -1) = '1' else
								 element_mat2_int;
								 
multiplication_element_unsigned <= element_mat1_unsigned * element_mat2_unsigned;

multiplication_element <= multiplication_element_unsigned when (element_mat1_int(largeur_data -1) = '0' and element_mat2_int(largeur_data -1) = '0') else
								  multiplication_element_unsigned when (element_mat1_int(largeur_data -1) = '1' and element_mat2_int(largeur_data -1) = '1') else
								  not(multiplication_element_unsigned) + 1;  

--registre gardant le résultat de l'addition successive (résultat de le multiplication matricielle
reg_addition_elements : registreNbits generic map(2*largeur_data) port map(clk => clk, reset => reset_reg_add, en => enable_reg_add, d => addition_element, q_out => reg_addition_element);

--registre du numéro de l'élément de la matrice 1 que l'on veux avoir
reg_numero_element1 : registreNbits generic map(integer(ceil(log2(real(N*M))))) port map(clk => clk, reset => reset_numero, en => enable_numero, d => numero_element_mat1_int(integer(ceil(log2(real(M*N)))) - 1 downto 0),
																														q_out => numero_element_mat1);
																													
																														
--registre du numéro de l'élément de la matrice
reg_numero_element2 : registreNbits generic map(integer(ceil(log2(real(M*S))))) port map(clk => clk, reset => reset_numero, en => enable_numero, d => numero_element_mat2_int(integer(ceil(log2(real(M*S)))) - 1 downto 0),
																														q_out => numero_element_mat2);																														

--conversion du numéro de ligne et compteur avance pour la matrice 1
mult_numero_mat1 <= std_logic_vector(to_unsigned(M, integer(ceil(log2(real(N*M)))))) * compte_ligne;
numero_element_mat1_int <= mult_numero_mat1 + compte_avance;

--conversion du numéro de colonne et compteur avance pour la matrice 2
mult_numero_mat2 <= std_logic_vector(to_unsigned(S, integer(ceil(log2(real(M*S)))))) * compte_avance;
numero_element_mat2_int <= mult_numero_mat2 + compte_col;

--registres du latching des elements à multiplier
reg_element_mat1 : registreNbits generic map(largeur_data) port map(clk => clk, reset => reset_input, en => enable_input, d => element_mat1, q_out => element_mat1_int);

reg_element_mat2 : registreNbits generic map(largeur_data) port map(clk => clk, reset => reset_input, en => enable_input, d => element_mat2, q_out => element_mat2_int);

--comparateur
cmp_fin_avance <= '1' when compte_avance >= (M-1) else
						'0';
						
cmp_fin_col <= '1' when compte_col >= (S-1) else
					'0';
					
cmp_fin_ligne <= '1' when compte_ligne >= (N-1) else
					  '0';
					  
--sortie	
resultat <= reg_addition_element;
				  
--machine à état de la multiplication matricielle
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin_avance, cmp_fin_ligne, cmp_fin_col)
begin
	case etat_present is
		when attente =>
			reset_input <= '0';
			enable_input <= '0';
			reset_compte_ligne <= '0';
			enable_compte_ligne <= '0';
			reset_compte_col <= '0';
			enable_compte_col <= '0';
			reset_compte_avance <= '0';
			enable_compte_avance <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			reset_numero <= '0';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= latch_data;
			else
				etat_suivant <= attente;
			end if;
		
		when latch_data =>
			reset_input <= '1';
			enable_input <= '1';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= multiplier;
			
		when multiplier =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= additionner;
			
		when additionner =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '1';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= verif_fin_avance;
			
		when verif_fin_avance =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_avance = '1') then
				etat_suivant <= verif_fin_col;
			else
				etat_suivant <= compter_avance;
			end if;
			
		when compter_avance =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '1';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_numero;
			
		when latch_numero =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '1';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= changer_element_etat;
			
		when changer_element_etat =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '1';
			data_rdy <= '0';
			changer_element <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_data;
			
		when verif_fin_col =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '1';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_col = '1') then
				etat_suivant <= verif_fin_ligne;
			else
				etat_suivant <= compter_col;
			end if;
			
		when compter_col =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '1';
			reset_compte_avance <= '0';
			enable_compte_avance <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_numero;
			
		when verif_fin_ligne =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '0';
			reset_compte_col <= '1';
			enable_compte_col <= '0';
			reset_compte_avance <= '1';
			enable_compte_avance <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_ligne = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= compter_ligne;
			end if;
			
		when compter_ligne =>
			reset_input <= '1';
			enable_input <= '0';
			reset_compte_ligne <= '1';
			enable_compte_ligne <= '1';
			reset_compte_col <= '0';
			enable_compte_col <= '0';
			reset_compte_avance <= '0';
			enable_compte_avance <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			reset_numero <= '1';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_numero;
			
		when fin =>
			reset_input <= '0';
			enable_input <= '0';
			reset_compte_ligne <= '0';
			enable_compte_ligne <= '0';
			reset_compte_col <= '0';
			enable_compte_col <= '0';
			reset_compte_avance <= '0';
			enable_compte_avance <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			reset_numero <= '0';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '0';
			termine <= '1';
			etat_suivant <= attente;
			
		when others => 
			reset_input <= '0';
			enable_input <= '0';
			reset_compte_ligne <= '0';
			enable_compte_ligne <= '0';
			reset_compte_col <= '0';
			enable_compte_col <= '0';
			reset_compte_avance <= '0';
			enable_compte_avance <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			reset_numero <= '0';
			enable_numero <= '0';
			data_rdy <= '0';
			changer_element <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
		
	end case;
end process;	

end Behavioral;


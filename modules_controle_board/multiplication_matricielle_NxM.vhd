----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:07 07/21/2017 
-- Design Name: 
-- Module Name:    multiplication_matricielle_NxM - Behavioral 
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

entity multiplication_matricielle_NxM is
	generic(N, M, S : integer := 4);
    Port ( clk, reset, start : in  STD_LOGIC;
           ligne_matrice1, colonne_matrice2 : in  ligne_matrice_16bits (S-1 downto 0);
           resultat : out  STD_LOGIC_VECTOR (31 downto 0);
           donnee_prete, occupe, termine : out  STD_LOGIC);
end multiplication_matricielle_NxM;

architecture Behavioral of multiplication_matricielle_NxM is

type etat_mult_matricielle is (attente, multiplication, addition_etat, latch_res, verif_fin, fin);

signal res_mult_unsigned, res_mult_int : ligne_matrice_32bits(S-1 downto 0);
signal ligne_matrice1_int, colonne_matrice2_int : ligne_matrice_16bits(S-1 downto 0);
signal etat_present, etat_suivant : etat_mult_matricielle;
signal compte_nb_ligne : std_logic_vector((integer(ceil(log2(real(N*M))))) downto 0);
signal compte_parcour : std_logic_vector((integer(ceil(log2(real(S))))) - 1 downto 0);
signal res_addition, reg_addition_out, addition : std_logic_vector(63 downto 0);
signal reset_compteur, reset_reg, enable_compteur, enable_reg, cmp_fin, reset_reg_add, enable_reg_add, cmp_fin_add : std_logic;
signal signe, data_add : std_logic_vector(31 downto 0);
begin

--compteur du nombre d'�l�ment calcul�
compteur_nb_lignes : compteurNbits generic map(integer(ceil(log2(real(N*M)))) + 1) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_nb_ligne);

--g�n�rer les multiplieurs
gen_mult : for i in 0 to S-1 generate
	--mux pour enlever le signe si besoin
	mux_mat1 : mux_add_sous_matrice_Nbits generic map(16) port map(choix => ligne_matrice1(i)(15), d0 => ligne_matrice1(i), d1 => (not(ligne_matrice1(i)) + 1),
																				 output => ligne_matrice1_int(i));
	mux_mat2: mux_add_sous_matrice_Nbits generic map(16) port map(choix => colonne_matrice2(i)(15), d0 => colonne_matrice2(i), d1 => (not(colonne_matrice2(i)) + 1),
																			 output => colonne_matrice2_int(i));
	
	--multiplication sans signe
	res_mult_unsigned(i) <= ligne_matrice1_int(i) * colonne_matrice2_int(i);		

	--ajuster le signe
	res_mult_int(i) <= res_mult_unsigned(i) when ligne_matrice1(i)(15) = '0' and colonne_matrice2(i)(15) = '0' else
							 (not(res_mult_unsigned(i)) + 1) when ligne_matrice1(i)(15) = '0' and colonne_matrice2(i)(15) = '1' else
							 (not(res_mult_unsigned(i)) + 1) when ligne_matrice1(i)(15) = '1' and colonne_matrice2(i)(15) = '0' else
							 res_mult_unsigned(i);
end generate gen_mult;

--additionneur en r�troaction
res_addition <= reg_addition_out + addition;

registre_res_addition : registreNbits generic map(64) port map(clk => clk, reset => reset_reg_add, en => enable_reg_add, d => res_addition,
																					q_out => reg_addition_out);

--compteur du parcour des r�sultats de la Multiplication
compteur_parcour : compteurNbits generic map((integer(ceil(log2(real(S)))))) port map(clk => clk, reset => reset_reg_add, enable => enable_reg_add, output => compte_parcour);
			
--mux du parcour des r�sultats de la multiplication
signe <= (others => '0') when data_add(31) = '0' else
			(others => '1');
			
data_add <= res_mult_int(to_integer(unsigned(compte_parcour)));

addition <=  signe & data_add;

--registre sortie
registre_sortie : registreNbits generic map(32) port map(clk => clk, reset => reset_reg, en => enable_reg, d => reg_addition_out(31 downto 0), q_out => resultat);

--comparateur
cmp_fin <= '1' when compte_nb_ligne >= (N*M) else
			  '0';
			  
cmp_fin_add <= '1' when compte_parcour >= (S-1) else
					'0';

--machine � �tat de la gestion du calcul
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin, cmp_fin_add)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '0';
			enable_reg <= '0';
			occupe <= '0';
			termine <= '0';
			donnee_prete <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			if(start = '1') then
				etat_suivant <= multiplication;
			else
				etat_suivant <= attente;
			end if;
			
		when multiplication =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_reg <= '1';
			enable_reg <= '0';
			occupe <= '1';
			termine <= '0';
			donnee_prete <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			etat_suivant <= addition_etat;
		
		when addition_etat =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_reg <= '1';
			enable_reg <= '0';
			occupe <= '1';
			termine <= '0';
			donnee_prete <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '1';
			if(cmp_fin_add = '1') then
				etat_suivant <= latch_res;
			else
				etat_suivant <= addition_etat;
			end if;
			
		when latch_res =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_reg <= '1';
			enable_reg <= '1';
			occupe <= '1';
			termine <= '0';
			donnee_prete <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			etat_suivant <= verif_fin;
			
		when verif_fin =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_reg <= '1';
			enable_reg <= '0';
			occupe <= '1';
			termine <= '0';
			donnee_prete <= '1';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= multiplication;
			end if;
			
		when fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '0';
			enable_reg <= '0';
			occupe <= '0';
			termine <= '1';
			donnee_prete <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			etat_suivant <= attente;
		
		when others =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '0';
			enable_reg <= '0';
			occupe <= '0';
			termine <= '0';
			donnee_prete <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			etat_suivant <= attente;
	end case;				
end process;
end Behavioral;


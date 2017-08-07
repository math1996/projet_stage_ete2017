----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:36 07/19/2017 
-- Design Name: 
-- Module Name:    addition_soustraction_matrice_NxN - Behavioral 
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

entity addition_soustraction_matrice_NxM is
	generic(N, M : integer := 4);
    Port ( clk, reset, start, choix_add_sous : in  STD_LOGIC;
           ligne_matrice1, ligne_matrice2 : in  ligne_matrice_16bits (M-1 downto 0);
           resultat : out  std_logic_vector(15 downto 0);
           donnee_prete, compter_ligne, occupe, termine : out  STD_LOGIC);
end addition_soustraction_matrice_NxM;

architecture Behavioral of addition_soustraction_matrice_NxM is

type etat_add_sous_mat is (attente, addition, latch_res, avancer_ligne, verif_fin, fin);
signal etat_present, etat_suivant : etat_add_sous_mat;
signal compte_nb_ligne : std_logic_vector((integer(ceil(log2(real(N))))) downto 0);
signal compte_nb_col : std_logic_vector((integer(ceil(log2(real(M))))) downto 0);
signal res_add_sous, ligne_matrice2_int  : ligne_matrice_16bits(M-1 downto 0);
signal reset_compteur, reset_reg, enable_compteur, enable_reg, cmp_fin, cmp_fin_col, reset_sortie, enable_sortie  : std_logic;

begin

--sortie
donnee_prete <= enable_sortie;
compter_ligne <= enable_compteur;

--mux pour parcourir la colonne
resultat <= res_add_sous(to_integer(unsigned((M-1) - compte_nb_col)));

--compteur du nombre de lignes additionnées
compteur_nb_lignes : compteurNbits generic map(integer(ceil(log2(real(N)))) + 1) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_nb_ligne);

--compteur du nombre d'éléments sur une colonne
compteur_nb_element_col : compteurNbits generic map(integer(ceil(log2(real(M)))) + 1) port map(clk => clk, reset => reset_sortie, enable => enable_sortie, output => compte_nb_col);

--génération des registres de sortie et de l'addition/soustraction
gen_module : for i in 0 to M-1 generate
	mux : mux_add_sous_matrice_Nbits generic map(16) port map(choix => choix_add_sous, d0 => ligne_matrice2(i), d1 => (not(ligne_matrice2(i)) + 1),
																				 output => ligne_matrice2_int(i));
	res_add_sous(i) <= ligne_matrice1(i) + ligne_matrice2_int(i);
end generate gen_module;

--comparateur
cmp_fin <= '1' when compte_nb_ligne >= N else
			  '0';

cmp_fin_col <= '1' when compte_nb_col >= M-1 else
						'0';

--machine à état de la gestion du calcul
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin, cmp_fin_col)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= addition;
			else
				etat_suivant <= attente;
			end if;
			
		when addition =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= latch_res;
			
		when latch_res =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_sortie <= '1';
			enable_sortie <= '1';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_col = '1') then
				etat_suivant <= avancer_ligne;
			else
					etat_suivant <= latch_res;
			end if;
		
		when avancer_ligne =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= verif_fin;
			
		when verif_fin =>
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= addition;
			end if;
			
		when fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
		
		when others =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;				
end process;
end Behavioral;


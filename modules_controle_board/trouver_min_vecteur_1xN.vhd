----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:59 08/07/2017 
-- Design Name: 
-- Module Name:    trouver_min_vecteur_1xN - Behavioral 
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

entity trouver_min_vecteur_1xN is
generic(N : integer := 3);
    Port ( clk, reset, start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           position_min : out  STD_LOGIC_VECTOR ((integer(ceil(log2(real(N))))) downto 0);
           enable_decalage, occupe, termine : out  STD_LOGIC);
end trouver_min_vecteur_1xN;

architecture Behavioral of trouver_min_vecteur_1xN is

type etat_min is (attente, latch_min, compter, comparaison, fin_min, fin);
signal etat_present, etat_suivant : etat_min;

signal reset_min, enable_min, reset_sortie, enable_sortie, reset_compte, enable_compte, cmp_min, cmp_fin : std_logic;
signal data_in_int, minimum : std_logic_vector(31 downto 0);
signal compte_position : std_logic_vector((integer(ceil(log2(real(N))))) downto 0);

begin

--sortie
enable_decalage <= enable_compte;

--valeur absolue
data_in_int <= not(data_in) + 1 when data_in(31) = '1' else
					data_in;
					
--comparaison
cmp_min <= '1' when 	data_in_int < minimum else
			  '0';
			  
cmp_fin <= '1' when compte_position >= (N-1) else
			  '0';
			  
--registre minimum
registre_minimum : registreNbits generic map(32) port map(clk => clk, reset => reset_min, en => enable_min, d => data_in_int, q_out => minimum);

--registre position minimum
registre_pos_min : registreNbits generic map((integer(ceil(log2(real(N))))) + 1) port map(clk => clk, reset => reset_sortie, en => enable_sortie, d => compte_position, q_out => position_min);

--compteur de l'indice
compteur_indice : compteurNbits generic map((integer(ceil(log2(real(N))))) + 1) port map(clk => clk, reset => reset_compte, enable => enable_compte, output => compte_position);

--machine à état de l'algorithme du minimum
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_min, cmp_fin)
begin
	case etat_present is
		when attente =>
			reset_min <= '0';
			enable_min <= '0';
			reset_sortie <= '0';
			enable_sortie <= '0';
			reset_compte <= '0';
			enable_compte <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= latch_min;
			else
				etat_suivant <= attente;
			end if;
			
		when latch_min =>
			reset_min <= '1';
			enable_min <= '1';
			reset_sortie <= '1';
			enable_sortie <= '1';
			reset_compte <= '1';
			enable_compte <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= compter;
			
		when compter =>
			reset_min <= '1';
			enable_min <= '0';
			reset_sortie <= '1';
			enable_sortie <= '0';
			reset_compte <= '1';
			enable_compte <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= comparaison;
			
		when comparaison =>
			reset_min <= '1';
			enable_min <= '0';
			reset_sortie <= '1';
			enable_sortie <= '0';
			reset_compte <= '1';
			enable_compte <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_min = '1' and cmp_fin = '0') then
				etat_suivant <= latch_min;
			elsif(cmp_min = '0' and cmp_fin = '0') then
				etat_suivant <= compter;
			elsif(cmp_min = '0' and cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= fin_min;
			end if;
			
		when fin_min =>
			reset_min <= '1';
			enable_min <= '1';
			reset_sortie <= '1';
			enable_sortie <= '1';
			reset_compte <= '1';
			enable_compte <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= fin;
		
		when fin =>
			reset_min <= '0';
			enable_min <= '0';
			reset_sortie <= '1';
			enable_sortie <= '0';
			reset_compte <= '0';
			enable_compte <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_min <= '0';
			enable_min <= '0';
			reset_sortie <= '1';
			enable_sortie <= '0';
			reset_compte <= '0';
			enable_compte <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;	
end process;

end Behavioral;


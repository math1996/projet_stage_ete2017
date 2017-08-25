----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:18 08/11/2017 
-- Design Name: 
-- Module Name:    FSM_recup_matrice_rx - Behavioral 
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

entity FSM_recup_matrice_rx is
    Port ( clk, reset, start, new_data_int : in  STD_LOGIC;
           nb_data : in  STD_LOGIC_VECTOR (7 downto 0);
           latch_data, termine, occupe : out  STD_LOGIC);
end FSM_recup_matrice_rx;

architecture Behavioral of FSM_recup_matrice_rx is

type etat_recup_matrice_rx is (attente, attente_data, latch_data_etat, verif_data, fin);
signal etat_present, etat_suivant : etat_recup_matrice_rx;

signal reset_compteur_buffer, enable_compteur_buffer, reset_compteur_nb_data, enable_compteur_nb_data, cmp_attente_buffer, cmp_fin_data : std_logic;
signal compte_buffer : std_logic_vector(1 downto 0);
signal compte_nb_data : std_logic_vector(7 downto 0);

signal enable_compteur_buffer_int : std_logic;

begin

enable_compteur_buffer_int <= enable_compteur_buffer and new_data_int;

--compteur des paramètres recu
compteur_buffer_data: compteurNbits generic map(2) port map(clk => clk, reset => reset_compteur_buffer, enable => enable_compteur_buffer_int, output => compte_buffer);

--compteur du nombre de data recu
compteur_data_recu : compteurNbits generic map(8) port map(clk => clk, reset => reset_compteur_nb_data, enable => enable_compteur_nb_data, output => compte_nb_data);

--comparateurs 
cmp_attente_buffer <= '1' when compte_buffer >= 2 else
							'0';
							
cmp_fin_data <= '1' when compte_nb_data >= nb_data else
					 '0';

--machine à état de la récupération d'une matrice				 
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;					 

process(etat_present, start, cmp_attente_buffer, cmp_fin_data)
begin
	case etat_present is
		when attente =>
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			reset_compteur_buffer <= '0';
			enable_compteur_buffer <= '0';
			latch_data <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= attente_data;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_data =>
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '0';
			reset_compteur_buffer <= '1';
			enable_compteur_buffer <= '1';
			latch_data <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_attente_buffer = '1') then
				etat_suivant <= latch_data_etat;
			else
				etat_suivant <= attente_data;
			end if;
			
		when latch_data_etat =>
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '1';
			reset_compteur_buffer <= '0';
			enable_compteur_buffer <= '0';
			latch_data <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= verif_data;
			
		when verif_data =>
			reset_compteur_nb_data <= '1';
			enable_compteur_nb_data <= '0';
			reset_compteur_buffer <= '0';
			enable_compteur_buffer <= '0';
			latch_data <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_data = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_data;
			end if;
			
		when fin =>
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			reset_compteur_buffer <= '0';
			enable_compteur_buffer <= '0';
			latch_data <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_compteur_nb_data <= '0';
			enable_compteur_nb_data <= '0';
			reset_compteur_buffer <= '0';
			enable_compteur_buffer <= '0';
			latch_data <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;	
	end case;
end process;						 
end Behavioral;


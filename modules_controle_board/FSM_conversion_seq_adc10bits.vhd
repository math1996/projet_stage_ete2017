----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:31 06/14/2017 
-- Design Name: 
-- Module Name:    FSM_conversion_seq_adc10bits - Behavioral 
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

entity FSM_conversion_seq_adc10bits is
    Port ( clk, reset, start, termine_conversion : in  STD_LOGIC;
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           sequence : in  STD_LOGIC_VECTOR (7 downto 0);
           start_conversion, occupe, termine : out  STD_LOGIC;
           canal_conversion : out  STD_LOGIC_VECTOR (2 downto 0));
end FSM_conversion_seq_adc10bits;

architecture Behavioral of FSM_conversion_seq_adc10bits is

type etat_conv_seq_adc10bits is (attente, verification_sequence, compter_sequence, demarrer_conversion, attente_conversion, compter_cycle, verification_fin, fin);
signal etat_present, etat_suivant : etat_conv_seq_adc10bits;

signal cmp_fin, cmp_seq, cmp_fin_sequence, reset_compteur_seq, enable_compteur_seq, reset_compteur_nb_cycle, enable_compteur_nb_cycle : std_logic;
signal compte_seq : std_logic_vector(2 downto 0);
signal compte_nb_cycle : std_logic_vector(31 downto 0);
signal compte_nb_canaux : std_logic_vector(3 downto 0);


begin

--compteur g�n�rant la s�quence de canal � convertir
compteur_seq_canaux : compteurNbits generic map(3) port map(clk => clk, reset => reset_compteur_seq, enable => enable_compteur_seq, output => compte_seq);

--compteur du nombre de cycle de conversion fait
compteur_nb_cycle_conv : compteurNbits generic map(32) port map(clk => clk, reset => reset_compteur_nb_cycle, enable => enable_compteur_nb_cycle, output => compte_nb_cycle);

--mux de la s�quence de canaux
cmp_seq <= sequence(7) when compte_seq = "000" else
			  sequence(6) when compte_seq = "001" else
			  sequence(5) when compte_seq = "010" else
			  sequence(4) when compte_seq = "011" else
			  sequence(3) when compte_seq = "100" else
			  sequence(2) when compte_seq = "101" else
			  sequence(1) when compte_seq = "110" else
			  sequence(0);
			  
--mux de d�codage du canal
canal_conversion <=  "000" when compte_seq = "000" else
							"100" when compte_seq = "001" else
							"001" when compte_seq = "010" else
							"101" when compte_seq = "011" else
							"010" when compte_seq = "100" else
							"110" when compte_seq = "101" else
							"011" when compte_seq = "110" else
							"111";
							
--comparateurs 
cmp_fin <= '1' when compte_nb_cycle >= nb_cycle_conversion else
					'0';

--machine � �tat de la conversion s�quentielle
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, termine_conversion, cmp_fin, cmp_seq, cmp_fin_sequence)
begin
	case etat_present is
		when attente =>
			reset_compteur_seq <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= verification_sequence;
			else
				etat_suivant <= attente;
			end if;
			
		when verification_sequence =>
			reset_compteur_seq <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_seq = '1') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= compter_sequence;
			end if;
		
		when compter_sequence =>
			reset_compteur_seq <= '1';
			enable_compteur_seq <= '1';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= verification_sequence;
			
		when demarrer_conversion =>
			reset_compteur_seq <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion;
			
		when attente_conversion =>
			reset_compteur_seq <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			if(termine_conversion = '1') then
				etat_suivant <= compter_cycle;
			else
				etat_suivant <= attente_conversion;
			end if;
			
		when compter_cycle =>
			reset_compteur_seq <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '1';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= verification_fin;
			
		when verification_fin =>
			reset_compteur_seq <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= verification_sequence;
			end if;
			
		when fin =>
			reset_compteur_seq <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
		
		when others =>
			reset_compteur_seq <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;		
end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:08 06/07/2017 
-- Design Name: 
-- Module Name:    FSM_controle_mode_adc_12bits - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_controle_mode_adc_12bits is
    Port ( clk, reset, start, termine_conversion_canal, fin_conversion : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
			  nb_canaux : in std_logic_vector(3 downto 0);
           start_1CH, start_seq, arret, occupe, termine, enable_input, reset_input : out  STD_LOGIC);
end FSM_controle_mode_adc_12bits;

architecture Behavioral of FSM_controle_mode_adc_12bits is

type etat_ctrl_mode_adc12bits is (attente, choix_mode_load_input, demarrer_conversion_mode1, demarrer_conversion_seq, attente_conversion_mode1,
											 attente_conversion_seq, arret_conversion, fin, compter_cycle_conversion);
signal etat_present, etat_suivant : etat_ctrl_mode_adc12bits;

signal enable_compteur_nb_cycle_conv, reset_compteur_nb_cycle_conv, enable_compteur_nb_canaux_conv,
		 reset_compteur_nb_canaux_conv, cmp_fin_conversion, cmp_nb_canaux_converti : std_logic;
signal compte_nb_cycle_conversion : std_logic_vector(31 downto 0);
signal compte_nb_canaux_conv : std_logic_vector(3 downto 0);

begin

--compteur du nb de cycle de conversion
compteur_nb_cycle_conversion : compteurNbits generic map(32) port map(clk => clk, enable => enable_compteur_nb_cycle_conv,
																							reset => reset_compteur_nb_cycle_conv, output => compte_nb_cycle_conversion);

--compteur du nb de canal converti
compteur_nb_canaux_converti : compteurNbits generic map(4) port map(clk => clk, enable => enable_compteur_nb_canaux_conv,
																						 reset => reset_compteur_nb_canaux_conv, output => compte_nb_canaux_conv);

--comparateurs
cmp_fin_conversion <= '1' when 	compte_nb_cycle_conversion >= nb_cycle_conversion else
							 '0';
							 
cmp_nb_canaux_converti <= '1' when compte_nb_canaux_conv >= nb_canaux else
								  '0';
																						 
--machine à état du contrôle des modes
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, mode, start, termine_conversion_canal, fin_conversion, cmp_fin_conversion, cmp_nb_canaux_converti)
begin
	case etat_present is
		when attente =>
			reset_input <= '0';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= choix_mode_load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when choix_mode_load_input =>
			reset_input <= '1';
			enable_input <= '1';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			if(mode = "01") then
				etat_suivant <= demarrer_conversion_mode1;
			elsif(mode = "10") then
				etat_suivant <= demarrer_conversion_seq;
			elsif(mode = "11") then
				etat_suivant <= demarrer_conversion_seq;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_conversion_mode1 =>
			reset_input <= '1';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '1';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion_mode1;
			
		when attente_conversion_mode1 =>
			reset_input <= '1';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= termine_conversion_canal;
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_conversion = '1') then
				etat_suivant <= arret_conversion;
			else
				etat_suivant <= attente_conversion_mode1;
			end if;
			
		when demarrer_conversion_seq =>
			reset_input <= '1';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '1';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion_seq;
			
		when attente_conversion_seq =>
			reset_input <= '1';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_canaux_conv <= termine_conversion_canal;
			reset_compteur_nb_canaux_conv <= '1';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_nb_canaux_converti = '1' and cmp_fin_conversion = '1') then
				etat_suivant <= arret_conversion;
			elsif(cmp_nb_canaux_converti = '1' and cmp_fin_conversion = '0') then
				etat_suivant <= compter_cycle_conversion;
			else
				etat_suivant <= attente_conversion_seq;
			end if;
			
		when compter_cycle_conversion =>
			reset_input <= '1';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '1';
			reset_compteur_nb_cycle_conv <= '1';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion_seq;
			
		when arret_conversion =>
			reset_input <= '0';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '1';
			occupe <= '1';
			termine <= '0';
			if(fin_conversion = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= arret_conversion;
			end if;
			
		when fin =>
			reset_input <= '0';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_input <= '0';
			enable_input <= '0';
			enable_compteur_nb_cycle_conv <= '0';
			reset_compteur_nb_cycle_conv <= '0';
			enable_compteur_nb_canaux_conv <= '0';
			reset_compteur_nb_canaux_conv <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			arret <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;				
end process;

end Behavioral;


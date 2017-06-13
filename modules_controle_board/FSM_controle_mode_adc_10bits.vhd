----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:42 06/13/2017 
-- Design Name: 
-- Module Name:    FSM_controle_mode_adc_10bits - Behavioral 
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

entity FSM_controle_mode_adc_10bits is
    Port ( clk, reset, start, termine_conversion_canal : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
			  sequence : in std_logic_vector(7 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_canaux : in  STD_LOGIC_VECTOR (3 downto 0);
			  canal_conversion : in std_logic_vector(2 downto 0);
			  canal_a_convertir : out std_logic_vector(2 downto 0);
           occupe, termine, enable_input, reset_input, start_conversion : out  STD_LOGIC);
end FSM_controle_mode_adc_10bits;

architecture Behavioral of FSM_controle_mode_adc_10bits is

type etat_fsm_mode_adc10bits is (attente, load_input, choix_mode, demarrer_conv_1CH, attente_conversion_1CH, verification_fin_1CH, demarrer_conv_seq, fin,
											verification_seq, compter_seq, attente_conv_seq, verification_fin_sequence, compter_cycle_conversion, verification_fin_conv_seq);
signal etat_present, etat_suivant : etat_fsm_mode_adc10bits;

signal reset_compteur_seq, enable_compteur_seq, reset_compteur_nb_cycle, enable_compteur_nb_cycle, reset_compteur_nb_canaux, enable_compteur_nb_canaux,
		 cmp_seq, cmp_fin_1CH, cmp_fin_sequence, cmp_fin_conv_seq: std_logic;

signal compte_seq, choix_canal_conversion : std_logic_vector(2 downto 0);
signal compte_nb_cycle : std_logic_vector(31 downto 0);
signal compte_nb_canaux : std_logic_vector(3 downto 0);


begin

--compteur générant la séquence de canal à convertir
compteur_seq_canaux : compteurNbits generic map(3) port map(clk => clk, reset => reset_compteur_seq, enable => enable_compteur_seq, output => compte_seq);

--compteur du nombre de cycle de conversion fait
compteur_nb_cycle_conv : compteurNbits generic map(32) port map(clk => clk, reset => reset_compteur_nb_cycle, enable => enable_compteur_nb_cycle, output => compte_nb_cycle);

--compteur du nombre de canaux convertis
compteur_nb_canaux_conv : compteurNbits generic map(4) port map(clk => clk, reset => reset_compteur_nb_canaux, enable => enable_compteur_nb_canaux, output => compte_nb_canaux);

--mux de la séquence de canaux
cmp_seq <= sequence(7) when compte_seq = "000" else
			  sequence(6) when compte_seq = "001" else
			  sequence(5) when compte_seq = "010" else
			  sequence(4) when compte_seq = "011" else
			  sequence(3) when compte_seq = "100" else
			  sequence(2) when compte_seq = "101" else
			  sequence(1) when compte_seq = "110" else
			  sequence(0);
			  
--mux de décodage du canal
canal_a_convertir <= "000" when choix_canal_conversion = "000" else
							"100" when choix_canal_conversion = "001" else
							"001" when choix_canal_conversion = "010" else
							"101" when choix_canal_conversion = "011" else
							"010" when choix_canal_conversion = "100" else
							"110" when choix_canal_conversion = "101" else
							"011" when choix_canal_conversion = "110" else
							"111";
							
--mux du choix du canal en fonction du mode
choix_canal_conversion <= canal_conversion when mode = "01" else
								  compte_seq;

--comparateurs 
cmp_fin_1CH <= '1' when compte_nb_cycle >= nb_cycle_conversion else
					'0';

cmp_fin_sequence <= '1' when compte_nb_canaux >= nb_canaux else
						  '0';

cmp_fin_conv_seq <= '1' when compte_nb_cycle >= nb_cycle_conversion else
						  '0';
					  
--machine à état gérant les modes de fonctionnements
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;		

process(etat_present, start, mode, termine_conversion_canal, cmp_fin_1CH, cmp_fin_sequence, cmp_seq, cmp_fin_conv_seq)
begin
	case etat_present is
		when attente =>
			enable_input <= '0';
			reset_input <= '0';
			occupe <= '0';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when load_input =>
			enable_input <= '1';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '0';
			etat_suivant <= choix_mode;
			
		when choix_mode =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '0';
			if(mode = "01") then
				etat_suivant <= demarrer_conv_1CH;
			elsif(mode = "10") then
				etat_suivant <= verification_seq;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_conv_1CH =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '1';
			reset_compteur_nb_cycle <= '1';
			etat_suivant <= attente_conversion_1CH;
			
		when attente_conversion_1CH =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(termine_conversion_canal = '1') then
				etat_suivant <= verification_fin_1CH;
			else
				etat_suivant <= attente_conversion_1CH;
			end if;
			
		when verification_fin_1CH =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(cmp_fin_1CH = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= demarrer_conv_1CH;
			end if;
		
		when verification_seq =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '1';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(cmp_seq = '1') then
				etat_suivant <= demarrer_conv_seq;
			else
				etat_suivant <= compter_seq;
			end if;
			
		when compter_seq =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '1';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '1';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			etat_suivant <= verification_seq;
			
		when demarrer_conv_seq =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '1';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '1';
			reset_compteur_nb_canaux <= '1';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			etat_suivant <= attente_conv_seq;
			
		when attente_conv_seq =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '1';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(termine_conversion_canal = '1') then
				etat_suivant <= verification_fin_sequence;
			else
				etat_suivant <= attente_conv_seq;
			end if;
			
		when verification_fin_sequence =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '1';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(cmp_fin_sequence = '1') then
				etat_suivant <= compter_cycle_conversion;
			else
				etat_suivant <= compter_seq;
			end if;
			
		when compter_cycle_conversion =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '1';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '1';
			reset_compteur_nb_cycle <= '1';
			etat_suivant <= verification_fin_conv_seq;
			
		when verification_fin_conv_seq =>
			enable_input <= '0';
			reset_input <= '1';
			occupe <= '1';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '1';
			if(cmp_fin_conv_seq = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= verification_seq;
			end if;
		
		when fin =>
			enable_input <= '0';
			reset_input <= '0';
			occupe <= '1';
			termine <= '1';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '0';
			etat_suivant <= attente;
			
		when others =>
			enable_input <= '0';
			reset_input <= '0';
			occupe <= '0';
			termine <= '0';
			start_conversion <= '0';
			enable_compteur_seq <= '0';
			reset_compteur_seq <= '0';
			enable_compteur_nb_canaux <= '0';
			reset_compteur_nb_canaux <= '0';
			enable_compteur_nb_cycle <= '0';
			reset_compteur_nb_cycle <= '0';
			etat_suivant <= attente;
			
	end case	;			
end process;					
				
end Behavioral;


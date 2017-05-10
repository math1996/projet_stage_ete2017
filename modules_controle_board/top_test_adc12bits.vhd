----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:53 05/10/2017 
-- Design Name: 
-- Module Name:    top_test_adc12bits - Behavioral 
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

entity top_test_adc12bits is
    Port ( clk, reset, DOUT, rx : in  STD_LOGIC;
           CS, SCLK, DIN, tx: out  STD_LOGIC;
			  --output de test sur LED
			  output_LED_fin_conversion, output_LED_fin_transfert : out std_logic);
end top_test_adc12bits;

architecture Behavioral of top_test_adc12bits is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_hardware_ctrl_adc12bits is (attente, demarrage_conversion, attente_termine_conversion, demarrage_envoie1, attente_envoie1, 
													demarrage_envoie2, etat_tampon, fin);
signal etat_present, etat_suivant : etat_hardware_ctrl_adc12bits;

signal data_recu, data_a_envoyer : std_Logic_vector(7 downto 0);
signal donnees_adc : std_logic_vector(15 downto 0);
signal clk_divise_int, termine_int, occupe_int, ready, occupe_envoie, envoyer_data, termine_envoie, start_ctrl_adc12bits : std_logic;

begin

--choisir 12.5 MHz comme fréquence d'horloge
diviseur_horloge : diviseur_clk port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_divise_int);

--module de controle SPI
controle_adc12bits : controle_spi_adc_12bits port map(clk => clk_divise_int, reset => reset, start => start_ctrl_adc12bits, DOUT => DOUT, DIN => DIN,
															SCLK => SCLK, CS => CS, occupe => occupe_int, termine => termine_int, donnees => donnees_adc);

com_serie_tx : FSM_serial_tx port map(clk => clk_divise_int, start => envoyer_data, reset => reset, data => data_a_envoyer, tx => tx, 
														occupe => occupe_envoie, termine => termine_envoie);
com_serie_rx : serial_rx port map(clk => clk_divise_int, rst => reset, rx => rx, data => data_recu, new_data => ready);

--machine à état du controle du test
process(clk_divise_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_divise_int'event and clk_divise_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(ready, etat_present, occupe_envoie, occupe_int, termine_envoie, termine_int, donnees_adc)
begin
	case etat_present is 
		when attente =>
			data_a_envoyer <= (others => '0');
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '0';
			output_LED_fin_transfert <= '0';
			if(ready = '1' and occupe_int = '0') then
				etat_suivant <= demarrage_conversion;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage_conversion =>
			data_a_envoyer <= (others => '0');
			start_ctrl_adc12bits <= '1';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '0';
			output_LED_fin_transfert <= '0';
			etat_suivant <= attente_termine_conversion;
		
		when attente_termine_conversion =>
			data_a_envoyer <= (others => '0');
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '0';
			output_LED_fin_transfert <= '0';
			if(termine_int = '1') then
				etat_suivant <= demarrage_envoie1;
			else
				etat_suivant <= attente_termine_conversion;
			end if;
			
		when demarrage_envoie1 =>
			data_a_envoyer <= donnees_adc(15 downto 8);
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '1';
			output_LED_fin_conversion <= '1';
			output_LED_fin_transfert <= '0';
			etat_suivant <= attente_envoie1;
		
		when attente_envoie1 =>
			data_a_envoyer <= donnees_adc(15 downto 8);
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '1';
			output_LED_fin_transfert <= '0';
			if(termine_envoie = '1') then
				etat_suivant <= etat_tampon;
			else
				etat_suivant <= attente_envoie1;
			end if;
			
		when etat_tampon =>
			data_a_envoyer <= donnees_adc(15 downto 8);
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '1';
			output_LED_fin_transfert <= '0';
			if(occupe_envoie = '1') then
				etat_suivant <= etat_tampon;
			else 
				etat_suivant <= demarrage_envoie2;
			end if;
			
		when demarrage_envoie2 =>
			data_a_envoyer <= donnees_adc(7 downto 0);
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '1';
			output_LED_fin_conversion <= '1';
			output_LED_fin_transfert <= '0';
			etat_suivant <= fin;
			
		when fin =>
			data_a_envoyer <= donnees_adc(7 downto 0);
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '1';
			output_LED_fin_transfert <= '1';
			etat_suivant <= fin;
			
		when others =>
			data_a_envoyer <= (others => '0');
			start_ctrl_adc12bits <= '0';
			envoyer_data <= '0';
			output_LED_fin_conversion <= '0';
			output_LED_fin_transfert <= '0';
			etat_suivant <= attente;
		end case;
end process;														

end Behavioral;


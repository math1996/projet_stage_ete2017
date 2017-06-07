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
			  --output_LED_fin_conversion, output_LED_fin_transfert : out std_logic
			  output_led_conversion : out std_logic_vector(7 downto 0));
end top_test_adc12bits;

architecture Behavioral of top_test_adc12bits is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_hardware_ctrl_adc12bits is (attente, demarrage_conversion, attente_termine_conversion);
signal etat_present, etat_suivant : etat_hardware_ctrl_adc12bits;

signal data_recu, data_a_envoyer : std_Logic_vector(7 downto 0);
signal donnees_adc : std_logic_vector(15 downto 0);
signal clk_divise_int, termine_int, occupe_int, ready, occupe_envoie, envoyer_data, termine_envoie, start_ctrl_adc12bits : std_logic;

begin

--choisir 12.5 MHz comme fréquence d'horloge
diviseur_horloge : diviseur_clk generic map (1) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_divise_int);

--module de controle SPI
controle_adc12bits : controle_spi_adc_12bits port map(clk => clk_divise_int, reset => reset, start => start_ctrl_adc12bits, DOUT => DOUT, DIN => DIN,
															SCLK => SCLK, CS => CS, occupe => occupe_int, termine => termine_int, donnees => donnees_adc, canal => data_recu(7 downto 5));

--module de communication série rx
com_serie_rx : serial_rx port map(clk => clk_divise_int, rst => reset, rx => rx, data => data_recu, new_data => ready);

output_led_conversion <= donnees_adc(7 downto 0);

--machine à état du controle du test de l'ADC 12 bits
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
			start_ctrl_adc12bits <= '0';
			if(ready = '1' and occupe_int = '0') then
				etat_suivant <= demarrage_conversion;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage_conversion =>
			start_ctrl_adc12bits <= '1';
			etat_suivant <= attente_termine_conversion;
		
		when attente_termine_conversion =>
			start_ctrl_adc12bits <= '0';
			if(termine_int = '1') then
				etat_suivant <= attente;
			else
				etat_suivant <= attente_termine_conversion;
			end if;
	
		when others =>
			start_ctrl_adc12bits <= '0';
			etat_suivant <= attente;
		end case;
end process;														

end Behavioral;


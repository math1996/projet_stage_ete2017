----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:43 05/17/2017 
-- Design Name: 
-- Module Name:    top_controle_spi_adc_12bits - Behavioral 
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

--top module du controle SPI d l'ADC 12 bits, implémente les modes de
--fonctionnement de l'ADC 12 bits, permet de configurer et récupérer 
--les données jusqu'à ce qu'on signal un arrêt

entity top_controle_spi_adc_12bits is
    Port ( clk, start_seq, start_1CH, reset, DOUT, arret : in  STD_LOGIC;
           occupe, termine, data_rdy, CS, SCLK, DIN : out  STD_LOGIC;
           data_out_conversion : out  STD_LOGIC_VECTOR (15 downto 0);
           canal : in  STD_LOGIC_VECTOR (2 downto 0);
			  sequence : in std_logic_vector(7 downto 0));
end top_controle_spi_adc_12bits;

architecture Behavioral of top_controle_spi_adc_12bits is

signal start_config, start_config1, start_config2, start_recup, start_recup1, start_recup2, 
			sclk_config, sclk_recup, cs_config, cs_recup, termine1, termine2,
			occupe_config, occupe_recup, termine_config, termine_recup : std_logic;
signal load_config, load_config1, load_config2 : std_logic_vector(15 downto 0);


begin

--sortie
CS <= cs_config and cs_recup;
SCLK <= sclk_config and sclk_recup;
occupe <= occupe_config or occupe_recup;
termine <= termine1 or termine2;

start_config <= start_config1 or start_config2;
start_recup <= start_recup1 or start_recup2;
load_config <= load_config1 or load_config2;

data_rdy <= termine_recup;

--module de configuration de l'ADC 12 bits
rdc_configuration_adc12bits : configuration_spi_adc_12bits port map(clk => clk, reset => reset, start => start_config,
																							load => load_config, DIN => DIN, SCLK => sclk_config,
																							CS => cs_config, occupe => occupe_config, termine => termine_config);
																							
--module de récupération des données de l'ADC 12 bits																							
rdc_recuperation_adc12bits : FSM_recuperer_donnee_adc_12bits port map(clk => clk, start => start_recup, reset => reset, DOUT => DOUT,
																							 SCLK => sclk_recup, CS => cs_recup, occupe => occupe_recup, termine => termine_recup,
																							 data_out => data_out_conversion);

--module de conversion d'un seul canal
FSM_conversion_1canal : FSM_convertir_1canal_adc12bits port map(clk => clk, reset => reset, start => start_1CH, arret_conversion => arret,
																						termine_rdc_config => termine_config, termine_rdc_recup => termine_recup,
																						canal_conversion => canal, termine => termine1, demarrer_transfert => start_config1,
																						demarrer_recup => start_recup1, load => load_config1);

--module de conversion séquentiel des canaux																					
FSM_conversion_sequentielle : FSM_conversion_seq_choix_canaux_adc12bits port map(clk => clk, reset => reset, start => start_seq, arret_conversion => arret,
																											termine_rdc_config => termine_config, termine_rdc_recup => termine_recup,
																											choix_canaux => sequence, termine => termine2, demarrer_transfert => start_config2,
																											demarrer_recup => start_recup2, load => load_config2);
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:47 06/06/2017 
-- Design Name: 
-- Module Name:    top_test_mode_adc_12bits - Behavioral 
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

entity top_test_mode_adc_12bits is
    Port ( clk, reset, DOUT, rx : in  STD_LOGIC;
           CS, SCLK, DIN, tx : out  STD_LOGIC);
end top_test_mode_adc_12bits;

architecture Behavioral of top_test_mode_adc_12bits is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

signal clk_int, new_data_int, start_seq_int, start_1CH_int, reset_conversion, arret_conversion, occupe_conversion, termine_conversion,
		 donne_conversion_pret: std_logic;
signal data_conversion : std_logic_vector(15 downto 0);
signal canal_conversion : std_logic_vector(2 downto 0);
signal data_recu, sequence_conversion : std_logic_vector(7 downto 0);



begin

--diviseur d'horloge à 12.5 MHz
diviseur_horloge : diviseur_clk generic map (1) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

--communication série (RX)
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--module de contrôle de l'ADC 12 bits
ctrl_adc_12bits : top_controle_spi_adc_12bits port map(clk => clk_int, start_seq => start_seq_int, start_1CH => start_1CH_int, reset => reset_conversion, 
																		 DOUT => DOUT, arret => arret_conversion, occupe => occupe_conversion, termine => termine_conversion,
																		 data_rdy => donne_conversion_pret, CS => CS, SCLK => SCLK, DIN => DIN, data_out_conversion => data_conversion,
																		 canal => canal_conversion, sequence => sequence_conversion);

--connecter le communication série tx, buffer de réception et faire machine à état de gestion des modes
--utiliser une mémoire tampon, ou envoyer la conversion directement sur le port série??																		 

end Behavioral;


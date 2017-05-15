----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:42 05/11/2017 
-- Design Name: 
-- Module Name:    top_test_adc10bits - Behavioral 
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

entity top_test_adc10bits is
    Port ( clk, DOUT, SSTRB, reset, rx : in  STD_LOGIC;
           DIN, SCLK, CS, SHDN, tx, occupe: out  STD_LOGIC;
			  data_out : out std_logic_vector(7 downto 0));
end top_test_adc10bits;

architecture Behavioral of top_test_adc10bits is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

signal data_rdy, occupe_int, clk_int, termine_int, occupe_envoie, termine_envoie, clk_out_int, enable_rdc_affichage_int, input_rdc_int : std_logic;
signal data_recu : std_logic_vector(7 downto 0);
signal data_int : std_logic_vector(15 downto 0);

begin
SCLK <= clk_out_int;
CS <= enable_rdc_affichage_int;
DIN <= input_rdc_int;
diviseur_horloge : diviseur_clk generic map(4) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

ctrl_spi_adc10bits : controle_spi_adc_10bits port map(start => data_rdy, clk => clk_int, reset => reset, DOUT => DOUT, SSTRB => SSTRB, DIN => input_rdc_int, SCLK => clk_out_int,
																		CS => enable_rdc_affichage_int, occupe => occupe, termine => termine_int, donnes => data_int, canal => data_recu(2 downto 0),
																		SHDN => SHDN);
com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => termine_int, data => data_int, tx => tx, occupe => occupe_envoie, termine => termine_envoie);																		
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => data_rdy);

rdc_output_led_test: rdc_NBits generic map(8) port map(clk => clk_out_int, reset => reset, enable => not(enable_rdc_affichage_int),
																			input => input_rdc_int, data_output_parallele => data_out);

end Behavioral;


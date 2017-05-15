----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:45:00 05/08/2017 
-- Design Name: 
-- Module Name:    configuration_spi_adc_10bits - Behavioral 
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

entity configuration_spi_adc_10bits is
    Port ( clk,start,reset : in  STD_LOGIC;
				load : in std_logic_vector(7 downto 0);
				termine, occupe, DIN, SCLK, CS : out std_logic);
end configuration_spi_adc_10bits;

architecture Behavioral of configuration_spi_adc_10bits is

type etat_config_adc10bits is (attente, load_data, decalage, fin);

signal etat_present, etat_suivant: etat_config_adc10bits;
signal reset_rdc, enable_rdc, mode_rdc, reset_compteur, enable_compteur, clk_int : std_logic;
signal compteur : std_logic_vector(3 downto 0);

begin

rdc : rdc_load_nbits generic map(8) port map(load => load, enable => enable_rdc, reset => reset_rdc, clk => clk_int, input => '0',
															mode => mode_rdc, output => DIN);
compteur_4bits : compteurNbits generic map(4) port map(clk => clk_int, enable => enable_compteur, reset => reset_compteur, output => compteur);													
clk_int <= clk;

process(clk_int,reset)
begin
if(reset <= '0') then
	etat_present <= attente;
elsif(clk_int'event and clk_int = '1') then
	etat_present <= etat_suivant;
end if;
end process;

process(etat_present, clk_int, start, compteur)
begin
	case etat_present is
		when attente =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '1';
			SCLK <= '0';
			occupe <= '0';
			termine <= '0';
			mode_rdc <= '0';
			if(start = '1') then
				etat_suivant <= load_data;
			else
				etat_suivant <= attente;
			end if;
		
		when load_data =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '0';
			SCLK <= '0';
			occupe <= '1';
			termine <= '0';
			mode_rdc <= '1';
			etat_suivant <= decalage;
		
		when decalage =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			reset_compteur <= '1';
			enable_compteur <= '1';
			CS <= '0';
			SCLK <= not(clk_int);
			occupe <= '1';
			termine <= '0';
			mode_rdc <= '0';
			if(compteur >= 7) then
				etat_suivant <= fin;
			else
				etat_suivant <= decalage;
			end if;
			
		when fin =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '0';
			SCLK <= '0';
			occupe <= '1';
			termine <= '1';
			mode_rdc <= '0';
			etat_suivant <= attente;
		
		when others =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '1';
			SCLK <= '0';
			occupe <= '0';
			termine <= '0';
			mode_rdc <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:47 05/04/2017 
-- Design Name: 
-- Module Name:    controle_spi_adc_12bits - Behavioral 
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

entity configuration_spi_adc_12bits is
    Port ( clk, reset, start : in  STD_LOGIC;
			  load : in std_logic_vector(15 downto 0);
           DIN, SCLK, CS, occupe, termine: out  STD_LOGIC);
end configuration_spi_adc_12bits;

architecture Behavioral of configuration_spi_adc_12bits is

type etat_config_adc_12bits is (attente, load_valeur, decalage, fin);

--à changer pour contrôler via le port série?
signal load_int: std_logic_vector(15 downto 0);
signal reset_rdc, enable_rdc, mode_rdc, clk_int, reset_compteur, enable_compteur : std_logic;
signal compteur : std_logic_vector(4 downto 0);
signal etat_present, etat_suivant : etat_config_adc_12bits;

begin

clk_int <= clk;

rdc : rdc_load_nbits generic map(16) port map(clk => clk, reset => reset_rdc, enable => enable_rdc, input => '0', mode => mode_rdc,
															output => DIN, load => load);
compteur5bit : compteurNbits generic map(5) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compteur);															

process(clk,reset)
begin
if(reset = '0') then
	etat_present <= attente;
elsif(clk'event and clk = '1') then	
	etat_present <= etat_suivant;
end if;
end process;

process(start, compteur, etat_present, clk_int)
begin
	case etat_present is
		when attente =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '1';
			SCLK <= '1';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_valeur;
			else
				etat_suivant <= attente;
			end if;
		
		when load_valeur => 
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '0';
			SCLK <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= decalage;
			
		when decalage =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			CS <= '0';
			SCLK <= clk_int;
			occupe <= '1';
			termine <= '0';
			if(compteur >= 15) then
				etat_suivant <= fin;
			else
				etat_suivant <= decalage;
			end if;
			
		when fin =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			CS <= '1';
			SCLK <= '1';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			load_int <= (others => '0');
			CS <= '1';
			SCLK <= '1';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


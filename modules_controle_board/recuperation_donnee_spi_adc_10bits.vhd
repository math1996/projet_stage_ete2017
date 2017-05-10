----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:26 05/08/2017 
-- Design Name: 
-- Module Name:    recuperation_donnee_spi_adc_10bits - Behavioral 
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

entity recuperation_donnee_spi_adc_10bits is
    Port ( clk,start,reset, SSTRB, DOUT : in  STD_LOGIC;
           CS, SCLK, occupe, termine : out  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end recuperation_donnee_spi_adc_10bits;

architecture Behavioral of recuperation_donnee_spi_adc_10bits is

type etat_recup_data is (attente, attente_donnee, recuperation, fin, demarrage);

signal etat_present, etat_suivant : etat_recup_data;
signal donnee_int : std_logic_vector(15 downto 0);
signal reset_rdc, enable_rdc, reset_compteur, enable_compteur, clk_int : std_logic;
signal compteur : std_logic_vector(4 downto 0);

begin

rdc_recup: rdc_Nbits generic map(16) port map(clk => clk, reset => reset_rdc, enable => enable_rdc, input => DOUT, data_output_parallele => donnee_int);
compteur_5bits : compteurNbits generic map(5) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compteur);
clk_int <= clk;
data_out <= donnee_int;

process(clk, reset)
begin
if(reset = '0') then
	etat_present <= attente;
elsif(clk'event and clk = '1') then
	etat_present <= etat_suivant;
end if;
end process;

process(start, etat_present, compteur, SSTRB, clk_int)
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
		if(start = '1') then
			etat_suivant <= attente_donnee;
		else
			etat_suivant <= attente;
		end if;
		
	when attente_donnee =>
		reset_rdc <= '0';
		enable_rdc <= '0';
		reset_compteur <= '0';
		enable_compteur <= '0';
		CS <= '1';
		SCLK <= '0';
		occupe <= '1';
		termine <= '0';
		if(SSTRB = '1') then
			etat_suivant <= demarrage;
		else
			etat_suivant <= attente_donnee;
		end if;
		
	when demarrage =>
		reset_rdc <= '0';
		enable_rdc <= '0';
		reset_compteur <= '0';
		enable_compteur <= '0';
		CS <= '0';
		SCLK <= '0';
		occupe <= '1';
		termine <= '0';
		etat_suivant <= recuperation;
		
	when recuperation => 
		reset_rdc <= '1';
		enable_rdc <= '1';
		reset_compteur <= '1';
		enable_compteur <= '1';
		CS <= '0';
		SCLK <= clk_int;
		occupe <= '1';
		termine <= '0';
		if(compteur >= 15) then
			etat_suivant <= fin;
		else
			etat_suivant <= recuperation;
		end if;
	
	when fin =>
		reset_rdc <= '1';
		enable_rdc <= '0';
		reset_compteur <= '0';
		enable_compteur <= '0';
		CS <= '0';
		SCLK <= '0';
		occupe <= '1';
		termine <= '1';
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
		etat_suivant <= attente;
	end case;	
end process;

end Behavioral;


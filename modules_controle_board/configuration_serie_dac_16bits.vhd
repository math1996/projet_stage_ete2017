----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:02 05/10/2017 
-- Design Name: 
-- Module Name:    configuration_serie_dac_16bits - Behavioral 
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

entity configuration_serie_dac_16bits is
    Port ( clk, reset, start  : in  STD_LOGIC;
				load : in std_logic_vector(15 downto 0);
           FSYNC, SCLK, DIN, occupe, termine : out  STD_LOGIC);
end configuration_serie_dac_16bits;

architecture Behavioral of configuration_serie_dac_16bits is

type etat_config_dac is (attente, load, decalage, fin);

signal compteur : std_logic_vector(4 downto 0);
signal reset_compteur, enable_compteur, reset_rdc, enable_rdc, mode_rdc : std_logic;
signal etat_present, etat_suivant : etat_config_dac;

begin

rdc : rdc_load_nbits generic map(16) port map(clk => clk, reset => reset_rdc, enable => enable_rdc, mode => mode_rdc, load => load, input => '0', output => DIN);
compteur_5bits : compteurNbits generic map(5) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compteur);

--machine à état de l'envoie de la valeur 16 bits au DAC
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, etat_present, compteur)
begin

end process;
end Behavioral;


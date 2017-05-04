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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity configuration_spi_adc_12bits is
    Port ( clk, reset, start, DOUT  : in  STD_LOGIC;
           DIN, SCLK, CS: out  STD_LOGIC);
end configuration_spi_adc_12bits;

architecture Behavioral of configuration_spi_adc_12bits is

type etat is (attente, load_p1, dec_p1, load_p2, dec_p2, load_p3, dec_p3, load_p4, dec_p4, fin1, fin2, fin3);

--à changer pour contrôler via le port série?
signal load_int: std_logic_vector(15 downto 0);
signal reset_rdc, enable_rdc, mode_rdc, clk_int : std_logic;
signal compteur : std_logic_vector(4 downto 0);
signal etat_present, etat_suivant : etat;

begin

clk_int <= clk;

rdc : rdc_load_nbits generic map(16) port map(clk => clk, reset => reset_rdc, enable => enable_rdc, input => '0', mode => mode_rdc,
															output => DIN, load => load_int);
compteur5bit : compteurNbits generic map(5) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compteur);															

process(clk,reset)
begin
if(reset = '0') then
	etat_present <= attente;
elsif(clk'event and clk = '1') then	
	etat_present <= etat_suivant;
end if;
end process;

process(start, compteur, etat_present)
begin
	case etat_present is
		when attente =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			load_int <= (others => '0');
			CS <= '1';
			SCLK <= '1';
			if(start = '1') then
				etat_suivant <= load_p1;
			else
				etat_suivant <= attente;
			end if;
		
		when load_p1 =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			load_int <= ("1010101010100000"); -- choisir la valeur
			CS <= '0';
			SCLK <= '1';
			etat_suivant <= dec_p1;
			
		when dec_p1 =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			load_int <= (others => '0');
			CS <= '0';
			SCLK <= clk_int;
			if(compteur >= 15) then
				etat_suivant <= fin1;
			else
				etat_suivant <= dec_p1;
			end if;
		
		--attendre 3 cycle d'horloge? nécessaire à 12.5 MHz?
		when fin1 =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '1';
			load_int <= (others => '0');
			CS <= '1';
			SCLK <= '1';
		
		--faire la même chose pour les 3 autres programmations!
		
		when others =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			load_int <= (others => '0');
			CS <= '1';
			SCLK <= '1';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


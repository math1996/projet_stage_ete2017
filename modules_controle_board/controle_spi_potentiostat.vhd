----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:15 05/01/2017 
-- Design Name: 
-- Module Name:    controle_spi_potentiostat - Behavioral 
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

entity controle_spi_potentiostat is
	Port(clk, reset, start : in std_logic;
			load_in : in std_logic_vector;
			CLK_OUT, CS, SDI : out std_logic;
			occupe, termine : out std_logic);
end controle_spi_potentiostat;

architecture Behavioral of controle_spi_potentiostat is

type etat is (attente, init, decalage, fin);
signal etat_present, etat_suivant : etat;


signal enable_compteur, reset_compteur, enable_rdc, reset_rdc, mode_rdc , output_rdc : std_logic;
signal compteur_out : std_logic_vector(3 downto 0);
signal clk_int : std_logic;

begin

--compteur du nombre de décalage
compteur4bit : compteurNbits generic map(4) port map(clk => clk_int, reset => reset_compteur, enable => enable_compteur, output => compteur_out);

--registre à décalage des données à envoyer à la résistance
rdc : rdc_load_nbits generic map(8) port map(clk => clk_int, enable => enable_rdc, reset => reset_rdc, input => '0', mode => mode_rdc, output => SDI,
																load => load_in);
															
clk_int <= clk;

--machine à état du controle SPI du potentiostat							
process(clk_int,reset)
begin
if(reset = '0') then
	etat_present <= attente;
elsif(clk_int'event and clk_int = '1') then
	etat_present <= etat_suivant;
end if;
end process;
process(etat_present, compteur_out, clk_int, start)
begin
	case etat_present is
		when attente =>
			enable_compteur <= '0';
			reset_compteur <= '0';
			enable_rdc <= '0';
			reset_rdc <= '0';
			mode_rdc <= '0';
			CS <= '1';
			CLK_OUT <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= init;
			else
				etat_suivant <= attente;
			end if;
		
		when init =>
			enable_compteur <= '0';
			reset_compteur <= '0';
			enable_rdc <= '1';
			reset_rdc <= '1';
			mode_rdc <= '1';
			CS <= '0';
			CLK_OUT <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= decalage;
			
		when decalage =>
			enable_compteur <= '1';
			reset_compteur <= '1';
			enable_rdc <= '1';
			reset_rdc <= '1';
			mode_rdc <= '0';
			CS <= '0';
			CLK_OUT <= not(clk_int);
			occupe <= '1';
			termine <= '0';
			if(compteur_out >= 7) then
				etat_suivant <= fin;
			else
				etat_suivant <= decalage;
			end if;
		
		when fin =>
			enable_compteur <= '0';
			reset_compteur <= '0';
			enable_rdc <= '0';
			reset_rdc <= '0';
			mode_rdc <= '0';
			CS <= '1';
			CLK_OUT <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			enable_compteur <= '0';
			reset_compteur <= '0';
			enable_rdc <= '0';
			reset_rdc <= '0';
			mode_rdc <= '0';
			CS <= '1';
			CLK_OUT <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


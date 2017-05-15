----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:09 05/09/2017 
-- Design Name: 
-- Module Name:    FSM_recuperer_donnee_adc_12bits - Behavioral 
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

entity FSM_recuperer_donnee_adc_12bits is
    Port ( clk, start, reset, DOUT : in  STD_LOGIC;
           SCLK, CS, occupe, termine  : out  STD_LOGIC;
			  data_out : out std_logic_vector(15 downto 0));
end FSM_recuperer_donnee_adc_12bits;

architecture Behavioral of FSM_recuperer_donnee_adc_12bits is

type etat_recup_donnee_adc12bits is (attente, demarrage, recuperation, fin);

signal etat_present, etat_suivant : etat_recup_donnee_adc12bits;
signal compteur : std_logic_vector (4 downto 0);
signal clk_int, reset_compteur, enable_compteur, reset_rdc, enable_rdc : std_logic;
signal donnee_int : std_logic_vector(15 downto 0);

begin

compteur_5bits: compteurNbits generic map(5) port map(clk => clk_int, reset => reset_compteur, enable => enable_compteur, output => compteur);
rdc_recup : rdc_Nbits generic map(16) port map(clk => clk_int, reset => reset_rdc, enable => enable_rdc, input => DOUT, data_output_parallele => donnee_int);
clk_int <= clk;

--sorties
data_out <= donnee_int;

--machine à état de la récupérations des données de l'adc 12 bits
process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, clk_int, compteur)
begin
	case etat_present is 
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_rdc <= '0';
			enable_rdc <= '0';
			CS <= '1';
			SCLK <= '1';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= demarrage;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_rdc <= '1';
			enable_rdc <= '1';
			CS <= '0';
			SCLK <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= recuperation;
			
		when recuperation =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_rdc <= '1';
			enable_rdc <= '1';
			CS <= '0';
			SCLK <= clk_int;
			occupe <= '1';
			termine <= '0';
			if(compteur >= 14) then
				etat_suivant <= fin;
			else
				etat_suivant <= recuperation;
			end if;
			
		when fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_rdc <= '1';
			enable_rdc <= '0';
			CS <= '0';
			SCLK <= '1';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others => 
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_rdc <= '0';
			enable_rdc <= '0';
			CS <= '0';
			SCLK <= '1';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
			
	end case;			
end process;

end Behavioral;


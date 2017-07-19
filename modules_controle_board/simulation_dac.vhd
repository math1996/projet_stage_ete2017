----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:26 07/19/2017 
-- Design Name: 
-- Module Name:    simulation_dac - Behavioral 
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

entity simulation_dac is
    Port ( clk, reset, start : in  STD_LOGIC;
           termine, occupe : out  STD_LOGIC);
end simulation_dac;

architecture Behavioral of simulation_dac is

type etat_sim_dac is (attente, attente_comptage, fin);
signal etat_present, etat_suivant : etat_sim_dac;

signal reset_compteur, enable_compteur, cmp_fin : std_logic;
signal compte_attente : std_logic_vector(4 downto 0);

begin

--compteur
compteur_attente : compteurNbits generic map(5) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_attente);

--comparateur
cmp_fin <= '1' when compte_attente >= 18 else
			  '0';
			  
--machine à état de la simulation du DAC (pour le module de génération d'onde
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= attente_comptage;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_comptage =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_comptage;
			end if;
			
		when fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


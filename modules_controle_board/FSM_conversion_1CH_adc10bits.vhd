----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:59 06/14/2017 
-- Design Name: 
-- Module Name:    FSM_conversion_1CH_adc10bits - Behavioral 
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

entity FSM_conversion_1CH_adc10bits is
    Port ( clk, reset, start, termine_conversion : in  STD_LOGIC;
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
			  canal_a_convertir : in std_logic_vector(2 downto 0);
           start_conversion, occupe, termine : out  STD_LOGIC;
			  canal_conversion : out std_logic_vector(2 downto 0));
end FSM_conversion_1CH_adc10bits;

architecture Behavioral of FSM_conversion_1CH_adc10bits is

type etat_conv_1CH_adc10bits is (attente, demarrer_conversion, attente_conversion, fin);
signal etat_present, etat_suivant : etat_conv_1CH_adc10bits;

signal reset_compteur_nb_cycle, enable_compteur_nb_cycle, cmp_fin : std_logic;
signal compte_nb_cycle : std_logic_vector(31 downto 0);

begin

--compteur du nombre de cycle de conversion fait
compteur_nb_cycle_conv : compteurNbits generic map(32) port map(clk => clk, reset => reset_compteur_nb_cycle, enable => enable_compteur_nb_cycle, output => compte_nb_cycle);

--comparateur
cmp_fin <= '1' when compte_nb_cycle >= nb_cycle_conversion else
			  '0';
			  
--mux de décodage du canal
canal_conversion <=  "000" when canal_a_convertir = "000" else
							"100" when canal_a_convertir = "001" else
							"001" when canal_a_convertir = "010" else
							"101" when canal_a_convertir = "011" else
							"010" when canal_a_convertir = "100" else
							"110" when canal_a_convertir = "101" else
							"011" when canal_a_convertir = "110" else
							"111";

--machine à état de la conversion d'un seul canal
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, termine_conversion, cmp_fin, start)
begin
	case etat_present is
		when attente =>
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_conversion =>
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '1';
			start_conversion <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion;
		
		when attente_conversion =>
			reset_compteur_nb_cycle <= '1';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '0';
			if(termine_conversion = '1' and cmp_fin = '1') then
				etat_suivant <= fin;
			elsif(termine_conversion = '1' and cmp_fin = '0') then
				etat_suivant <= demarrer_conversion;
			else
				etat_suivant <= attente_conversion;
			end if;
			
		when fin =>
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_compteur_nb_cycle <= '0';
			enable_compteur_nb_cycle <= '0';
			start_conversion <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;		
end process;
end Behavioral;


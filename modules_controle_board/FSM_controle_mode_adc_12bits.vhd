----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:08 06/07/2017 
-- Design Name: 
-- Module Name:    FSM_controle_mode_adc_12bits - Behavioral 
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

entity FSM_controle_mode_adc_12bits is
    Port ( clk, reset, start, fin_conversion : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           start_1CH, start_seq, occupe, termine, enable_input, reset_input : out  STD_LOGIC);
end FSM_controle_mode_adc_12bits;

architecture Behavioral of FSM_controle_mode_adc_12bits is

type etat_ctrl_mode_adc12bits is (attente, choix_mode, load_input, demarrer_conversion_mode1, demarrer_conversion_seq,attente_conversion, fin);
signal etat_present, etat_suivant : etat_ctrl_mode_adc12bits;

begin
									 
--machine à état du contrôle des modes
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, mode, start, fin_conversion)
begin
	case etat_present is
		when attente =>
			reset_input <= '0';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when load_input =>
			reset_input <= '1';
			enable_input <= '1';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= choix_mode;
		
		when choix_mode =>
			reset_input <= '1';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '1';
			termine <= '0';
			if(mode = "01") then
				etat_suivant <= demarrer_conversion_mode1;
			elsif(mode = "10") then
				etat_suivant <= demarrer_conversion_seq;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_conversion_mode1 =>
			reset_input <= '1';
			enable_input <= '0';
			start_1CH <= '1';
			start_seq <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion;
			
		when demarrer_conversion_seq =>
			reset_input <= '1';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion;
			
		when attente_conversion =>
			reset_input <= '1';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '1';
			termine <= '0';
			if(fin_conversion = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_conversion;
			end if;
			
		when fin =>
			reset_input <= '0';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_input <= '0';
			enable_input <= '0';
			start_1CH <= '0';
			start_seq <= '0';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;				
end process;

end Behavioral;


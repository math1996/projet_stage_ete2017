----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:42 06/13/2017 
-- Design Name: 
-- Module Name:    FSM_controle_mode_adc_10bits - Behavioral 
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

entity FSM_controle_mode_adc_10bits is
    Port ( clk, reset, start, termine_conversion_canal : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
			  sequence : in std_logic_vector(7 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_canaux : in  STD_LOGIC_VECTOR (3 downto 0);
			  canal_conversion : in std_logic_vector(2 downto 0);
			  canal_a_convertir : out std_logic_vector(2 downto 0);
           occupe, termine, enable_input, reset_input, start_conversion : out  STD_LOGIC);
end FSM_controle_mode_adc_10bits;

architecture Behavioral of FSM_controle_mode_adc_10bits is

type etat_fsm_mode_adc10bits is (attente, load_input, choix_mode, demarrage_conv_1CH, attente_conversion, fin, demarrage_conv_seq);
signal etat_present, etat_suivant : etat_fsm_mode_adc10bits;

signal start_fsm_1CH, start_fsm_seq, reset_fsm_1CH, reset_fsm_seq, occupe_fsm_1CH, termine_fsm_1CH, occupe_fsm_seq, termine_fsm_seq, demarrer_conv_1CH,
		 demarrer_conv_seq,termine_conversion : std_logic;

signal canal_conversion_1CH_int, canal_conversion_seq_int : std_logic_vector(2 downto 0);


begin

--signaux de sortie
occupe <= occupe_fsm_1CH or occupe_fsm_seq;
start_conversion <= demarrer_conv_1CH or demarrer_conv_seq;
termine_conversion <= termine_fsm_1CH or termine_fsm_seq;

--module de conversion d'un seul canal
FSM_conv_1CH : FSM_conversion_1CH_adc10bits port map(clk => clk, reset => reset_fsm_1CH, start => start_fsm_1CH, termine_conversion => termine_conversion_canal, 
																	  nb_cycle_conversion => nb_cycle_conversion, start_conversion => demarrer_conv_1CH, occupe => occupe_fsm_1CH,
																	  termine => termine_fsm_1CH, canal_a_convertir => canal_conversion, canal_conversion => canal_conversion_1CH_int);
																	  
--module de conversion séquentielle
FSM_conv_seq : FSM_conversion_seq_adc10bits port map(clk => clk, reset => reset_fsm_seq, start => start_fsm_seq, termine_conversion => termine_conversion_canal,
																	  nb_cycle_conversion => nb_cycle_conversion, nb_canaux => nb_canaux, sequence => sequence,
																	  start_conversion => demarrer_conv_seq, occupe => occupe_fsm_seq, termine => termine_fsm_seq, 
																	  canal_conversion => canal_conversion_seq_int);
																	  
--mux du choix du canal en fonction du mode
canal_a_convertir <= canal_conversion_1CH_int when mode = "01" else
							canal_conversion_seq_int;

--machine à état gérant les modes de fonctionnements
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;		

process(etat_present, start, mode, termine_conversion)
begin
	case etat_present is
		when attente =>
			enable_input <= '0';
			reset_input <= '0';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when load_input =>
			enable_input <= '1';
			reset_input <= '1';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			termine <= '0';
			etat_suivant <= choix_mode;
			
		when choix_mode =>
			enable_input <= '0';
			reset_input <= '1';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			termine <= '0';
			if(mode = "01") then
				etat_suivant <= demarrage_conv_1CH;
			elsif(mode = "10") then
				etat_suivant <= demarrage_conv_seq;
			else
				etat_suivant <= attente;
			end if;
		
		when demarrage_conv_1CH =>
			enable_input <= '0';
			reset_input <= '1';
			termine <= '0';
			start_fsm_1CH <= '1';
			reset_fsm_1CH <= '1';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			termine <= '0';
			etat_suivant <= attente_conversion;
			
		when demarrage_conv_seq =>
			enable_input <= '0';
			reset_input <= '1';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '1';
			reset_fsm_seq <= '1';
			termine <= '0';
			etat_suivant <= attente_conversion;
			
		when attente_conversion =>
			enable_input <= '0';
			reset_input <= '1';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '1';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '1';
			termine <= '0';
			if(termine_conversion = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_conversion;
			end if;
			
		when fin =>
			enable_input <= '0';
			reset_input <= '0';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			termine <= '1';
			etat_suivant <= attente;
		
		when others =>
			enable_input <= '0';
			reset_input <= '0';
			termine <= '0';
			start_fsm_1CH <= '0';
			reset_fsm_1CH <= '0';
			start_fsm_seq <= '0';
			reset_fsm_seq <= '0';
			etat_suivant <= attente;		
	end case	;			
end process;					
				
end Behavioral;


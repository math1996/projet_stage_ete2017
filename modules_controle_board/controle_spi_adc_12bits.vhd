----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:45 05/09/2017 
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

entity controle_spi_adc_12bits is
    Port ( clk, start, reset, DOUT : in  STD_LOGIC;
           DIN, SCLK, CS, occupe, termine : out  STD_LOGIC;
				canal : in std_logic_vector(2 downto 0);
			  donnees : out STD_LOGIC_VECTOR(15 downto 0));
end controle_spi_adc_12bits;

architecture Behavioral of controle_spi_adc_12bits is

type etat_fsm_ctrl_adc12bits is (attente, demarrage_config, attente_fin_config, demarrage_recuperation_donnee, attente_recuperation_donnee, fin);

signal reset_FSM_config, start_FSM_config, occupe_FSM_config, termine_FSM_config, cs_FSM_config, sclk_FSM_config, 
			reset_FSM_recup, start_FSM_recup, sclk_FSM_recup, cs_FSM_recup, occupe_FSM_recup, termine_FSM_recup : std_logic;
signal donnee_int : std_logic_vector(15 downto 0);
signal etat_present, etat_suivant: etat_fsm_ctrl_adc12bits;

begin


config_adc12bits : FSM_configurer_adc_12bits port map(clk => clk, reset => reset_FSM_config, start => start_FSM_config, occupe => occupe_FSM_config,
																		termine => termine_FSM_config, CS => cs_FSM_config, SCLK => sclk_FSM_config, DIN => DIN, canal => canal);
recup_donnee : FSM_recuperer_donnee_adc_12bits port map(clk => clk, reset => reset_FSM_recup, start => start_FSM_recup, DOUT => DOUT, 
																			SCLK => sclk_FSM_recup, CS => cs_FSM_recup, occupe => occupe_FSM_recup, termine => termine_FSM_recup,
																			data_out => donnee_int);
registre_tampon : registreNbits generic map(16) port map(clk => clk, reset => reset, en => termine_FSM_recup, d => donnee_int, q_out => donnees);																		

SCLK <= sclk_FSM_recup and sclk_FSM_config;
CS <= cs_FSM_recup and cs_FSM_config; 
occupe <= occupe_FSM_config or occupe_FSM_recup;

--machine à état du controle spi de l'ADC 12 bits
process(clk,reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, etat_present, termine_FSM_config, termine_FSM_recup)
begin
	case etat_present is 
		when attente =>
			reset_FSM_config <= '0';
			reset_FSM_recup <= '0';
			start_FSM_config <= '0';
			start_FSM_recup <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= demarrage_config;
			else
				etat_suivant <= attente;
			end if;
		
		when demarrage_config =>
			reset_FSM_config <= '1';
			reset_FSM_recup <= '1';
			start_FSM_config <= '1';
			start_FSM_recup <= '0';
			termine <= '0';
			etat_suivant <= attente_fin_config;
	
		when attente_fin_config =>
			reset_FSM_config <= '1';
			reset_FSM_recup <= '1';
			start_FSM_config <= '0';
			start_FSM_recup <= '0';
			termine <= '0';
			if(termine_FSM_config = '1') then
				etat_suivant <= demarrage_recuperation_donnee;
			else
				etat_suivant <= attente_fin_config;
			end if;
			
		when demarrage_recuperation_donnee =>
			reset_FSM_config <= '1';
			reset_FSM_recup <= '1';
			start_FSM_config <= '0';
			start_FSM_recup <= '1';
			termine <= '0';
			etat_suivant <= attente_recuperation_donnee;
			
		when attente_recuperation_donnee =>
			reset_FSM_config <= '1';
			reset_FSM_recup <= '1';
			start_FSM_config <= '0';
			start_FSM_recup <= '0';
			termine <= '0';
			if(termine_FSM_recup = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_recuperation_donnee;
			end if;
			
		when fin =>
			reset_FSM_config <= '1';
			reset_FSM_recup <= '1';
			start_FSM_config <= '0';
			start_FSM_recup <= '0';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_FSM_config <= '0';
			reset_FSM_recup <= '0';
			start_FSM_config <= '0';
			start_FSM_recup <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;		
end process;
end Behavioral;


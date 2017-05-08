----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:21 05/08/2017 
-- Design Name: 
-- Module Name:    controle_spi_adc_10bits - Behavioral 
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

entity controle_spi_adc_10bits is
    Port ( start, clk, reset, DOUT, SSTRB : in  STD_LOGIC;
           DIN, SCLK, CS, occupe, termine : out  STD_LOGIC;
			  --output temporaire
			  donnes : out std_logic_vector(15 downto 0));
end controle_spi_adc_10bits;

architecture Behavioral of controle_spi_adc_10bits is

type etat_ctrl_adc10bits is (attente, demarrage, attente_donnee, fin);


signal start_fsm_config, reset_fsm_config, fsm_config_termine, fsm_config_occupe, fsm_config_sclk, fsm_config_cs, reset_fsm_recup, 
			fsm_recup_cs, fsm_recup_sclk, fsm_recup_occupe, fsm_recup_termine : std_logic;
			
signal donnee_recupere : std_logic_vector(15 downto 0);
signal load_int : std_logic_vector (7 downto 0);

signal etat_present, etat_suivant : etat_ctrl_adc10bits;


begin

config_adc10bits: configuration_spi_adc_10bits port map(clk => clk, start => start_fsm_config, reset => reset_fsm_config, load => load_int, termine => fsm_config_termine, 
																			occupe => fsm_config_occupe, DIN => DIN, SCLK => fsm_config_sclk, CS => fsm_config_cs);
recup_donnee: recuperation_donnee_spi_adc_10bits port map(clk => clk, start => fsm_config_termine, reset => reset_fsm_recup, SSTRB => SSTRB, DOUT => DOUT,
																				CS => fsm_recup_cs, SCLK => fsm_recup_sclk, occupe => fsm_recup_occupe, termine => fsm_recup_termine, 
																				data_out => donnee_recupere);
memoire_tmp: memoire_tampon_NxM generic map(16, 8) port map(clk => clk, reset => reset, enable => fsm_recup_termine, input => donnee_recupere, output => donnes);
																				
SCLK <= fsm_recup_sclk or fsm_config_sclk;
CS <= fsm_recup_cs and fsm_config_cs;

occupe <= fsm_config_occupe or fsm_recup_occupe;

process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, etat_present, fsm_recup_termine)
begin
	case etat_present is 
		when attente =>
			reset_fsm_config <= '0';
			reset_fsm_recup <= '0';
			start_fsm_config <= '0';
			load_int <= (others => '1');
			termine <= '0';
			if(start = '1') then
				etat_suivant <= demarrage;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage =>
			reset_fsm_config <= '1';
			reset_fsm_recup <= '1';
			start_fsm_config <= '1';
			load_int <= (others => '1');
			termine <= '0';
			etat_suivant <= attente_donnee;
		
		when attente_donnee =>
			reset_fsm_config <= '1';
			reset_fsm_recup <= '1';
			start_fsm_config <= '0';
			load_int <= b"1_000_0_1_10"; --configurer l'adc
			termine <= '0';
			if(fsm_recup_termine = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_donnee;
			end if;
			
		when fin =>
			reset_fsm_config <= '0';
			reset_fsm_recup <= '0';
			start_fsm_config <= '0';
			load_int <= (others => '0');
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_fsm_config <= '0';
			reset_fsm_recup <= '0';
			start_fsm_config <= '0';
			load_int <= (others => '0');
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;

end Behavioral;


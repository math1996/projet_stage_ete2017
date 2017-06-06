----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:41 05/18/2017 
-- Design Name: 
-- Module Name:    top_test_model_RC_solution - Behavioral 
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

entity top_test_model_RC_solution is
    Port ( clk, reset, rx, DOUT_12bits, DOUT_10bits, SSTRB_10bits : in  STD_LOGIC;
           tx, CS_12bits, DIN_12bits, SCLK_12bits : out  STD_LOGIC;
           CS_10bits, DIN_10bits, SCLK_10bits, SHDN_10bits, occupe : out  STD_LOGIC;
           BPB_dac, OSR1_dac, OSR2_dac, RSTB_dac, MUTEB_dac, FSYNC_dac, SCLK_dac, DIN_dac : out  STD_LOGIC;
			  adc10_termine, adc12_termine : out std_logic);
end top_test_model_RC_solution;

architecture Behavioral of top_test_model_RC_solution is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

signal start_test, start_consigne, occupe_adc12bits, termine_adc12bits, occupe_adc10bits,
			termine_adc10bits, clk_int, demarrer, occupe_envoie, termine_envoie, reg_termine1,
			reg_termine2, occupe_dac, termine_dac, demarrer_envoie, reset_compteur, enable_compteur,
			reset_reg : std_logic;
signal data_adc_12bits, data_adc_10bits, data_int, load_int : std_logic_vector(15 downto 0);
signal data_recu : std_logic_vector(7 downto 0);
signal compteur : std_logic_vector(9 downto 0);
signal choix : std_logic_vector(2 downto 0);

type etat_test_modele_RC is (attente, appliquer_consigne, attente_dac, attente_transitoire, demarrer_test, attente_mesure, demarrer_envoie1, demarrer_envoie2, attente_envoie1, attente_envoie2);
signal etat_present, etat_suivant : etat_test_modele_RC;

begin

adc10_termine <= reg_termine2;
adc12_termine <= reg_termine1;

--occupe <= occupe_adc12bits or occupe_adc10bits or occupe_dac or occupe_envoie;
choix <= data_recu(6 downto 4);

load_int <= X"342B" when choix = "000" else -- 1,87 V
				X"22CB" when choix = "001" else -- 1,25 V
				X"1164" when choix = "010" else -- 0,62 V
				X"0000" when choix = "011" else -- 0 V
				X"F215" when choix = "100" else -- -0.5 V
				X"E42C" when choix = "101" else -- -1 V
				X"D642" when choix = "110" else -- -1.5 V
				X"0000";

compteur_10bits : compteurNbits generic map(10) port map(clk => clk_int, enable => enable_compteur, reset => reset_compteur, output => compteur);

diviseur_horloge : diviseur_clk generic map(4) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

test_ctrl_spi_adc12bits : controle_spi_adc_12bits port map(clk => clk_int, start => start_test, reset  => reset, 
																			DOUT => DOUT_12bits, DIN => DIN_12bits, SCLK => SCLK_12bits,
																			CS => CS_12bits, occupe => occupe_adc12bits, termine => termine_adc12bits,
																			canal => "000", donnees => data_adc_12bits);
																			
test_ctrl_spi_adc10bits : controle_spi_adc_10bits port map(clk => clk_int, reset => reset, start => start_test, DOUT => DOUT_10bits, SSTRB => SSTRB_10bits,
																				DIN => DIN_10bits, SCLK => SCLK_10bits, CS => CS_10bits, SHDN => SHDN_10bits,
																				occupe => occupe_adc10bits, termine => termine_adc10bits, canal => "000",
																				donnes => data_adc_10bits);
																			
test_ctrl_serie_dac16bits : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_consigne, load => load_int,
																					FSYNC => FSYNC_dac, SCLK => SCLK_dac, DIN => DIN_dac, OSR1 => OSR1_dac, OSR2 => OSR2_dac,
																					BPB => BPB_dac, MUTEB => MUTEB_dac, RSTB => RSTB_dac, occupe => occupe_dac, termine => termine_dac);

com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => demarrer);
com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => demarrer_envoie, data => data_int, tx => tx, occupe => occupe_envoie, termine => termine_envoie);

reg_termine_adc12bits : registre1bit port map(clk => clk_int, reset => reset_reg, d => termine_adc12bits, en => termine_adc12bits, q_out => reg_termine1);
reg_termine_adc10bits : registre1bit port map(clk => clk_int, reset => reset_reg, d => termine_adc10bits, en => termine_adc10bits, q_out => reg_termine2);


--machine à état qui gère le déroulement du test
process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(demarrer, etat_present, reg_termine1, reg_termine2, termine_dac, termine_envoie, data_adc_12bits, data_adc_10bits, compteur)
begin
	case etat_present is
		when attente =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '0';
			data_int <= (others => '0');
			occupe <= '0';
			if(demarrer = '1') then
				etat_suivant <= appliquer_consigne;
			else
				etat_suivant <= attente;
			end if;
		
		when appliquer_consigne =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= (others => '0');
			occupe <= '0';
			etat_suivant <= attente_dac;
			
		when attente_dac =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= (others => '0');
			occupe <= '0';
			if(termine_dac = '1') then
				etat_suivant <= attente_transitoire;
			else
				etat_suivant <= attente_dac;
			end if;
			
		when attente_transitoire =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_reg <= '1';
			data_int <= (others => '0');
			occupe <= '0';
			if(compteur >= 1000) then
				etat_suivant <= demarrer_test;
			else
				etat_suivant <= attente_transitoire;
			end if;
			
		when demarrer_test =>
			demarrer_envoie <= '0';
			start_test <= '1';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= (others => '0');
			occupe <= '0';
			etat_suivant <= attente_mesure;
		
		when attente_mesure =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= (others => '0');
			occupe <= '1';
			if(reg_termine1 = '1' and reg_termine2 = '1') then
				etat_suivant <= demarrer_envoie1;
			else
				etat_suivant <= attente_mesure;
			end if;
			
		when demarrer_envoie1 =>
			demarrer_envoie <= '1';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= data_adc_12bits;
			occupe <= '0';
			etat_suivant <= attente_envoie1;
			
		when attente_envoie1 =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= data_adc_12bits;
			occupe <= '0';
			if(termine_envoie = '1') then
				etat_suivant <= demarrer_envoie2;
			else
				etat_suivant <= attente_envoie1;
			end if;
			
		when demarrer_envoie2 =>
			demarrer_envoie <= '1';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= data_adc_10bits;
			occupe <= '0';
			etat_suivant <= attente_envoie2;
		
		when attente_envoie2 =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '1';
			data_int <= data_adc_10bits;
			occupe <= '0';
			if(termine_envoie = '1') then
				etat_suivant <= attente;
			else
				etat_suivant <= attente_envoie2;
			end if;
			
		when others =>
			demarrer_envoie <= '0';
			start_test <= '0';
			start_consigne <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_reg <= '0';
			occupe <= '0';
			etat_suivant <= attente;
	end case;
end process; 
																	
end Behavioral;


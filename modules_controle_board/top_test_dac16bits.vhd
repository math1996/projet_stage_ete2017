----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:30 05/16/2017 
-- Design Name: 
-- Module Name:    top_test_dac16bits - Behavioral 
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

entity top_test_dac16bits is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB  : out  STD_LOGIC);
end top_test_dac16bits;

architecture Behavioral of top_test_dac16bits is

signal reset_ctrl, start_ctrl, termine_dac,  demarrer, clk_int : std_logic;
signal data_recu : std_logic_vector(7 downto 0);
signal data_int, load_int : std_logic_vector(15 downto 0);
signal mode : std_logic_vector(2 downto 0);

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_ctrl_dac is (attente, demarrage, valeur_max_pos, valeur_mid_pos, valeur_max_neg,
										valeur_mid_neg, fin);
										
signal etat_present, etat_suivant : etat_test_ctrl_dac;

begin

diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => demarrer);
ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset_ctrl, start => start_ctrl,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe, termine => termine_dac);
mode <= data_recu(2 downto 0);
																		
--machine à état du test de controle du DAC
process(clk_int, reset)
begin
	if(reset = '0') then	
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(demarrer, etat_present, termine_dac, mode)
begin
	case etat_present is 
		when attente =>
			reset_ctrl <= '0';
			start_ctrl <= '0';
			load_int <= (others => '0');
			termine <= '0';
			if(demarrer = '1') then
				etat_suivant <= demarrage;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage =>
			reset_ctrl <= '1';
			start_ctrl <= '1';
			load_int <= (others => '0');
			termine <= '0';
			if(mode = "00") then
				etat_suivant <= valeur_max_pos;
			elsif(mode = "01") then
				etat_suivant <= valeur_mid_pos;
			elsif(mode = "10") then	
				etat_suivant <= valeur_max_neg;
			else
				etat_suivant <= valeur_mid_neg;
			end if;
			
		when valeur_max_pos =>
			reset_ctrl <= '1';
			start_ctrl <= '0';
			load_int <= X"7FFF";
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= valeur_max_pos;
			end if;
			
		when valeur_mid_pos =>
			reset_ctrl <= '1';
			start_ctrl <= '0';
			load_int <= X"4000"; -- ou 4FFF?
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= valeur_mid_pos;
			end if;
		
		when valeur_max_neg =>
			reset_ctrl <= '1';
			start_ctrl <= '0';
			load_int <= X"8000";
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= valeur_max_neg;
			end if;
		
		when valeur_mid_neg =>
			reset_ctrl <= '1';
			start_ctrl <= '0';
			load_int <= X"BFFF";
			termine <= '0';
			if(termine_dac = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= valeur_mid_neg;
			end if;
		
		when fin =>
			reset_ctrl <= '0';
			start_ctrl <= '0';
			load_int <= (others => '1');
			termine <= '1';
			etat_suivant <= attente;
			
		when others => 
			reset_ctrl <= '0';
			start_ctrl <= '0';
			load_int <= (others => '1');
			etat_suivant <= attente;
	end case;
end process;
																		
end Behavioral;


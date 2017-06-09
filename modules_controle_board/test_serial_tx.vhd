----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:45 05/10/2017 
-- Design Name: 
-- Module Name:    test_serial_tx - Behavioral 
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

entity test_serial_tx is
    Port ( clk, reset, rx , block_tx : in  STD_LOGIC;
           tx : out  STD_LOGIC;
			  data_out_parallele : out std_logic_vector(7 downto 0));
end test_serial_tx;

architecture Behavioral of test_serial_tx is

component serial_tx is 
	port(clk, rst, block_tx, new_data : in std_logic;
			data : in std_logic_vector(7 downto 0);
			busy, tx : out std_logic);
end component;

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_tx is (attente, demarrer_envoie, attente_envoie, fin_envoie, fin);
signal etat_present, etat_suivant : etat_test_tx;

signal termine_int, occupe_int, ready_int, clk_int, reset_compteur, enable_compteur, start_envoie, cmp : std_logic;
signal data_recu : std_Logic_vector(7 downto 0);
signal data_int_add : std_logic_vector(7 downto 0);
signal data_int : std_logic_vector(15 downto 0);
signal compteur : std_logic_vector(7 downto 0);

begin


cmp <= '1' when compteur >=  data_recu else
		 '0';

process(clk_int, reset_compteur, enable_compteur)
begin
	if(reset_compteur = '0') then
		compteur <= (others => '0');
	elsif(clk_int'event and clk_int = '1') then
		if(enable_compteur = '1') then
			compteur <= compteur + 1;
		end if;
	end if;
end process;

process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, ready_int, termine_int, cmp)
begin
	case etat_present is 
		when attente =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			if(ready_int = '1') then
				etat_suivant <= demarrer_envoie;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_envoie =>
			start_envoie <= '1';
			reset_compteur <= '1';
			enable_compteur <= '1';
			etat_suivant <= attente_envoie;
			
		when attente_envoie =>
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '0';
			if(termine_int = '1') then
				etat_suivant <= fin_envoie;
			else 
				etat_suivant <= attente_envoie;
			end if;
			
		when fin_envoie =>
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '0';
			if(cmp = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= demarrer_envoie;
			end if;
		
		when fin =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			etat_suivant <= fin;
		
		when others => 
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '0';
			etat_suivant <= attente;
			
	end case;	
end process;


diviseur_horloge: diviseur_clk generic map(4) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => start_envoie, data => data_int, tx => tx,
																			occupe => occupe_int, termine => termine_int, block_tx => block_tx);
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => ready_int);

data_out_parallele <= data_int_add;
data_int_add <= data_recu + 1;
data_int(15 downto 8) <= data_recu;
data_int(7 downto 0) <= data_int_add;

end Behavioral;


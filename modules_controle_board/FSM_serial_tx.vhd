----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:02 05/10/2017 
-- Design Name: 
-- Module Name:    FSM_serial_tx - Behavioral 
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

entity FSM_serial_tx is
    Port ( clk, start, reset, block_tx : in  STD_LOGIC;
				data : in std_logic_vector(7 downto 0);
				tx, occupe, termine: out  STD_LOGIC);
end FSM_serial_tx;

architecture Behavioral of FSM_serial_tx is

component serial_tx is 
	port(clk, rst, block_tx, new_data : in std_logic;
			data : in std_logic_vector(7 downto 0);
			busy, tx : out std_logic);
end component;

type etat_test_com_serie is (attente, envoie, attente_fin_envoie, fin);
signal etat_present, etat_suivant : etat_test_com_serie;
signal block_tx_int, new_data_int, busy_int, ready_int : std_logic;

begin

com_serie_tx : serial_tx port map(clk => clk, rst => reset, block_tx => block_tx, new_data => new_data_int, data => data, busy => busy_int, tx => tx);

occupe <= busy_int;

process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, busy_int, etat_present)
begin
	case etat_present is
		when attente =>
			new_data_int <= '0';
			termine <= '0';
			if(start = '1') then	
				etat_suivant <= envoie;
			else
				etat_suivant <= attente;
			end if;
			
		when envoie =>
			new_data_int <= '1';
			termine <= '0';
			etat_suivant <= attente_fin_envoie;
		
		when attente_fin_envoie =>
			new_data_int <= '0';
			termine <= '0';
			if(busy_int = '1') then
				etat_suivant <= attente_fin_envoie;
			else
				etat_suivant <= fin;
			end if;
			
		when fin =>
			new_data_int <= '0';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			new_data_int <= '0';
			termine <= '0';
			etat_suivant <= attente;
			
	end case;
end process;
end Behavioral;


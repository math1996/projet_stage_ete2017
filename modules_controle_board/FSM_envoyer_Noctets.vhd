----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:21 05/12/2017 
-- Design Name: 
-- Module Name:    FSM_envoyer_Noctets - Behavioral 
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

entity FSM_envoyer_Noctets is
generic(N: integer:=1);
    Port ( clk, reset, start : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR ((8*N)-1 downto 0);
           tx, occupe, termine : out  STD_LOGIC);
end FSM_envoyer_Noctets;

architecture Behavioral of FSM_envoyer_Noctets is

type etat_fsm_envoie_Noctets is (attente, demarrage1, attente1, demarrage2, attente2, fin, tampon);
signal etat_present, etat_suivant : etat_fsm_envoie_Noctets;

signal reset_tx, demarrage_transfert, termine_transfert, mode: std_logic;
signal data_int :std_logic_vector(7 downto 0);

begin

com_serie_tx : FSM_serial_tx port map(clk => clk, start => demarrage_transfert, reset => reset_tx, data => data_int, tx => tx,
													occupe => occupe, termine => termine_transfert, block_tx => '0');

data_int <= data(15 downto 8) when mode = '0' else
				data(7 downto 0);
													
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, etat_present, termine_transfert, data)
begin
	case etat_present is
		when attente =>
			demarrage_transfert <= '0';
			reset_tx <= '0';
			termine <= '0';
			mode <= '0';
			if(start = '1') then
				etat_suivant <= demarrage1;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage1 =>
			demarrage_transfert <= '1';
			reset_tx <= '1';
			termine <= '0';
			mode <= '0';
			etat_suivant <= attente1;
	
		when attente1 =>
			demarrage_transfert <= '0';
			reset_tx <= '1';
			termine <= '0';
			mode <= '0';
			if(termine_transfert = '1') then
				etat_suivant <= tampon;
			else	
				etat_suivant <= attente1;
			end if;
		
		when tampon =>
			demarrage_transfert <= '0';
			reset_tx <= '1';
			termine <= '0';
			mode <= '0';
			etat_suivant <= demarrage2;
			
		when demarrage2 =>
			demarrage_transfert <= '1';
			reset_tx <= '1';
			termine <= '0';
			mode <= '1';
			etat_suivant <= attente2;
		
		when attente2 =>
			demarrage_transfert <= '0';
			reset_tx <= '1';
			termine <= '0';
			mode <= '1';
			if(termine_transfert = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente2;
			end if;
			
		when fin =>
			demarrage_transfert <= '0';
			reset_tx <= '0';
			termine <= '1';
			mode <= '0';
			etat_suivant <= attente;
			
		when others =>
			demarrage_transfert <= '0';
			reset_tx <= '0';
			termine <= '0';
			mode <= '0';
			etat_suivant <= attente;
	end case;
end process;
end Behavioral;


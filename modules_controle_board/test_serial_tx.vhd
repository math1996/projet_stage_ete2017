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
    Port ( clk, reset, rx : in  STD_LOGIC;
           tx, occupe : out  STD_LOGIC;
			  data_out_parallele : out std_logic_vector(7 downto 0));
end test_serial_tx;

architecture Behavioral of test_serial_tx is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

component serial_tx is 
	port(clk, rst, block_tx, new_data : in std_logic;
			data : in std_logic_vector(7 downto 0);
			busy, tx : out std_logic);
end component;

type etat_test_tx is (attente, demarrer_envoie, attente_envoie, fin_envoie, fin);
signal etat_present, etat_suivant : etat_test_tx;

signal termine_int, occupe_int, ready_int, clk_int, reset_compteur, enable_compteur, start_envoie, cmp, busy_int, demarrer_transfert,
			occupe_envoie, termine_envoie, mode, occupe_rx, occupe_tx: std_logic;
signal data_recu, data_recu_int : std_Logic_vector(7 downto 0);
signal data_int_add, data_envoie : std_logic_vector(7 downto 0);
signal data_int : std_logic_vector(15 downto 0);
signal compteur : std_logic_vector(7 downto 0);

begin


cmp <= '1' when compteur >=  16 else
		 '0';
occupe <= occupe_rx or occupe_tx;

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
			etat_suivant <= attente;
		
		when others => 
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '0';
			etat_suivant <= attente;
			
	end case;	
end process;

--mux
--data_envoie <= data_int(15 downto 8) when mode = '0' else
--					data_int(7 downto 0);

diviseur_horloge: diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

--com_serie_tx : FSM_envoyer_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => start_envoie, data => data_int, tx => tx,
--																		occupe => occupe_int, termine => termine_int);
																		
--com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => ready_int);

com_serie_rx : receveur_UART port map(clk => clk_int, reset => reset, rx => rx, data_out => data_recu_int, data_rdy => ready_int, occupe => occupe_rx);
com_serie_tx : transmetteur_UART_Noctets generic map(2) port map(clk => clk_int, reset => reset, start => start_envoie, data_in => data_int, occupe => occupe_tx, termine => termine_int, tx => tx);

--com_serie_tx : serial_tx port map(clk => clk_int, rst => reset, block_tx => '0', new_data => demarrer_transfert, data => data_int_add, busy => busy_int, tx => tx);
--com_serie_tx : FSM_serial_tx port map(clk => clk_int, start => demarrer_transfert, reset => reset, block_tx => '0', data => data_envoie, tx => tx, occupe => occupe_envoie,
--												termine => termine_envoie);

--process(reset, clk_int)
--begin
--	if(reset = '0') then
--		etat_present <= attente;
--	elsif(clk_int'event and clk_int = '1') then
--		etat_present <= etat_suivant;
--	end if;
--end process;
--
--process(etat_present, cmp, ready_int, termine_envoie)
--begin
--	case etat_present is 
--		when attente =>
--			enable_compteur <= '0';
--			reset_compteur <= '0';
--			demarrer_transfert <= '0';
--			mode <= '0';
--			if(ready_int = '1') then
--				etat_suivant <= demarrer1;
--			else
--				etat_suivant <= attente;
--			end if;
--			
--		when demarrer1 =>
--			enable_compteur <= '1';
--			reset_compteur <= '1';
--			demarrer_transfert <= '1';
--			mode <= '0';
--			etat_suivant <= attente_envoie1;
--		
--		when attente_envoie1 =>
--			enable_compteur <= '0';
--			reset_compteur <= '1';
--			demarrer_transfert <= '0';
--			mode <= '0';
--			if(termine_envoie = '1') then
--				etat_suivant <= tampon;
--			else
--				etat_suivant <= attente_envoie1;
--			end if;
--		
--		when tampon =>
--			enable_compteur <= '0';
--			reset_compteur <= '1';
--			demarrer_transfert <= '0';
--			mode <= '0';
--			etat_suivant <= demarrer2;
--		
--		when demarrer2 =>
--			enable_compteur <= '0';
--			reset_compteur <= '1';
--			demarrer_transfert <= '1';
--			mode <= '1';
--			etat_suivant <= attente_envoie2;
--		
--		when attente_envoie2 =>
--			enable_compteur <= '0';
--			reset_compteur <= '1';
--			demarrer_transfert <= '0';
--			mode <= '1';
--			if(termine_envoie = '1') then
--				etat_suivant <= fin_envoie;
--			else
--				etat_suivant <= attente_envoie2;
--			end if;
--			
--		when fin_envoie =>
--			enable_compteur <= '0';
--			reset_compteur <= '1';
--			demarrer_transfert <= '0';
--			mode <= '1';
--			if(cmp = '1') then
--				etat_suivant <= attente;
--			else
--				etat_suivant <= demarrer1;
--			end if;
--			
--		when others =>
--			enable_compteur <= '0';
--			reset_compteur <= '0';
--			demarrer_transfert <= '0';
--			mode <= '0';
--			etat_suivant <= attente;
--	end case;	
--end process;

data_recu <= data_recu_int(0) & data_recu_int(1) & data_recu_int(2) & data_recu_int(3) & data_recu_int(4) & data_recu_int(5) & data_recu_int(6) & data_recu_int(7);
data_out_parallele <= data_int_add;
data_int_add <= data_recu + 1;
data_int(15 downto 8) <= data_recu;
data_int(7 downto 0) <= data_int_add;

end Behavioral;


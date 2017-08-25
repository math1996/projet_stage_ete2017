----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:55 08/17/2017 
-- Design Name: 
-- Module Name:    transmetteur_UART_Noctets - Behavioral 
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
use IEEE.math_real.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmetteur_UART_Noctets is
generic(N : integer := 4);
    Port ( clk, reset, start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR ((8*N)-1 downto 0);
           occupe, termine, tx : out  STD_LOGIC);
end transmetteur_UART_Noctets;

architecture Behavioral of transmetteur_UART_Noctets is

type etat_transmetteur_Noctets is (attente, load_input, envoyer, attente_envoie, compter_envoie, fin);
signal etat_present, etat_suivant : etat_transmetteur_Noctets;

signal start_envoie, occupe_envoie, termine_envoie, reset_compteur, enable_compteur, cmp_fin_envoie, occupe_int, reset_input, enable_input : std_logic;
signal data_mux : tableau_memoire_8bits(N-1 downto 0);
signal compte_data : std_logic_vector((integer(ceil(log2(real(N))))) downto 0);
signal data_in_int : std_logic_vector((8*N)-1 downto 0);
signal data_int, data_int_envoie : std_logic_vector(7 downto 0);

begin

--signaux de sortie
occupe <= occupe_int or occupe_envoie;

--transmetteur UART
com_tx : transmetteur_UART port map(clk => clk, reset => reset, start => start_envoie, data_in => data_int, occupe => occupe_envoie, termine => termine_envoie, tx => tx);

--mux des données à envoyer
gen_mux : for i in 0 to N-1 generate 
	data_mux(i) <= data_in_int(8*(N-i)-1 downto 8*(N-1-i));
end generate gen_mux;

--compteur des données à envoyer
compteur_data_envoie : compteurNbits generic map((integer(ceil(log2(real(N))))) + 1) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_data);

--mux d'envoie des données
data_int <= data_mux(to_integer(unsigned(compte_data)));

--comparateur
cmp_fin_envoie <= '1' when compte_data >= N-1 else
						'0';
						
--registre de l'input
registre_input : registreNbits generic map(8*N) port map(clk => clk, reset => reset_input, en => enable_input, d => data_in, q_out => data_in_int);

--machine à état de l'envoie sur le port série
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin_envoie, termine_envoie)
begin
	case etat_present is
		when attente =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_input <= '0';
			enable_input <= '0';
			occupe_int <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_input;
			else
				etat_suivant <= attente;
			end if;
			
		when load_input =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_input <= '1';
			enable_input <= '1';
			occupe_int <= '1';
			termine <= '0';
			etat_suivant <= envoyer;
			
		when envoyer =>
			start_envoie <= '1';
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_input <= '1';
			enable_input <= '0';
			occupe_int <= '1';
			termine <= '0';
			etat_suivant <= attente_envoie;
			
		when attente_envoie =>
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '0';
			reset_input <= '1';
			enable_input <= '0';
			occupe_int <= '1';
			termine <= '0';
			if(termine_envoie = '1' and cmp_fin_envoie = '1') then
				etat_suivant <= fin;
			elsif(termine_envoie = '1' and cmp_fin_envoie = '0') then
				etat_suivant <= compter_envoie;
			else
				etat_suivant <= attente_envoie;
			end if;
			
		when compter_envoie =>
			start_envoie <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_input <= '1';
			enable_input <= '0';
			occupe_int <= '1';
			termine <= '0';
			etat_suivant <= envoyer;
			
		when fin =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_input <= '0';
			enable_input <= '0';
			occupe_int <= '1';
			termine <= '1';
			etat_suivant <= attente;
			
		when others =>
			start_envoie <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_input <= '0';
			enable_input <= '0';
			occupe_int <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;
end process;						
						
end Behavioral;


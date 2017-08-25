----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:39 08/14/2017 
-- Design Name: 
-- Module Name:    transmetteur_UART - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmetteur_UART is
    Port ( clk, reset, start : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           occupe, termine, tx : out  STD_LOGIC);
end transmetteur_UART;

architecture Behavioral of transmetteur_UART is

constant clk_per_bit : integer := 54;

type etat_FSM_UART_tx is (attente, load_data, start_bit, reset_compte_start, data_bit, compter_data, reset_compte_stop, stop_bit, fin);
signal etat_present, etat_suivant : etat_FSM_UART_tx;

component rdc_load_nbits is
generic(N: integer := 8);
    Port ( load : in  STD_LOGIC_VECTOR(N-1 downto 0);
           enable,reset,clk, input : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component compteurNbits is
generic(N: integer := 4);
    Port ( clk,enable,reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component;


signal enable_rdc, reset_rdc, mode_rdc, enable_compteur_clk, reset_compteur_clk, cmp_fin_bit, cmp_fin_transfert_data, tx_int,
			enable_compteur_data, reset_compteur_data : std_logic;
signal compte_nb_clk : std_logic_vector((integer(ceil(log2(real(clk_per_bit))))) downto 0);
signal compte_nb_data : std_logic_vector(2 downto 0);

begin

--rdc des données à envoyer
rdc_data_envoie : rdc_load_nbits generic map(8) port map(clk => clk, enable => enable_rdc, reset => reset_rdc, input => '0', mode => mode_rdc,
						output => tx_int, load => data_in);
						
--compteur du nb de coup d'horloge
compteur_nb_clk : compteurNbits generic map((integer(ceil(log2(real(clk_per_bit))))) + 1) port map(clk => clk, enable => enable_compteur_clk, reset => reset_compteur_clk, output => compte_nb_clk);

--compteur du nb de data envoyé
compteur_nb_data : compteurNbits generic map(3) port map(clk => clk, enable => enable_compteur_data, reset => reset_compteur_data, output => compte_nb_data);

--comparateur
cmp_fin_bit <= '1' when compte_nb_clk >= (clk_per_bit - 1) else
					'0';
					
cmp_fin_transfert_data <= '1' when compte_nb_data >= 7 else
								  '0';
		
--machine à état de la gestion du transfert
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then 
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_fin_bit, cmp_fin_transfert_data, tx_int)
begin
	case etat_present is 
		when attente =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= load_data;
			else
				etat_suivant <= attente;
			end if;
		
		when load_data =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '1';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= start_bit;
		
		when start_bit =>
			reset_rdc <= '1';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '1';
			enable_compteur_clk <= '1';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '0';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_bit = '1') then
				etat_suivant <= reset_compte_start;
			else
				etat_suivant <= start_bit;
			end if;
		
		when reset_compte_start =>
			reset_rdc <= '1';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '0';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= data_bit;
			
		when data_bit =>
			reset_rdc <= '1';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '1';
			enable_compteur_clk <= '1';
			reset_compteur_data <= '1';
			enable_compteur_data <= '0';
			tx <= tx_int;
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_bit = '1') then
				etat_suivant <= compter_data;
			else
				etat_suivant <= data_bit;
			end if;
			
		when compter_data =>
			reset_rdc <= '1';
			enable_rdc <= '1';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '1';
			enable_compteur_data <= '1';
			tx <= tx_int;
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_transfert_data = '1') then
				etat_suivant <= reset_compte_stop;
			else
				etat_suivant <= data_bit;
			end if;
			
		when reset_compte_stop =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '1';
			termine <= '0';
			etat_suivant <= stop_bit;
			
		when stop_bit =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '1';
			enable_compteur_clk <= '1';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '1';
			termine <= '0';
			if(cmp_fin_bit = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= stop_bit;
			end if;
			
		when fin =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '1';
			termine <= '1';
			etat_suivant <= attente;
		
		when others =>
			reset_rdc <= '0';
			enable_rdc <= '0';
			mode_rdc <= '0';
			reset_compteur_clk <= '0';
			enable_compteur_clk <= '0';
			reset_compteur_data <= '0';
			enable_compteur_data <= '0';
			tx <= '1';
			occupe <= '0';
			termine <= '0';
			etat_suivant <= attente;
	end case;		
end process;			

end Behavioral;


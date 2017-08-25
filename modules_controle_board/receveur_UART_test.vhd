----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:10 07/24/2017 
-- Design Name: 
-- Module Name:    receveur_UART_test - Behavioral 
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

entity receveur_UART is
    Port ( clk, reset, rx : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           data_rdy, occupe : out  STD_LOGIC);
end receveur_UART;

architecture Behavioral of receveur_UART is

constant clk_per_bit : integer := 54; 
constant nb_bit : integer := 9;

component rdc_8bits is
    Port ( clk, enable, reset, input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component compteurNbits is
generic(N: integer := 4);
    Port ( clk,enable,reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component;


type etat_UART is (attente, verif_start_bit, attente_milieu, recuperer_bit, attente_fin_bit, verif_fin, fin, attente_stop_bit);
signal etat_present, etat_suivant : etat_UART;

signal reset_compteur, enable_compteur, reset_compteur_bit, enable_compteur_bit, cmp_milieu, cmp_fin_bit, cmp_fin_data, enable_rdc : std_logic;
signal compte_nb_clk  : std_logic_vector((integer(ceil(log2(real(clk_per_bit))))) downto 0);
signal compte_nb_bits : std_logic_vector((integer(ceil(log2(real(nb_bit))))) downto 0);

begin

--compteur du UART
compteur_nb_clk : compteurNbits generic map((integer(ceil(log2(real(clk_per_bit))))) + 1) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_nb_clk);

--compteur du nombre de bit recu
compteur_nb_bit : compteurNbits generic map((integer(ceil(log2(real(nb_bit))))) + 1) port map(clk => clk, reset => reset_compteur_bit, enable => enable_compteur_bit, output => compte_nb_bits);

--comparateurs
cmp_milieu <= '1' when compte_nb_clk >= (clk_per_bit/2) else
				  '0';
				  
cmp_fin_bit <= '1' when compte_nb_clk >= (clk_per_bit - 2) else
					'0';
					
cmp_fin_data <= '1' when compte_nb_bits >= nb_bit else
							'0';
						
--registre à décalage de récupération des données
registre_recup_data : rdc_8bits port map(clk => clk, enable => enable_rdc, reset => reset, input => rx, output => data_out);

--machine à état
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, rx, cmp_fin_bit, cmp_milieu, cmp_fin_data)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_compteur_bit <= '0';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '0';
			data_rdy <= '0';
			if(rx = '0') then
				etat_suivant <= verif_start_bit;
			else
				etat_suivant <= attente;
			end if;

		when verif_start_bit =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_compteur_bit <= '0';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(rx = '0') then
				etat_suivant <= attente_milieu;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_milieu =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_compteur_bit <= '1';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(cmp_milieu = '1') then
				etat_suivant <= recuperer_bit;
			else
				etat_suivant <= attente_milieu;
			end if;
			
		when recuperer_bit =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_compteur_bit <= '1';
			enable_compteur_bit <= '1';
			enable_rdc <= '1';
			occupe <= '1';
			data_rdy <= '0';
			etat_suivant <= attente_fin_bit;
			
		when attente_fin_bit =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_compteur_bit <= '1';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(cmp_fin_bit = '1') then
				etat_suivant <= verif_fin;
			else
				etat_suivant <= attente_fin_bit;
			end if;
			
		when verif_fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_compteur_bit <= '1';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(cmp_fin_data = '1') then
				etat_suivant <= attente_stop_bit;
			else
				etat_suivant <= attente_milieu;
			end if;
			
		when attente_stop_bit =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			reset_compteur_bit <= '0';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(cmp_fin_bit = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_stop_bit;
			end if;
			
		when fin =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_compteur_bit <= '0';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '1';
			data_rdy <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			reset_compteur_bit <= '0';
			enable_compteur_bit <= '0';
			enable_rdc <= '0';
			occupe <= '0';
			data_rdy <= '0';
			etat_suivant <= attente;
	end case;		
end process;

end Behavioral;


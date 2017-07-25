----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:13 07/25/2017 
-- Design Name: 
-- Module Name:    test_diviseur_clk_precision - Behavioral 
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

entity test_diviseur_clk_precision is
    Port ( clk, reset, rx : in  STD_LOGIC;
           clk_out, occupe : out  STD_LOGIC);
end test_diviseur_clk_precision;

architecture Behavioral of test_diviseur_clk_precision is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_div_clk_precision is (attente, attente_param, attente_clk);
signal etat_present, etat_suivant : etat_test_div_clk_precision;

signal data_recu : std_logic_vector(7 downto 0);
signal new_data_int, cmp_param, reset_compteur_buffer, start_div_clk : std_logic;
signal output_buffer_rx : tableau_memoire_8bits(3 downto 0);
signal compte_buffer : std_logic_vector(4 downto 0);


begin

--module de communication série
com_serie_rx : serial_rx port map(clk => clk, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

--buffer rx
buffer_rx : buffer_8xM generic map(4) port map(clk => clk, enable => new_data_int, reset => reset, input => data_recu, output => output_buffer_rx);

--compteur du nombre de données reçus dans le buffer
compteur_buffer : compteurNbits generic map(5) port map(clk => clk, enable => new_data_int, reset => reset,
																				output => compte_buffer);
																				
--comparateur
cmp_param <= '1' when compte_buffer >= 4 else
				 '0';
				 
--module du diviseur clk				 
div_clk : diviseur_clk_precision port map(clk => clk, reset => reset, start => start_div_clk, temps_attente => (output_buffer_rx(3) & output_buffer_rx(2)
														& output_buffer_rx(1) & output_buffer_rx(0)) , clk_out => clk_out);
--machine à état de la gestion du test
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, new_data_int, cmp_param)
begin
	case etat_present is
		when attente =>
			start_div_clk <= '0';
			occupe <= '0';
			if(new_data_int = '1') then
				etat_suivant <= attente_param;
			else
				etat_suivant <= attente;
			end if;
			
		when attente_param =>
			start_div_clk <= '0';
			occupe <= '1';
			if(cmp_param = '1') then
				etat_suivant <= attente_clk;
			else
				etat_suivant <= attente_param;
			end if;
			
		when attente_clk =>
			start_div_clk <= '1';
			occupe <= '1';
			etat_suivant <= attente_clk;
			
		when others =>
			start_div_clk <= '0';
			occupe <= '0';
			etat_suivant <= attente;
			
	end case;
end process;			 
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:35 07/25/2017 
-- Design Name: 
-- Module Name:    diviseur_clk_precision - Behavioral 
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

entity diviseur_clk_precision is
    Port ( clk, reset, start : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           clk_out : out  STD_LOGIC);
end diviseur_clk_precision;

architecture Behavioral of diviseur_clk_precision is

type etat_div_clk is (attente, attente_clk, reset_clk);--attente_1, reset_compte1, attente_0, reset_compte2);
signal etat_present, etat_suivant : etat_div_clk;

signal cmp_attente, reset_compteur, enable_compteur, reset_input, enable_input, enable_reg, q_int, q_int_n  : std_logic;
signal compte_attente, temps_attente_int : std_logic_vector(31 downto 0);

begin

--registre temps attente
--registre_param_attente : registreNbits generic map(32) port map(clk => clk, reset => reset_input, en => enable_input, d => temps_attente, q_out => temps_attente_int);

--compteur du diviseur de fréquence
compteur_div_clk : compteurNbits generic map(32) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_attente);

--registre clk
reg_clk : registre1bit port map(clk => clk, reset => reset, en => enable_reg, d => q_int_n, q_out => q_int);

q_int_n <= not(q_int);
clk_out <= q_int;

--comparateur 
cmp_attente <= '1' when compte_attente >= (temps_attente - 1) else
					'0';

--machine à état du diviseur d'horloge
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, start, cmp_attente)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '0';
			enable_compteur <= '0';
--			reset_input <= '0';
--			enable_input <= '0';
			enable_reg <= '0';
			if(start = '1') then
				etat_suivant <= attente_clk;
			else
				etat_suivant <= attente;
			end if;
		
		when attente_clk =>
			reset_compteur <= '1';
			enable_compteur <= '1';
			enable_reg <= '0';
			if(cmp_attente = '1') then
				etat_suivant <= reset_clk;
			else
				etat_suivant <= attente_clk;
			end if;
			
		when reset_clk =>
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_reg <= '1';
			etat_suivant <= attente_clk;
			
--		when latch_input =>
--			reset_compteur <= '0';
--			enable_compteur <= '0';
--			reset_input <= '1';
--			enable_input <= '1';
--			clk_out <= '0';
--			etat_suivant <= attente_1;
			
--		when attente_1 =>
--			reset_compteur <= '1';
--			enable_compteur <= '1';
----			reset_input <= '1';
----			enable_input <= '0';
--			clk_out <= '1';
--			if(cmp_attente = '1') then
--				etat_suivant <= reset_compte1;
--			else
--				etat_suivant <= attente_1;
--			end if;
--			
--		when reset_compte1 =>
--			reset_compteur <= '0';
--			enable_compteur <= '0';
----			reset_input <= '1';
----			enable_input <= '0';
--			clk_out <= '1';
--			etat_suivant <= attente_0;
--		
--		when attente_0 =>
--			reset_compteur <= '1';
--			enable_compteur <= '1';
----			reset_input <= '1';
----			enable_input <= '0';
--			clk_out <= '0';
--			if(cmp_attente = '1') then
--				etat_suivant <= reset_compte2;
--			else
--				etat_suivant <= attente_0;
--			end if;
--			
--		when reset_compte2 =>
--			reset_compteur <= '0';
--			enable_compteur <= '0';
----			reset_input <= '1';
----			enable_input <= '0';
--			clk_out <= '0';
--			etat_suivant <= attente_1;
--			
		when others => 
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_reg <= '0';
			etat_suivant <= attente;
	end case;
end process;

end Behavioral;


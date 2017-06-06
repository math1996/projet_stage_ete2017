----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:58 05/31/2017 
-- Design Name: 
-- Module Name:    test_generation_onde_triangle_pulse - Behavioral 
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

entity test_generation_onde_triangle_pulse is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end test_generation_onde_triangle_pulse;

architecture Behavioral of test_generation_onde_triangle_pulse is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;


signal clk_int, termine_dac, occupe_dac, start_gen, start_transfert_int, termine_gen, occupe_gen,
		reset_int, reset_compteur, cmp, new_data_int : std_logic;
signal comparaison, pulse, onde_genere_int, onde_pulse, resultat_offset : std_logic_vector(15 downto 0);
signal mux : std_logic;

signal data_recu, nombre_cycle_int, choix_horloge_int : std_logic_vector(7 downto 0);
signal offset_int, amplitude_int, load_int, pas_comptage_int : std_logic_vector(15 downto 0);
signal temps_attente_int : std_logic_vector(31 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(11 downto 0);
signal compte_buffer, choix_horloge : std_logic_vector(3 downto 0);

type etat_test_gen_tri_pulse is (attente, demarrage);
signal etat_suivant, etat_present : etat_test_gen_tri_pulse;

begin

occupe <= occupe_gen;
termine <= termine_gen;
cmp <= '1' when compte_buffer >= 12 else
					'0';


choix_horloge_int <= output_buffer_rx(11);
nombre_cycle_int <=  output_buffer_rx(10);	
amplitude_int(15 downto 8) <= output_buffer_rx(9);
amplitude_int(7 downto 0) <= output_buffer_rx(8);
offset_int(15 downto 8) <= output_buffer_rx(7);
offset_int(7 downto 0) <= output_buffer_rx(6);
pas_comptage_int(15 downto 8) <= output_buffer_rx(5);
pas_comptage_int(7 downto 0) <= output_buffer_rx(4);
temps_attente_int(31 downto 24) <= output_buffer_rx(3);
temps_attente_int(23 downto 16) <= output_buffer_rx(2);
temps_attente_int(15 downto 8) <= output_buffer_rx(1);
temps_attente_int(7 downto 0) <= output_buffer_rx(0);							
							
reset_int <= reset and reset_compteur;
choix_horloge <= choix_horloge_int(3 downto 0);

--clk à 25 MHz
--générer l'onde à l'infinie pour les tests!!
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

gen_onde_triangle : generation_onde_triangle port map(clk => clk_int, reset => reset, start => start_gen, termine_dac => termine_dac,
																		temps_attente => temps_attente_int, pas_comptage => pas_comptage_int, amplitude => amplitude_int,
																		offset => offset_int, onde_genere => onde_genere_int, demarrer_transfert => start_transfert_int, nombre_cycle => nombre_cycle_int,
																		occupe => occupe_gen, termine => termine_gen);
																		
com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);
																		
																	
compteur_onde_pulse : compteurNbits generic map(16) port map(clk => clk_int, reset => reset, enable => '1', output => pulse);

buffer_rx : buffer_8xM generic map(12) port map(clk => clk_int, enable => new_data_int, reset => reset, input => data_recu, output => output_buffer_rx);

compteur_start : compteurNbits generic map(4) port map(clk => clk_int, enable => new_data_int, reset => reset_int, output => compte_buffer);

--mux générant les horloges à comparer
mux <=  pulse(0) when choix_horloge = "0000" else
		  pulse(1) when choix_horloge = "0001" else
		  pulse(2) when choix_horloge = "0010" else
		  pulse(3) when choix_horloge = "0011" else
		  pulse(4) when choix_horloge = "0100" else
		  pulse(5) when choix_horloge = "0101" else
		  pulse(6) when choix_horloge = "0110" else
		  pulse(7) when choix_horloge = "0111" else
		  pulse(8) when choix_horloge = "1000" else
		  pulse(9) when choix_horloge = "1001" else
		  pulse(10) when choix_horloge = "1010" else
		  pulse(11) when choix_horloge = "1011" else
		  pulse(12) when choix_horloge = "1100" else
		  pulse(13) when choix_horloge = "1101" else
		  pulse(14) when choix_horloge = "1110" else
		  pulse(15);

--offset
add_offset_partie_pos : addition_offset port map(amplitude => (others => '0'), offset => offset_int, resultat => resultat_offset);

--signal de comparaison		  
comparaison <= mux & mux & mux & mux & mux & mux & mux & mux & mux & mux
					& mux & mux & mux & mux & mux & mux;

--résultat de la comparaison
load_int <= resultat_offset when ((comparaison and onde_genere_int) = "0000000000000000") else
					(comparaison and onde_genere_int);


process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(cmp, etat_present)
begin
	case etat_present is
		when attente =>
			start_gen <= '0';
			reset_compteur <= '1';
			if(cmp = '1') then
				etat_suivant <= demarrage;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrage =>
			start_gen <= '1';
			reset_compteur <= '0';
			etat_suivant <= attente;
			
		when others => 
			start_gen <= '0';
			etat_suivant <= attente;
	end case;
end process;

end Behavioral;


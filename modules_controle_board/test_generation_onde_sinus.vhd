----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:35 05/30/2017 
-- Design Name: 
-- Module Name:    test_generation_onde_sinus - Behavioral 
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

entity test_generation_onde_sinus is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end test_generation_onde_sinus;

architecture Behavioral of test_generation_onde_sinus is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_gen_sin is (attente, demarrage);
signal etat_suivant, etat_present : etat_test_gen_sin;

signal data_recu, nb_cycle_int, pas_int : std_logic_vector(7 downto 0);
signal new_data_int, clk_int, occupe_dac, termine_dac, reset_int, reset_compteur,
			comparaison, start_gen, start_transfert_int, occupe_gen, termine_gen: std_logic;
signal output_buffer_rx : tableau_memoire_8bits(9 downto 0);
signal compte_buffer : std_logic_vector(3 downto 0);
signal load_int, amplitude_int, offset_int : std_logic_vector(15 downto 0);
signal temps_attente_int : std_logic_vector(31 downto 0);


begin

occupe <= occupe_gen or occupe_dac;
termine <= termine_gen;

reset_int <= reset_compteur and reset;
comparaison <= '1' when compte_buffer >= 10 else
					'0';

nb_cycle_int <= output_buffer_rx(9);
temps_attente_int(31 downto 24) <= output_buffer_rx(8);
temps_attente_int(23 downto 16) <= output_buffer_rx(7);
temps_attente_int(15 downto 8) <= output_buffer_rx(6);
temps_attente_int(7 downto 0) <= output_buffer_rx(5);
pas_int <= output_buffer_rx(4);
amplitude_int(15 downto 8) <= output_buffer_rx(3);
amplitude_int(7 downto 0) <= output_buffer_rx(2);
offset_int(15 downto 8) <= output_buffer_rx(1);
offset_int(7 downto 0) <= output_buffer_rx(0);


com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);

ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);
																		
gen_sinus : generation_onde_sin port map(clk => clk_int, reset => reset, start => start_gen, termine_dac => termine_dac, temps_attente => temps_attente_int,
																			pas => pas_int, amplitude => amplitude_int, offset => offset_int, nombre_cycle => nb_cycle_int, 
																			onde_genere => load_int, demarrer_transfert => start_transfert_int, occupe => occupe_gen, termine => termine_gen);

diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

buffer_rx : buffer_8xM generic map(10) port map(clk => clk_int, enable => new_data_int, reset => reset, input => data_recu, output => output_buffer_rx);

compteur_start : compteurNbits generic map(4) port map(clk => clk_int, enable => new_data_int, reset => reset_int, output => compte_buffer);

process(clk_int, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk_int'event and clk_int = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(comparaison, etat_present)
begin
	case etat_present is
		when attente =>
			start_gen <= '0';
			reset_compteur <= '1';
			if(comparaison = '1') then
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


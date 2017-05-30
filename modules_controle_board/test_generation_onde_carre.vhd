----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:00 05/22/2017 
-- Design Name: 
-- Module Name:    test_generation_onde_carre - Behavioral 
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

entity test_generation_onde_carre is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end test_generation_onde_carre;

architecture Behavioral of test_generation_onde_carre is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_test_gen_carre is (attente, demarrage);
signal etat_suivant, etat_present : etat_test_gen_carre;

signal data_recu, nb_cycle_int : std_logic_vector(7 downto 0);
signal clk_int, start_transfert_int, termine_dac, new_data_int, occupe_dac, occupe_gen, termine_gen,
			comparaison, reset_int, reset_compteur, start_gen : std_logic;
signal duty_cycle_int, nb_coup_horloge_par_cycle_int : std_logic_vector(31 downto 0);
signal offset_int, amplitude_int, load_int : std_logic_vector(15 downto 0);
signal output_buffer_rx : tableau_memoire_8bits(12 downto 0);
signal compte_buffer : std_logic_vector(3 downto 0);

begin

--mode <= data_recu(2 downto 0);
--
--nb_coup_horloge_par_cycle_int <= "00000000000000000000100111000100" when mode = "000" else  --10 kHz
--											"00000000000000000000100111000100" when mode = "001" else --10 kHz
--											"00000000000000000110000110101000" when mode = "010" else --1 kHz
--											"00000000000000111101000010010000" when mode = "011" else --100 Hz
--											"10010101000000101111100100000000" when mode = "100" else --0.01 Hz
--											"00000000000000000110000110101000" when mode = "101" else --1 kHz
--											"00000000000000000110000110101000" when mode = "110" else --1 kHz
--											"00000000000000000000100111000100";								 --10 kHz
--
--amplitude_int <= "0111111111111111" when mode = "101" else	--4.6 V
--						"0010000101100011" when mode = "110" else	--1.2 V
--						"0000110111101001" when mode = "111" else	--0.5 V
--						"0001101111010011";								--1 V
--						
--offset_int <= "0000110111101001" when mode = "001" else		--0.5 V
--					"0011011110100110" when mode = "010" else		--2 V
--					"1110101100100010" when mode = "111" else		-- -0.75 V
--					"1110010000101101" when mode = "110" else		-- -1 V
--					(others => '0');										--0 V
--					
--duty_cycle_int <= "00000000000000000000010011100010" when mode = "000" else	--50 %
--						"00000000000000000000010011100010" when mode = "001" else	--50 %
--						"00000000000000000000100111000100" when mode = "010" else	--10 %
--						"00000000000000110110111011101000" when mode = "011" else	--90 %
--						"01001010100000010111110010000000" when mode = "100" else	--50 %
--						"00000000000000000001110101001100" when mode = "101" else	--30 %
--						"00000000000000000011000011010100" when mode = "110" else	--50 %
--						"00000000000000000000010011100010"; 								--50 %
-- 
--nb_cycle_int <=   "00001000" when mode = "000" else 	--8 cycles
--						"11001000" when mode = "001" else		--200 cycles
--						"00000010" when mode = "010" else		--2 cycles
--						"11111111" when mode = "011" else		--255 cycles
--						"00000001" when mode = "100" else		--1 cycle
--						"10011011" when mode = "101" else		--155 cycles
--						"11101111" when mode = "110" else		--239 cycles
--						"11001000";										--200 cycles

occupe <= occupe_dac or occupe_gen;
termine <= termine_gen;

comparaison <= '1' when compte_buffer >= 13 else
					'0';
reset_int <= reset and reset_compteur;

nb_cycle_int <= output_buffer_rx(12);
duty_cycle_int(31 downto 24) <= output_buffer_rx(11);
duty_cycle_int(23 downto 16) <= output_buffer_rx(10);
duty_cycle_int(15 downto 8) <= output_buffer_rx(9);
duty_cycle_int(7 downto 0) <= output_buffer_rx(8);
nb_coup_horloge_par_cycle_int(31 downto 24) <= output_buffer_rx(7);
nb_coup_horloge_par_cycle_int(23 downto 16) <= output_buffer_rx(6);
nb_coup_horloge_par_cycle_int(15 downto 8) <= output_buffer_rx(5);
nb_coup_horloge_par_cycle_int(7 downto 0) <= output_buffer_rx(4);
amplitude_int(15 downto 8) <= output_buffer_rx(3);
amplitude_int(7 downto 0) <= output_buffer_rx(2);
offset_int(15 downto 8) <= output_buffer_rx(1);
offset_int(7 downto 0) <= output_buffer_rx(0);

--clk à 25 MHz
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);
ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);

gen_onde_carre : generation_onde_carre port map(clk => clk_int, reset => reset, start => start_gen, termine_dac => termine_dac,
																nombre_cycle => nb_cycle_int, duty_cycle => duty_cycle_int, nb_coup_horloge_par_cycle => nb_coup_horloge_par_cycle_int,
																amplitude => amplitude_int, offset => offset_int, onde_genere => load_int, occupe => occupe_gen, termine => termine_gen,
																demarrer_transfert => start_transfert_int);

buffer_rx : buffer_8xM generic map(13) port map(clk => clk_int, enable => new_data_int, reset => reset, input => data_recu, output => output_buffer_rx);

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


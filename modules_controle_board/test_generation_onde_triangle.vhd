----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:39 05/24/2017 
-- Design Name: 
-- Module Name:    test_generation_onde_triangle - Behavioral 
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

entity test_generation_onde_triangle is
    Port ( clk, reset, rx : in  STD_LOGIC;
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end test_generation_onde_triangle;

architecture Behavioral of test_generation_onde_triangle is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

signal data_recu, nombre_cycle_int : std_logic_vector(7 downto 0);
signal clk_int, start_transfert_int, termine_dac, new_data_int, occupe_dac, occupe_gen, termine_gen : std_logic;
signal offset_int, amplitude_int, load_int, pas_comptage_int : std_logic_vector(15 downto 0);
signal mode : std_logic_vector(2 downto 0);
signal temps_attente_int : std_logic_vector(31 downto 0);

begin

occupe <= occupe_dac or occupe_gen;
termine <= termine_gen;
mode <= data_recu(2 downto 0);

--revoir la mani�re dont on teste!!!!!
--!!!!!!!!!! 

--amplitude_int <= "0001101111010011";
--offset_int <= "0000110111101001";
--pas_comptage_int <= "0000000000000011";
--temps_attente_int <= "00000000000000000000000000000001";

--amplitude_int <=  "0001101111010011" when mode = "000" else	--1 v
--						"0001101111010011" when mode = "001" else	--1 v
--						"0001101111010011" when mode = "010" else	--1 v
--						"0000001011001000" when mode = "011" else	--0.1 v
--						"0000001011001000" when mode = "100" else	--0.1 v
--						"0000110111101001" when mode = "101" else	--0.5 v
--						"0010100110111100" when mode = "110" else	--1.5 v
--						"1111111111111111";									--empecher trim
--				 
--offset_int <=  "0110111101001001" when mode = "011" else	--0.5 v
--					"1000100101111001" when mode = "100" else	--0.5 v
--					"0011011010101101" when mode = "101" else	-- -1 v
--					"1110110110110111" when mode = "111" else --empecher trimm
--					(others => '0');
--			 
--pas_comptage_int <=  "0000000011100100" when mode = "000" else	--239
--							"0000000000100010" when mode = "001" else	--34
--							"0000000000000011" when mode = "010" else	--3
--							"0000000000000001" when mode = "011" else	--1
--							"0000000000010100" when mode = "100" else	--20
--							"0000000000001111" when mode = "101" else	--15
--							"0000001100000100" when mode = "110" else	--4
--							"1111111111111111";								--empecher trim
--
--temps_attente_int <= "00000000000000000000000001001000" when mode = "011" else	--attendre 70 toc
--							"11111111111111111111111111111111" when mode = "111" else	--empecher trim
--							(others => '0');

nombre_cycle_int <=  data_recu;	
							
							


--clk � 25 MHz
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

com_serie_rx : serial_rx port map(clk => clk_int, rst => reset, rx => rx, data => data_recu, new_data => new_data_int);
ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk_int, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);
																		
gen_onde_triangle : generation_onde_triangle port map(clk => clk_int, reset => reset, start => new_data_int, termine_dac => termine_dac,
																		temps_attente => temps_attente_int, pas_comptage => pas_comptage_int, amplitude => amplitude_int,
																		offset => offset_int, onde_genere => load_int, demarrer_transfert => start_transfert_int, nombre_cycle => nombre_cycle_int,
																		occupe => occupe_gen, termine => termine_gen); 
end Behavioral;

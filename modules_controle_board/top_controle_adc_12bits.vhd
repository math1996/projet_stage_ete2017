----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:48 06/07/2017 
-- Design Name: 
-- Module Name:    top_controle_adc_12bits - Behavioral 
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

entity top_controle_adc_12bits is
    Port ( clk, reset, start, DOUT : in  STD_LOGIC;
           canal_conversion : in  STD_LOGIC_VECTOR (2 downto 0);
           sequence_conversion : in  STD_LOGIC_VECTOR (7 downto 0);
           mode_conversion : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           donne_conversion_pret, CS, SCLK, DIN, occupe, termine : out  STD_LOGIC;
           donne_conversion : out  STD_LOGIC_VECTOR (15 downto 0));
end top_controle_adc_12bits;

architecture Behavioral of top_controle_adc_12bits is

signal start_seq_int, start_1Ch_int, occupe_conversion, termine_conversion, donne_conversion_pret_int,
		 occupe_mode, termine_mode, reset_input, enable_input : std_logic;
signal canal_conversion_int : std_logic_vector(2 downto 0);
signal mode_conversion_int : std_logic_vector(1 downto 0);
signal nb_cycle_conversion_int : std_logic_vector(31 downto 0);
signal nb_canaux_conversion_int : std_logic_vector(3 downto 0);
signal sequence_conversion_int : std_logic_vector(7 downto 0);

begin

--registre des inputs
registre_mode : registreNbits generic map(2) port map(clk => clk, reset => reset_input, en => enable_input, d => mode_conversion, q_out => mode_conversion_int);
registre_nb_cycle_conv : registreNbits generic map(32) port map(clk => clk, reset => reset_input, en => enable_input, d => nb_cycle_conversion, q_out => nb_cycle_conversion_int);
registre_canal_conv : registreNbits generic map(3) port map(clk => clk, reset => reset_input, en => enable_input, d => canal_conversion, q_out => canal_conversion_int);
registre_sequence_conv : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => enable_input, d => sequence_conversion, q_out => sequence_conversion_int);


--module de controle de l'ADC 12 bits
ctrl_adc_12bits : top_controle_spi_adc_12bits port map(clk => clk, start_seq => start_seq_int, start_1CH => start_1CH_int, reset => reset, 
																		 DOUT => DOUT, occupe => occupe_conversion, termine => termine_conversion,
																		 data_rdy => donne_conversion_pret_int, CS => CS, SCLK => SCLK, DIN => DIN, data_out_conversion => donne_conversion,
																		 canal => canal_conversion_int, sequence => sequence_conversion_int, nb_cycle_conversion => nb_cycle_conversion_int);
--module de controle de mode de l'ADC 12 bits
FSM_ctrl_mode : FSM_controle_mode_adc_12bits port map(clk => clk, reset => reset, start => start,
																		fin_conversion => termine_conversion, mode => mode_conversion_int,
																		start_1CH => start_1CH_int, start_seq => start_seq_int, occupe => occupe_mode,
																		termine => termine_mode, reset_input => reset_input, enable_input => enable_input);
																		
--signaux sortie
donne_conversion_pret <= donne_conversion_pret_int;
occupe <= occupe_mode or occupe_conversion;
termine <= termine_mode;
																		
end Behavioral;


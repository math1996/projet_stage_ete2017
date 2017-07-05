----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:03 06/07/2017 
-- Design Name: 
-- Module Name:    top_controle_adc_10bits - Behavioral 
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

entity top_controle_adc_10bits is
    Port ( clk, reset, start, DOUT, SSTRB : in  STD_LOGIC;
			  canal_conversion : in  STD_LOGIC_VECTOR (2 downto 0);
           sequence_conversion : in  STD_LOGIC_VECTOR (7 downto 0);
           mode_conversion : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           donnee_conversion_pret, DIN, SCLK, CS, SHDN, occupe, termine : out  STD_LOGIC;
			  donnee_conversion : out std_logic_vector(15 downto 0));
end top_controle_adc_10bits;

architecture Behavioral of top_controle_adc_10bits is

signal start_conv_recup, occupe_conversion_recup, termine_conversion_recup, occupe_mode, enable_input, reset_input : std_logic;
signal canal_conversion_int, canal_a_convertir_int : std_logic_vector(2 downto 0);
signal mode_conversion_int : std_logic_vector(1 downto 0);
signal nb_cycle_conversion_int : std_logic_vector(31 downto 0);
signal sequence_conversion_int : std_logic_vector(7 downto 0);
signal donnee_conversion_int : std_logic_vector(15 downto 0);

begin

--signaux de sortie
donnee_conversion_pret <= termine_conversion_recup;
occupe <= occupe_mode or occupe_conversion_recup;
donnee_conversion <= donnee_conversion_int(15 downto 3) & canal_a_convertir_int;

--registre des inputs
registre_canal_conv : registreNbits generic map(3) port map(clk => clk, reset => reset_input, en => enable_input, d => canal_conversion, q_out => canal_conversion_int);
registre_sequence_conv : registreNbits generic map(8) port map(clk => clk, reset => reset_input, en => enable_input, d => sequence_conversion, q_out => sequence_conversion_int);
registre_mode_conv : registreNbits generic map(2) port map(clk => clk, reset => reset_input, en => enable_input, d => mode_conversion, q_out => mode_conversion_int);
registre_nb_cycle_conv : registreNbits generic map(32) port map(clk => clk, reset => reset_input, en => enable_input, d => nb_cycle_conversion, q_out => nb_cycle_conversion_int);


--module de controle et de récupération des données de l'ADC 10 bits
ctrl_recup_adc10bits : controle_spi_adc_10bits port map(clk => clk, reset => reset, start => start_conv_recup, DOUT => DOUT, SSTRB => SSTRB, DIN => DIN, SCLK => SCLK, CS => CS,
																		 occupe => occupe_conversion_recup, termine => termine_conversion_recup, SHDN => SHDN, canal => canal_a_convertir_int,
																		 donnes => donnee_conversion_int);

																		 
--module de controle des modes de fonctionnement de l'ADC 10 bits
fsm_ctrl_mode: FSM_controle_mode_adc_10bits port map(clk => clk, reset => reset, start => start, termine_conversion_canal => termine_conversion_recup, mode => mode_conversion_int,
																	  sequence => sequence_conversion_int, nb_cycle_conversion => nb_cycle_conversion_int,
																	  canal_conversion => canal_conversion_int, canal_a_convertir => canal_a_convertir_int, occupe => occupe_mode, termine => termine,
																	  enable_input => enable_input, reset_input => reset_input, start_conversion => start_conv_recup);																		 

end Behavioral;


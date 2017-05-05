----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:06 05/04/2017 
-- Design Name: 
-- Module Name:    top_test_potentiostat - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_test_potentiostat is
    Port ( clk, reset, rx : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  SDI, CS, CLK_OUT :out std_logic);
end top_test_potentiostat;

architecture Behavioral of top_test_potentiostat is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

--clk_int est l'horloge divisé à 12.5 MHz
--clk est l'horloge du mojo à 50 MHz
signal start_int, clk_out_int, enable_rdc_affichage_int, input_rdc_int, clk_int, occupe_int, termine_int : std_logic;
signal data_int : std_logic_vector(7 downto 0);

begin

--horloge divisé à 12.5 MHz
diviseur_horloge: diviseur_clk port map(clk => clk, reset => '1', enable => '1', clk_out_reg => clk_int);


rdc_controle_spi: controle_spi_potentiostat port map(clk => clk_int, reset => reset, start => start_int, load_in => data_int, CLK_OUT => clk_out_int,
															CS => enable_rdc_affichage_int, SDI => input_rdc_int, occupe => occupe_int, termine => termine_int);

port_serie : serial_rx port map(clk =>	clk_int, rst => reset, rx => rx, data => data_int, new_data	=> start_int);

--seulement pour les test, retirer pour vrai implémentation
--connecter les sortie du module de controle SPI directement aux sortie (SDI,CLK_OUT,CS)
rdc_output_led_test: rdc_NBits generic map(8) port map(clk => clk_out_int, reset => reset, enable => not(enable_rdc_affichage_int),
																			input => input_rdc_int, data_output_parallele => data_out);
																			
CLK_OUT <= clk_out_int;
SDI <= input_rdc_int;
CS <= enable_rdc_affichage_int;
																			
end Behavioral;


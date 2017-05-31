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
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSRS2, BPB, MUTEB, RSTB : out  STD_LOGIC);
end test_generation_onde_triangle_pulse;

architecture Behavioral of test_generation_onde_triangle_pulse is

signal clk_int, termine_dac, occupe_dac, start_gen, start_transfert_int, termine_gen, occupe_gen : std_logic;
signal compteur_pulse : std_logic_vector(23 downto 0);

begin

--clk à 25 MHz
diviseur_horloge : diviseur_clk generic map(0) port map(clk => clk, reset => reset, enable => '1', clk_out_reg => clk_int);

gen_onde_triangle : generation_onde_triangle port map(clk => clk_int, reset => reset, start => start_gen, termine_dac => termine_dac,
																		temps_attente => temps_attente_int, pas_comptage => pas_comptage_int, amplitude => amplitude_int,
																		offset => offset_int, onde_genere => load_int, demarrer_transfert => start_transfert_int, nombre_cycle => nombre_cycle_int,
																		occupe => occupe_gen, termine => termine_gen); 
																		
compteur_onde_pulse : compteurNbits generic map(24) port map(clk => clk_int, reset => reset_pulse, enable => enable_pulse, output => compteur_pulse);
end Behavioral;


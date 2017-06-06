----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:34 06/01/2017 
-- Design Name: 
-- Module Name:    test_sim_gen_onde_tri_pulse - Behavioral 
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

entity test_sim_gen_onde_tri_pulse is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           pas_comptage : in  STD_LOGIC_VECTOR (15 downto 0);
           amplitude, offset : in  STD_LOGIC_VECTOR (15 downto 0);
           nombre_cycle : in  STD_LOGIC_VECTOR (7 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
           demarrer_transfert, occupe, termine : out  STD_LOGIC;
           choix_horloge : in  STD_LOGIC_VECTOR (3 downto 0));
end test_sim_gen_onde_tri_pulse;

architecture Behavioral of test_sim_gen_onde_tri_pulse is


signal comparaison, pulse, onde_genere_int, onde_pulse, resultat_offset : std_logic_vector(15 downto 0);
signal mux : std_logic;

begin

gen_onde_triangle : generation_onde_triangle port map(clk => clk, reset => reset, start => start, termine_dac => termine_dac,
																		temps_attente => temps_attente, pas_comptage => pas_comptage, amplitude => amplitude,
																		offset => offset, onde_genere => onde_genere_int, demarrer_transfert => demarrer_transfert, nombre_cycle => nombre_cycle,
																		occupe => occupe, termine => termine); 

compteur_pulse : compteurNbits generic map(16) port map(clk => clk, reset => reset, enable => start, output => pulse);

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
add_offset_partie_pos : addition_offset port map(amplitude => (others => '0'), offset => offset, resultat => resultat_offset);

--signal de comparaison		  
comparaison <= mux & mux & mux & mux & mux & mux & mux & mux & mux & mux
					& mux & mux & mux & mux & mux & mux;

--résultat de la comparaison
onde_genere <= resultat_offset when ((comparaison and onde_genere_int) = "0000000000000000") else
					(comparaison and onde_genere_int);

end Behavioral;


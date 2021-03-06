----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:33 07/21/2017 
-- Design Name: 
-- Module Name:    test_mult_epe_pipeline - Behavioral 
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
use IEEE.math_real.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_mult_epe_pipeline is
generic(N: integer := 4);
    Port ( clk, reset, start : in  STD_LOGIC;
           resultat1, resultat2, resultat3, resultat4 : out  STD_LOGIC_VECTOR (31 downto 0);
           occupe, termine, data_pret : out  STD_LOGIC);
end test_mult_epe_pipeline;

architecture Behavioral of test_mult_epe_pipeline is

type matrice_NxM is array(natural range <>) of ligne_matrice_16bits(N-1 downto 0);

signal data_rdy, enable_rdc : std_logic;
signal compte_ligne : std_logic_vector(2 downto 0);
signal matrice1, matrice2 : matrice_NxM(3 downto 0);
signal ligne_matrice1_int, ligne_matrice2_int : ligne_matrice_16bits(3 downto 0);
signal res_int : std_logic_vector(31 downto 0);

begin



--assignation des matrices
matrice1(0)(0) <= std_logic_vector(to_unsigned(77, 16));
matrice1(0)(1) <= "1111111110110110";
matrice1(0)(2) <= std_logic_vector(to_unsigned(27, 16));
matrice1(0)(3) <= std_logic_vector(to_unsigned(12, 16));
matrice1(1)(0) <= std_logic_vector(to_unsigned(79, 16));
matrice1(1)(1) <= std_logic_vector(to_unsigned(64, 16));
matrice1(1)(2) <= std_logic_vector(to_unsigned(68, 16));
matrice1(1)(3) <= std_logic_vector(to_unsigned(50, 16));
matrice1(2)(0) <= std_logic_vector(to_unsigned(19, 16));
matrice1(2)(1) <= std_logic_vector(to_unsigned(71, 16));
matrice1(2)(2) <= std_logic_vector(to_unsigned(65, 16));
matrice1(2)(3) <= std_logic_vector(to_unsigned(96, 16));
matrice1(3)(0) <= "1111111111001111";
matrice1(3)(1) <= std_logic_vector(to_unsigned(75, 16));
matrice1(3)(2) <= std_logic_vector(to_unsigned(16, 16));
matrice1(3)(3) <= std_logic_vector(to_unsigned(34, 16));

matrice2(0)(0) <= std_logic_vector(to_unsigned(74, 16));
matrice2(0)(1) <= std_logic_vector(to_unsigned(70, 16));
matrice2(0)(2) <= std_logic_vector(to_unsigned(9, 16));
matrice2(0)(3) <= std_logic_vector(to_unsigned(95, 16));
matrice2(1)(0) <= std_logic_vector(to_unsigned(39, 16));
matrice2(1)(1) <= std_logic_vector(to_unsigned(3, 16));
matrice2(1)(2) <= std_logic_vector(to_unsigned(82, 16));
matrice2(1)(3) <= std_logic_vector(to_unsigned(3, 16));
matrice2(2)(0) <= "1111111110111110"; --matrice2(2)(0) <= std_logic_vector(to_unsigned(66, 16));
matrice2(2)(1) <= std_logic_vector(to_unsigned(27, 16));
matrice2(2)(2) <= std_logic_vector(to_unsigned(69, 16));
matrice2(2)(3) <= std_logic_vector(to_unsigned(44, 16));
matrice2(3)(0) <= "1111111111101111";
matrice2(3)(1) <= std_logic_vector(to_unsigned(5, 16));
matrice2(3)(2) <= std_logic_vector(to_unsigned(31, 16));
matrice2(3)(3) <= std_logic_vector(to_unsigned(38, 16));

--mux
ligne_matrice1_int <= matrice1(0) when compte_ligne = "000" else
							 matrice1(1) when compte_ligne = "001" else
							 matrice1(2) when compte_ligne = "010" else
							 matrice1(3) when compte_ligne = "011" else
							 (others => (others => '0'));
							 
ligne_matrice2_int <= matrice2(0) when compte_ligne = "000" else
							 matrice2(1) when compte_ligne = "001" else
							 matrice2(2) when compte_ligne = "010" else
							 matrice2(3) when compte_ligne = "011" else
							 (others => (others => '0'));
							 
--compteur pour s�lectionner les lignes
compteur_ligne : compteurNbits generic map(3) port map(clk => clk, enable => data_rdy, reset => reset, output => compte_ligne);

--module de multiplication matricielle �l�ment par �l�ment
mult : multiplication_epe_matrice_NxM generic map(4,4) port map(clk => clk, reset => reset, start => start, ligne_matrice1 => ligne_matrice1_int,
						ligne_matrice2 => ligne_matrice2_int, resultat => res_int, donnee_prete => data_pret, compter_ligne => data_rdy, occupe => occupe, termine => termine);
						
resultat1 <= res_int;
resultat2 <= res_int;
resultat3 <= res_int;
resultat4 <= res_int;							
							 
end Behavioral;


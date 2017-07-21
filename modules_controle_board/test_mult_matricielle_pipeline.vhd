----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:53 07/21/2017 
-- Design Name: 
-- Module Name:    test_mult_matricielle_pipeline - Behavioral 
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_mult_matricielle_pipeline is
generic(N: integer := 4);
    Port ( clk, reset, start : in  STD_LOGIC;
           resultat : out  STD_LOGIC_VECTOR (31 downto 0);
           occupe, termine : out  STD_LOGIC);
end test_mult_matricielle_pipeline;

architecture Behavioral of test_mult_matricielle_pipeline is

type matrice_NxM is array(natural range <>) of ligne_matrice_16bits(N-1 downto 0);

signal data_rdy : std_logic;
signal compte_ligne : std_logic_vector(3 downto 0);
signal matrice1, matrice2 : matrice_NxM(3 downto 0);
signal ligne_matrice1_int, ligne_matrice2_int, colonne1, colonne2, colonne3, colonne4 : ligne_matrice_16bits(3 downto 0);
signal ligne_res_int : ligne_matrice_32bits(3 downto 0);

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
ligne_matrice1_int <= matrice1(0) when compte_ligne = "0000" else
							 matrice1(0) when compte_ligne = "0001" else
							 matrice1(0) when compte_ligne = "0010" else
							 matrice1(0) when compte_ligne = "0011" else
							 matrice1(1) when compte_ligne = "0100" else
							 matrice1(1) when compte_ligne = "0101" else
							 matrice1(1) when compte_ligne = "0110" else
							 matrice1(1) when compte_ligne = "0111" else
							 matrice1(2) when compte_ligne = "1000" else
							 matrice1(2) when compte_ligne = "1001" else
							 matrice1(2) when compte_ligne = "1010" else
							 matrice1(2) when compte_ligne = "1011" else
							 matrice1(3) when compte_ligne = "1100" else
							 matrice1(3) when compte_ligne = "1101" else
							 matrice1(3) when compte_ligne = "1110" else
							 matrice1(3);

generate_colonne1 : for i in 0 to 3 generate
	colonne1(i) <= matrice2(i)(0);
end generate generate_colonne1;

generate_colonne2 : for i in 0 to 3 generate
	colonne2(i) <= matrice2(i)(1);
end generate generate_colonne2;

generate_colonne3 : for i in 0 to 3 generate
	colonne3(i) <= matrice2(i)(2);
end generate generate_colonne3;

generate_colonne4 : for i in 0 to 3 generate
	colonne4(i) <= matrice2(i)(3);
end generate generate_colonne4;
				 
ligne_matrice2_int <= colonne1 when compte_ligne = "0000" else
							 colonne2 when compte_ligne = "0001" else
							 colonne3 when compte_ligne = "0010" else
							 colonne4 when compte_ligne = "0011" else
							 colonne1 when compte_ligne = "0100" else
							 colonne2 when compte_ligne = "0101" else
							 colonne3 when compte_ligne = "0110" else
							 colonne4 when compte_ligne = "0111" else
							 colonne1 when compte_ligne = "1000" else
							 colonne2 when compte_ligne = "1001" else
							 colonne3 when compte_ligne = "1010" else
							 colonne4 when compte_ligne = "1011" else
							 colonne1 when compte_ligne = "1100" else
							 colonne2 when compte_ligne = "1101" else
							 colonne3 when compte_ligne = "1110" else
							 colonne4;
				
--compteur pour sélectionner les lignes
compteur_ligne : compteurNbits generic map(4) port map(clk => clk, enable => data_rdy, reset => reset, output => compte_ligne);

--module de multiplication matricielle
mult_matricielle : multiplication_matricielle_NxM generic map(4,4) port map(clk => clk, reset => reset, start => start, ligne_matrice1 => ligne_matrice1_int,
						colonne_matrice2 => ligne_matrice2_int, resultat => resultat, donnee_prete => data_rdy, occupe => occupe, termine => termine);
						
end Behavioral;


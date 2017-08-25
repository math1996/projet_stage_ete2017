----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:56 08/23/2017 
-- Design Name: 
-- Module Name:    test_mult_mat_pipeline_nouveau - Behavioral 
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

entity test_mult_mat_pipeline_nouveau is
generic(N: integer := 3; M : integer := 3);
    Port ( clk, start, reset : in  STD_LOGIC;
           resultat : out  STD_LOGIC_VECTOR (31 downto 0);
           occupe, termine, data_rdy, changer_element : out  STD_LOGIC);
end test_mult_mat_pipeline_nouveau;

architecture Behavioral of test_mult_mat_pipeline_nouveau is

type matrice_NxM is array(natural range <>) of ligne_matrice_16bits(N-1 downto 0);
type matrice_NxM2 is array(natural range <>) of ligne_matrice_16bits(M-1 downto 0);

signal data_rdy_int : std_logic;
signal matrice1 : matrice_NxM(5 downto 0); --matrice2 : matrice_NxM(3 downto 0);
signal matrice2 : matrice_NxM2(3 downto 0);
signal element_mat1_int, element_mat2_int : std_logic_vector(15 downto 0);
signal numero_element_mat1_int : std_logic_vector(4 downto 0);
signal numero_element_mat2_int : std_logic_vector(3 downto 0);--: std_logic_vector(3 downto 0);
signal resultat_operation : std_logic_vector(31 downto 0);
signal output_buffer : tableau_memoire_32bits(17 downto 0);

begin

--module de multiplication matricielle
mult_mat : multiplication_matricielle_pipeline_NxM_MxS generic map(6,3,3) port map(clk => clk, start => start, reset => reset, element_mat1 => element_mat1_int,
			  element_mat2 => element_mat2_int, numero_element_mat1 => numero_element_mat1_int, numero_element_mat2 => numero_element_mat2_int, resultat => resultat_operation,
			  occupe => occupe, termine => termine, data_rdy => data_rdy_int, changer_element => changer_element);
			  
--matrice 1
matrice1(0)(0) <= std_logic_vector(to_unsigned(70, 16));
matrice1(0)(1) <= std_logic_vector(to_unsigned(8, 16));
matrice1(0)(2) <= std_logic_vector(to_unsigned(13, 16));
matrice1(1)(0) <= std_logic_vector(to_unsigned(96, 16));
matrice1(1)(1) <= "1111111111001011"; -- -53
matrice1(1)(2) <= std_logic_vector(to_unsigned(0, 16));
matrice1(2)(0) <= "1111111111111111"; -- -1
matrice1(2)(1) <= std_logic_vector(to_unsigned(4, 16));
matrice1(2)(2) <= std_logic_vector(to_unsigned(67, 16));
matrice1(3)(0) <= std_logic_vector(to_unsigned(6, 16));
matrice1(3)(1) <= std_logic_vector(to_unsigned(53, 16));
matrice1(3)(2) <= std_logic_vector(to_unsigned(44, 16));
matrice1(4)(0) <= std_logic_vector(to_unsigned(11, 16));
matrice1(4)(1) <= std_logic_vector(to_unsigned(79, 16));
matrice1(4)(2) <= std_logic_vector(to_unsigned(96, 16));
matrice1(5)(0) <= std_logic_vector(to_unsigned(10, 16));
matrice1(5)(1) <= std_logic_vector(to_unsigned(1, 16));
matrice1(5)(2) <= std_logic_vector(to_unsigned(0, 16));

--matrice1(4)(0) <= "1111111111001011"; -- -53
--matrice1(4)(1) <= std_logic_vector(to_unsigned(43, 16));
--matrice1(4)(2) <= std_logic_vector(to_unsigned(26, 16));
--matrice1(4)(3) <= std_logic_vector(to_unsigned(37, 16));

--matrice2 
matrice2(0)(0) <= "1111111111111101";
matrice2(0)(1) <= std_logic_vector(to_unsigned(46, 16));
matrice2(0)(2) <= std_logic_vector(to_unsigned(69, 16));
matrice2(1)(0) <= std_logic_vector(to_unsigned(13, 16));
matrice2(1)(1) <= std_logic_vector(to_unsigned(91, 16));
matrice2(1)(2) <= std_logic_vector(to_unsigned(25, 16));
matrice2(2)(0) <= std_logic_vector(to_unsigned(101, 16));
matrice2(2)(1) <= std_logic_vector(to_unsigned(0, 16));
matrice2(2)(2) <= std_logic_vector(to_unsigned(19, 16));
--matrice2(1)(0) <= std_logic_vector(to_unsigned(39, 16));
--matrice2(1)(1) <= std_logic_vector(to_unsigned(3, 16));
--matrice2(1)(2) <= std_logic_vector(to_unsigned(82, 16));
--matrice2(1)(3) <= std_logic_vector(to_unsigned(3, 16));
--matrice2(2)(0) <= "1111111110111110"; --matrice2(2)(0) <= std_logic_vector(to_unsigned(66, 16));
--matrice2(2)(1) <= std_logic_vector(to_unsigned(27, 16));
--matrice2(2)(2) <= std_logic_vector(to_unsigned(69, 16));
--matrice2(2)(3) <= std_logic_vector(to_unsigned(44, 16));
--matrice2(3)(0) <= "1111111111101111";
--matrice2(3)(1) <= std_logic_vector(to_unsigned(5, 16));
--matrice2(3)(2) <= std_logic_vector(to_unsigned(31, 16));
--matrice2(3)(3) <= std_logic_vector(to_unsigned(38, 16));

--mux des éléments de la matrice 1
element_mat1_int <= matrice1(0)(0) when numero_element_mat1_int = "00000" else
						  matrice1(0)(1) when numero_element_mat1_int = "00001" else
						  matrice1(0)(2) when numero_element_mat1_int = "00010" else
						  matrice1(1)(0) when numero_element_mat1_int = "00011" else
						  matrice1(1)(1) when numero_element_mat1_int = "00100" else
						  matrice1(1)(2) when numero_element_mat1_int = "00101" else
						  matrice1(2)(0) when numero_element_mat1_int = "00110" else
						  matrice1(2)(1) when numero_element_mat1_int = "00111" else
						  matrice1(2)(2) when numero_element_mat1_int = "01000" else
						  matrice1(3)(0) when numero_element_mat1_int = "01001" else
						  matrice1(3)(1) when numero_element_mat1_int = "01010" else
						  matrice1(3)(2) when numero_element_mat1_int = "01011" else
						  matrice1(4)(0) when numero_element_mat1_int = "01100" else
						  matrice1(4)(1) when numero_element_mat1_int = "01101" else
						  matrice1(4)(2) when numero_element_mat1_int = "01110" else
						  matrice1(5)(0) when numero_element_mat1_int = "01111" else
						  matrice1(5)(1) when numero_element_mat1_int = "10000" else
						  matrice1(5)(2) when numero_element_mat1_int = "10001" else
						  (others => '0');
--mux des éléments de la matrice 2
element_mat2_int <= matrice2(0)(0) when numero_element_mat2_int = "0000" else
						  matrice2(0)(1) when numero_element_mat2_int = "0001" else
						  matrice2(0)(2) when numero_element_mat2_int = "0010" else
						  matrice2(1)(0) when numero_element_mat2_int = "0011" else
						  matrice2(1)(1) when numero_element_mat2_int = "0100" else
						  matrice2(1)(2) when numero_element_mat2_int = "0101" else
						  matrice2(2)(0) when numero_element_mat2_int = "0110" else
						  matrice2(2)(1) when numero_element_mat2_int = "0111" else
						  matrice2(2)(2) when numero_element_mat2_int = "1000" else
						  (others => '0');
--						  matrice2(0)(3) when numero_element_mat2_int = "0011" else
--						  matrice2(1)(0) when numero_element_mat2_int = "0100" else
--						  matrice2(1)(1) when numero_element_mat2_int = "0101" else
--						  matrice2(1)(2) when numero_element_mat2_int = "0110" else
--						  matrice2(1)(3) when numero_element_mat2_int = "0111" else
--						  matrice2(2)(0) when numero_element_mat2_int = "1000" else
--						  matrice2(2)(1) when numero_element_mat2_int = "1001" else
--						  matrice2(2)(2) when numero_element_mat2_int = "1010" else
--						  matrice2(2)(3) when numero_element_mat2_int = "1011" else
--						  matrice2(3)(0) when numero_element_mat2_int = "1100" else
--						  matrice2(3)(1) when numero_element_mat2_int = "1101" else
--						  matrice2(3)(2) when numero_element_mat2_int = "1110" else
--						  matrice2(3)(3);

--sortie
resultat <= output_buffer(0);
data_rdy <= data_rdy_int;

--registre de récupérationd des données
rdc_recup : memoire_tampon_32xM generic map(18) port map(clk => clk, reset => reset, enable => data_rdy_int, input => resultat_operation, output => output_buffer);
						  
end Behavioral;


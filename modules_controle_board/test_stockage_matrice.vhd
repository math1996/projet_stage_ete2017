----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:03 07/28/2017 
-- Design Name: 
-- Module Name:    test_stockage_matrice - Behavioral 
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

entity test_stockage_matrice is
    Port ( clk, reset, enable : in  STD_LOGIC;
           numero_ligne : in  STD_LOGIC_VECTOR (0 downto 0);
           numero_colonne : in  STD_LOGIC_VECTOR (4 downto 0);
           input_element : in  STD_LOGIC_VECTOR (15 downto 0);
           ligne1, ligne2, ligne3, ligne4, ligne5,ligne6,ligne7,ligne8,ligne9,ligne10,ligne11,ligne12,ligne13 : out  STD_LOGIC_vector(15 downto 0);
           colonne1: out  STD_LOGIC_vector(15 downto 0));
end test_stockage_matrice;

architecture Behavioral of test_stockage_matrice is

signal colonne_int : ligne_matrice_16bits (0 downto 0);
signal ligne_int : ligne_matrice_16bits(12 downto 0);

begin

--module de stockage de la matrice
matrice : matrice_NxM generic map(1,13) port map(clk => clk, reset => reset, enable => enable, numero_ligne => numero_ligne, numero_colonne => numero_colonne,
																input_element => input_element, ligne => ligne_int, colonne => colonne_int);
																
--sortie
ligne1 <= ligne_int(0);		
ligne2 <= ligne_int(1);	
ligne3 <= ligne_int(2);	
ligne4 <= ligne_int(3);
ligne5 <= ligne_int(4);
ligne6 <= ligne_int(5);	
ligne7 <= ligne_int(6);	
ligne8 <= ligne_int(7);	
ligne9 <= ligne_int(8);	
ligne10 <= ligne_int(9);	
ligne11 <= ligne_int(10);	
ligne12 <= ligne_int(11);	
ligne13 <= ligne_int(12);			

colonne1 <= colonne_int(0);	
														
end Behavioral;


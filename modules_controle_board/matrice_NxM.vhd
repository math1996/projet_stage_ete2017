----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:59 07/28/2017 
-- Design Name: 
-- Module Name:    matrice_NxM - Behavioral 
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

entity matrice_NxM is
generic(N,M : integer := 4);
    Port ( input_element : in  std_logic_vector(15 downto 0);
           clk, reset, enable : in  STD_LOGIC;
           numero_ligne : in  STD_LOGIC_VECTOR((integer(ceil(log2(real(N)))))-1 downto 0);
           ligne : out  ligne_matrice_16bits(M-1 downto 0);
			  numero_colonne : in std_logic_vector((integer(ceil(log2(real(M)))))-1 downto 0);
           colonne : out  ligne_matrice_16bits(N-1 downto 0));
end matrice_NxM;

architecture Behavioral of matrice_NxM is

signal output_matrice : tableau_memoire((N*M)-1 downto 0);

begin

--memoire stockant la matrice
memoire_matrice : memoire_tampon_16xM generic map(N*M) port map(clk => clk, reset => reset, enable => enable, input => input_element, output => output_matrice);

--générer les lignes
gen_ligne : for i in 0 to M-1 generate
		ligne(i) <= output_matrice((N*M - 1) - (M*to_integer(unsigned(numero_ligne)) + i));
end generate gen_ligne;

--générer les colonnes
gen_colonne : for j in 0 to N-1 generate
		colonne(j) <= output_matrice((N*M - 1) - (to_integer(unsigned(numero_colonne)) + j*N));
end generate gen_colonne;

end Behavioral;


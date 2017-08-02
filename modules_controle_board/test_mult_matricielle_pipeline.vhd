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
    Port ( clk, reset, start, enable_input : in  STD_LOGIC;
			  input_element1, input_element2 : in std_logic_vector(15 downto 0);
           resultat : out  STD_LOGIC_VECTOR (31 downto 0);
           occupe, termine, data_rdy : out  STD_LOGIC);
end test_mult_matricielle_pipeline;

architecture Behavioral of test_mult_matricielle_pipeline is


signal ligne_mat1, colonne_mat2 : ligne_matrice_16bits(3 downto 0);
signal ligne_res_int : ligne_matrice_32bits(3 downto 0);
signal num_col_int : std_logic_vector(2 downto 0);
signal num_ligne_int : std_logic_vector(2 downto 0);

begin

--module de stockage de la matrice 1
matrice1 : matrice_NxM generic map(4,4) port map(clk => clk, reset => reset, enable => enable_input, numero_ligne => num_ligne_int, ligne => ligne_mat1,
				numero_colonne => (others => '0'), colonne => open, input_element => input_element1);
				
matrice2 : matrice_NxM generic map(4,4) port map(clk => clk, reset => reset, enable => enable_input, numero_ligne => (others => '0'), ligne => open,
				numero_colonne => num_col_int, colonne => colonne_mat2, input_element => input_element2);		

--module de multiplication matricielle
mult_matricielle : multiplication_matricielle_NxM generic map(4,4,4) port map(clk => clk, reset => reset, start => start, ligne_matrice1 => ligne_mat1,
						colonne_matrice2 => colonne_mat2, resultat => resultat, donnee_prete => data_rdy, occupe => occupe, termine => termine, compte_ligne => num_ligne_int,
						compte_colonne => num_col_int);

end Behavioral;


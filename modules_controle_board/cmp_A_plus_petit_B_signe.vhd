----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:31 08/04/2017 
-- Design Name: 
-- Module Name:    cmp_A_plus_petit_B_signe - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp_A_plus_petit_B_signe is
    Port ( A,B : in  STD_LOGIC_VECTOR (31 downto 0);
           comparaison : out  STD_LOGIC);
end cmp_A_plus_petit_B_signe;

architecture Behavioral of cmp_A_plus_petit_B_signe is

signal A_int, B_int : std_logic_vector(31 downto 0);
signal signe_A, signe_B, comparaison1, comparaison2 : std_logic;

begin

--extraction du signe
signe_A <= A(31);
signe_B <= B(31);

--conversion complément 2
A_int <= not(A) +1 when signe_A = '1' else
			A;
			
B_int <= not(B) +1 when signe_B = '1' else
			B;

--comparaisons
comparaison1 <= '1' when A_int < B_int else
					 '0';
					 
comparaison2 <= '1' when B_int < A_int else
					 '0';	
					 
--sortie
comparaison <= comparaison1 when signe_A = '0' and signe_B = '0' else
					'0' when signe_A = '0' and signe_B = '1' else
					'1' when signe_A = '1' and signe_B = '0' else
					comparaison2;

end Behavioral;


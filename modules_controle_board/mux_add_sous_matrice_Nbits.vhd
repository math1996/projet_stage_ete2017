----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:31 07/19/2017 
-- Design Name: 
-- Module Name:    mux_add_sous_matrice_Nbits - Behavioral 
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

entity mux_add_sous_matrice_Nbits is
	generic(N : integer :=16);
    Port ( choix : in  STD_LOGIC;
           d0, d1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           output : out  STD_LOGIC_vector(N-1 downto 0));
end mux_add_sous_matrice_Nbits;

architecture Behavioral of mux_add_sous_matrice_Nbits is

begin

output <= d0 when choix = '0' else
			 d1;

end Behavioral;


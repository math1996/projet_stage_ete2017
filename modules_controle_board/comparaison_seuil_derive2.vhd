----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:35 08/07/2017 
-- Design Name: 
-- Module Name:    comparaison_seuil_derive2 - Behavioral 
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

entity comparaison_seuil_derive2 is
    Port ( clk, reset : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           seuil : in  STD_LOGIC_VECTOR (31 downto 0);
           comparaison_out : out  STD_LOGIC);
end comparaison_seuil_derive2;

architecture Behavioral of comparaison_seuil_derive2 is

signal comparaison_int : std_logic;

begin

--comparateur, si à 1 dépasse le seuil
comparaison : cmp_A_plus_petit_B_signe port map(A  => data_in, B => seuil, comparaison => comparaison_int);

--registre de sortie de la comparaison
registre_comparaison_out : registre1bit port map(clk => clk, reset => reset, en => comparaison_int, d => '1', q_out => comparaison_out);

end Behavioral;


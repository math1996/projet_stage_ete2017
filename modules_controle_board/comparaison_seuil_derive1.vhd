----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:02 08/04/2017 
-- Design Name: 
-- Module Name:    comparaison_seuil_derive1 - Behavioral 
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

entity comparaison_seuil_derive1 is
    Port ( clk, reset : in  STD_LOGIC;
           data_in : in  std_logic_vector(31 downto 0);
           seuil : in  STD_LOGIC_VECTOR (31 downto 0);
           comparaison_out : out  STD_LOGIC);
end comparaison_seuil_derive1;

architecture Behavioral of comparaison_seuil_derive1 is

signal comparaison_int : std_logic;

begin

--comparateur, à 1 si on dépasse le seuil
comparaison : cmp_A_plus_grand_B_signe port map(A => data_in, B => seuil, comparaison => comparaison_int);

--registre signifiant que l'on a dépassé le seuil de la dérivée première
reg_comparaison_out : registre1bit port map(clk => clk, reset => reset, en => comparaison_int, d => '1', q_out => comparaison_out);


end Behavioral;


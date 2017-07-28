----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:38 07/28/2017 
-- Design Name: 
-- Module Name:    derivee - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity derivee is
    Port ( Y_1, Y_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           resultat : out  STD_LOGIC_VECTOR (15 downto 0));
end derivee;

architecture Behavioral of derivee is

begin

resultat <= Y_1 + (not(Y_0) + 1);

end Behavioral;


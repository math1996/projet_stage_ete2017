----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:18 05/22/2017 
-- Design Name: 
-- Module Name:    addition_offset - Behavioral 
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

entity addition_offset is
    Port ( amplitude, offset : in  STD_LOGIC_VECTOR (15 downto 0);
           resultat : out  STD_LOGIC_VECTOR (15 downto 0));
end addition_offset;

architecture Behavioral of addition_offset is

signal resultat_int : std_logic_vector(15 downto 0);


begin

resultat_int <= amplitude + offset;

resultat <= resultat_int when resultat_int(15) = '0' else
				not(not(resultat_int) + 1);
				
end Behavioral;


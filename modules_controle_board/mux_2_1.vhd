----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:08 05/01/2017 
-- Design Name: 
-- Module Name:    mux_2_1 - Behavioral 
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

entity mux_2_1 is
    Port ( choix : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin

output <= input(0) when choix = '0' else
			 input (1);

end Behavioral;


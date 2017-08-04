----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:40:29 08/04/2017 
-- Design Name: 
-- Module Name:    test_comparaison_seuil_derive1 - Behavioral 
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

entity test_comparaison_seuil_derive1 is
    Port ( clk, reset, start : in  STD_LOGIC;
           data1,data2,data3,data4,data5 : in  STD_LOGIC_VECTOR (31 downto 0);
           seuil : in  STD_LOGIC_VECTOR (31 downto 0);
           comparaison_out : out  STD_LOGIC_VECTOR (4 downto 0);
           occupe, termine : out  STD_LOGIC);
end test_comparaison_seuil_derive1;

architecture Behavioral of test_comparaison_seuil_derive1 is

begin


end Behavioral;


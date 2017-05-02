----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:40 05/01/2017 
-- Design Name: 
-- Module Name:    compteurNbits - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteurNbits is
generic(N: integer := 4);
    Port ( clk,enable,reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(N-1 downto 0));
end compteurNbits;
architecture Behavioral of compteurNbits is

signal compteur : STD_LOGIC_VECTOR(N-1 downto 0);

begin

process(clk,enable,reset)
begin
if(reset = '0') then
	compteur <= (others => '0');
elsif(clk'event and clk = '1') then
	if(enable = '1') then
		compteur <= compteur + 1;
	end if;
end if;
end process;

output <= compteur;

end Behavioral;


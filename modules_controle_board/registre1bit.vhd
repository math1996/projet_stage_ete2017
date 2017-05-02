----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:23 05/01/2017 
-- Design Name: 
-- Module Name:    registre1bit - Behavioral 
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

entity registre1bit is
    Port ( clk,d,en,reset : in  STD_LOGIC;
           q_out : out  STD_LOGIC);
end registre1bit;

architecture Behavioral of registre1bit is

begin

process(clk,en,reset)
begin
if(reset = '0') then
	q_out <= '0';
elsif(clk'event and clk = '1') then
	if(en = '1') then
		q_out <= d;
	end if;
end if;
end process;

end Behavioral;


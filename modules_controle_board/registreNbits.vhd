----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:55 05/01/2017 
-- Design Name: 
-- Module Name:    registreNbits - Behavioral 
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

entity registreNbits is

generic(N: integer := 8);

    Port ( clk,reset,en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
           q_out : out  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
end registreNbits;

architecture Behavioral of registreNbits is

begin

process(clk,reset,en)
begin

if(reset = '0') then
	q_out <= (others => '0');
elsif(clk'event and clk = '1') then
	if(en = '1') then
		q_out <= d;
	end if;
end if;
end process;

end Behavioral;


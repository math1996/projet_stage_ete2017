----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:56 11/08/2016 
-- Design Name: 
-- Module Name:    diviseur_clk - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity diviseur_clk is
generic(N : integer := 0);
    Port ( clk : in  STD_LOGIC;
           reset,enable : in  STD_LOGIC;
           clk_out_reg : out  STD_LOGIC);
end diviseur_clk;

architecture Behavioral of diviseur_clk is

signal clk_int : std_logic_vector(24 downto 0);

begin

process(clk,reset,enable)
begin
if(reset = '0') then
	clk_int <= (others => '0');
elsif(clk'event and clk = '1') then
		if(enable = '1') then
			clk_int <= clk_int + 1;
		end if;
end if;
end process;

--changer pour implémentation physique
clk_out_reg <= clk_int(N);
end Behavioral;


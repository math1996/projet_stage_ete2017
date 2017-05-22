----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:37:51 05/22/2017 
-- Design Name: 
-- Module Name:    compteurNbits_mode - Behavioral 
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

entity compteurNbits_mode is
generic(N: integer := 8);
    Port ( clk, reset, enable, mode : in  STD_LOGIC;
           compteur_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           pas : in  STD_LOGIC_VECTOR (N-1 downto 0));
end compteurNbits_mode;

architecture Behavioral of compteurNbits_mode is

signal compteur_int : std_logic_vector(N-1 downto 0);

begin

process(clk, reset, pas, mode, enable)
begin
	if(reset = '0') then
		compteur_int <= (others => '0');
	elsif(clk'event and clk = '1') then
		if(enable = '1') then
			if(mode = '0') then
				compteur_int <= compteur_int + pas;
			else
				compteur_int <= compteur_int - pas;
			end if;
		end if;
	end if;
end process;

compteur_out <= compteur_int;

end Behavioral;


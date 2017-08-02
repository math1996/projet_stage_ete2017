----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:36 05/09/2017 
-- Design Name: 
-- Module Name:    memoire_tampon_16xM - Behavioral 
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

entity memoire_tampon_16xM is
generic(M: integer := 8);
    Port ( clk, enable, reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  tableau_memoire(M-1 downto 0));
end memoire_tampon_16xM;

architecture Behavioral of memoire_tampon_16xM is

signal q_int : tableau_memoire(M-1 downto 0);

begin

reg0: registreNbits generic map(16) port map(clk => clk, reset => reset, en => enable, d => input, q_out => q_int(0));

reg_loop: for i in 1 to M-1 generate
	registres : registreNbits generic map(16) port map(clk => clk, reset => reset, en => enable, d => q_int(i-1), q_out => q_int(i));
end generate;

output <= q_int;
end Behavioral;


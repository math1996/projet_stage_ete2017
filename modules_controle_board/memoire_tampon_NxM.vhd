----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:40:03 05/08/2017 
-- Design Name: 
-- Module Name:    memoire_tampon_NxM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--N : largeur de la mémoire (horizontal)
--M : hauteur de la mémoire (vertical)

entity memoire_tampon_NxM is
generic(N : integer:= 8;
			M : integer:= 8);
    Port ( clk, enable, reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (N-1 downto 0);
           output : out  STD_LOGIC_VECTOR (N-1 downto 0));
end memoire_tampon_NxM;

architecture Behavioral of memoire_tampon_NxM is

type tableau is array(M-1 downto 0) of std_logic_vector(N-1 downto 0);

signal q_int : tableau;

begin

reg0: registreNbits generic map(N) port map(clk => clk, reset => reset, en => enable, d => input, q_out => q_int(0));

reg_loop: for i in 1 to M-2 generate
	registres : registreNbits generic map(N) port map(clk => clk, reset => reset, en => enable, d => q_int(i-1), q_out => q_int(i));
end generate;

reg_fin : registreNbits generic map(N) port map(clk => clk, reset => reset, en => enable, d => q_int(M-2), q_out => q_int(M-1));

output <= q_int(M-1);

end Behavioral;


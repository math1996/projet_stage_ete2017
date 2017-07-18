----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:27 07/18/2017 
-- Design Name: 
-- Module Name:    test_division - Behavioral 
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

entity test_division is
    Port ( clk : in  STD_LOGIC;
           dividend, divisor : in  STD_LOGIC_VECTOR (31 downto 0);
           quotien, frac : out  STD_LOGIC_VECTOR (31 downto 0);
			  rfd : out std_logic);
end test_division;

architecture Behavioral of test_division is

component diviseur
	port (
	clk: in std_logic;
	rfd: out std_logic;
	dividend: in std_logic_vector(31 downto 0);
	divisor: in std_logic_vector(31 downto 0);
	quotient: out std_logic_vector(31 downto 0);
	fractional: out std_logic_vector(31 downto 0));
end component;


begin

division_test : diviseur port map(clk => clk, rfd => rfd, dividend => dividend, divisor => divisor, quotient => quotien, fractional => frac);

end Behavioral;


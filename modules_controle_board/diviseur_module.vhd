----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:00 07/19/2017 
-- Design Name: 
-- Module Name:    diviseur_module - Behavioral 
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

entity diviseur_module is
    Port ( clk, ce, sclr : in  STD_LOGIC;
			  rfd : out std_logic;
           dividend, divisor : in  STD_LOGIC_VECTOR (31 downto 0);
           quotient, fractional : out  STD_LOGIC_VECTOR (31 downto 0));
end diviseur_module;

architecture Behavioral of diviseur_module is

component diviseur
	port (
	clk: in std_logic;
	ce: in std_logic;
	sclr: in std_logic;
	rfd: out std_logic;
	dividend: in std_logic_vector(31 downto 0);
	divisor: in std_logic_vector(31 downto 0);
	quotient: out std_logic_vector(31 downto 0);
	fractional: out std_logic_vector(31 downto 0));
end component;

begin

division_gain : diviseur port map (clk => clk, rfd => rfd, dividend => dividend, divisor => divisor, quotient => quotient,
												fractional => fractional, ce => ce, sclr => sclr);

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:29 05/04/2017 
-- Design Name: 
-- Module Name:    rdc_Nbits - Behavioral 
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

entity rdc_Nbits is
generic(N : integer :=8);
    Port ( input, clk, reset, enable : in  STD_LOGIC;
           data_output_parallele : out  STD_LOGIC_VECTOR (N-1 downto 0));
end rdc_Nbits;

architecture Behavioral of rdc_Nbits is

signal q_int : std_logic_vector(N-1 downto 0);

begin

reg0 : registre1bit port map(clk => clk, reset => reset, en => enable, d => input, q_out => q_int(0));

reg_loop : for i in 1 to N-1 generate
	reg: registre1bit port map(clk => clk, reset => reset, en => enable, d => q_int(i-1), q_out => q_int(i));
end generate;

data_output_parallele <= q_int;

end Behavioral;


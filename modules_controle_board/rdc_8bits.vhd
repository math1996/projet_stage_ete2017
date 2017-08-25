----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:53 07/24/2017 
-- Design Name: 
-- Module Name:    rdc_8bits - Behavioral 
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

entity rdc_8bits is
    Port ( clk, enable, reset, input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end rdc_8bits;

architecture Behavioral of rdc_8bits is

component registre1bit is
    Port ( clk, reset, en, d : in  STD_LOGIC;
           q_out : out  STD_LOGIC);
end component;

signal output_int : std_logic_vector(7 downto 0);

begin

--registres
reg0 : registre1bit port map(clk => clk, en => enable, reset => reset, d => input, q_out => output_int(0));
reg1 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(0), q_out => output_int(1));
reg2 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(1), q_out => output_int(2));
reg3 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(2), q_out => output_int(3));
reg4 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(3), q_out => output_int(4));
reg5 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(4), q_out => output_int(5));
reg6 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(5), q_out => output_int(6));
reg7 : registre1bit port map(clk => clk, en => enable, reset => reset, d => output_int(6), q_out => output_int(7));

--output
output <= output_int;

end Behavioral;


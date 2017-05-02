----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:21 05/01/2017 
-- Design Name: 
-- Module Name:    rdc_load_nbits - Behavioral 
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

entity rdc_load_nbits is

generic(N: integer := 8);
    Port ( load : in  STD_LOGIC_VECTOR(N-1 downto 0);
           enable,reset,clk, input : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           output : out  STD_LOGIC;
			  output_parallele : out std_logic_vector(N-1 downto 0));
end rdc_load_nbits;

architecture Behavioral of rdc_load_nbits is

signal q_int : STD_LOGIC_VECTOR(N-1 downto 0);
signal sortie_mux : STD_LOGIC_VECTOR(N-1 DOWNTO 0);


begin

reg0: registre1bit port map(clk => clk, en => enable, reset => reset, d => sortie_mux(0), q_out => q_int(0));

reg_loop: for i in 1 to N-2 generate
	reg: registre1bit port map(clk => clk, en => enable, reset => reset, d => sortie_mux(i), q_out => q_int(i));
end generate;

reg_fin: registre1bit port map(clk => clk, en => enable, reset => reset, d => sortie_mux(N-1), q_out => q_int(N-1));

mux0: mux_2_1 port map(choix => mode, input(0) => input, input(1) => load(0), output => sortie_mux(0));

mux_loop: for i in 1 to N-2 generate
	mux: mux_2_1 port map(choix => mode, input(0) => q_int(i-1), input(1) => load(i), output => sortie_mux(i));
end generate;

mux_fin: mux_2_1 port map(choix => mode, input(0) => q_int(N-2), input(1) => load(N-1), output => sortie_mux(N-1));

output <= q_int(N-1);
output_parallele <= q_int;
end Behavioral;


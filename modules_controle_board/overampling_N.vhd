----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:34 07/25/2017 
-- Design Name: 
-- Module Name:    overampling_N - Behavioral 
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

entity overampling_N is
    Port ( clk, reset, enable_rdc : in  STD_LOGIC;
           data_rdy : out  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end overampling_N;

architecture Behavioral of overampling_N is

begin

--reprendre l'architecture en arbre des additionneurs
--diviser par 2*N pour faire la moyenne
--latcher le résultat
--signaler que la données est prete
--recommencer jusqu'à n'avoir plus de de données

end Behavioral;


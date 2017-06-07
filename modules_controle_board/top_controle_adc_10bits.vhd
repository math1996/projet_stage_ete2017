----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:03 06/07/2017 
-- Design Name: 
-- Module Name:    top_controle_adc_10bits - Behavioral 
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

entity top_controle_adc_10bits is
    Port ( clk, reset, start, DOUT, SSTRB : in  STD_LOGIC;
			  canal_conversion : in  STD_LOGIC_VECTOR (2 downto 0);
           sequence_conversion : in  STD_LOGIC_VECTOR (7 downto 0);
           mode_conversion : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_canaux_conversion : in  STD_LOGIC_VECTOR (3 downto 0);
           donnee_conversion_pret, DIN, SCLK, CS, SHDN, occupe, termine : out  STD_LOGIC;
			  donnee_conversion : out std_logic_vector(15 downto 0));
end top_controle_adc_10bits;

architecture Behavioral of top_controle_adc_10bits is

begin


end Behavioral;


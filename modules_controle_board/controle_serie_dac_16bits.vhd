----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:34 05/15/2017 
-- Design Name: 
-- Module Name:    controle_serie_dac_16bits - Behavioral 
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

entity controle_serie_dac_16bits is
    Port ( clk, reset, start : in  STD_LOGIC;
           load : in  STD_LOGIC_VECTOR (15 downto 0);
           FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB, occupe, termine : out  STD_LOGIC);
end controle_serie_dac_16bits;

architecture Behavioral of controle_serie_dac_16bits is

begin

OSR1 <= '0';
OSR2 <= '0';
BPB <= '0';
MUTEB <= '1';
RSTB <= '0';

--config_serie_dac16bits : configuration_serie_dac

end Behavioral;


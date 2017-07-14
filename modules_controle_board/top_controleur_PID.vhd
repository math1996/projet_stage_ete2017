----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:34 07/13/2017 
-- Design Name: 
-- Module Name:    top_controleur_PID - Behavioral 
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

entity top_controleur_PID is
    Port ( tension : in  STD_LOGIC_VECTOR (11 downto 0);
           courant : in  STD_LOGIC_VECTOR (13 downto 0);
           onde_gen : in  STD_LOGIC_VECTOR (15 downto 0);
           clk, reset, data_pret : in  STD_LOGIC;
           occupe, termine, transfer_dac : out  STD_LOGIC;
           u : out  STD_LOGIC_VECTOR (15 downto 0));
end top_controleur_PID;

architecture Behavioral of top_controleur_PID is

begin


end Behavioral;


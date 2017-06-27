----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:49 06/27/2017 
-- Design Name: 
-- Module Name:    controleur_PID - Behavioral 
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

entity controleur_PID is
    Port ( clk, reset, start : in  STD_LOGIC;
           Ek0, Ek1, Ek2 : in  STD_LOGIC_VECTOR (15 downto 0);
           u : out  STD_LOGIC;
           termine, occupe, transfert_dac : out  STD_LOGIC);
end controleur_PID;

architecture Behavioral of controleur_PID is

constant kp : std_logic_vector(31 downto 0) ;

begin


end Behavioral;


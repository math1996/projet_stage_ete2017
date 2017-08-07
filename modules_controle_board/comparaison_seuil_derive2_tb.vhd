--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:52:14 08/07/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/comparaison_seuil_derive2_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparaison_seuil_derive2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
library modules;
use modules.usr_package.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY comparaison_seuil_derive2_tb IS
END comparaison_seuil_derive2_tb;
 
ARCHITECTURE behavior OF comparaison_seuil_derive2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparaison_seuil_derive2
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         data_in : IN  std_logic_vector(31 downto 0);
         seuil : IN  std_logic_vector(31 downto 0);
         comparaison_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal seuil : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal comparaison_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparaison_seuil_derive2 PORT MAP (
          clk => clk,
          reset => reset,
          data_in => data_in,
          seuil => seuil,
          comparaison_out => comparaison_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '0';
		seuil <= std_logic_vector(to_unsigned(345, 32));
      wait for 100 ns;	
		reset <= '1';
		data_in <= std_logic_vector(to_unsigned(14, 32));
		seuil <= "11111100001111011111111111011100";
      wait for clk_period*10;
		data_in <= "11111100001111011111111111011101";
		seuil <= "11111100001111011111111111011100";
		wait for clk_period*10;
		data_in <= "11111100001111011111111111011100";
		seuil <= "11111100001111011111111111011101";
      wait for clk_period*10;
		data_in <= std_logic_vector(to_unsigned(345, 32));
		seuil <= std_logic_vector(to_unsigned(344, 32));
      wait for clk_period*10;
		data_in <= std_logic_vector(to_unsigned(365, 32));
		seuil <= std_logic_vector(to_unsigned(377, 32));
      wait for clk_period*10;
		data_in <= "11111100001111011111111111011101";
      wait for clk_period*10;
		data_in <= std_logic_vector(to_unsigned(1, 32));
      wait for clk_period*10;
		data_in <= std_logic_vector(to_unsigned(0, 32));
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

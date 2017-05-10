--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:02:39 05/09/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/memoire_tampon_16xM_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoire_tampon_16xM
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
LIBRARY ieee;
library modules;
use modules.usr_package.all;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memoire_tampon_16xM_tb IS
END memoire_tampon_16xM_tb;
 
ARCHITECTURE behavior OF memoire_tampon_16xM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoire_tampon_16xM
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  tableau_memoire( 7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : tableau_memoire( 7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoire_tampon_16xM PORT MAP (
          clk => clk,
          enable => enable,
          reset => reset,
          input => input,
          output => output
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
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;
		reset <= '1';
		enable <= '1';
		input <= "1001110111011101";
		wait for clk_period;
		input <= "1001011111000101";
		wait for clk_period;
		input <= "0000000000000000";
		wait for clk_period;
		input <= "1111111111111111";
		wait for clk_period;
		enable <= '0';
		wait for clk_period*5;
		enable <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
		reset <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;

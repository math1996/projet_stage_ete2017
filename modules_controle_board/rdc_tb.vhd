--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:49:49 05/04/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/rdc_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rdc_Nbits
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY rdc_tb IS
END rdc_tb;
 
ARCHITECTURE behavior OF rdc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rdc_Nbits
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         data_output_parallele : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal data_output_parallele : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rdc_Nbits PORT MAP (
          input => input,
          clk => clk,
          reset => reset,
          enable => enable,
          data_output_parallele => data_output_parallele
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
		enable <= '0';
      wait for clk_period*10;
		input <= '1';
		enable <= '1';
		reset <= '1';
		wait for clk_period*2;
		input <= '0';
		wait for clk_period*3;
		input <= '1';
		wait for clk_period*2;
		enable <= '0';
		wait for clk_period*3;
		enable <= '1';
		wait for clk_period*2;
		reset <= '0';
		wait for clk_period*2;
		reset <= '1';
      -- insert stimulus here 
      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:14:00 08/23/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_mult_mat_pipeline_nouveau_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_mult_mat_pipeline_nouveau
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
 
ENTITY test_mult_mat_pipeline_nouveau_tb IS
END test_mult_mat_pipeline_nouveau_tb;
 
ARCHITECTURE behavior OF test_mult_mat_pipeline_nouveau_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_mult_mat_pipeline_nouveau
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         reset : IN  std_logic;
         resultat : OUT  std_logic_vector(31 downto 0);
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         data_rdy : OUT  std_logic;
         changer_element : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal resultat : std_logic_vector(31 downto 0);
   signal occupe : std_logic;
   signal termine : std_logic;
   signal data_rdy : std_logic;
   signal changer_element : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_mult_mat_pipeline_nouveau PORT MAP (
          clk => clk,
          start => start,
          reset => reset,
          resultat => resultat,
          occupe => occupe,
          termine => termine,
          data_rdy => data_rdy,
          changer_element => changer_element
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
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*10;
		start <= '1';
		wait for clk_period;
		start <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

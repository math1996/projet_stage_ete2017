--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:43:55 08/22/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/multiplication_matricielle_pipeline_NxM_MxS_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplication_matricielle_pipeline_NxM_MxS
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
 
ENTITY multiplication_matricielle_pipeline_NxM_MxS_tb IS
END multiplication_matricielle_pipeline_NxM_MxS_tb;
 
ARCHITECTURE behavior OF multiplication_matricielle_pipeline_NxM_MxS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplication_matricielle_pipeline_NxM_MxS
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         reset : IN  std_logic;
         element_mat1 : IN  std_logic_vector(15 downto 0);
         element_mat2 : IN  std_logic_vector(15 downto 0);
         numero_element_mat1 : OUT  std_logic_vector(3 downto 0);
         numero_element_mat2 : OUT  std_logic_vector(3 downto 0);
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
   signal element_mat1 : std_logic_vector(15 downto 0) := (others => '0');
   signal element_mat2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal numero_element_mat1 : std_logic_vector(3 downto 0);
   signal numero_element_mat2 : std_logic_vector(3 downto 0);
   signal resultat : std_logic_vector(31 downto 0);
   signal occupe : std_logic;
   signal termine : std_logic;
   signal data_rdy : std_logic;
   signal changer_element : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplication_matricielle_pipeline_NxM_MxS PORT MAP (
          clk => clk,
          start => start,
          reset => reset,
          element_mat1 => element_mat1,
          element_mat2 => element_mat2,
          numero_element_mat1 => numero_element_mat1,
          numero_element_mat2 => numero_element_mat2,
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
		element_mat1 <= "1111111001110111";
		element_mat2 <= "0000000000000011";
      wait for clk_period*10;
		start <= '1';
		wait for clk_period;
		start <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

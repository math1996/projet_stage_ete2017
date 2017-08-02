--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:00 08/02/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_operation_matricielle_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_operation_matricielle
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
 
ENTITY test_operation_matricielle_tb IS
END test_operation_matricielle_tb;
 
ARCHITECTURE behavior OF test_operation_matricielle_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_operation_matricielle
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         tx : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         resultat_add_sous1 : OUT  std_logic_vector(15 downto 0);
         resultat_add_sous2 : OUT  std_logic_vector(15 downto 0);
         resultat_add_sous3 : OUT  std_logic_vector(15 downto 0);
         resultat_add_sous4 : OUT  std_logic_vector(15 downto 0);
         resultat_mult_epe1 : OUT  std_logic_vector(31 downto 0);
         resultat_mult_epe2 : OUT  std_logic_vector(31 downto 0);
         resultat_mult_epe3 : OUT  std_logic_vector(31 downto 0);
         resultat_mult_epe4 : OUT  std_logic_vector(31 downto 0);
         resultat_mult_mat : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal tx : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;
   signal resultat_add_sous1 : std_logic_vector(15 downto 0);
   signal resultat_add_sous2 : std_logic_vector(15 downto 0);
   signal resultat_add_sous3 : std_logic_vector(15 downto 0);
   signal resultat_add_sous4 : std_logic_vector(15 downto 0);
   signal resultat_mult_epe1 : std_logic_vector(31 downto 0);
   signal resultat_mult_epe2 : std_logic_vector(31 downto 0);
   signal resultat_mult_epe3 : std_logic_vector(31 downto 0);
   signal resultat_mult_epe4 : std_logic_vector(31 downto 0);
   signal resultat_mult_mat : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_operation_matricielle PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          tx => tx,
          occupe => occupe,
          termine => termine,
          resultat_add_sous1 => resultat_add_sous1,
          resultat_add_sous2 => resultat_add_sous2,
          resultat_add_sous3 => resultat_add_sous3,
          resultat_add_sous4 => resultat_add_sous4,
          resultat_mult_epe1 => resultat_mult_epe1,
          resultat_mult_epe2 => resultat_mult_epe2,
          resultat_mult_epe3 => resultat_mult_epe3,
          resultat_mult_epe4 => resultat_mult_epe4,
          resultat_mult_mat => resultat_mult_mat
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
		rx <= '1';
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*10;
		
		--opération
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--nombre data
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--numéro matrice
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 1
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 1
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 2
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 2
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 3
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 3
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 4
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 4
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 5
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 5
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 6
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 6
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 7
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 7
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 8
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 8
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 9
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 9
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 10
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 10
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 11
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 11
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 12
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 12
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 13
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 13
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 14
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 14
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 15
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 15
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 16
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 16
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--nombre data
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--numéro matrice
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 1
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 1
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 2
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 2
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 3
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 3
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 4
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 4
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 5
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 5
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 6
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 6
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 7
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 7
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 8
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 8
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 9
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 9
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 10
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 10
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 11
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 11
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 12
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 12
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 13
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 13
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 14
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 14
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 15
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 15
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		
		--data 16
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
		--data 16
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '0';
		wait for clk_period*27;
		rx <= '1';
		wait for clk_period*50;
      -- insert stimulus here 

      wait;
   end process;

END;

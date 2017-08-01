--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:16:41 07/28/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_stockage_matrice_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_stockage_matrice
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
 use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_stockage_matrice_tb IS
END test_stockage_matrice_tb;
 
ARCHITECTURE behavior OF test_stockage_matrice_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_stockage_matrice
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         numero_ligne : IN  std_logic_vector(0 downto 0);
         numero_colonne : IN  std_logic_vector(4 downto 0);
         input_element : IN  std_logic_vector(15 downto 0);
         ligne1 : OUT  std_logic_vector(15 downto 0);
         ligne2 : OUT  std_logic_vector(15 downto 0);
			ligne3 : OUT  std_logic_vector(15 downto 0);
			ligne4 : OUT  std_logic_vector(15 downto 0);
			ligne5 : OUT  std_logic_vector(15 downto 0);
			ligne6 : OUT  std_logic_vector(15 downto 0);
         ligne7 : OUT  std_logic_vector(15 downto 0);
			ligne8 : OUT  std_logic_vector(15 downto 0);
			ligne9 : OUT  std_logic_vector(15 downto 0);
			ligne10 : OUT  std_logic_vector(15 downto 0);
			ligne11 : OUT  std_logic_vector(15 downto 0);
         ligne12 : OUT  std_logic_vector(15 downto 0);
			ligne13 : OUT  std_logic_vector(15 downto 0);
         colonne1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';
   signal numero_ligne : std_logic_vector(0 downto 0) := (others => '0');
   signal numero_colonne : std_logic_vector(4 downto 0) := (others => '0');
   signal input_element : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal ligne1 : std_logic_vector(15 downto 0);
   signal ligne2 : std_logic_vector(15 downto 0);
   signal ligne3 : std_logic_vector(15 downto 0);
	signal ligne4 : std_logic_vector(15 downto 0);
	signal ligne5 : std_logic_vector(15 downto 0);
   signal ligne6 : std_logic_vector(15 downto 0);
   signal ligne7 : std_logic_vector(15 downto 0);
   signal ligne8 : std_logic_vector(15 downto 0);
   signal ligne9 : std_logic_vector(15 downto 0);
   signal ligne10 : std_logic_vector(15 downto 0);
   signal ligne11 : std_logic_vector(15 downto 0);	
   signal ligne12 : std_logic_vector(15 downto 0);
   signal ligne13 : std_logic_vector(15 downto 0);
	
   signal colonne1 : std_logic_vector(15 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_stockage_matrice PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          numero_ligne => numero_ligne,
          numero_colonne => numero_colonne,
          input_element => input_element,
          ligne1 => ligne1,
          ligne2 => ligne2,
			 ligne3 => ligne3,
			 ligne4 => ligne4,
			 ligne5 => ligne5,
			 ligne6 => ligne6,
			 ligne7 => ligne7,
			 ligne8 => ligne8,
			 ligne9 => ligne9,
			 ligne10 => ligne10,
			 ligne11 => ligne11,
			 ligne12 => ligne12,
			 ligne13 => ligne13,
          colonne1 => colonne1
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
		wait for clk_period;
		enable <= '1';
		input_element <= std_logic_vector(to_unsigned(27, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(72, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(12, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(38, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(182, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(83, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(9, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(93, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(100, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(25, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(15, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(25, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(87, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(63, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(69, 16));
		wait for clk_period;
		input_element <= std_logic_vector(to_unsigned(10, 16));
		wait for clk_period;
		enable <= '0';
      wait for clk_period*10;
		numero_ligne <= "1";
		numero_colonne <= "01011";

      -- insert stimulus here 

      wait;
   end process;

END;

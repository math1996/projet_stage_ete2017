--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:57:19 07/20/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/addition_soustraction_matrice_NxN_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addition_soustraction_matrice_NxM
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
use IEEE.math_real.all;
use ieee.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY addition_soustraction_matrice_NxN_tb IS
END addition_soustraction_matrice_NxN_tb;
 
ARCHITECTURE behavior OF addition_soustraction_matrice_NxN_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addition_soustraction_matrice_NxM
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         choix_add_sous : IN  std_logic;
         ligne_matrice1 : IN  ligne_matrice_16bits (3 downto 0);
         ligne_matrice2 : IN  ligne_matrice_16bits (3 downto 0);
         ligne_resultat : OUT  ligne_matrice_16bits (3 downto 0);
         donnee_prete : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal choix_add_sous : std_logic := '0';
   signal ligne_matrice1 : ligne_matrice_16bits (3 downto 0);
   signal ligne_matrice2 : ligne_matrice_16bits (3 downto 0);

 	--Outputs
   signal ligne_resultat : ligne_matrice_16bits (3 downto 0);
   signal donnee_prete : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addition_soustraction_matrice_NxM PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          choix_add_sous => choix_add_sous,
          ligne_matrice1 => ligne_matrice1,
          ligne_matrice2 => ligne_matrice2,
          ligne_resultat => ligne_resultat,
          donnee_prete => donnee_prete,
          occupe => occupe,
          termine => termine
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
		wait for clk_period*10;
		reset <= '1';
		start <= '1';
		choix_add_sous <= '0';
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(77, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(74, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(27, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(12, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(74, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(70, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(9, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(95, 16));
		
		wait for clk_period*3;
		start <= '0';
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(79, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(64, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(68, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(50, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(39, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(3, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(82, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(3, 16));
		
		wait for clk_period*3;
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(19, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(71, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(65, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(96, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(66, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(27, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(69, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(44, 16));
		
		wait for clk_period*3;
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(49, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(75, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(16, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(34, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(17, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(5, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(31, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(38, 16));
		
      wait for 100 ns;
		
		reset <= '1';
		start <= '1';
		choix_add_sous <= '1';
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(77, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(74, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(27, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(12, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(74, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(70, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(9, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(95, 16));
		
		wait for clk_period*3;
		start <= '0';
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(79, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(64, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(68, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(50, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(39, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(3, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(82, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(3, 16));
		
		wait for clk_period*3;
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(19, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(71, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(65, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(96, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(66, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(27, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(69, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(44, 16));
		
		wait for clk_period*3;
		ligne_matrice1(0) <= std_logic_vector(to_unsigned(49, 16));
		ligne_matrice1(1) <= std_logic_vector(to_unsigned(75, 16));
		ligne_matrice1(2) <= std_logic_vector(to_unsigned(16, 16));
		ligne_matrice1(3) <= std_logic_vector(to_unsigned(34, 16));
		
		ligne_matrice2(0) <= std_logic_vector(to_unsigned(17, 16));
		ligne_matrice2(1) <= std_logic_vector(to_unsigned(5, 16));
		ligne_matrice2(2) <= std_logic_vector(to_unsigned(31, 16));
		ligne_matrice2(3) <= std_logic_vector(to_unsigned(38, 16));
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

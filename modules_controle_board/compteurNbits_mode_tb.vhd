--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:45:39 05/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/compteurNbits_mode_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: compteurNbits_mode
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
 
ENTITY compteurNbits_mode_tb IS
END compteurNbits_mode_tb;
 
ARCHITECTURE behavior OF compteurNbits_mode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compteurNbits_mode
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         mode : IN  std_logic;
         compteur_out : OUT  std_logic_vector(7 downto 0);
         pas : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';
   signal mode : std_logic := '0';
   signal pas : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal compteur_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compteurNbits_mode PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          mode => mode,
          compteur_out => compteur_out,
          pas => pas
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
		pas <= "00000001";
		mode <= '0';
		wait for clk_period*10;
		enable <= '0';
		wait for clk_period*2;
		enable <= '1';
		pas <= "00000111";
		wait for clk_period*5;
		mode <= '1';
		wait for clk_period*5;
		enable <= '0';
		mode <= '0';
		wait for clk_period*2;
		enable <= '1';
		pas <= (others => '0');
      -- insert stimulus here 

      wait;
   end process;

END;

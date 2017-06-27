--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:00:48 06/27/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/controleur_PID_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controleur_PID
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
 
ENTITY controleur_PID_tb IS
END controleur_PID_tb;
 
ARCHITECTURE behavior OF controleur_PID_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controleur_PID
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         Ek0 : IN  std_logic_vector(15 downto 0);
         Ek1 : IN  std_logic_vector(15 downto 0);
         Ek2 : IN  std_logic_vector(15 downto 0);
         u : OUT  std_logic;
         termine : OUT  std_logic;
         occupe : OUT  std_logic;
         transfert_dac : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal Ek0 : std_logic_vector(15 downto 0) := (others => '0');
   signal Ek1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Ek2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal u : std_logic;
   signal termine : std_logic;
   signal occupe : std_logic;
   signal transfert_dac : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controleur_PID PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          Ek0 => Ek0,
          Ek1 => Ek1,
          Ek2 => Ek2,
          u => u,
          termine => termine,
          occupe => occupe,
          transfert_dac => transfert_dac
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

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

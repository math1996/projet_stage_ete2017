--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:52:10 06/05/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/test_top_gen_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_generation_onde
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
 
ENTITY test_top_gen_tb IS
END test_top_gen_tb;
 
ARCHITECTURE behavior OF test_top_gen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_generation_onde
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         FSYNC : OUT  std_logic;
         SCLK : OUT  std_logic;
         DIN : OUT  std_logic;
         OSR1 : OUT  std_logic;
         OSR2 : OUT  std_logic;
         BPB : OUT  std_logic;
         MUTEB : OUT  std_logic;
         RSTB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal occupe : std_logic;
   signal termine : std_logic;
   signal FSYNC : std_logic;
   signal SCLK : std_logic;
   signal DIN : std_logic;
   signal OSR1 : std_logic;
   signal OSR2 : std_logic;
   signal BPB : std_logic;
   signal MUTEB : std_logic;
   signal RSTB : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_generation_onde PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          occupe => occupe,
          termine => termine,
          FSYNC => FSYNC,
          SCLK => SCLK,
          DIN => DIN,
          OSR1 => OSR1,
          OSR2 => OSR2,
          BPB => BPB,
          MUTEB => MUTEB,
          RSTB => RSTB
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
		rx <= '1';
		wait for clk_period;
		rx <= '0';
		wait for clk_period*5*25;
		rx <= '1';
		wait for clk_period*3*50;
		rx <= '0';
		wait for clk_period*3*50;
		rx <= '1';
		wait for clk_period*10*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		wait for clk_period*30*50;
		rx <= '0';
		wait for clk_period*50;
		rx <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;

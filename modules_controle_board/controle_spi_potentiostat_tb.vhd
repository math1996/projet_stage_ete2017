--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:25:00 05/03/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/controle_spi_potentiostat_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controle_spi_potentiostat
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
 
ENTITY controle_spi_potentiostat_tb IS
END controle_spi_potentiostat_tb;
 
ARCHITECTURE behavior OF controle_spi_potentiostat_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controle_spi_potentiostat
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         CLK_OUT : OUT  std_logic;
         CS : OUT  std_logic;
         SDI : OUT  std_logic;
         output_LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal CLK_OUT : std_logic;
   signal CS : std_logic;
   signal SDI : std_logic;
   signal output_LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controle_spi_potentiostat PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          CLK_OUT => CLK_OUT,
          CS => CS,
          SDI => SDI,
          output_LED => output_LED
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

      -- insert stimulus here 

      wait;
   end process;

END;

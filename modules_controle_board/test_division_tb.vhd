--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:23:03 07/18/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_division_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_division
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
 
ENTITY test_division_tb IS
END test_division_tb;
 
ARCHITECTURE behavior OF test_division_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT division_module
    PORT(
         clk,ce, sclr : IN  std_logic;
         dividend : IN  std_logic_vector(31 downto 0);
         divisor : IN  std_logic_vector(31 downto 0);
         quotien : OUT  std_logic_vector(31 downto 0);
         frac : OUT  std_logic_vector(31 downto 0);
         rfd : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk, ce, sclr : std_logic := '0';
   signal dividend : std_logic_vector(31 downto 0) := (others => '0');
   signal divisor : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal quotien : std_logic_vector(31 downto 0);
   signal frac : std_logic_vector(31 downto 0);
   signal rfd : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: division_module PORT MAP (
          clk => clk,
			 ce => ce,
			 sclr => sclr,
          dividend => dividend,
          divisor => divisor,
          quotien => quotien,
          frac => frac,
          rfd => rfd
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
		ce <= '1';
		sclr <= '0';
		dividend <= "00000000000000111000000000000000";
		divisor <= "00000000000000011000000000000000";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

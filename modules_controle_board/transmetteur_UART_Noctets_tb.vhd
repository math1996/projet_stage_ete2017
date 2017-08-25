--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:41 08/17/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/transmetteur_UART_Noctets_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transmetteur_UART_Noctets
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
 
ENTITY transmetteur_UART_Noctets_tb IS
END transmetteur_UART_Noctets_tb;
 
ARCHITECTURE behavior OF transmetteur_UART_Noctets_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transmetteur_UART_Noctets
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         data_in : IN  std_logic_vector(31 downto 0);
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal occupe : std_logic;
   signal termine : std_logic;
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transmetteur_UART_Noctets PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          data_in => data_in,
          occupe => occupe,
          termine => termine,
          tx => tx
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
		data_in <= "01001110000110110011011101101011";
		wait for clk_period;
		start <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;

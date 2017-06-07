--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:14:10 06/07/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/test_sim_mode_adc12bits_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_test_mode_adc_12bits
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
 
ENTITY test_sim_mode_adc12bits_tb IS
END test_sim_mode_adc12bits_tb;
 
ARCHITECTURE behavior OF test_sim_mode_adc12bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_test_mode_adc_12bits
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         DOUT : IN  std_logic;
         rx : IN  std_logic;
         CS : OUT  std_logic;
         SCLK : OUT  std_logic;
         DIN : OUT  std_logic;
         tx : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal DOUT : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal CS : std_logic;
   signal SCLK : std_logic;
   signal DIN : std_logic;
   signal tx : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_test_mode_adc_12bits PORT MAP (
          clk => clk,
          reset => reset,
          DOUT => DOUT,
          rx => rx,
          CS => CS,
          SCLK => SCLK,
          DIN => DIN,
          tx => tx,
          occupe => occupe,
          termine => termine,
          data_out => data_out
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
		rx <= '1';
		DOUT <= '1';
      wait for clk_period*10;
		reset <= '1';
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		
		
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		--autre data
		wait for clk_period*20;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		wait for clk_period*100;
		rx <= '0';
		wait for clk_period*100;
		rx <= '1';
		
		
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;

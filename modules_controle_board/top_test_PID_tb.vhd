--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:10 07/19/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/top_test_PID_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_test_PID
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
 
ENTITY top_test_PID_tb IS
END top_test_PID_tb;
 
ARCHITECTURE behavior OF top_test_PID_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_test_PID
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         DOUT_12bits : IN  std_logic;
         DOUT_10bits : IN  std_logic;
         SSTRB_10bits : IN  std_logic;
         CS_12bits : OUT  std_logic;
         DIN_12bits : OUT  std_logic;
         SCLK_12bits : OUT  std_logic;
         CS_10bits : OUT  std_logic;
         DIN_10bits : OUT  std_logic;
         SCLK_10bits : OUT  std_logic;
         SHDN_10bits : OUT  std_logic;
         BPB_dac : OUT  std_logic;
         OSR1_dac : OUT  std_logic;
         OSR2_dac : OUT  std_logic;
         RSTB_dac : OUT  std_logic;
         MUTEB_dac : OUT  std_logic;
         FSYNC_dac : OUT  std_logic;
         DIN_dac : OUT  std_logic;
         SCLK_dac : OUT  std_logic;
         SCLK_pot : OUT  std_logic;
         CS_pot : OUT  std_logic;
         SDI : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
   signal DOUT_12bits : std_logic := '0';
   signal DOUT_10bits : std_logic := '0';
   signal SSTRB_10bits : std_logic := '0';

 	--Outputs
   signal CS_12bits : std_logic;
   signal DIN_12bits : std_logic;
   signal SCLK_12bits : std_logic;
   signal CS_10bits : std_logic;
   signal DIN_10bits : std_logic;
   signal SCLK_10bits : std_logic;
   signal SHDN_10bits : std_logic;
   signal BPB_dac : std_logic;
   signal OSR1_dac : std_logic;
   signal OSR2_dac : std_logic;
   signal RSTB_dac : std_logic;
   signal MUTEB_dac : std_logic;
   signal FSYNC_dac : std_logic;
   signal DIN_dac : std_logic;
   signal SCLK_dac : std_logic;
   signal SCLK_pot : std_logic;
   signal CS_pot : std_logic;
   signal SDI : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_test_PID PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          DOUT_12bits => DOUT_12bits,
          DOUT_10bits => DOUT_10bits,
          SSTRB_10bits => SSTRB_10bits,
          CS_12bits => CS_12bits,
          DIN_12bits => DIN_12bits,
          SCLK_12bits => SCLK_12bits,
          CS_10bits => CS_10bits,
          DIN_10bits => DIN_10bits,
          SCLK_10bits => SCLK_10bits,
          SHDN_10bits => SHDN_10bits,
          BPB_dac => BPB_dac,
          OSR1_dac => OSR1_dac,
          OSR2_dac => OSR2_dac,
          RSTB_dac => RSTB_dac,
          MUTEB_dac => MUTEB_dac,
          FSYNC_dac => FSYNC_dac,
          DIN_dac => DIN_dac,
          SCLK_dac => SCLK_dac,
          SCLK_pot => SCLK_pot,
          CS_pot => CS_pot,
          SDI => SDI,
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
      wait for 100 ns;	
		reset <= '0';
		rx <= '1';
      wait for clk_period*10;
		reset <= '1';
		rx <= '1';
		SSTRB_10bits <= '1';
		DOUT_10bits <= '1';
		DOUT_12bits <= '1';
		--paramètre sin
		
		--mode
		wait for clk_period;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--temps_attente_sin
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		
		--pas_sin
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--nb_cycle_sin
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--amplitude_sin
	
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
			wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--offset_sin
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
			--gain
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--paramètres ADC
		
		--mode
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--canal
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		--nb_conv_12bits
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		
		--nb_conv_10bits
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
		wait for clk_period*5;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		wait for clk_period*54;
		rx <= '0';
		wait for clk_period*54;
		rx <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;

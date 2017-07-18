--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:12:11 07/18/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/top_controleur_PID_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_controleur_PID
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
 
ENTITY top_controleur_PID_tb IS
END top_controleur_PID_tb;
 
ARCHITECTURE behavior OF top_controleur_PID_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_controleur_PID
    PORT(
         tension : IN  std_logic_vector(10 downto 0);
         courant : IN  std_logic_vector(12 downto 0);
         onde_gen : IN  std_logic_vector(15 downto 0);
         gain : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         data_pret : IN  std_logic;
         termine_dac : IN  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         transfert_dac : OUT  std_logic;
         u : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tension : std_logic_vector(10 downto 0) := (others => '0');
   signal courant : std_logic_vector(12 downto 0) := (others => '0');
   signal onde_gen : std_logic_vector(15 downto 0) := (others => '0');
   signal gain : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_pret : std_logic := '0';
   signal termine_dac : std_logic := '0';

 	--Outputs
   signal occupe : std_logic;
   signal termine : std_logic;
   signal transfert_dac : std_logic;
   signal u : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_controleur_PID PORT MAP (
          tension => tension,
          courant => courant,
          onde_gen => onde_gen,
          gain => gain,
          clk => clk,
          reset => reset,
          data_pret => data_pret,
          termine_dac => termine_dac,
          occupe => occupe,
          termine => termine,
          transfert_dac => transfert_dac,
          u => u
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
		tension <= "00110110110";
		courant <= "0001110110111";
		onde_gen <= "0000000000000000";
		gain <= "00110110";
		termine_dac <= '1';
      wait for clk_period*10;
		data_pret <= '1';
		wait for clk_period*5;
		data_pret <= '0';
		wait for clk_period*100;
		tension <= "00110110110";
		courant <= "0000010110111";
		onde_gen <= "0110010100001001";
		gain <= "00110110";
		data_pret <= '1';
		wait for clk_period*5;
		data_pret <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

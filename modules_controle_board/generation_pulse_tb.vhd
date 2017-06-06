--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:20:46 06/02/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/generation_pulse_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generation_pulse
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
 
ENTITY generation_pulse_tb IS
END generation_pulse_tb;
 
ARCHITECTURE behavior OF generation_pulse_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generation_pulse
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         onde_tri : IN  std_logic_vector(15 downto 0);
         offset_tri : IN  std_logic_vector(15 downto 0);
         choix_horloge : IN  std_logic_vector(3 downto 0);
         onde_tri_pulse : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';
   signal onde_tri : std_logic_vector(15 downto 0) := (others => '0');
   signal offset_tri : std_logic_vector(15 downto 0) := (others => '0');
   signal choix_horloge : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal onde_tri_pulse : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generation_pulse PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          onde_tri => onde_tri,
          offset_tri => offset_tri,
          choix_horloge => choix_horloge,
          onde_tri_pulse => onde_tri_pulse
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
		choix_horloge <= "0011";
		offset_tri <= "0000000000000001";
		onde_tri <= "1010101010101010";
		wait for clk_period*3;
		onde_tri <= "1010101010101110";
		wait for clk_period*3;
		onde_tri <= "1010101010111110";
		wait for clk_period*3;
		onde_tri <= "1010101011111110";
		wait for clk_period*3;
		onde_tri <= "1010101011111110";
      -- insert stimulus here 

      wait;
   end process;

END;

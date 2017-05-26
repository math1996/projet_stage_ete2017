--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:38:39 05/24/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/generation_onde_triangle_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generation_onde_triangle
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
library modules;
use modules.usr_package.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY generation_onde_triangle_tb IS
END generation_onde_triangle_tb;
 
ARCHITECTURE behavior OF generation_onde_triangle_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generation_onde_triangle
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         termine_dac : IN  std_logic;
         temps_attente : IN  std_logic_vector(31 downto 0);
         pas_comptage : IN  std_logic_vector(15 downto 0);
         amplitude : IN  std_logic_vector(15 downto 0);
         offset : IN  std_logic_vector(15 downto 0);
			nombre_cycle : in std_logic_vector(7 downto 0);
         onde_genere : OUT  std_logic_vector(15 downto 0);
         demarrer_transfert : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal termine_dac : std_logic := '0';
   signal temps_attente : std_logic_vector(31 downto 0) := (others => '0');
   signal pas_comptage : std_logic_vector(15 downto 0) := (others => '0');
   signal amplitude : std_logic_vector(15 downto 0) := (others => '0');
   signal offset : std_logic_vector(15 downto 0) := (others => '0');
	signal nombre_cycle :  std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal onde_genere : std_logic_vector(15 downto 0);
   signal demarrer_transfert : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 

	-- Instantiate the Unit Under Test (UUT)
   uut: generation_onde_triangle PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          termine_dac => termine_dac,
          temps_attente => temps_attente,
          pas_comptage => pas_comptage,
          amplitude => amplitude,
          offset => offset,
          onde_genere => onde_genere,
          demarrer_transfert => demarrer_transfert,
          occupe => occupe,
          termine => termine, 
			 nombre_cycle => nombre_cycle
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
		wait for clk_period/2;
		reset <= '1';
		start <= '1';
		termine_dac <= '1';
		temps_attente <= "00000000000000000000000000000000";
		pas_comptage <=  "0000000000010010";
		amplitude <= "0000001010110110";
		offset <= "0000000000000000";
		nombre_cycle <= "00000100";
		wait for clk_period;
		start <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;

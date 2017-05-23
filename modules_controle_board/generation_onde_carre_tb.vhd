--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:24:39 05/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/generation_onde_carre_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generation_onde_carre
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
 
ENTITY generation_onde_carre_tb IS
END generation_onde_carre_tb;
 
ARCHITECTURE behavior OF generation_onde_carre_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generation_onde_carre
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         termine_dac : IN  std_logic;
         nb_cycle : IN  std_logic_vector(7 downto 0);
         duty_cycle : IN  std_logic_vector(31 downto 0);
         nb_coup_horloge_par_cycle : IN  std_logic_vector(31 downto 0);
         amplitude : IN  std_logic_vector(15 downto 0);
         offset : IN  std_logic_vector(15 downto 0);
         onde_genere : OUT  std_logic_vector(15 downto 0);
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         demarrer_transfert : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal termine_dac : std_logic := '0';
   signal nb_cycle : std_logic_vector(7 downto 0) := (others => '0');
   signal duty_cycle : std_logic_vector(31 downto 0) := (others => '0');
   signal nb_coup_horloge_par_cycle : std_logic_vector(31 downto 0) := (others => '0');
   signal amplitude : std_logic_vector(15 downto 0) := (others => '0');
   signal offset : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal onde_genere : std_logic_vector(15 downto 0);
   signal occupe : std_logic;
   signal termine : std_logic;
   signal demarrer_transfert : std_logic;

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generation_onde_carre PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          termine_dac => termine_dac,
          nb_cycle => nb_cycle,
          duty_cycle => duty_cycle,
          nb_coup_horloge_par_cycle => nb_coup_horloge_par_cycle,
          amplitude => amplitude,
          offset => offset,
          onde_genere => onde_genere,
          occupe => occupe,
          termine => termine,
          demarrer_transfert => demarrer_transfert
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
		termine_dac <= '1';
		start <= '0';
      wait for clk_period*10;
		reset <= '1';
		start <= '1';
		offset <= "0000110111101001";
		amplitude <= "0001101111010011";
		nb_cycle <= "00000011";
		nb_coup_horloge_par_cycle <= "00000000000000000000100111000100";
		duty_cycle <= "00000000000000000000001001110001";
		wait for clk_period;
		start <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

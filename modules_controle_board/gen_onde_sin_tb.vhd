--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:27:43 05/30/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/gen_onde_sin_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generation_onde_sin
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
 
ENTITY gen_onde_sin_tb IS
END gen_onde_sin_tb;
 
ARCHITECTURE behavior OF gen_onde_sin_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generation_onde_sin
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         termine_dac : IN  std_logic;
         temps_attente : IN  std_logic_vector(31 downto 0);
         pas : IN  std_logic_vector(7 downto 0);
         amplitude : IN  std_logic_vector(15 downto 0);
         offset : IN  std_logic_vector(15 downto 0);
         nombre_cycle : IN  std_logic_vector(7 downto 0);
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
   signal pas : std_logic_vector(7 downto 0) := (others => '0');
   signal amplitude : std_logic_vector(15 downto 0) := (others => '0');
   signal offset : std_logic_vector(15 downto 0) := (others => '0');
   signal nombre_cycle : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal onde_genere : std_logic_vector(15 downto 0);
   signal demarrer_transfert : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generation_onde_sin PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          termine_dac => termine_dac,
          temps_attente => temps_attente,
          pas => pas,
          amplitude => amplitude,
          offset => offset,
          nombre_cycle => nombre_cycle,
          onde_genere => onde_genere,
          demarrer_transfert => demarrer_transfert,
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
      wait for clk_period*10;
		reset <= '1';
		start <= '1';
		temps_attente <= "00000000000000000000000000000001";
		pas <= "00000100";
		offset <= "1101011001000100";
		amplitude <= "0000011000000000";
		nombre_cycle <= "00000011";
		termine_dac <= '1';
		wait for clk_period;
		start <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;

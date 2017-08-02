--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:13:17 07/21/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_mult_matricielle_pipeline_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_mult_matricielle_pipeline
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
library IEEE;
library modules;
use modules.usr_package.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_mult_matricielle_pipeline_tb IS
END test_mult_matricielle_pipeline_tb;
 
ARCHITECTURE behavior OF test_mult_matricielle_pipeline_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_mult_matricielle_pipeline
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start, enable_input : IN  std_logic;
         resultat : OUT  std_logic_vector(31 downto 0);
			input_element1, input_element2 : in std_logic_vector(15 downto 0);
         occupe, data_rdy : OUT  std_logic;
         termine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start, enable_input : std_logic := '0';
	signal input_element1, input_element2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal resultat : std_logic_vector(31 downto 0);
   signal occupe, data_rdy: std_logic;
   signal termine : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_mult_matricielle_pipeline PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          resultat => resultat,
          occupe => occupe,
			 enable_input => enable_input,
			 input_element1 => input_element1,
			 input_element2 => input_element2,
			 data_rdy => data_rdy,
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
		wait for clk_period;
		enable_input <= '1';
		input_element1 <= std_logic_vector(to_unsigned(77, 16));
		input_element2 <= std_logic_vector(to_unsigned(74, 16));
		wait for clk_period;
		input_element1 <= "1111111110110110";
		input_element2 <= std_logic_vector(to_unsigned(70, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(27, 16));
		input_element2 <= std_logic_vector(to_unsigned(9, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(12, 16));
		input_element2 <= std_logic_vector(to_unsigned(95, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(79, 16));
		input_element2 <= std_logic_vector(to_unsigned(39, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(64, 16));
		input_element2 <= std_logic_vector(to_unsigned(3, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(68, 16));
		input_element2 <= std_logic_vector(to_unsigned(82, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(50, 16));
		input_element2 <= std_logic_vector(to_unsigned(3, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(19, 16));
		input_element2 <= "1111111110111110";
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(71, 16));
		input_element2 <= std_logic_vector(to_unsigned(27, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(65, 16));
		input_element2 <= std_logic_vector(to_unsigned(69, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(96, 16));
		input_element2 <= std_logic_vector(to_unsigned(44, 16));
		wait for clk_period;
		input_element1 <= "1111111111001111";
		input_element2 <= "1111111111101111";
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(75, 16));
		input_element2 <= std_logic_vector(to_unsigned(5, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(16, 16));
		input_element2 <= std_logic_vector(to_unsigned(31, 16));
		wait for clk_period;
		input_element1 <= std_logic_vector(to_unsigned(34, 16));
		input_element2 <= std_logic_vector(to_unsigned(38, 16));
		wait for clk_period;
		enable_input <= '0';
		wait for clk_period;
		start <= '1';
		wait for clk_period;
		start <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

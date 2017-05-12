--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:19:09 05/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/config_spi_adc10bits_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: configuration_spi_adc_10bits
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
 
ENTITY config_spi_adc10bits_tb IS
END config_spi_adc10bits_tb;
 
ARCHITECTURE behavior OF config_spi_adc10bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT configuration_spi_adc_10bits
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         reset : IN  std_logic;
         load : IN  std_logic_vector(7 downto 0);
         termine : OUT  std_logic;
         occupe : OUT  std_logic;
         DIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         CS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal reset : std_logic := '0';
   signal load : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal termine : std_logic;
   signal occupe : std_logic;
   signal DIN : std_logic;
   signal SCLK : std_logic;
   signal CS : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: configuration_spi_adc_10bits PORT MAP (
          clk => clk,
          start => start,
          reset => reset,
          load => load,
          termine => termine,
          occupe => occupe,
          DIN => DIN,
          SCLK => SCLK,
          CS => CS
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
		load <= "01101001";
		wait for clk_period;
		start <= '0';
		wait for clk_period*2;
		load <= "11111111";
      -- insert stimulus here 

      wait;
   end process;

END;

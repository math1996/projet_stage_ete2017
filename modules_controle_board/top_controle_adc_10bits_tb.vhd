--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:46:41 06/13/2017
-- Design Name:   
-- Module Name:   C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/top_controle_adc_10bits_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_controle_adc_10bits
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



 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_controle_adc_10bits_tb IS
END top_controle_adc_10bits_tb;
 
ARCHITECTURE behavior OF top_controle_adc_10bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_controle_adc_10bits
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         DOUT : IN  std_logic;
         SSTRB : IN  std_logic;
         canal_conversion : IN  std_logic_vector(2 downto 0);
         sequence_conversion : IN  std_logic_vector(7 downto 0);
         mode_conversion : IN  std_logic_vector(1 downto 0);
         nb_cycle_conversion : IN  std_logic_vector(31 downto 0);
         donnee_conversion_pret : OUT  std_logic;
         DIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         CS : OUT  std_logic;
         SHDN : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         donnee_conversion : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal DOUT : std_logic := '0';
   signal SSTRB : std_logic := '0';
   signal canal_conversion : std_logic_vector(2 downto 0) := (others => '0');
   signal sequence_conversion : std_logic_vector(7 downto 0) := (others => '0');
   signal mode_conversion : std_logic_vector(1 downto 0) := (others => '0');
   signal nb_canaux_conversion : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal donnee_conversion_pret : std_logic;
   signal DIN : std_logic;
   signal SCLK : std_logic;
   signal CS : std_logic;
   signal SHDN : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;
   signal donnee_conversion : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_controle_adc_10bits PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          DOUT => DOUT,
          SSTRB => SSTRB,
          canal_conversion => canal_conversion,
          sequence_conversion => sequence_conversion,
          mode_conversion => mode_conversion,
          nb_cycle_conversion => nb_cycle_conversion,
          donnee_conversion_pret => donnee_conversion_pret,
          DIN => DIN,
          SCLK => SCLK,
          CS => CS,
          SHDN => SHDN,
          occupe => occupe,
          termine => termine,
          donnee_conversion => donnee_conversion
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
		start <= '1';
		SSTRB <= '0';
		canal_conversion <= "001";
		sequence_conversion <= "00000000";
		mode_conversion <= "01";
		nb_cycle_conversion <= "00000000000000000000000000000100";
		wait for clk_period;
		start <= '0';
      wait for clk_period*10;
		DOUT <= '1';
		SSTRB <= '1';
		wait for clk_period*200;
		start <= '1';
		SSTRB <= '0';
		canal_conversion <= "011";
		sequence_conversion <= "11111111";
		mode_conversion <= "10";
		nb_cycle_conversion <= "00000000000000000000000000000100";
		wait for clk_period;
		start <= '0';
		wait for clk_period*10;
		SSTRB <= '1';
		DOUT <= '1';
		wait for clk_period*1500;
		reset <= '1';
		start <= '1';
		SSTRB <= '0';
		canal_conversion <= "001";
		sequence_conversion <= "10001001";
		mode_conversion <= "10";
		nb_cycle_conversion <= "00000000000000000000000000000001";
		wait for clk_period;
		start <= '0';
		wait for clk_period*20;
		SSTRB <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;

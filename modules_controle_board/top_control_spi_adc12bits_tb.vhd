--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:42:16 05/17/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/top_control_spi_adc12bits_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_controle_spi_adc_12bits
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
 
ENTITY top_control_spi_adc12bits_tb IS
END top_control_spi_adc12bits_tb;
 
ARCHITECTURE behavior OF top_control_spi_adc12bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_controle_spi_adc_12bits
    PORT(
         clk : IN  std_logic;
         start_seq, start_1CH : IN  std_logic;
         reset : IN  std_logic;
         DOUT : IN  std_logic;
         arret : IN  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         CS : OUT  std_logic;
         SCLK : OUT  std_logic;
         DIN : OUT  std_logic;
         data_out_conversion : OUT  std_logic_vector(15 downto 0);
         canal : IN  std_logic_vector(2 downto 0);
			sequence : in std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start_seq, start_1CH : std_logic := '0';
   signal reset : std_logic := '0';
   signal DOUT : std_logic := '0';
   signal arret : std_logic := '0';
   signal canal : std_logic_vector(2 downto 0) := (others => '0');
	signal sequence : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal occupe : std_logic;
   signal termine : std_logic;
   signal CS : std_logic;
   signal SCLK : std_logic;
   signal DIN : std_logic;
   signal data_out_conversion : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_controle_spi_adc_12bits PORT MAP (
          clk => clk,
          start_seq => start_seq,
			 start_1CH => start_1CH,
          reset => reset,
          DOUT => DOUT,
          arret => arret,
          occupe => occupe,
          termine => termine,
          CS => CS,
          SCLK => SCLK,
          DIN => DIN,
          data_out_conversion => data_out_conversion,
          canal => canal,
			 sequence => sequence
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
		start_seq <= '1';
		start_1CH <= '0';
		canal <= "000";
		sequence <= "01110111";
		arret <= '0';
		wait for clk_period;
		DOUT <= '1';
		start_1CH <= '0';
		start_seq <= '0';
		wait for clk_period*100;
		arret <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;

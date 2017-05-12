--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:19 05/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/controle_spi_adc10bits_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controle_spi_adc_10bits
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
 
ENTITY controle_spi_adc10bits_tb IS
END controle_spi_adc10bits_tb;
 
ARCHITECTURE behavior OF controle_spi_adc10bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controle_spi_adc_10bits
    PORT(
         start : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         DOUT : IN  std_logic;
         SSTRB : IN  std_logic;
         DIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         CS : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic;
         donnes : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal DOUT : std_logic := '0';
   signal SSTRB : std_logic := '0';

 	--Outputs
   signal DIN : std_logic;
   signal SCLK : std_logic;
   signal CS : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;
   signal donnes : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controle_spi_adc_10bits PORT MAP (
          start => start,
          clk => clk,
          reset => reset,
          DOUT => DOUT,
          SSTRB => SSTRB,
          DIN => DIN,
          SCLK => SCLK,
          CS => CS,
          occupe => occupe,
          termine => termine,
          donnes => donnes
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
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period*2;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--2ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--3ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--4ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--5ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--6ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--7ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--8ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		--9ième fois
		wait for clk_period*5;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period*25;
		sstrb <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '0';
		wait for clk_period;
		DOUT <= '1';
		wait for clk_period;
		DOUT <= '1';
		SSTRB <= '0';
		
		
      -- insert stimulus here 

      wait;
   end process;

END;

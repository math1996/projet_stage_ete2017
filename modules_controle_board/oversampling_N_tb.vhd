--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:19:14 07/27/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/oversampling_N_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: oversampling_N
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
 
ENTITY oversampling_N_tb IS
END oversampling_N_tb;
 
ARCHITECTURE behavior OF oversampling_N_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT oversampling_N
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable_rdc : IN  std_logic;
         data_in : IN  std_logic_vector(15 downto 0);
         choix_oversampling : IN  std_logic_vector(2 downto 0);
         data_rdy : OUT  std_logic;
         occupe : OUT  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable_rdc : std_logic := '0';
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal choix_oversampling : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal data_rdy : std_logic;
   signal occupe : std_logic;
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: oversampling_N PORT MAP (
          clk => clk,
          reset => reset,
          enable_rdc => enable_rdc,
          data_in => data_in,
          choix_oversampling => choix_oversampling,
          data_rdy => data_rdy,
          occupe => occupe,
          data_out => data_out
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
		wait for clk_period/2;
		reset <= '1';
		wait for clk_period;
		choix_oversampling <= "011";
		enable_rdc <= '1';
		data_in <= "0100000101101011";
      wait for clk_period;
		enable_rdc <= '0';
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000101111011";
		wait for clk_period;
		enable_rdc <= '0';
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000101111011";
		wait for clk_period;
		enable_rdc <= '0';
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000101111011";
		wait for clk_period;
		enable_rdc <= '0';
		--465
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000111010001";
		wait for clk_period;
		enable_rdc <= '0';
		--501
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000111110101";
		wait for clk_period;
		enable_rdc <= '0';
		-- -163
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0101111101011101";
		wait for clk_period;
		enable_rdc <= '0';
		--379
		wait for clk_period*5;
		enable_rdc <= '1';
		data_in <= "0100000101111011";
		wait for clk_period;
		enable_rdc <= '0';
--		--379
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100000101111011";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--1000
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100001111101000";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--1005
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100001111101101";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--863
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100001101011111";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--445
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100000110111101";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--500
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100000111110100";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--503
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100000111110111";
--		wait for clk_period;
--		enable_rdc <= '0';
--		--367
--		wait for clk_period*5;
--		enable_rdc <= '1';
--		data_in <= "0100000101101111";
--		wait for clk_period;
--		enable_rdc <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;

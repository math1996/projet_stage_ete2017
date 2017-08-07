--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:05:01 08/07/2017
-- Design Name:   
-- Module Name:   C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/trouver_min_vecteur_1xN_tb.vhd
-- Project Name:  modules_controle_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trouver_min_vecteur_1xN
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
 
ENTITY trouver_min_vecteur_1xN_tb IS
END trouver_min_vecteur_1xN_tb;
 
ARCHITECTURE behavior OF trouver_min_vecteur_1xN_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trouver_min_vecteur_1xN
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         data_in : IN  std_logic_vector(31 downto 0);
         position_min : OUT  std_logic_vector(2 downto 0);
         enable_decalage : OUT  std_logic;
         occupe : OUT  std_logic;
         termine : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal position_min : std_logic_vector(2 downto 0);
   signal enable_decalage : std_logic;
   signal occupe : std_logic;
   signal termine : std_logic;


	type valeur is array(2 downto 0) of std_logic_vector(31 downto 0);
	signal rdc : valeur := ("00110110111101110011110110111110","11110110111101110011110110111110","00110110111101110011110110111110");
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trouver_min_vecteur_1xN PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          data_in => data_in,
          position_min => position_min,
          enable_decalage => enable_decalage,
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
		reset <= '0';
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period;
		start <= '1';
		wait for clk_period;
		start <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

	rdc_process : process(reset,clk,enable_decalage)
	begin
	if(reset = '0') then
		rdc <= ("11111111111101110011110110111111","11110110111101110011110110111110","11111110111101110011110110111110");
	elsif(clk'event and clk = '1') then
		if(enable_decalage = '1') then
			rdc(2 downto 1) <= rdc(1 downto 0);
			rdc(0) <= (others => '0');
		end if;
	end if;
	end process;

	data_in <= rdc(2);
END;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:36 05/05/2017 
-- Design Name: 
-- Module Name:    FSM_configurer_adc_12bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library modules;
use modules.usr_package.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_configurer_adc_12bits is
    Port ( clk, start, reset : in  STD_LOGIC;
           occupe, termine, CS, SCLK, DIN : out  STD_LOGIC);
end FSM_configurer_adc_12bits;

architecture Behavioral of FSM_configurer_adc_12bits is

type etat_fsm_adc12bits is (attente, start_RR1, RR1, start_RR2, RR2, start_SR, SR, start_CR, CR, fin);
 
signal etat_present, etat_suivant : etat_fsm_adc12bits;
signal demarrer_transfert, DIN_int, sclk_int, cs_int, occupe_int, termine_int, reset_spi : std_logic;
signal load_int : std_logic_vector(15 downto 0);

begin

rdc_configurer_adc_12bits: configuration_spi_adc_12bits port map(clk => clk, reset => reset_spi, start => demarrer_transfert,  load => load_int, 
																						DIN => DIN, SCLK => SCLK, CS => CS, occupe => occupe, termine => termine_int);

--machine à état de la configuration des registres de l'adc 12 bits
process(clk,reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(start, termine_int, etat_present)
begin
case etat_present is
	when attente =>
		reset_spi <= '0';
		demarrer_transfert <= '0';
		load_int <= (others => '1');
		termine <= '0';
		if(start = '1') then
			etat_suivant <= start_RR1;
		else
			etat_suivant <= attente;
		end if;
		
	when start_RR1 =>
		reset_spi <= '1';
		demarrer_transfert <= '1';
		load_int <= (others => '1');
		termine <= '0';
		etat_suivant <= RR1;
	
	when RR1 =>
		reset_spi <= '1';
		demarrer_transfert <= '0';
		load_int <= b"1_01_01010101_00000"; --range register 1
		termine <= '0';
		if(termine_int = '1') then
			etat_suivant <= start_RR2;
		else
			etat_suivant <= RR1;
		end if;
	
	when start_RR2 =>
		reset_spi <= '1';
		demarrer_transfert <= '1';
		load_int <= (others => '1');
		termine <= '0';
		etat_suivant <= RR2;
	
	when RR2 =>
		reset_spi <= '1';
		demarrer_transfert <= '0';
		load_int <= b"1_10_01010101_00000"; --range register 2
		termine <= '0';
		if(termine_int = '1') then
			etat_suivant <= start_SR;
		else
			etat_suivant <= RR2;
		end if;
	
	when start_SR =>
		reset_spi <= '1';
		demarrer_transfert <= '1';
		load_int <= (others => '1');
		termine <= '0';
		etat_suivant <= SR;
		
	when SR =>
		reset_spi <= '1';
		demarrer_transfert <= '0';
		load_int <= b"1_11_10000000_00000"; --sequence register 
		termine <= '0';
		if(termine_int = '1') then
			etat_suivant <= start_CR;
		else
			etat_suivant <= SR;
		end if;
		
	when start_CR =>
		reset_spi <= '1';
		demarrer_transfert <= '1';
		load_int <= (others => '1');
		termine <= '0';
		etat_suivant <= CR;
	
	when CR =>
		reset_spi <= '1';
		demarrer_transfert <= '0';
		load_int <= b"1_00_000_00_00_0_1_00_00"; --sequence register 
		termine <= '0';
		if(termine_int = '1') then
			etat_suivant <= fin;
		else
			etat_suivant <= CR;
		end if;
		
	when fin =>
		reset_spi <= '0';
		demarrer_transfert <= '0';
		load_int <= (others => '1');
		termine <= '1';
		etat_suivant <= attente;
		
	when others =>
		reset_spi <= '0';
		demarrer_transfert <= '0';
		load_int <= (others => '1');
		termine <= '0';
		etat_suivant <= attente;
end case;	
end process;

end Behavioral;


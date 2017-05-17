----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:33 05/17/2017 
-- Design Name: 
-- Module Name:    FSM_com_serie_rx - Behavioral 
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

entity FSM_com_serie_rx is
    Port ( clk, reset, rx : in  STD_LOGIC;
           start_1CH, start_seq, arret_conversion : out  STD_LOGIC;
           sequence : out  STD_LOGIC_VECTOR (7 downto 0);
			  canal : out STD_LOGIC_VECTOR (2 downto 0));
end FSM_com_serie_rx;

architecture Behavioral of FSM_com_serie_rx is

component serial_rx is 
	port(clk, rst, rx : in std_logic;
			data : out std_logic_vector(7 downto 0);
			new_data : out std_logic);
end component;

type etat_fsm_rx is (attente,mode0, mode1, mode2, mode2_1, mode3);
signal etat_present, etat_suivant :  etat_fsm_rx;

signal data_rdy, enable_data_out : std_logic;
signal mode : std_logic_vector(1 downto 0);
signal data_int, sequence_int : std_logic_vector(7 downto 0);

begin

mode <= data_int(5 downto 4);

				
com_serie_rx : serial_rx port map(clk => clk, rst => reset, rx => rx, data => data_int, new_data => data_rdy);

registre_canal : registreNbits generic map(3) port map(clk => clk, reset => reset, en => enable_data_out, 
																		d => data_int(2 downto 0), q_out => canal);
registre_sequence : registreNbits generic map(8) port map(clk => clk, reset => reset, en => enable_data_out,
																			d => sequence_int, q_out => sequence);

--machine à état de la gestion des modes
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(mode, data_rdy, etat_present, data_int)
begin
	case etat_present is
		when attente =>
			start_1CH <= '0';
			start_seq <= '0';
			enable_data_out <= '0';
			arret_conversion <= '0';
			sequence_int <= (others => '0');
			if(data_rdy = '1' and mode = "00") then
				etat_suivant <= mode0;
			elsif(data_rdy = '1' and mode = "01") then
				etat_suivant <= mode1;
			elsif(data_rdy = '1' and mode = "10") then
				etat_suivant <= mode2;
			elsif(data_rdy = '1' and mode = "11") then
				etat_suivant <= mode3;
			else
				etat_suivant <= attente;
			end if;
		
		--utiliser un registre pour arret, jour avec le enable!!!
		when mode0 =>
			start_1CH <= '0';
			start_seq <= '0';
			enable_data_out <= '1';
			arret_conversion <= '1';
			sequence_int <= ("10000001");
			etat_suivant <= attente;
			
		when mode1 =>
			start_1CH <= '1';
			start_seq <= '0';
			enable_data_out <= '1';
			arret_conversion <= '0';
			sequence_int <= ("01111110");
			etat_suivant <= attente;
			
		when mode2 =>
			start_1CH <= '0';
			start_seq <= '0';
			enable_data_out <= '0';
			arret_conversion <= '0';
			sequence_int <= (others => '0');
			if(data_rdy = '1') then
				etat_suivant <= mode2_1;
			else
				etat_suivant <= mode2;
			end if;
			
		when mode2_1 =>
			start_1CH <= '0';
			start_seq <= '1';
			enable_data_out <= '1';
			arret_conversion <= '0';
			sequence_int <= data_int;
			etat_suivant <= attente;
			
		when mode3 =>
			start_1CH <= '0';
			start_seq <= '1';
			enable_data_out <= '1';
			arret_conversion <= '0';
			sequence_int <=(others => '1');
			etat_suivant <= attente;

		when others =>
			start_1CH <= '0';
			start_seq <= '0';
			enable_data_out <= '0';
			arret_conversion <= '0';
			sequence_int <= (others => '0');
			etat_suivant <= attente;
	end case;		
end process;

end Behavioral;


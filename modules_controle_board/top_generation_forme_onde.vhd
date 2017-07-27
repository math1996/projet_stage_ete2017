----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:52 06/19/2017 
-- Design Name: 
-- Module Name:    top_generation_forme_onde - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_generation_forme_onde is
    Port ( clk, reset, start : in  STD_LOGIC;
			  choix_onde : std_logic_vector(2 downto 0);
			  amplitude, offset : std_logic_vector(15 downto 0);
			  duty_cycle_carre, nb_coup_horloge_par_cycle_carre, nb_cycle : std_logic_vector(31 downto 0);
			  pas_comptage_tri : std_logic_vector(15 downto 0);
			  temps_attente_tri, temps_attente_sin : std_logic_vector(31 downto 0);
			  pas_comptage_sin : std_logic_vector(7 downto 0);
			  choix_clk_pulse : std_logic_vector(3 downto 0);
           occupe, termine, FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB, pente_onde_tri : out  STD_LOGIC);
end top_generation_forme_onde;

architecture Behavioral of top_generation_forme_onde is

type etat_top_gen_forme_onde is (attente, choix_onde_etat, demarrer_onde_carre, demarrer_onde_tri, demarrer_onde_sin, demarrer_onde_tri_pulse, attente_carre,
											attente_tri, attente_sin, attente_pulse,fin);
signal etat_present, etat_suivant : etat_top_gen_forme_onde;

signal termine_dac, occupe_dac, start_transfert_int, reset_onde_carre, start_onde_carre, occupe_onde_carre, termine_onde_carre, start_dac_onde_carre,
		 reset_onde_tri, start_onde_tri, occupe_onde_tri, termine_onde_tri, start_dac_onde_tri, reset_onde_sin, start_onde_sin, start_dac_onde_sin,
		 occupe_onde_sin, termine_onde_sin, reset_onde_pulse, enable_onde_pulse, termine_gen : std_logic;

signal onde_carre_int, onde_tri_int, onde_sin_int, onde_tri_pulse_int, load_int : std_logic_vector(15 downto 0);

begin

--clk est à 25 MHz obligatoirement!

--assignation signaux
occupe <= occupe_dac or occupe_onde_carre or occupe_onde_tri or occupe_onde_sin;

--module	de controle SPI du DAC 16 bits
ctrl_serie_dac16 : controle_serie_dac_16bits port map(clk => clk, reset => reset, start => start_transfert_int,
																		load => load_int, FSYNC => FSYNC, SCLK => SCLK, DIN => DIN,
																		OSR1 => OSR1, OSR2 => OSR2, BPB => BPB, MUTEB => MUTEB, 
																		RSTB => RSTB, occupe => occupe_dac, termine => termine_dac);																			

--module de génération d'une onde carrée
gen_onde_carre : generation_onde_carre port map(clk => clk, reset => reset_onde_carre, start => start_onde_carre, termine_dac => termine_dac,
																nombre_cycle => nb_cycle, duty_cycle => duty_cycle_carre,
																nb_coup_horloge_par_cycle => nb_coup_horloge_par_cycle_carre,
																amplitude => amplitude, offset => offset, onde_genere => onde_carre_int, 
																occupe => occupe_onde_carre, termine => termine_onde_carre,
																demarrer_transfert => start_dac_onde_carre);
																
--module de génération d'une onde triangulaire
gen_onde_triangle : generation_onde_triangle port map(clk => clk, reset => reset_onde_tri, start => start_onde_tri, termine_dac => termine_dac,
																		temps_attente => temps_attente_tri, pas_comptage => pas_comptage_tri, 
																		amplitude => amplitude,offset => offset, onde_genere => onde_tri_int, 
																		demarrer_transfert => start_dac_onde_tri, nombre_cycle => nb_cycle, occupe => occupe_onde_tri,
																		termine => termine_onde_tri, pente_onde_tri => pente_onde_tri); 	

--module de génération d'une onde sinusoïdale
gen_onde_sinus : generation_onde_sin port map(clk => clk, reset => reset_onde_sin, start => start_onde_sin, termine_dac => termine_dac,
															temps_attente => temps_attente_sin, pas => pas_comptage_sin, amplitude => amplitude, 
															offset => offset, nombre_cycle => nb_cycle, onde_genere => onde_sin_int,
															demarrer_transfert => start_dac_onde_sin, occupe => occupe_onde_sin, termine => termine_onde_sin);
															
--module de génération de l'onde triangulaire pulsée
gen_onde_pulse : generation_pulse port map(clk => clk, reset => reset_onde_pulse, enable => enable_onde_pulse, onde_tri => onde_tri_int,
														 offset_tri => offset, choix_horloge => choix_clk_pulse, onde_tri_pulse => onde_tri_pulse_int);															

--mux de l'onde choisi à donner au DAC
load_int <= onde_carre_int when choix_onde = "001" else
				onde_tri_int when choix_onde = "010" else
				onde_sin_int when choix_onde = "011" else
				onde_tri_pulse_int when choix_onde = "100" else
				(others => '0');

--mux du start de l'onde choisi à donenr au DAC				
start_transfert_int <= start_dac_onde_carre when choix_onde = "001" else
							  start_dac_onde_tri when choix_onde = "010" else
							  start_dac_onde_sin when choix_onde = "011" else
							  start_dac_onde_tri when choix_onde = "100" else
							  '0';
	
--machine à état du controle du choix d'onde	
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;	

process(etat_present, start, termine_onde_tri, termine_onde_carre, termine_onde_sin, choix_onde)
begin
	case etat_present is
		when attente =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			if(start = '1') then
				etat_suivant <= choix_onde_etat;
			else
				etat_suivant <= attente;
			end if;
			
		when choix_onde_etat =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			if(choix_onde = "001") then
				etat_suivant <= demarrer_onde_carre;
			elsif(choix_onde = "010") then
				etat_suivant <= demarrer_onde_tri;
			elsif(choix_onde = "011") then
				etat_suivant <= demarrer_onde_sin;
			elsif(choix_onde = "100") then
				etat_suivant <= demarrer_onde_tri_pulse;
			else
				etat_suivant <= attente;
			end if;
			
		when demarrer_onde_carre =>
			reset_onde_carre <= '1';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '1';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			etat_suivant <= attente_carre;
		
		when demarrer_onde_tri =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '1';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '1';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			etat_suivant <= attente_tri;
			
		when demarrer_onde_sin =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '1';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '1';
			enable_onde_pulse <= '0';
			termine <= '0';
			etat_suivant <= attente_sin;
			
		when demarrer_onde_tri_pulse =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '1';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '1';
			start_onde_carre <= '0';
			start_onde_tri <= '1';
			start_onde_sin <= '0';
			enable_onde_pulse <= '1';
			termine <= '0';
			etat_suivant <= attente_pulse;
		
		when attente_carre =>
			reset_onde_carre <= '1';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '1';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			if(termine_onde_carre = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_carre;
			end if;
			
		when attente_tri =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '1';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '1';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			if(termine_onde_tri = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_tri;
			end if;
			
		when attente_sin =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '1';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '1';
			enable_onde_pulse <= '0';
			termine <= '0';
			if(termine_onde_sin = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_sin;
			end if;
			
		when attente_pulse =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '1';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '1';
			start_onde_carre <= '0';
			start_onde_tri <= '1';
			start_onde_sin <= '0';
			enable_onde_pulse <= '1';
			termine <= '0';
			if(termine_onde_tri = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_pulse;
			end if;
			
		when fin =>
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '1';
			etat_suivant <= attente;
		
		when others => 
			reset_onde_carre <= '0';
			reset_onde_tri <= '0';
			reset_onde_sin <= '0';
			reset_onde_pulse <= '0';
			start_onde_carre <= '0';
			start_onde_tri <= '0';
			start_onde_sin <= '0';
			enable_onde_pulse <= '0';
			termine <= '0';
			etat_suivant <= attente;
			
	end case;
end process;					  
end Behavioral;


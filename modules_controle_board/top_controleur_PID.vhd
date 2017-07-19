----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:34 07/13/2017 
-- Design Name: 
-- Module Name:    top_controleur_PID - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity top_controleur_PID is
    Port ( tension : in  STD_LOGIC_VECTOR (10 downto 0);
           courant : in  STD_LOGIC_VECTOR (12 downto 0);
           onde_gen : in  STD_LOGIC_VECTOR (15 downto 0);
			  gain : in std_logic_vector(7 downto 0);
           clk, reset, data_pret, termine_dac : in  STD_LOGIC;
           occupe, termine, transfert_dac : out  STD_LOGIC;
           u : out  STD_LOGIC_VECTOR (15 downto 0));
end top_controleur_PID;

architecture Behavioral of top_controleur_PID is

type etat_ctrl_pid is (attente, latch_input, attente_division, demarrer_cycle_PID, attente_PID, fin); 
signal etat_present, etat_suivant : etat_ctrl_pid;

signal tension_32bits, courant_32bits_gain, courant_32bits, partie_entiere_div, partie_frac_div : std_logic_vector(31 downto 0);
signal erreur0, erreur1, erreur2, erreur_int, diff_tension_courant: std_logic_vector(31 downto 0);
signal enable_reg, rfd_int, reset_reg, enable_input, start_cycle_PID, reset_compteur, enable_compteur, cmp_fin_div, termine_PID,
			enable_div, reset_div: std_logic;
signal gain_courant_32bits, onde_int_signe, onde_gen_int : std_logic_vector(31 downto 0);
signal onde_int : std_logic_vector(15 downto 0);
signal courant_int : std_logic_vector(12 downto 0);
signal tension_int : std_logic_vector(10 downto 0);
signal compte_div : std_logic_vector(7 downto 0);

component diviseur is
  port (
    sclr : in STD_LOGIC := 'X'; 
    ce : in STD_LOGIC := 'X'; 
    rfd : out STD_LOGIC; 
    clk : in STD_LOGIC := 'X'; 
    dividend : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    quotient : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    divisor : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    fractional : out STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end component;


begin


--registres contenant les entrées de courant et de tension
registre_courant : registreNbits generic map(13) port map(clk => clk, reset => reset_reg, en => enable_input, d => courant, q_out => courant_int);
registre_tension : registreNbits generic map(11) port map(clk => clk, reset => reset_reg, en => enable_input, d => tension, q_out => tension_int);
registre_onde : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => enable_input, d => onde_gen, q_out => onde_int);

--normaliser sur 32 bits les courant et la tension (16 bits entier, 16 bits decimal)
tension_32bits <= tension_int & "00000" & "0000000000000000";
courant_32bits <= courant_int & "000" & "0000000000000000";
onde_gen_int <= onde_int & "0000000000000000";

--module effectuant l'asservissement du PID
ctrl_PID : controleur_PID port map(clk => clk, reset => reset_reg, start => start_cycle_PID, termine_dac => termine_dac, Ek0 => erreur0, Ek1 => erreur1, Ek2 => erreur2,
													  u => u, termine => termine_PID, occupe => occupe, transfert_dac => transfert_dac, enable_reg_erreur => enable_reg);

--registres stockant les erreurs
registre_erreur0 : registreNbits generic map(32) port map(clk => clk, reset => reset, en => enable_reg, d => erreur_int, q_out => erreur0);
registre_erreur1 : registreNbits generic map(32) port map(clk => clk, reset => reset, en => enable_reg, d => erreur0, q_out => erreur1);
registre_erreur2 : registreNbits generic map(32) port map(clk => clk, reset => reset, en => enable_reg, d => erreur1, q_out => erreur2);

--diviseur permettant de retirer la gain
division_gain : diviseur port map (clk => clk, rfd => rfd_int, dividend => courant_32bits, divisor => gain_courant_32bits, quotient => partie_entiere_div,
												fractional => partie_frac_div, ce => enable_div, sclr => not(reset_div));
												
--comparaison de la tension et du courant (ajouter un diviseur pour retirer le gain)
diff_tension_courant <= tension_32bits + (not(courant_32bits_gain) + 1);

--mpasser du complément 1 à complément 2
onde_int_signe <= onde_gen_int when onde_gen_int(31) = '0' else
						onde_gen_int + 1;
						
--comparaison de la différence tension_courant avec le signal
erreur_int <= onde_int_signe + (not(diff_tension_courant) + 1);

--LUT contenant les valeurs de gain associé à la valeur de la résistance (8 bits)
LUT_gain : LUT_256_gain port map(adresse => gain, valeur => gain_courant_32bits);

--assignation des signaux après la division
courant_32Bits_gain <= partie_entiere_div(15 downto 0) & partie_frac_div(31 downto 16);

--compteur du nombre de coup d'horloge pour la division
compteur_div : compteurNbits generic map(8) port map(clk => clk, reset => reset_compteur, enable => enable_compteur, output => compte_div);

--comparateur
cmp_fin_div <= '1' when compte_div >= 69 else
					'0';

--machine à état du controle du cycle d'asservissement
process(clk, reset)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, data_pret, cmp_fin_div, termine_PID)
begin
	case etat_present is 
		when attente =>
			start_cycle_PID <= '0';
			reset_reg <= '0';
			enable_input <= '0';
			termine <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '0';
			if(data_pret = '1') then
				etat_suivant <= latch_input;
			else
				etat_suivant <= attente;
			end if;
			
		when latch_input =>	
			start_cycle_PID <= '0';
			reset_reg <= '1';
			enable_input <= '1';
			termine <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '0';
			etat_suivant <= attente_division;
			
		when attente_division =>
			start_cycle_PID <= '0';
			reset_reg <= '1';
			enable_input <= '0';
			termine <= '0';
			reset_compteur <= '1';
			enable_compteur <= '1';
			enable_div <= '1';
			reset_div <= '1';
			if(cmp_fin_div = '1') then
				etat_suivant <= demarrer_cycle_PID;
			else
				etat_suivant <= attente_division;
			end if;
			
		when demarrer_cycle_PID =>
			start_cycle_PID <= '1';
			reset_reg <= '1';
			enable_input <= '0';
			termine <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '1';
			etat_suivant <= attente_PID;
			
		when attente_PID =>
			start_cycle_PID <= '0';
			reset_reg <= '1';
			enable_input <= '0';
			termine <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '1';
			if(termine_PID = '1') then
				etat_suivant <= fin;
			else
				etat_suivant <= attente_PID;
			end if;
			
		when fin =>
			start_cycle_PID <= '0';
			reset_reg <= '0';
			enable_input <= '0';
			termine <= '1';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '0';
			etat_suivant <= attente;
			
		when others => 
			start_cycle_PID <= '0';
			reset_reg <= '0';
			enable_input <= '0';
			termine <= '0';
			reset_compteur <= '0';
			enable_compteur <= '0';
			enable_div <= '0';
			reset_div <= '0';
			etat_suivant <= attente;
	end case;
end process;

end Behavioral;


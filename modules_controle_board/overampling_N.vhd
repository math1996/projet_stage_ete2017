----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:34 07/25/2017 
-- Design Name: 
-- Module Name:    overampling_N - Behavioral 
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

--l'oversampling va varier de 1 (pas d'oversampling) à 16 données (oversampling max)
entity oversampling_N is
    Port ( clk, reset, enable_rdc : in  STD_LOGIC;
			  data_in : in std_logic_vector(15 downto 0);
			  choix_oversampling : in std_logic_vector(2 downto 0);
           data_rdy, occupe : out  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end oversampling_N;

architecture Behavioral of oversampling_N is

type etat_oversampling is (attente, latch_data, addition_etat, decalage, data_rdy_etat);
signal etat_present, etat_suivant : etat_oversampling;

signal nb_data_over, compte_nb_data : std_logic_vector(4 downto 0);
signal reset_compteur, reset_reg, enable_reg, enable_reg_res, cmp_nb_data, cmp_fin_add, reset_reg_add, enable_reg_add  : std_logic;
signal output_oversampling, data_oversampling_int : tableau_memoire(15 downto 0);
signal res_addition, reg_addition_out, addition : std_logic_vector(31 downto 0);
signal res_decalage : std_logic_vector(12 downto 0);
signal canal_int : std_logic_vector(2 downto 0);
signal compte_parcour : std_logic_vector(3 downto 0);

begin

--mux du choix d'oversampling 
nb_data_over <= "00001" when choix_oversampling = "000" else
					 "00010" when choix_oversampling = "001" else
					 "00100" when choix_oversampling = "010" else
					 "01000" when choix_oversampling = "011" else
					 "10000" when choix_oversampling = "100" else
					 "00001";

--mux du décalage des données 	
res_decalage <= reg_addition_out(12 downto 0) when choix_oversampling = "000" else
					 reg_addition_out(13 downto 1) when choix_oversampling = "001" else
					 reg_addition_out(14 downto 2) when choix_oversampling = "010" else
					 reg_addition_out(15 downto 3) when choix_oversampling = "011" else
					 reg_addition_out(16 downto 4) when choix_oversampling = "100" else
					 (others => '0');

				 
--comparateur
cmp_nb_data <= '1' when compte_nb_data >= nb_data_over else
					'0';
					
cmp_fin_add <= '1' when compte_parcour >= (nb_data_over - 1) else
					'0';
					
--compteur nombre data
compteur_nb_data : compteurNbits generic map(5) port map(clk => clk, reset => (reset_compteur and reset), enable => enable_rdc, output => compte_nb_data);	

--buffer d'entrée des données de l'ADC 12 bits
buffer_entree : memoire_tampon_16xM  generic map(16) port map(clk => clk, reset => reset, enable => enable_rdc, input => data_in, output => output_oversampling);

--registre des données à moyenner
reg_loop : for i in 0 to 15 generate
	registre : registreNbits generic map(16) port map(clk => clk, reset => reset_reg, en => enable_reg, d => (output_oversampling(i)(12) & output_oversampling(i)(12) &
																	output_oversampling(i)(12) & output_oversampling(i)(12 downto 0)), q_out => data_oversampling_int(i));
end generate reg_loop;

--registre du canal
registre_canal : registreNbits generic map(3) port map(clk => clk, reset => reset_reg, en => enable_reg, d => output_oversampling(0)(15 downto 13), 
																		 q_out => canal_int);

--additionneur des données et registre du résultat de l'addition
res_addition <= reg_addition_out + addition;

registre_res_addition : registreNbits generic map(32) port map(clk => clk, reset => reset_reg_add, en => enable_reg_add, d => res_addition,
																					q_out => reg_addition_out);

--mux du choix de la donnnée à additionner
addition <= (data_oversampling_int(0)(15 downto 12) & data_oversampling_int(0)(15 downto 12) & data_oversampling_int(0)(15 downto 12) & data_oversampling_int(0)(15 downto 12) & data_oversampling_int(0)) when compte_parcour = "0000" else
				(data_oversampling_int(1)(15 downto 12) & data_oversampling_int(1)(15 downto 12) & data_oversampling_int(1)(15 downto 12) & data_oversampling_int(1)(15 downto 12) & data_oversampling_int(1)) when compte_parcour = "0001" else
				(data_oversampling_int(2)(15 downto 12) & data_oversampling_int(2)(15 downto 12) & data_oversampling_int(2)(15 downto 12) & data_oversampling_int(2)(15 downto 12) & data_oversampling_int(2)) when compte_parcour = "0010" else
				(data_oversampling_int(3)(15 downto 12) & data_oversampling_int(3)(15 downto 12) & data_oversampling_int(3)(15 downto 12) & data_oversampling_int(3)(15 downto 12) & data_oversampling_int(3)) when compte_parcour = "0011" else
				(data_oversampling_int(4)(15 downto 12) & data_oversampling_int(4)(15 downto 12) & data_oversampling_int(4)(15 downto 12) & data_oversampling_int(4)(15 downto 12) & data_oversampling_int(4)) when compte_parcour = "0100" else
				(data_oversampling_int(5)(15 downto 12) & data_oversampling_int(5)(15 downto 12) & data_oversampling_int(5)(15 downto 12) & data_oversampling_int(5)(15 downto 12) & data_oversampling_int(5)) when compte_parcour = "0101" else
				(data_oversampling_int(6)(15 downto 12) & data_oversampling_int(6)(15 downto 12) & data_oversampling_int(6)(15 downto 12) & data_oversampling_int(6)(15 downto 12) & data_oversampling_int(6)) when compte_parcour = "0110" else
				(data_oversampling_int(7)(15 downto 12) & data_oversampling_int(7)(15 downto 12) & data_oversampling_int(7)(15 downto 12) & data_oversampling_int(7)(15 downto 12) & data_oversampling_int(7)) when compte_parcour = "0111" else
				(data_oversampling_int(8)(15 downto 12) & data_oversampling_int(8)(15 downto 12) & data_oversampling_int(8)(15 downto 12) & data_oversampling_int(8)(15 downto 12) & data_oversampling_int(8)) when compte_parcour = "1000" else
				(data_oversampling_int(9)(15 downto 12) & data_oversampling_int(9)(15 downto 12) & data_oversampling_int(9)(15 downto 12) & data_oversampling_int(9)(15 downto 12) & data_oversampling_int(9)) when compte_parcour = "1001" else
				(data_oversampling_int(10)(15 downto 12) & data_oversampling_int(10)(15 downto 12) & data_oversampling_int(10)(15 downto 12) & data_oversampling_int(10)(15 downto 12) & data_oversampling_int(10)) when compte_parcour = "1010" else
				(data_oversampling_int(11)(15 downto 12) & data_oversampling_int(11)(15 downto 12) & data_oversampling_int(11)(15 downto 12) & data_oversampling_int(11)(15 downto 12) & data_oversampling_int(11)) when compte_parcour = "1011" else
				(data_oversampling_int(12)(15 downto 12) & data_oversampling_int(12)(15 downto 12) & data_oversampling_int(12)(15 downto 12) & data_oversampling_int(12)(15 downto 12) & data_oversampling_int(12)) when compte_parcour = "1100" else
				(data_oversampling_int(13)(15 downto 12) & data_oversampling_int(13)(15 downto 12) & data_oversampling_int(13)(15 downto 12) & data_oversampling_int(13)(15 downto 12) & data_oversampling_int(13)) when compte_parcour = "1101" else
				(data_oversampling_int(14)(15 downto 12) & data_oversampling_int(14)(15 downto 12) & data_oversampling_int(14)(15 downto 12) & data_oversampling_int(14)(15 downto 12) & data_oversampling_int(14)) when compte_parcour = "1110" else
				(data_oversampling_int(15)(15 downto 12) & data_oversampling_int(15)(15 downto 12) & data_oversampling_int(15)(15 downto 12) & data_oversampling_int(15)(15 downto 12) & data_oversampling_int(15));

--compteur du parcour des données de l'oversampling
compteur_parcour : compteurNbits generic map(4) port map(clk => clk, reset => reset_reg_add, enable => enable_reg_add, output => compte_parcour);

--registre du résultat de l'oversampling
registre_res : registreNbits generic map(16) port map(clk => clk, reset => reset, en => enable_reg_res, d => (canal_int & res_decalage),
																		q_out => data_out);	
												
--machine à état du controle de l'oversampling
process(reset, clk)
begin
	if(reset = '0') then
		etat_present <= attente;
	elsif(clk'event and clk = '1') then
		etat_present <= etat_suivant;
	end if;
end process;

process(etat_present, cmp_nb_data, cmp_fin_add)
begin
	case etat_present is
		when attente =>
			reset_compteur <= '1';
			reset_reg <= '0';
			enable_reg <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			enable_reg_res <= '0';
			occupe <= '0';
			data_rdy <= '0';
			if(cmp_nb_data = '1') then
				etat_suivant <= latch_data;
			else
				etat_suivant <= attente;
			end if;
			
		when latch_data =>
			reset_compteur <= '0';
			reset_reg <= '1';
			enable_reg <= '1';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			enable_reg_res <= '0';
			occupe <= '1';
			data_rdy <= '0';
			etat_suivant <= addition_etat;
			
		when addition_etat =>
			reset_compteur <= '1';
			reset_reg <= '1';
			enable_reg <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '1';
			enable_reg_res <= '0';
			occupe <= '1';
			data_rdy <= '0';
			if(cmp_fin_add = '1') then
				etat_suivant <= decalage;
			else
				etat_suivant <= addition_etat;
			end if;
			
		when decalage =>
			reset_compteur <= '1';
			reset_reg <= '1';
			enable_reg <= '0';
			reset_reg_add <= '1';
			enable_reg_add <= '0';
			enable_reg_res <= '1';
			occupe <= '1';
			data_rdy <= '0';
			etat_suivant <= data_rdy_etat;
			
		when data_rdy_etat =>
			reset_compteur <= '1';
			reset_reg <= '0';
			enable_reg <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			enable_reg_res <= '0';
			occupe <= '1';
			data_rdy <= '1';
			etat_suivant <= attente;
			
		when others =>
			reset_compteur <= '0';
			reset_reg <= '0';
			enable_reg <= '0';
			reset_reg_add <= '0';
			enable_reg_add <= '0';
			enable_reg_res <= '0';
			occupe <= '0';
			data_rdy <= '0';
			etat_suivant <= attente;
	end case;		
end process;

end Behavioral;


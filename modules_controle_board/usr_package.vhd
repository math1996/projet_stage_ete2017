--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;


package usr_package is

type tableau_memoire is array(natural range <>) of std_logic_vector(15 downto 0);
type tableau_memoire_8bits is array(natural range <>) of std_logic_vector(7 downto 0);
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

component top_controle_adc_12bits is
    Port ( clk, reset, start, DOUT : in  STD_LOGIC;
           canal_conversion : in  STD_LOGIC_VECTOR (2 downto 0);
           sequence_conversion : in  STD_LOGIC_VECTOR (7 downto 0);
           mode_conversion : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_canaux_conversion : in  STD_LOGIC_VECTOR (3 downto 0);
           donne_conversion_pret, CS, SCLK, DIN, occupe, termine : out  STD_LOGIC;
           donne_conversion : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component top_controle_spi_adc_12bits is
    Port ( clk, start_seq, start_1CH, reset, DOUT, arret : in  STD_LOGIC;
           occupe, termine, data_rdy, CS, SCLK, DIN : out  STD_LOGIC;
           data_out_conversion : out  STD_LOGIC_VECTOR (15 downto 0);
           canal : in  STD_LOGIC_VECTOR (2 downto 0);
			  sequence : in std_logic_vector(7 downto 0));
end component;

component FSM_controle_mode_adc_12bits is
    Port ( clk, reset, start, termine_conversion_canal, fin_conversion : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           nb_cycle_conversion : in  STD_LOGIC_VECTOR (31 downto 0);
			  nb_canaux : in std_logic_vector(3 downto 0);
           start_1CH, start_seq, arret, occupe, termine, reset_input, enable_input : out  STD_LOGIC);
end component;

component generation_pulse is
    Port ( clk, reset, enable : in  STD_LOGIC;
           onde_tri, offset_tri : in  STD_LOGIC_VECTOR (15 downto 0);
			  choix_horloge : in std_logic_vector(3 downto 0);
           onde_tri_pulse : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component generation_onde_sin is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           pas : in  STD_LOGIC_VECTOR (7 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
			  nombre_cycle : in std_logic_vector(7 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
           demarrer_transfert, occupe, termine : out  STD_LOGIC);
end component;

component LUT_1024_sin is
    Port ( adresse : in  STD_LOGIC_VECTOR (9 downto 0);
           valeur : out  STD_LOGIC_VECTOR (15 downto 0));
end component;


component buffer_8xM is
generic(M : integer:= 8);
    Port ( clk, enable, reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  tableau_memoire_8bits(M-1 downto 0));
end component;

component generation_onde_triangle is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           temps_attente : in  STD_LOGIC_VECTOR (31 downto 0);
           pas_comptage : in  STD_LOGIC_VECTOR (15 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
			  nombre_cycle : in std_logic_vector(7 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  demarrer_transfert, occupe, termine : out std_logic);
end component;

component compteurNbits_mode is
generic(N: integer := 8);
    Port ( clk, reset, enable, mode : in  STD_LOGIC;
           compteur_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           pas : in  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component generation_onde_carre is
    Port ( clk, reset, start, termine_dac : in  STD_LOGIC;
           nombre_cycle : in  STD_LOGIC_VECTOR (7 downto 0);
           duty_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           nb_coup_horloge_par_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           amplitude : in  STD_LOGIC_VECTOR (15 downto 0);
           offset : in  STD_LOGIC_VECTOR (15 downto 0);
           onde_genere : out  STD_LOGIC_VECTOR (15 downto 0);
			  occupe, termine, demarrer_transfert : out std_logic);
end component;

component addition_offset is
    Port ( amplitude, offset : in  STD_LOGIC_VECTOR (15 downto 0);
           resultat : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component FSM_conversion_seq_choix_canaux_adc12bits is
    Port ( clk, start, reset, arret_conversion, termine_rdc_config, termine_rdc_recup : in  STD_LOGIC;
           choix_canaux : in  STD_LOGIC_VECTOR (7 downto 0);
           termine, demarrer_transfert, demarrer_recup : out  STD_LOGIC;
           load : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component FSM_convertir_1canal_adc12bits is
    Port ( clk, reset, start, arret_conversion, termine_RDC_config, termine_RDC_recup : in  STD_LOGIC;
				canal_conversion : in std_logic_vector(2 downto 0);
           termine, demarrer_transfert, demarrer_recup : out  STD_LOGIC;
           load : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component controle_serie_dac_16bits is
    Port ( clk, reset, start : in  STD_LOGIC;
           load : in  STD_LOGIC_VECTOR (15 downto 0);
           FSYNC, SCLK, DIN, OSR1, OSR2, BPB, MUTEB, RSTB, occupe, termine : out  STD_LOGIC);
end component;

component configuration_serie_dac_16bits is
    Port ( clk, reset, start  : in  STD_LOGIC;
				load : in std_logic_vector(15 downto 0);
           FSYNC, DIN, occupe, termine : out  STD_LOGIC);
end component;

component FSM_envoyer_Noctets is
generic(N: integer:=1);
    Port ( clk, reset, start : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR ((8*N)-1 downto 0);
           tx, occupe, termine : out  STD_LOGIC);
end component;

component controle_spi_adc_10bits is
    Port ( start, clk, reset, DOUT, SSTRB : in  STD_LOGIC;
           DIN, SCLK, CS, occupe, termine, SHDN : out  STD_LOGIC;
			  --output temporaire
			  canal : in  std_logic_vector(2 downto 0);
			  donnes : out std_logic_vector(15 downto 0));
end component;


component FSM_serial_tx is
    Port ( clk, start, reset, block_tx : in  STD_LOGIC;
				data : in std_logic_vector(7 downto 0);
				tx, occupe, termine: out  STD_LOGIC);
end component;

component controle_spi_adc_12bits is
    Port ( clk, start, reset, DOUT : in  STD_LOGIC;
           DIN, SCLK, CS, occupe, termine : out  STD_LOGIC;
			canal : in std_logic_vector(2 downto 0);
			  --output temporaire
			  donnees : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component FSM_configurer_adc_12bits is
    Port ( clk, start, reset : in  STD_LOGIC;
				canal : in std_logic_vector(2 downto 0);
           occupe, termine, CS, SCLK, DIN : out  STD_LOGIC);
end component;

component FSM_recuperer_donnee_adc_12bits is
    Port ( clk, start, reset, DOUT : in  STD_LOGIC;
           SCLK, CS, occupe, termine  : out  STD_LOGIC;
			  data_out : out std_logic_vector(15 downto 0));
end component;

component memoire_tampon_NxM is
generic(N : integer:=8 ; M : integer:= 8);
    Port ( clk, enable, reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (N-1 downto 0);
           output : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component recuperation_donnee_spi_adc_10bits is
    Port ( clk,start,reset, SSTRB, DOUT : in  STD_LOGIC;
           CS, SCLK, occupe, termine : out  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component configuration_spi_adc_10bits is
    Port ( clk,start,reset : in  STD_LOGIC;
				load : in std_logic_vector(7 downto 0);
				termine, occupe, DIN, SCLK, CS : out std_logic);
end component;

component rdc_Nbits is
generic(N : integer :=8);
    Port ( input, clk, reset, enable : in  STD_LOGIC;
           data_output_parallele : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;
			  
component registreNbits is 
	generic(N: integer := 8);
    Port ( clk,reset,en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
           q_out : out  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
end component;

component compteurNbits is
generic(N: integer := 4);
    Port ( clk,enable,reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(N-1 downto 0));
end component;

component diviseur_clk is
generic(N : integer :=0);
	Port ( clk : in  STD_LOGIC;
           reset,enable : in  STD_LOGIC;
           clk_out_reg : out  STD_LOGIC);
end component;

component rdc_load_nbits is
generic(N: integer := 8);
    Port ( load : in  STD_LOGIC_VECTOR(N-1 downto 0);
           enable,reset,clk, input : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component registre1bit is
	Port ( clk,d,en,reset : in  STD_LOGIC;
           q_out : out  STD_LOGIC);
end component;

component mux_2_1 is
 Port ( choix : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
end component;

component controle_spi_potentiostat is
Port(clk, reset, start : in std_logic;
			load_in : in std_logic_vector;
			CLK_OUT, CS, SDI : out std_logic;
			occupe, termine : out std_logic);
end component;

component configuration_spi_adc_12bits is
    Port ( clk, reset, start : in  STD_LOGIC;
			  load : in std_logic_vector(15 downto 0);
           DIN, SCLK, CS, occupe, termine: out  STD_LOGIC);
end component;

end usr_package;

package body usr_package is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end usr_package;

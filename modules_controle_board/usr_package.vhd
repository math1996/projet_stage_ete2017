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

component FSM_serial_tx is
    Port ( clk, start, reset : in  STD_LOGIC;
				data : in std_logic_vector(7 downto 0);
				tx, occupe, termine: out  STD_LOGIC);
end component;

component controle_spi_adc_12bits is
    Port ( clk, start, reset, DOUT : in  STD_LOGIC;
           DIN, SCLK, CS, occupe, termine : out  STD_LOGIC;
			  --output temporaire
			  donnees : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component FSM_configurer_adc_12bits is
    Port ( clk, start, reset : in  STD_LOGIC;
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

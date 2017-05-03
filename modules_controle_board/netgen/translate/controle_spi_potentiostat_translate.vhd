--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: controle_spi_potentiostat_translate.vhd
-- /___/   /\     Timestamp: Wed May 03 09:28:13 2017
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm controle_spi_potentiostat -w -dir netgen/translate -ofmt vhdl -sim controle_spi_potentiostat.ngd controle_spi_potentiostat_translate.vhd 
-- Device	: 6slx9tqg144-2
-- Input file	: controle_spi_potentiostat.ngd
-- Output file	: C:\Users\Mathieu\Desktop\projet_stage_ete2017\modules_controle_board\netgen\translate\controle_spi_potentiostat_translate.vhd
-- # of Entities	: 1
-- Design Name	: controle_spi_potentiostat
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity controle_spi_potentiostat is
  port (
    clk : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    start : in STD_LOGIC := 'X'; 
    CLK_OUT : out STD_LOGIC; 
    CS : out STD_LOGIC; 
    SDI : out STD_LOGIC; 
    output_LED : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end controle_spi_potentiostat;

architecture Structure of controle_spi_potentiostat is
  signal clk_BUFGP : STD_LOGIC; 
  signal reset_IBUF_4 : STD_LOGIC; 
  signal etat_present_FSM_FFd1_6 : STD_LOGIC; 
  signal etat_present_FSM_FFd2_7 : STD_LOGIC; 
  signal enable_rdc : STD_LOGIC; 
  signal etat_present_FSM_FFd3_9 : STD_LOGIC; 
  signal rdc_reg_loop_6_reg_q_out_10 : STD_LOGIC; 
  signal rdc_reg_loop_5_reg_q_out_11 : STD_LOGIC; 
  signal rdc_reg_loop_4_reg_q_out_12 : STD_LOGIC; 
  signal rdc_reg_loop_3_reg_q_out_13 : STD_LOGIC; 
  signal rdc_reg_loop_2_reg_q_out_14 : STD_LOGIC; 
  signal rdc_reg_loop_1_reg_q_out_15 : STD_LOGIC; 
  signal rdc_reg0_q_out_16 : STD_LOGIC; 
  signal rdc_reg_fin_q_out_17 : STD_LOGIC; 
  signal CLK_OUT_OBUF_18 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal enable_compteur_inv : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal etat_present_FSM_FFd3_In : STD_LOGIC; 
  signal etat_present_FSM_FFd1_In : STD_LOGIC; 
  signal reset_inv : STD_LOGIC; 
  signal diviseur_horlode_Mcount_clk_int_cy_1_rt_61 : STD_LOGIC; 
  signal diviseur_horlode_Mcount_clk_int_xor_2_rt_62 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_2 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal diviseur_horlode_clk_int : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal diviseur_horlode_Mcount_clk_int_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal diviseur_horlode_Mcount_clk_int_cy : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal compteur4bit_compteur : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal rdc_sortie_mux : STD_LOGIC_VECTOR ( 7 downto 1 ); 
begin
  XST_VCC : X_ONE
    port map (
      O => N0
    );
  XST_GND : X_ZERO
    port map (
      O => N1
    );
  diviseur_horlode_clk_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      I => Result(0),
      O => diviseur_horlode_clk_int(0),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  diviseur_horlode_clk_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      I => Result(1),
      O => diviseur_horlode_clk_int(1),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  diviseur_horlode_clk_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      I => Result(2),
      O => diviseur_horlode_clk_int(2),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  etat_present_FSM_FFd3 : X_FF
    generic map(
      INIT => '1'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      I => etat_present_FSM_FFd3_In,
      SET => reset_inv,
      O => etat_present_FSM_FFd3_9,
      CE => VCC,
      RST => GND
    );
  etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      RST => reset_inv,
      I => etat_present_FSM_FFd1_In,
      O => etat_present_FSM_FFd1_6,
      CE => VCC,
      SET => GND
    );
  compteur4bit_compteur_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => etat_present_FSM_FFd1_6,
      RST => enable_compteur_inv,
      I => Result_0_1,
      O => compteur4bit_compteur(0),
      SET => GND
    );
  compteur4bit_compteur_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => etat_present_FSM_FFd1_6,
      RST => enable_compteur_inv,
      I => Result_1_1,
      O => compteur4bit_compteur(1),
      SET => GND
    );
  compteur4bit_compteur_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => etat_present_FSM_FFd1_6,
      RST => enable_compteur_inv,
      I => Result_2_1,
      O => compteur4bit_compteur(2),
      SET => GND
    );
  compteur4bit_compteur_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => etat_present_FSM_FFd1_6,
      RST => enable_compteur_inv,
      I => Result_3_1,
      O => compteur4bit_compteur(3),
      SET => GND
    );
  etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      RST => reset_inv,
      I => etat_present_FSM_FFd3_9,
      O => etat_present_FSM_FFd2_7,
      CE => VCC,
      SET => GND
    );
  diviseur_horlode_Mcount_clk_int_cy_0_Q : X_MUX2
    port map (
      IB => N1,
      IA => N0,
      SEL => diviseur_horlode_Mcount_clk_int_lut(0),
      O => diviseur_horlode_Mcount_clk_int_cy(0)
    );
  diviseur_horlode_Mcount_clk_int_xor_0_Q : X_XOR2
    port map (
      I0 => N1,
      I1 => diviseur_horlode_Mcount_clk_int_lut(0),
      O => Result(0)
    );
  diviseur_horlode_Mcount_clk_int_cy_1_Q : X_MUX2
    port map (
      IB => diviseur_horlode_Mcount_clk_int_cy(0),
      IA => N1,
      SEL => diviseur_horlode_Mcount_clk_int_cy_1_rt_61,
      O => diviseur_horlode_Mcount_clk_int_cy(1)
    );
  diviseur_horlode_Mcount_clk_int_xor_1_Q : X_XOR2
    port map (
      I0 => diviseur_horlode_Mcount_clk_int_cy(0),
      I1 => diviseur_horlode_Mcount_clk_int_cy_1_rt_61,
      O => Result(1)
    );
  diviseur_horlode_Mcount_clk_int_xor_2_Q : X_XOR2
    port map (
      I0 => diviseur_horlode_Mcount_clk_int_cy(1),
      I1 => diviseur_horlode_Mcount_clk_int_xor_2_rt_62,
      O => Result(2)
    );
  rdc_reg0_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => etat_present_FSM_FFd2_7,
      O => rdc_reg0_q_out_16,
      SET => GND
    );
  rdc_reg_loop_1_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(1),
      O => rdc_reg_loop_1_reg_q_out_15,
      SET => GND
    );
  rdc_reg_loop_2_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(2),
      O => rdc_reg_loop_2_reg_q_out_14,
      SET => GND
    );
  rdc_reg_loop_3_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(3),
      O => rdc_reg_loop_3_reg_q_out_13,
      SET => GND
    );
  rdc_reg_loop_4_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(4),
      O => rdc_reg_loop_4_reg_q_out_12,
      SET => GND
    );
  rdc_reg_loop_5_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(5),
      O => rdc_reg_loop_5_reg_q_out_11,
      SET => GND
    );
  rdc_reg_loop_6_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(6),
      O => rdc_reg_loop_6_reg_q_out_10,
      SET => GND
    );
  rdc_reg_fin_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => diviseur_horlode_clk_int(2),
      CE => enable_rdc,
      RST => etat_present_FSM_FFd3_9,
      I => rdc_sortie_mux(7),
      O => rdc_reg_fin_q_out_17,
      SET => GND
    );
  etat_present_CLK_OUT1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => etat_present_FSM_FFd1_6,
      ADR1 => diviseur_horlode_clk_int(2),
      O => CLK_OUT_OBUF_18
    );
  etat_present_FSM_FFd3_In1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => compteur4bit_compteur(3),
      ADR1 => etat_present_FSM_FFd1_6,
      O => etat_present_FSM_FFd3_In
    );
  etat_present_FSM_FFd1_In1 : X_LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => compteur4bit_compteur(3),
      ADR2 => etat_present_FSM_FFd1_6,
      O => etat_present_FSM_FFd1_In
    );
  compteur4bit_Mcount_compteur_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => compteur4bit_compteur(1),
      ADR1 => compteur4bit_compteur(0),
      O => Result_1_1
    );
  compteur4bit_Mcount_compteur_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      ADR0 => compteur4bit_compteur(3),
      ADR1 => compteur4bit_compteur(0),
      ADR2 => compteur4bit_compteur(1),
      ADR3 => compteur4bit_compteur(2),
      O => Result_3_1
    );
  compteur4bit_Mcount_compteur_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => compteur4bit_compteur(2),
      ADR1 => compteur4bit_compteur(0),
      ADR2 => compteur4bit_compteur(1),
      O => Result_2_1
    );
  rdc_mux_loop_1_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg0_q_out_16,
      O => rdc_sortie_mux(1)
    );
  rdc_mux_loop_2_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_1_reg_q_out_15,
      O => rdc_sortie_mux(2)
    );
  rdc_mux_loop_3_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_2_reg_q_out_14,
      O => rdc_sortie_mux(3)
    );
  rdc_mux_loop_4_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_3_reg_q_out_13,
      O => rdc_sortie_mux(4)
    );
  rdc_mux_loop_5_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_4_reg_q_out_12,
      O => rdc_sortie_mux(5)
    );
  rdc_mux_loop_6_mux_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_5_reg_q_out_11,
      O => rdc_sortie_mux(6)
    );
  rdc_mux_fin_Mmux_output11 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => etat_present_FSM_FFd2_7,
      ADR1 => rdc_reg_loop_6_reg_q_out_10,
      O => rdc_sortie_mux(7)
    );
  reset_IBUF : X_BUF
    port map (
      I => reset,
      O => reset_IBUF_4
    );
  diviseur_horlode_Mcount_clk_int_cy_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => diviseur_horlode_clk_int(1),
      O => diviseur_horlode_Mcount_clk_int_cy_1_rt_61,
      ADR1 => GND
    );
  diviseur_horlode_Mcount_clk_int_xor_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => diviseur_horlode_clk_int(2),
      O => diviseur_horlode_Mcount_clk_int_xor_2_rt_62,
      ADR1 => GND
    );
  diviseur_horlode_Mcount_clk_int_lut_0_INV_0 : X_INV
    port map (
      I => diviseur_horlode_clk_int(0),
      O => diviseur_horlode_Mcount_clk_int_lut(0)
    );
  enable_compteur_inv1_INV_0 : X_INV
    port map (
      I => etat_present_FSM_FFd1_6,
      O => enable_compteur_inv
    );
  etat_present_n0021_0_1_INV_0 : X_INV
    port map (
      I => etat_present_FSM_FFd3_9,
      O => enable_rdc
    );
  reset_inv1_INV_0 : X_INV
    port map (
      I => reset_IBUF_4,
      O => reset_inv
    );
  compteur4bit_Mcount_compteur_xor_0_11_INV_0 : X_INV
    port map (
      I => compteur4bit_compteur(0),
      O => Result_0_1
    );
  clk_BUFGP_BUFG : X_CKBUF
    port map (
      I => clk_BUFGP_IBUFG_2,
      O => clk_BUFGP
    );
  clk_BUFGP_IBUFG : X_CKBUF
    port map (
      I => clk,
      O => clk_BUFGP_IBUFG_2
    );
  output_LED_7_OBUF : X_OBUF
    port map (
      I => rdc_reg_fin_q_out_17,
      O => output_LED(7)
    );
  output_LED_6_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_6_reg_q_out_10,
      O => output_LED(6)
    );
  output_LED_5_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_5_reg_q_out_11,
      O => output_LED(5)
    );
  output_LED_4_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_4_reg_q_out_12,
      O => output_LED(4)
    );
  output_LED_3_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_3_reg_q_out_13,
      O => output_LED(3)
    );
  output_LED_2_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_2_reg_q_out_14,
      O => output_LED(2)
    );
  output_LED_1_OBUF : X_OBUF
    port map (
      I => rdc_reg_loop_1_reg_q_out_15,
      O => output_LED(1)
    );
  output_LED_0_OBUF : X_OBUF
    port map (
      I => rdc_reg0_q_out_16,
      O => output_LED(0)
    );
  CLK_OUT_OBUF : X_OBUF
    port map (
      I => CLK_OUT_OBUF_18,
      O => CLK_OUT
    );
  CS_OBUF : X_OBUF
    port map (
      I => etat_present_FSM_FFd3_9,
      O => CS
    );
  SDI_OBUF : X_OBUF
    port map (
      I => rdc_reg_fin_q_out_17,
      O => SDI
    );
  NlwBlock_controle_spi_potentiostat_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_controle_spi_potentiostat_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;


--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: top_controle_adc_12bits_translate.vhd
-- /___/   /\     Timestamp: Tue Jul 11 14:25:48 2017
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm top_controle_adc_12bits -w -dir netgen/translate -ofmt vhdl -sim top_controle_adc_12bits.ngd top_controle_adc_12bits_translate.vhd 
-- Device	: 6slx9tqg144-2
-- Input file	: top_controle_adc_12bits.ngd
-- Output file	: C:\Users\Mathieu\Desktop\projet_stage_ete2017\modules_controle_board\netgen\translate\top_controle_adc_12bits_translate.vhd
-- # of Entities	: 1
-- Design Name	: top_controle_adc_12bits
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

entity top_controle_adc_12bits is
  port (
    clk : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    start : in STD_LOGIC := 'X'; 
    DOUT : in STD_LOGIC := 'X'; 
    donne_conversion_pret : out STD_LOGIC; 
    CS : out STD_LOGIC; 
    SCLK : out STD_LOGIC; 
    DIN : out STD_LOGIC; 
    occupe : out STD_LOGIC; 
    termine : out STD_LOGIC; 
    canal_conversion : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    sequence_conversion : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    mode_conversion : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    nb_cycle_conversion : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    donne_conversion : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end top_controle_adc_12bits;

architecture Structure of top_controle_adc_12bits is
  signal canal_conversion_2_IBUF_0 : STD_LOGIC; 
  signal canal_conversion_1_IBUF_1 : STD_LOGIC; 
  signal canal_conversion_0_IBUF_2 : STD_LOGIC; 
  signal sequence_conversion_7_IBUF_3 : STD_LOGIC; 
  signal sequence_conversion_6_IBUF_4 : STD_LOGIC; 
  signal sequence_conversion_5_IBUF_5 : STD_LOGIC; 
  signal sequence_conversion_4_IBUF_6 : STD_LOGIC; 
  signal sequence_conversion_3_IBUF_7 : STD_LOGIC; 
  signal sequence_conversion_2_IBUF_8 : STD_LOGIC; 
  signal sequence_conversion_1_IBUF_9 : STD_LOGIC; 
  signal sequence_conversion_0_IBUF_10 : STD_LOGIC; 
  signal mode_conversion_1_IBUF_11 : STD_LOGIC; 
  signal mode_conversion_0_IBUF_12 : STD_LOGIC; 
  signal nb_cycle_conversion_31_IBUF_13 : STD_LOGIC; 
  signal nb_cycle_conversion_30_IBUF_14 : STD_LOGIC; 
  signal nb_cycle_conversion_29_IBUF_15 : STD_LOGIC; 
  signal nb_cycle_conversion_28_IBUF_16 : STD_LOGIC; 
  signal nb_cycle_conversion_27_IBUF_17 : STD_LOGIC; 
  signal nb_cycle_conversion_26_IBUF_18 : STD_LOGIC; 
  signal nb_cycle_conversion_25_IBUF_19 : STD_LOGIC; 
  signal nb_cycle_conversion_24_IBUF_20 : STD_LOGIC; 
  signal nb_cycle_conversion_23_IBUF_21 : STD_LOGIC; 
  signal nb_cycle_conversion_22_IBUF_22 : STD_LOGIC; 
  signal nb_cycle_conversion_21_IBUF_23 : STD_LOGIC; 
  signal nb_cycle_conversion_20_IBUF_24 : STD_LOGIC; 
  signal nb_cycle_conversion_19_IBUF_25 : STD_LOGIC; 
  signal nb_cycle_conversion_18_IBUF_26 : STD_LOGIC; 
  signal nb_cycle_conversion_17_IBUF_27 : STD_LOGIC; 
  signal nb_cycle_conversion_16_IBUF_28 : STD_LOGIC; 
  signal nb_cycle_conversion_15_IBUF_29 : STD_LOGIC; 
  signal nb_cycle_conversion_14_IBUF_30 : STD_LOGIC; 
  signal nb_cycle_conversion_13_IBUF_31 : STD_LOGIC; 
  signal nb_cycle_conversion_12_IBUF_32 : STD_LOGIC; 
  signal nb_cycle_conversion_11_IBUF_33 : STD_LOGIC; 
  signal nb_cycle_conversion_10_IBUF_34 : STD_LOGIC; 
  signal nb_cycle_conversion_9_IBUF_35 : STD_LOGIC; 
  signal nb_cycle_conversion_8_IBUF_36 : STD_LOGIC; 
  signal nb_cycle_conversion_7_IBUF_37 : STD_LOGIC; 
  signal nb_cycle_conversion_6_IBUF_38 : STD_LOGIC; 
  signal nb_cycle_conversion_5_IBUF_39 : STD_LOGIC; 
  signal nb_cycle_conversion_4_IBUF_40 : STD_LOGIC; 
  signal nb_cycle_conversion_3_IBUF_41 : STD_LOGIC; 
  signal nb_cycle_conversion_2_IBUF_42 : STD_LOGIC; 
  signal nb_cycle_conversion_1_IBUF_43 : STD_LOGIC; 
  signal nb_cycle_conversion_0_IBUF_44 : STD_LOGIC; 
  signal clk_IBUF_BUFG_45 : STD_LOGIC; 
  signal reset_IBUF_46 : STD_LOGIC; 
  signal start_IBUF_47 : STD_LOGIC; 
  signal DOUT_IBUF_48 : STD_LOGIC; 
  signal termine_conversion : STD_LOGIC; 
  signal donne_conversion_pret_OBUF_111 : STD_LOGIC; 
  signal CS_OBUF_112 : STD_LOGIC; 
  signal SCLK_OBUF_113 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_fin_q_out_114 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd5_115 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd4_116 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd1_117 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd6_118 : STD_LOGIC; 
  signal occupe_OBUF_119 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal registre_canal_conv_reset_inv : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd7_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd6_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd5_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd4_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd2_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd1_In : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd7_128 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd3_129 : STD_LOGIC; 
  signal FSM_ctrl_mode_etat_present_FSM_FFd2_130 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load23 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load21 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi15_205 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi14_208 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi13_211 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi12_214 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi11_217 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi10_220 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi9_223 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi8_226 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi7_229 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi6_232 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi5_235 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi4_238 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi3_241 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi2_244 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi1_247 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi_250 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi15_253 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi14_256 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi13_259 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi12_262 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi11_265 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi10_268 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi9_271 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi8_274 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi7_277 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi6_280 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi5_283 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi4_286 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi3_289 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi2_292 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi1_295 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi_298 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_31_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_30_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_29_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_28_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_27_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_26_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_25_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_24_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_23_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_22_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_21_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_20_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_19_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_18_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_17_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_16_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_15_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_14_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_13_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_12_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_11_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_10_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_9_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_8_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_7_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_6_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_5_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_4_3 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_3_3 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_2_3 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_1_3 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_0_3 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_335 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_In_339 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In_340 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_4_2 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_3_2 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_2_2 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_1_2 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_0_2 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_4_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_3_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_2_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_1_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_Result_0_1 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_q_out_471 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_1_reg_q_out_472 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_2_reg_q_out_473 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_3_reg_q_out_474 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_4_reg_q_out_475 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_5_reg_q_out_476 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_6_reg_q_out_477 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_7_reg_q_out_478 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_8_reg_q_out_479 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_9_reg_q_out_480 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_10_reg_q_out_481 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_11_reg_q_out_482 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_12_reg_q_out_483 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_13_reg_q_out_484 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_14_reg_q_out_485 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_15_reg_q_out_486 : STD_LOGIC; 
  signal ctrl_adc_12bits_start_recup2 : STD_LOGIC; 
  signal ctrl_adc_12bits_start_recup1 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_15_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_14_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_13_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_12_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_11_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_10_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_9_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_8_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_7_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_6_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_5_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_4_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_3_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_2_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_14_reg_q_out_507 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_13_reg_q_out_508 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_12_reg_q_out_509 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_11_reg_q_out_510 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_10_reg_q_out_511 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_9_reg_q_out_512 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_8_reg_q_out_513 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_7_reg_q_out_514 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_6_reg_q_out_515 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_5_reg_q_out_516 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_4_reg_q_out_517 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_3_reg_q_out_518 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_2_reg_q_out_519 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv : STD_LOGIC; 
  signal ctrl_adc_12bits_registre_sortie_reset_inv : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In3_523 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_603 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_604 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_605 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_606 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_607 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_608 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_609 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_610 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_611 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_612 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_613 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_614 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_615 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_616 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_617 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_618 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_619 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_620 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_621 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_622 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_623 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_624 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_625 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_626 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_627 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_628 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_629 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_630 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_631 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_632 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_633 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_634 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_635 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_636 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_637 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_638 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_639 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_640 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_641 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_642 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_643 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_644 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_645 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_646 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_647 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_648 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_649 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_650 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_651 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_652 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_653 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_654 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_655 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_656 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_657 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_658 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_659 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_660 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_661 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_662 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_663 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_664 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut_665 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_15_l1 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut1_667 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut_668 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_15_l1 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut1_670 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_0_dpot_671 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_1_dpot_672 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_2_dpot_673 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_3_dpot_674 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_4_dpot_675 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_5_dpot_676 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_6_dpot_677 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_7_dpot_678 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_8_dpot_679 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_9_dpot_680 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_10_dpot_681 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_11_dpot_682 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_12_dpot_683 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_13_dpot_684 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_14_dpot_685 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_15_dpot_686 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_16_dpot_687 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_17_dpot_688 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_18_dpot_689 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_19_dpot_690 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_20_dpot_691 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_21_dpot_692 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_22_dpot_693 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_23_dpot_694 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_24_dpot_695 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_25_dpot_696 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_26_dpot_697 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_27_dpot_698 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_28_dpot_699 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_29_dpot_700 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_30_dpot_701 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_31_dpot_702 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_1_703 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_1_704 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_1_705 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708 : STD_LOGIC; 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709 : STD_LOGIC; 
  signal clk_IBUF_710 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal registre_canal_conv_q_out : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal registre_sequence_conv_q_out : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal registre_mode_q_out : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal registre_nb_cycle_conv_q_out : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal ctrl_adc_12bits_registre_sortie_q_out : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal ctrl_adc_12bits_Result : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal ctrl_adc_12bits_load_config2 : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal ctrl_adc_12bits_load_config1 : STD_LOGIC_VECTOR ( 5 downto 5 ); 
begin
  XST_GND : X_ZERO
    port map (
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q
    );
  XST_VCC : X_ONE
    port map (
      O => N1
    );
  registre_canal_conv_q_out_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => canal_conversion_2_IBUF_0,
      O => registre_canal_conv_q_out(2),
      SET => GND
    );
  registre_canal_conv_q_out_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => canal_conversion_1_IBUF_1,
      O => registre_canal_conv_q_out(1),
      SET => GND
    );
  registre_canal_conv_q_out_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => canal_conversion_0_IBUF_2,
      O => registre_canal_conv_q_out(0),
      SET => GND
    );
  registre_mode_q_out_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => mode_conversion_1_IBUF_11,
      O => registre_mode_q_out(1),
      SET => GND
    );
  registre_mode_q_out_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => mode_conversion_0_IBUF_12,
      O => registre_mode_q_out(0),
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd7 : X_FF
    generic map(
      INIT => '1'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      I => FSM_ctrl_mode_etat_present_FSM_FFd7_In,
      SET => ctrl_adc_12bits_registre_sortie_reset_inv,
      O => FSM_ctrl_mode_etat_present_FSM_FFd7_128,
      CE => VCC,
      RST => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd6_In,
      O => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      CE => VCC,
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd5_In,
      O => FSM_ctrl_mode_etat_present_FSM_FFd5_115,
      CE => VCC,
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd4_In,
      O => FSM_ctrl_mode_etat_present_FSM_FFd4_116,
      CE => VCC,
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd2_In,
      O => FSM_ctrl_mode_etat_present_FSM_FFd2_130,
      CE => VCC,
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd1_In,
      O => FSM_ctrl_mode_etat_present_FSM_FFd1_117,
      CE => VCC,
      SET => GND
    );
  FSM_ctrl_mode_etat_present_FSM_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      O => FSM_ctrl_mode_etat_present_FSM_FFd3_129,
      CE => VCC,
      SET => GND
    );
  registre_sequence_conv_q_out_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_7_IBUF_3,
      O => registre_sequence_conv_q_out(7),
      SET => GND
    );
  registre_sequence_conv_q_out_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_6_IBUF_4,
      O => registre_sequence_conv_q_out(6),
      SET => GND
    );
  registre_sequence_conv_q_out_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_5_IBUF_5,
      O => registre_sequence_conv_q_out(5),
      SET => GND
    );
  registre_sequence_conv_q_out_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_4_IBUF_6,
      O => registre_sequence_conv_q_out(4),
      SET => GND
    );
  registre_sequence_conv_q_out_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_3_IBUF_7,
      O => registre_sequence_conv_q_out(3),
      SET => GND
    );
  registre_sequence_conv_q_out_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_2_IBUF_8,
      O => registre_sequence_conv_q_out(2),
      SET => GND
    );
  registre_sequence_conv_q_out_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_1_IBUF_9,
      O => registre_sequence_conv_q_out(1),
      SET => GND
    );
  registre_sequence_conv_q_out_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => sequence_conversion_0_IBUF_10,
      O => registre_sequence_conv_q_out(0),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_31 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_31_IBUF_13,
      O => registre_nb_cycle_conv_q_out(31),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_30 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_30_IBUF_14,
      O => registre_nb_cycle_conv_q_out(30),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_29 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_29_IBUF_15,
      O => registre_nb_cycle_conv_q_out(29),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_28 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_28_IBUF_16,
      O => registre_nb_cycle_conv_q_out(28),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_27 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_27_IBUF_17,
      O => registre_nb_cycle_conv_q_out(27),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_26 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_26_IBUF_18,
      O => registre_nb_cycle_conv_q_out(26),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_25 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_25_IBUF_19,
      O => registre_nb_cycle_conv_q_out(25),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_24 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_24_IBUF_20,
      O => registre_nb_cycle_conv_q_out(24),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_23 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_23_IBUF_21,
      O => registre_nb_cycle_conv_q_out(23),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_22 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_22_IBUF_22,
      O => registre_nb_cycle_conv_q_out(22),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_21 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_21_IBUF_23,
      O => registre_nb_cycle_conv_q_out(21),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_20 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_20_IBUF_24,
      O => registre_nb_cycle_conv_q_out(20),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_19 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_19_IBUF_25,
      O => registre_nb_cycle_conv_q_out(19),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_18 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_18_IBUF_26,
      O => registre_nb_cycle_conv_q_out(18),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_17 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_17_IBUF_27,
      O => registre_nb_cycle_conv_q_out(17),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_16 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_16_IBUF_28,
      O => registre_nb_cycle_conv_q_out(16),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_15_IBUF_29,
      O => registre_nb_cycle_conv_q_out(15),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_14 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_14_IBUF_30,
      O => registre_nb_cycle_conv_q_out(14),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_13_IBUF_31,
      O => registre_nb_cycle_conv_q_out(13),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_12_IBUF_32,
      O => registre_nb_cycle_conv_q_out(12),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_11_IBUF_33,
      O => registre_nb_cycle_conv_q_out(11),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_10_IBUF_34,
      O => registre_nb_cycle_conv_q_out(10),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_9_IBUF_35,
      O => registre_nb_cycle_conv_q_out(9),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_8_IBUF_36,
      O => registre_nb_cycle_conv_q_out(8),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_7_IBUF_37,
      O => registre_nb_cycle_conv_q_out(7),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_6_IBUF_38,
      O => registre_nb_cycle_conv_q_out(6),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_5_IBUF_39,
      O => registre_nb_cycle_conv_q_out(5),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_4_IBUF_40,
      O => registre_nb_cycle_conv_q_out(4),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_3_IBUF_41,
      O => registre_nb_cycle_conv_q_out(3),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_2_IBUF_42,
      O => registre_nb_cycle_conv_q_out(2),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_1_IBUF_43,
      O => registre_nb_cycle_conv_q_out(1),
      SET => GND
    );
  registre_nb_cycle_conv_q_out_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => FSM_ctrl_mode_etat_present_FSM_FFd6_118,
      RST => registre_canal_conv_reset_inv,
      I => nb_cycle_conversion_0_IBUF_44,
      O => registre_nb_cycle_conv_q_out(0),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(30),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_663,
      O => ctrl_adc_12bits_Result_31_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_30_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(29),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_603,
      O => ctrl_adc_12bits_Result_30_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(29),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_603,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(30)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_29_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(28),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_604,
      O => ctrl_adc_12bits_Result_29_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(28),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_604,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(29)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_28_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(27),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_605,
      O => ctrl_adc_12bits_Result_28_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(27),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_605,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(28)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_27_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(26),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_606,
      O => ctrl_adc_12bits_Result_27_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(26),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_606,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(27)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_26_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(25),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_607,
      O => ctrl_adc_12bits_Result_26_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(25),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_607,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(26)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_25_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(24),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_608,
      O => ctrl_adc_12bits_Result_25_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(24),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_608,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(25)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_24_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(23),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_609,
      O => ctrl_adc_12bits_Result_24_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(23),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_609,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(24)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_23_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(22),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_610,
      O => ctrl_adc_12bits_Result_23_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(22),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_610,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(23)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_22_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(21),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_611,
      O => ctrl_adc_12bits_Result_22_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(21),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_611,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(22)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_21_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(20),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_612,
      O => ctrl_adc_12bits_Result_21_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(20),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_612,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(21)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_20_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(19),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_613,
      O => ctrl_adc_12bits_Result_20_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(19),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_613,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(20)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_19_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(18),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_614,
      O => ctrl_adc_12bits_Result_19_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(18),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_614,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(19)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_18_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(17),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_615,
      O => ctrl_adc_12bits_Result_18_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(17),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_615,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(18)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_17_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(16),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_616,
      O => ctrl_adc_12bits_Result_17_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(16),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_616,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(17)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_16_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(15),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_617,
      O => ctrl_adc_12bits_Result_16_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(15),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_617,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(16)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_15_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(14),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_618,
      O => ctrl_adc_12bits_Result_15_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(14),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_618,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(15)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_14_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(13),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_619,
      O => ctrl_adc_12bits_Result_14_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(13),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_619,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(14)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_13_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(12),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_620,
      O => ctrl_adc_12bits_Result_13_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(12),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_620,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(13)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_12_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(11),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_621,
      O => ctrl_adc_12bits_Result_12_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(11),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_621,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(12)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_11_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(10),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_622,
      O => ctrl_adc_12bits_Result_11_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(10),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_622,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(11)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_10_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(9),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_623,
      O => ctrl_adc_12bits_Result_10_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(9),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_623,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(10)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_9_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(8),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_624,
      O => ctrl_adc_12bits_Result_9_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(8),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_624,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(9)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_8_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(7),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_625,
      O => ctrl_adc_12bits_Result_8_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(7),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_625,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(8)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_7_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(6),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_626,
      O => ctrl_adc_12bits_Result_7_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(6),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_626,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(7)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_6_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(5),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_627,
      O => ctrl_adc_12bits_Result_6_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(5),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_627,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(6)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_5_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(4),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_628,
      O => ctrl_adc_12bits_Result_5_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(4),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_628,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(5)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_4_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(3),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_629,
      O => ctrl_adc_12bits_Result_4_3
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(3),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_629,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(4)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_3_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(2),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_630,
      O => ctrl_adc_12bits_Result_3_3
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(2),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_630,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(3)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_2_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(1),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_631,
      O => ctrl_adc_12bits_Result_2_3
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(1),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_631,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(2)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_1_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(0),
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_632,
      O => ctrl_adc_12bits_Result_1_3
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(0),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_632,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(1)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_0_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      I1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_lut(0),
      O => ctrl_adc_12bits_Result_0_3
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_0_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      IA => N1,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_lut(0),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy(0)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(30),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_664,
      O => ctrl_adc_12bits_Result(31)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_30_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(29),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_633,
      O => ctrl_adc_12bits_Result(30)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(29),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_633,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(30)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_29_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(28),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_634,
      O => ctrl_adc_12bits_Result(29)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(28),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_634,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(29)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_28_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(27),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_635,
      O => ctrl_adc_12bits_Result(28)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(27),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_635,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(28)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_27_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(26),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_636,
      O => ctrl_adc_12bits_Result(27)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(26),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_636,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(27)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_26_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(25),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_637,
      O => ctrl_adc_12bits_Result(26)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(25),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_637,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(26)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_25_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(24),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_638,
      O => ctrl_adc_12bits_Result(25)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(24),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_638,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(25)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_24_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(23),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_639,
      O => ctrl_adc_12bits_Result(24)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(23),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_639,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(24)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_23_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(22),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_640,
      O => ctrl_adc_12bits_Result(23)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(22),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_640,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(23)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_22_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(21),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_641,
      O => ctrl_adc_12bits_Result(22)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(21),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_641,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(22)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_21_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(20),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_642,
      O => ctrl_adc_12bits_Result(21)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(20),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_642,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(21)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_20_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(19),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_643,
      O => ctrl_adc_12bits_Result(20)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(19),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_643,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(20)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_19_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(18),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_644,
      O => ctrl_adc_12bits_Result(19)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(18),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_644,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(19)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_18_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(17),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_645,
      O => ctrl_adc_12bits_Result(18)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(17),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_645,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(18)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_17_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(16),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_646,
      O => ctrl_adc_12bits_Result(17)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(16),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_646,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(17)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_16_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(15),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_647,
      O => ctrl_adc_12bits_Result(16)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(15),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_647,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(16)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_15_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(14),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_648,
      O => ctrl_adc_12bits_Result(15)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(14),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_648,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(15)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_14_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(13),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_649,
      O => ctrl_adc_12bits_Result(14)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(13),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_649,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(14)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_13_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(12),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_650,
      O => ctrl_adc_12bits_Result(13)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(12),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_650,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(13)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_12_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(11),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_651,
      O => ctrl_adc_12bits_Result(12)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(11),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_651,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(12)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_11_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(10),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_652,
      O => ctrl_adc_12bits_Result(11)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(10),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_652,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(11)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_10_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(9),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_653,
      O => ctrl_adc_12bits_Result(10)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(9),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_653,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(10)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_9_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(8),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_654,
      O => ctrl_adc_12bits_Result(9)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(8),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_654,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(9)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_8_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(7),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_655,
      O => ctrl_adc_12bits_Result(8)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(7),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_655,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(8)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_7_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(6),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_656,
      O => ctrl_adc_12bits_Result(7)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(6),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_656,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(7)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_6_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(5),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_657,
      O => ctrl_adc_12bits_Result(6)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(5),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_657,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(6)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_5_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(4),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_658,
      O => ctrl_adc_12bits_Result(5)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(4),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_658,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(5)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_4_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(3),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_659,
      O => ctrl_adc_12bits_Result(4)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(3),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_659,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(4)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_3_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(2),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_660,
      O => ctrl_adc_12bits_Result(3)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(2),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_660,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(3)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_2_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(1),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_661,
      O => ctrl_adc_12bits_Result(2)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(1),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_661,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(2)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_1_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(0),
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_662,
      O => ctrl_adc_12bits_Result(1)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(0),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_662,
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(1)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_0_Q : X_XOR2
    port map (
      I0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      I1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_lut(0),
      O => ctrl_adc_12bits_Result(0)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_0_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      IA => N1,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_lut(0),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy(0)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_15_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(14),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi15_205,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(15),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(15)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_15_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(30),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(30),
      ADR2 => registre_nb_cycle_conv_q_out(31),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(31),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(15)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi15 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(31),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(30),
      ADR2 => registre_nb_cycle_conv_q_out(30),
      ADR3 => registre_nb_cycle_conv_q_out(31),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi15_205
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_14_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(13),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi14_208,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(14),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(14)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_14_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(28),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(28),
      ADR2 => registre_nb_cycle_conv_q_out(29),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(29),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(14)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi14 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(29),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(28),
      ADR2 => registre_nb_cycle_conv_q_out(28),
      ADR3 => registre_nb_cycle_conv_q_out(29),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi14_208
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_13_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(12),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi13_211,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(13),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(13)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_13_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(26),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(26),
      ADR2 => registre_nb_cycle_conv_q_out(27),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(27),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(13)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi13 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(27),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(26),
      ADR2 => registre_nb_cycle_conv_q_out(26),
      ADR3 => registre_nb_cycle_conv_q_out(27),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi13_211
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_12_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(11),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi12_214,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(12),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(12)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_12_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(24),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(24),
      ADR2 => registre_nb_cycle_conv_q_out(25),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(25),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(12)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi12 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(25),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(24),
      ADR2 => registre_nb_cycle_conv_q_out(24),
      ADR3 => registre_nb_cycle_conv_q_out(25),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi12_214
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_11_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(10),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi11_217,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(11),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(11)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_11_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(22),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(22),
      ADR2 => registre_nb_cycle_conv_q_out(23),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(23),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(11)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi11 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(23),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(22),
      ADR2 => registre_nb_cycle_conv_q_out(22),
      ADR3 => registre_nb_cycle_conv_q_out(23),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi11_217
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_10_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(9),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi10_220,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(10),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(10)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_10_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(20),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(20),
      ADR2 => registre_nb_cycle_conv_q_out(21),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(21),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(10)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi10 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(21),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(20),
      ADR2 => registre_nb_cycle_conv_q_out(20),
      ADR3 => registre_nb_cycle_conv_q_out(21),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi10_220
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_9_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(8),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi9_223,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(9),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(9)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_9_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(18),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(18),
      ADR2 => registre_nb_cycle_conv_q_out(19),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(19),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(9)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi9 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(19),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(18),
      ADR2 => registre_nb_cycle_conv_q_out(18),
      ADR3 => registre_nb_cycle_conv_q_out(19),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi9_223
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_8_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(7),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi8_226,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(8),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(8)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_8_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(16),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(16),
      ADR2 => registre_nb_cycle_conv_q_out(17),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(17),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(8)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi8 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(17),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(16),
      ADR2 => registre_nb_cycle_conv_q_out(16),
      ADR3 => registre_nb_cycle_conv_q_out(17),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi8_226
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_7_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(6),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi7_229,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(7),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(7)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_7_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(14),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(14),
      ADR2 => registre_nb_cycle_conv_q_out(15),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(15),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(7)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi7 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(15),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(14),
      ADR2 => registre_nb_cycle_conv_q_out(14),
      ADR3 => registre_nb_cycle_conv_q_out(15),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi7_229
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_6_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(5),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi6_232,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(6),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(6)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_6_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(12),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(12),
      ADR2 => registre_nb_cycle_conv_q_out(13),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(13),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(6)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi6 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(13),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(12),
      ADR2 => registre_nb_cycle_conv_q_out(12),
      ADR3 => registre_nb_cycle_conv_q_out(13),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi6_232
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_5_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(4),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi5_235,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(5),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(5)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_5_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(10),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(10),
      ADR2 => registre_nb_cycle_conv_q_out(11),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(11),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(5)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi5 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(11),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(10),
      ADR2 => registre_nb_cycle_conv_q_out(10),
      ADR3 => registre_nb_cycle_conv_q_out(11),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi5_235
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_4_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(3),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi4_238,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(4),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(4)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_4_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(8),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(8),
      ADR2 => registre_nb_cycle_conv_q_out(9),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(9),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(4)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi4 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(9),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(8),
      ADR2 => registre_nb_cycle_conv_q_out(8),
      ADR3 => registre_nb_cycle_conv_q_out(9),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi4_238
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_3_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(2),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi3_241,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(3),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(3)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_3_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(6),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(6),
      ADR2 => registre_nb_cycle_conv_q_out(7),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(7),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(3)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi3 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(7),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(6),
      ADR2 => registre_nb_cycle_conv_q_out(6),
      ADR3 => registre_nb_cycle_conv_q_out(7),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi3_241
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_2_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(1),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi2_244,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(2),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(2)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_2_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(4),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(4),
      ADR2 => registre_nb_cycle_conv_q_out(5),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(5),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(2)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi2 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(5),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(4),
      ADR2 => registre_nb_cycle_conv_q_out(4),
      ADR3 => registre_nb_cycle_conv_q_out(5),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi2_244
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_1_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(0),
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi1_247,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(1),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(1)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_1_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(2),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(2),
      ADR2 => registre_nb_cycle_conv_q_out(3),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(3),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(1)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi1 : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(3),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(2),
      ADR2 => registre_nb_cycle_conv_q_out(2),
      ADR3 => registre_nb_cycle_conv_q_out(3),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi1_247
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_0_Q : X_MUX2
    port map (
      IB => N1,
      IA => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi_250,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(0),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(0)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut_0_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(0),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(0),
      ADR2 => registre_nb_cycle_conv_q_out(1),
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(1),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lut(0)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi : X_LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(1),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(0),
      ADR2 => registre_nb_cycle_conv_q_out(0),
      ADR3 => registre_nb_cycle_conv_q_out(1),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_lutdi_250
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_15_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(14),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi15_253,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(15)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_15_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(30),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(30),
      ADR2 => registre_nb_cycle_conv_q_out(31),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(31),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(15)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_14_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(13),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi14_256,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(14),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(14)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_14_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(28),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(28),
      ADR2 => registre_nb_cycle_conv_q_out(29),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(29),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(14)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_13_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(12),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi13_259,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(13),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(13)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_13_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(26),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(26),
      ADR2 => registre_nb_cycle_conv_q_out(27),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(27),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(13)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_12_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(11),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi12_262,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(12),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(12)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_12_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(24),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(24),
      ADR2 => registre_nb_cycle_conv_q_out(25),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(25),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(12)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_11_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(10),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi11_265,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(11),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(11)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_11_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(22),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(22),
      ADR2 => registre_nb_cycle_conv_q_out(23),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(23),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(11)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_10_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(9),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi10_268,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(10),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(10)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_10_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(20),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(20),
      ADR2 => registre_nb_cycle_conv_q_out(21),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(21),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(10)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_9_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(8),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi9_271,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(9),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(9)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_9_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(18),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(18),
      ADR2 => registre_nb_cycle_conv_q_out(19),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(19),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(9)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_8_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(7),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi8_274,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(8),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(8)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_8_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(16),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(16),
      ADR2 => registre_nb_cycle_conv_q_out(17),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(17),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(8)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_7_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(6),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi7_277,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(7),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(7)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_7_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(14),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(14),
      ADR2 => registre_nb_cycle_conv_q_out(15),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(7)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_6_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(5),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi6_280,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(6),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(6)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_6_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(12),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(12),
      ADR2 => registre_nb_cycle_conv_q_out(13),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(13),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(6)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_5_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(4),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi5_283,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(5),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(5)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_5_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(10),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(10),
      ADR2 => registre_nb_cycle_conv_q_out(11),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(11),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(5)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_4_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(3),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi4_286,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(4),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(4)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_4_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(8),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(8),
      ADR2 => registre_nb_cycle_conv_q_out(9),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(9),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(4)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_3_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(2),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi3_289,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(3),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(3)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_3_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(6),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(6),
      ADR2 => registre_nb_cycle_conv_q_out(7),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(7),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(3)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_2_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(1),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi2_292,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(2),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(2)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_2_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(4),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(4),
      ADR2 => registre_nb_cycle_conv_q_out(5),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(5),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(2)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_1_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(0),
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi1_295,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(1),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(1)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_1_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(2),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(2),
      ADR2 => registre_nb_cycle_conv_q_out(3),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(3),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(1)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_0_Q : X_MUX2
    port map (
      IB => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      IA => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi_298,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(0),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(0)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut_0_Q : X_LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      ADR0 => registre_nb_cycle_conv_q_out(0),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(0),
      ADR2 => registre_nb_cycle_conv_q_out(1),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(1),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lut(0)
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_31 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_31_dpot_702,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(31),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_30 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_30_dpot_701,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(30),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_29 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_29_dpot_700,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(29),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_28 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_28_dpot_699,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(28),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_27 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_27_dpot_698,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(27),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_26 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_26_dpot_697,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(26),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_25 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_25_dpot_696,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(25),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_24 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_24_dpot_695,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(24),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_23 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_23_dpot_694,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(23),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_22 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_22_dpot_693,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(22),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_21 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_21_dpot_692,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(21),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_20 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_20_dpot_691,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(20),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_19 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_19_dpot_690,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(19),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_18 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_18_dpot_689,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(18),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_17 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_17_dpot_688,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(17),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_16 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_16_dpot_687,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(16),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_15_dpot_686,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(15),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_14 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_14_dpot_685,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(14),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_13_dpot_684,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(13),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_12_dpot_683,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(12),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_11_dpot_682,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(11),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_10_dpot_681,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(10),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_9_dpot_680,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(9),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_8_dpot_679,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(8),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_7_dpot_678,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(7),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_6_dpot_677,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(6),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_5_dpot_676,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(5),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_4_dpot_675,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(4),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_3_dpot_674,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(3),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_2_dpot_673,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(2),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_1_dpot_672,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(1),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      RST => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_0_dpot_671,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(0),
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_4_2,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(4),
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_3_2,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(3),
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_2_2,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(2),
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_1_2,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_0_2,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_4_1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(4),
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_3_1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(3),
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_2_1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(2),
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_1_1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv,
      I => ctrl_adc_12bits_Result_0_1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_31 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(31),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(31),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_30 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(30),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(30),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_29 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(29),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(29),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_28 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(28),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(28),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_27 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(27),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(27),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_26 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(26),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(26),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_25 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(25),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(25),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_24 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(24),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(24),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_23 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(23),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(23),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_22 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(22),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(22),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_21 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(21),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(21),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_20 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(20),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(20),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_19 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(19),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(19),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_18 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(18),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(18),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_17 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708,
      I => ctrl_adc_12bits_Result(17),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(17),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_16 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(16),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(16),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(15),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_14 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(14),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(14),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(13),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(13),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(12),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(12),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(11),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(11),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(10),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(10),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(9),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(9),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(8),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(8),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(7),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(7),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(6),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(6),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(5),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(5),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(4),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(4),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(3),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(3),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(2),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(2),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(1),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(1),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_start_recup1,
      RST => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv,
      I => ctrl_adc_12bits_Result(0),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(0),
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_335,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_In,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_In,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_In_339,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In_340,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_2_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_2_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_2_reg_q_out_519,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_3_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_3_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_3_reg_q_out_518,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_4_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_4_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_4_reg_q_out_517,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_5_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_5_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_5_reg_q_out_516,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_6_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_6_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_6_reg_q_out_515,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_7_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_7_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_7_reg_q_out_514,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_8_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_8_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_8_reg_q_out_513,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_9_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_9_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_9_reg_q_out_512,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_10_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_10_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_10_reg_q_out_511,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_11_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_11_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_11_reg_q_out_510,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_12_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_12_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_12_reg_q_out_509,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_13_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_13_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_13_reg_q_out_508,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_14_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_14_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_14_reg_q_out_507,
      SET => GND
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_fin_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      RST => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_15_Q,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_fin_q_out_114,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => DOUT_IBUF_48,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_q_out_471,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_1_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_q_out_471,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_1_reg_q_out_472,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_2_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_1_reg_q_out_472,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_2_reg_q_out_473,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_3_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_2_reg_q_out_473,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_3_reg_q_out_474,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_4_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_3_reg_q_out_474,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_4_reg_q_out_475,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_5_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_4_reg_q_out_475,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_5_reg_q_out_476,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_6_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_5_reg_q_out_476,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_6_reg_q_out_477,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_7_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_6_reg_q_out_477,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_7_reg_q_out_478,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_8_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_7_reg_q_out_478,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_8_reg_q_out_479,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_9_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_8_reg_q_out_479,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_9_reg_q_out_480,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_10_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_9_reg_q_out_480,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_10_reg_q_out_481,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_11_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_10_reg_q_out_481,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_11_reg_q_out_482,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_12_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_11_reg_q_out_482,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_12_reg_q_out_483,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_13_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_12_reg_q_out_483,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_13_reg_q_out_484,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_14_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_13_reg_q_out_484,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_14_reg_q_out_485,
      SET => GND
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_15_reg_q_out : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      RST => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_14_reg_q_out_485,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_15_reg_q_out_486,
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_15_reg_q_out_486,
      O => ctrl_adc_12bits_registre_sortie_q_out(15),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_14 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_14_reg_q_out_485,
      O => ctrl_adc_12bits_registre_sortie_q_out(14),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_13_reg_q_out_484,
      O => ctrl_adc_12bits_registre_sortie_q_out(13),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_12_reg_q_out_483,
      O => ctrl_adc_12bits_registre_sortie_q_out(12),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_11_reg_q_out_482,
      O => ctrl_adc_12bits_registre_sortie_q_out(11),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_10_reg_q_out_481,
      O => ctrl_adc_12bits_registre_sortie_q_out(10),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_9_reg_q_out_480,
      O => ctrl_adc_12bits_registre_sortie_q_out(9),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_8_reg_q_out_479,
      O => ctrl_adc_12bits_registre_sortie_q_out(8),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_7_reg_q_out_478,
      O => ctrl_adc_12bits_registre_sortie_q_out(7),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_6_reg_q_out_477,
      O => ctrl_adc_12bits_registre_sortie_q_out(6),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_5_reg_q_out_476,
      O => ctrl_adc_12bits_registre_sortie_q_out(5),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_4_reg_q_out_475,
      O => ctrl_adc_12bits_registre_sortie_q_out(4),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_3_reg_q_out_474,
      O => ctrl_adc_12bits_registre_sortie_q_out(3),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_2_reg_q_out_473,
      O => ctrl_adc_12bits_registre_sortie_q_out(2),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg_loop_1_reg_q_out_472,
      O => ctrl_adc_12bits_registre_sortie_q_out(1),
      SET => GND
    );
  ctrl_adc_12bits_registre_sortie_q_out_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      CE => donne_conversion_pret_OBUF_111,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_q_out_471,
      O => ctrl_adc_12bits_registre_sortie_q_out(0),
      SET => GND
    );
  FSM_ctrl_mode_etat_present_registre_canal_conv_reset_inv1 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd1_117,
      ADR1 => FSM_ctrl_mode_etat_present_FSM_FFd7_128,
      O => registre_canal_conv_reset_inv
    );
  FSM_ctrl_mode_etat_present_FSM_FFd6_In1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => start_IBUF_47,
      ADR1 => FSM_ctrl_mode_etat_present_FSM_FFd7_128,
      O => FSM_ctrl_mode_etat_present_FSM_FFd6_In
    );
  FSM_ctrl_mode_etat_present_FSM_FFd5_In1 : X_LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd3_129,
      ADR1 => registre_mode_q_out(0),
      ADR2 => registre_mode_q_out(1),
      O => FSM_ctrl_mode_etat_present_FSM_FFd5_In
    );
  FSM_ctrl_mode_etat_present_FSM_FFd4_In1 : X_LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      ADR0 => registre_mode_q_out(1),
      ADR1 => FSM_ctrl_mode_etat_present_FSM_FFd3_129,
      ADR2 => registre_mode_q_out(0),
      O => FSM_ctrl_mode_etat_present_FSM_FFd4_In
    );
  FSM_ctrl_mode_etat_present_FSM_FFd2_In1 : X_LUT4
    generic map(
      INIT => X"FAFE"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd4_116,
      ADR1 => FSM_ctrl_mode_etat_present_FSM_FFd2_130,
      ADR2 => FSM_ctrl_mode_etat_present_FSM_FFd5_115,
      ADR3 => termine_conversion,
      O => FSM_ctrl_mode_etat_present_FSM_FFd2_In
    );
  FSM_ctrl_mode_etat_present_FSM_FFd7_In1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFF8282FF82"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd3_129,
      ADR1 => registre_mode_q_out(1),
      ADR2 => registre_mode_q_out(0),
      ADR3 => FSM_ctrl_mode_etat_present_FSM_FFd7_128,
      ADR4 => start_IBUF_47,
      ADR5 => FSM_ctrl_mode_etat_present_FSM_FFd1_117,
      O => FSM_ctrl_mode_etat_present_FSM_FFd7_In
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_Mcount_compteur_xor_4_11 : X_LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(4),
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(2),
      ADR4 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(3),
      O => ctrl_adc_12bits_Result_4_2
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_Mcount_compteur_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(3),
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(2),
      O => ctrl_adc_12bits_Result_3_2
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_Mcount_compteur_xor_4_11 : X_LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(4),
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(2),
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(3),
      O => ctrl_adc_12bits_Result_4_1
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_Mcount_compteur_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(3),
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(2),
      O => ctrl_adc_12bits_Result_3_1
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_Mcount_compteur_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(2),
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      O => ctrl_adc_12bits_Result_2_2
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_Mcount_compteur_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(2),
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      O => ctrl_adc_12bits_Result_2_1
    );
  ctrl_adc_12bits_load_config2_2_1 : X_LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => ctrl_adc_12bits_load_config2(2)
    );
  ctrl_adc_12bits_SCLK1 : X_LUT5
    generic map(
      INIT => X"AABFBFBF"
    )
    port map (
      ADR0 => clk_IBUF_710,
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      O => SCLK_OBUF_113
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_In1 : X_LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_In
    );
  ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1 : X_LUT4
    generic map(
      INIT => X"15DD"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      O => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1 : X_LUT4
    generic map(
      INIT => X"55D7"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_1_703,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_1_704,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_1_705,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv
    );
  ctrl_adc_12bits_load_config1_5_1 : X_LUT4
    generic map(
      INIT => X"0006"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      O => ctrl_adc_12bits_load_config1(5)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load231 : X_LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load23
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load211 : X_LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load21
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In11 : X_LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_Mcount_compteur_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      O => ctrl_adc_12bits_Result_1_2
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_Mcount_compteur_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      O => ctrl_adc_12bits_Result_1_1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_n0040_0_1 : X_LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => ctrl_adc_12bits_start_recup2
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_demarrer_recup1 : X_LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      O => ctrl_adc_12bits_start_recup1
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_enable_compteur1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_termine1 : X_LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => donne_conversion_pret_OBUF_111
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_n0029_1_1 : X_LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_n0029_2_1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur
    );
  ctrl_adc_12bits_CS1 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      O => CS_OBUF_112
    );
  ctrl_adc_12bits_termine1 : X_LUT5
    generic map(
      INIT => X"F8888888"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => termine_conversion
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_SW0 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => N2
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In : X_LUT6
    generic map(
      INIT => X"FF000002FF0F030E"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd4_116,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR5 => N2,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_335
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In3 : X_LUT4
    generic map(
      INIT => X"3D00"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In3_523
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_In : X_LUT6
    generic map(
      INIT => X"C0C0C0C2C0C0FFF2"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd5_115,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR5 => N2,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_In_339
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_5_mux_Mmux_output1_SW0 : X_LUT3
    generic map(
      INIT => X"43"
    )
    port map (
      ADR0 => registre_sequence_conv_q_out(0),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => N8
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_5_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFFF0003AAAAAAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_4_reg_q_out_517,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR3 => N8,
      ADR4 => ctrl_adc_12bits_load_config1(5),
      ADR5 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_5_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_7_mux_Mmux_output1_SW0 : X_LUT3
    generic map(
      INIT => X"43"
    )
    port map (
      ADR0 => registre_sequence_conv_q_out(2),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => N10
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_7_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFFF0003AAAAAAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_6_reg_q_out_515,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR3 => N10,
      ADR4 => ctrl_adc_12bits_load_config1(5),
      ADR5 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_7_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_9_mux_Mmux_output1_SW0 : X_LUT3
    generic map(
      INIT => X"43"
    )
    port map (
      ADR0 => registre_sequence_conv_q_out(4),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => N12
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_9_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFFF0003AAAAAAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_8_reg_q_out_513,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR3 => N12,
      ADR4 => ctrl_adc_12bits_load_config1(5),
      ADR5 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_9_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_10_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFC0AAAAFF00AAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_9_reg_q_out_512,
      ADR1 => registre_sequence_conv_q_out(5),
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR3 => N14,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_10_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_11_mux_Mmux_output1_SW0 : X_LUT6
    generic map(
      INIT => X"AAAAABAE0000030C"
    )
    port map (
      ADR0 => registre_canal_conv_q_out(1),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR5 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load23,
      O => N16
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_11_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFAAFFAAFCAAF0AA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_10_reg_q_out_511,
      ADR1 => registre_sequence_conv_q_out(6),
      ADR2 => ctrl_adc_12bits_load_config1(5),
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      ADR5 => N16,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_11_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_12_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFC0AAAAFF00AAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_11_reg_q_out_510,
      ADR1 => registre_sequence_conv_q_out(7),
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR3 => N18,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_12_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_14_mux_Mmux_output1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => N20
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_14_mux_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"3300AAAAF3F0AAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_13_reg_q_out_508,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load23,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      ADR5 => N20,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_14_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_fin_Mmux_output1_SW0 : X_LUT3
    generic map(
      INIT => X"E1"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => N22
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_fin_Mmux_output1 : X_LUT6
    generic map(
      INIT => X"FFF0AAAAFFF3AAAA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_14_reg_q_out_507,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load21,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load23,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_mode_rdc,
      ADR5 => N22,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_15_Q
    );
  clk_IBUF : X_BUF
    port map (
      I => clk,
      O => clk_IBUF_710
    );
  canal_conversion_2_IBUF : X_BUF
    port map (
      I => canal_conversion(2),
      O => canal_conversion_2_IBUF_0
    );
  canal_conversion_1_IBUF : X_BUF
    port map (
      I => canal_conversion(1),
      O => canal_conversion_1_IBUF_1
    );
  canal_conversion_0_IBUF : X_BUF
    port map (
      I => canal_conversion(0),
      O => canal_conversion_0_IBUF_2
    );
  sequence_conversion_7_IBUF : X_BUF
    port map (
      I => sequence_conversion(7),
      O => sequence_conversion_7_IBUF_3
    );
  sequence_conversion_6_IBUF : X_BUF
    port map (
      I => sequence_conversion(6),
      O => sequence_conversion_6_IBUF_4
    );
  sequence_conversion_5_IBUF : X_BUF
    port map (
      I => sequence_conversion(5),
      O => sequence_conversion_5_IBUF_5
    );
  sequence_conversion_4_IBUF : X_BUF
    port map (
      I => sequence_conversion(4),
      O => sequence_conversion_4_IBUF_6
    );
  sequence_conversion_3_IBUF : X_BUF
    port map (
      I => sequence_conversion(3),
      O => sequence_conversion_3_IBUF_7
    );
  sequence_conversion_2_IBUF : X_BUF
    port map (
      I => sequence_conversion(2),
      O => sequence_conversion_2_IBUF_8
    );
  sequence_conversion_1_IBUF : X_BUF
    port map (
      I => sequence_conversion(1),
      O => sequence_conversion_1_IBUF_9
    );
  sequence_conversion_0_IBUF : X_BUF
    port map (
      I => sequence_conversion(0),
      O => sequence_conversion_0_IBUF_10
    );
  mode_conversion_1_IBUF : X_BUF
    port map (
      I => mode_conversion(1),
      O => mode_conversion_1_IBUF_11
    );
  mode_conversion_0_IBUF : X_BUF
    port map (
      I => mode_conversion(0),
      O => mode_conversion_0_IBUF_12
    );
  nb_cycle_conversion_31_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(31),
      O => nb_cycle_conversion_31_IBUF_13
    );
  nb_cycle_conversion_30_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(30),
      O => nb_cycle_conversion_30_IBUF_14
    );
  nb_cycle_conversion_29_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(29),
      O => nb_cycle_conversion_29_IBUF_15
    );
  nb_cycle_conversion_28_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(28),
      O => nb_cycle_conversion_28_IBUF_16
    );
  nb_cycle_conversion_27_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(27),
      O => nb_cycle_conversion_27_IBUF_17
    );
  nb_cycle_conversion_26_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(26),
      O => nb_cycle_conversion_26_IBUF_18
    );
  nb_cycle_conversion_25_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(25),
      O => nb_cycle_conversion_25_IBUF_19
    );
  nb_cycle_conversion_24_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(24),
      O => nb_cycle_conversion_24_IBUF_20
    );
  nb_cycle_conversion_23_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(23),
      O => nb_cycle_conversion_23_IBUF_21
    );
  nb_cycle_conversion_22_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(22),
      O => nb_cycle_conversion_22_IBUF_22
    );
  nb_cycle_conversion_21_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(21),
      O => nb_cycle_conversion_21_IBUF_23
    );
  nb_cycle_conversion_20_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(20),
      O => nb_cycle_conversion_20_IBUF_24
    );
  nb_cycle_conversion_19_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(19),
      O => nb_cycle_conversion_19_IBUF_25
    );
  nb_cycle_conversion_18_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(18),
      O => nb_cycle_conversion_18_IBUF_26
    );
  nb_cycle_conversion_17_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(17),
      O => nb_cycle_conversion_17_IBUF_27
    );
  nb_cycle_conversion_16_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(16),
      O => nb_cycle_conversion_16_IBUF_28
    );
  nb_cycle_conversion_15_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(15),
      O => nb_cycle_conversion_15_IBUF_29
    );
  nb_cycle_conversion_14_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(14),
      O => nb_cycle_conversion_14_IBUF_30
    );
  nb_cycle_conversion_13_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(13),
      O => nb_cycle_conversion_13_IBUF_31
    );
  nb_cycle_conversion_12_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(12),
      O => nb_cycle_conversion_12_IBUF_32
    );
  nb_cycle_conversion_11_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(11),
      O => nb_cycle_conversion_11_IBUF_33
    );
  nb_cycle_conversion_10_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(10),
      O => nb_cycle_conversion_10_IBUF_34
    );
  nb_cycle_conversion_9_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(9),
      O => nb_cycle_conversion_9_IBUF_35
    );
  nb_cycle_conversion_8_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(8),
      O => nb_cycle_conversion_8_IBUF_36
    );
  nb_cycle_conversion_7_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(7),
      O => nb_cycle_conversion_7_IBUF_37
    );
  nb_cycle_conversion_6_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(6),
      O => nb_cycle_conversion_6_IBUF_38
    );
  nb_cycle_conversion_5_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(5),
      O => nb_cycle_conversion_5_IBUF_39
    );
  nb_cycle_conversion_4_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(4),
      O => nb_cycle_conversion_4_IBUF_40
    );
  nb_cycle_conversion_3_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(3),
      O => nb_cycle_conversion_3_IBUF_41
    );
  nb_cycle_conversion_2_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(2),
      O => nb_cycle_conversion_2_IBUF_42
    );
  nb_cycle_conversion_1_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(1),
      O => nb_cycle_conversion_1_IBUF_43
    );
  nb_cycle_conversion_0_IBUF : X_BUF
    port map (
      I => nb_cycle_conversion(0),
      O => nb_cycle_conversion_0_IBUF_44
    );
  reset_IBUF : X_BUF
    port map (
      I => reset,
      O => reset_IBUF_46
    );
  start_IBUF : X_BUF
    port map (
      I => start,
      O => start_IBUF_47
    );
  DOUT_IBUF : X_BUF
    port map (
      I => DOUT,
      O => DOUT_IBUF_48
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(30),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_603,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(29),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_604,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(28),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_605,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(27),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_606,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(26),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_607,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(25),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_608,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(24),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_609,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(23),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_610,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(22),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_611,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(21),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_612,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(20),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_613,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(19),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_614,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(18),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_615,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(17),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_616,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(16),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_617,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(15),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_618,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(14),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_619,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(13),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_620,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(12),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_621,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(11),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_622,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(10),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_623,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(9),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_624,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(8),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_625,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(7),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_626,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(6),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_627,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(5),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_628,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(4),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_629,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(3),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_630,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(2),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_631,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(1),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_632,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(30),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_30_rt_633,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(29),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_29_rt_634,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(28),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_28_rt_635,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(27),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_27_rt_636,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(26),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_26_rt_637,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(25),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_25_rt_638,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(24),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_24_rt_639,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(23),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_23_rt_640,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(22),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_22_rt_641,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(21),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_21_rt_642,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(20),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_20_rt_643,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(19),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_19_rt_644,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(18),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_18_rt_645,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(17),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_17_rt_646,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(16),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_16_rt_647,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_15_rt_648,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(14),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_14_rt_649,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(13),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_13_rt_650,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(12),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_12_rt_651,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(11),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_11_rt_652,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(10),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_10_rt_653,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(9),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_9_rt_654,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(8),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_8_rt_655,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(7),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_7_rt_656,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(6),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_6_rt_657,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(5),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_5_rt_658,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(4),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_4_rt_659,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(3),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_3_rt_660,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(2),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_2_rt_661,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(1),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_cy_1_rt_662,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(31),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_663,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(31),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_xor_31_rt_664,
      ADR1 => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut_665
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_cy : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy(15),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut_665,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_15_l1
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_cy1 : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_sequentielle_Mcompar_n0000_cy_15_l1,
      IA => N1,
      SEL => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut1_667,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi15 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(31),
      ADR1 => registre_nb_cycle_conv_q_out(30),
      ADR2 => registre_nb_cycle_conv_q_out(31),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(30),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi15_253
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi14 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(29),
      ADR1 => registre_nb_cycle_conv_q_out(28),
      ADR2 => registre_nb_cycle_conv_q_out(29),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(28),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi14_256
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi13 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(27),
      ADR1 => registre_nb_cycle_conv_q_out(26),
      ADR2 => registre_nb_cycle_conv_q_out(27),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(26),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi13_259
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi12 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(25),
      ADR1 => registre_nb_cycle_conv_q_out(24),
      ADR2 => registre_nb_cycle_conv_q_out(25),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(24),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi12_262
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi11 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(23),
      ADR1 => registre_nb_cycle_conv_q_out(22),
      ADR2 => registre_nb_cycle_conv_q_out(23),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(22),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi11_265
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi10 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(21),
      ADR1 => registre_nb_cycle_conv_q_out(20),
      ADR2 => registre_nb_cycle_conv_q_out(21),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(20),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi10_268
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi9 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(19),
      ADR1 => registre_nb_cycle_conv_q_out(18),
      ADR2 => registre_nb_cycle_conv_q_out(19),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(18),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi9_271
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi8 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(17),
      ADR1 => registre_nb_cycle_conv_q_out(16),
      ADR2 => registre_nb_cycle_conv_q_out(17),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(16),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi8_274
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi7 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(15),
      ADR1 => registre_nb_cycle_conv_q_out(14),
      ADR2 => registre_nb_cycle_conv_q_out(15),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(14),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi7_277
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi6 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(13),
      ADR1 => registre_nb_cycle_conv_q_out(12),
      ADR2 => registre_nb_cycle_conv_q_out(13),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(12),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi6_280
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi5 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(11),
      ADR1 => registre_nb_cycle_conv_q_out(10),
      ADR2 => registre_nb_cycle_conv_q_out(11),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(10),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi5_283
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi4 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(9),
      ADR1 => registre_nb_cycle_conv_q_out(8),
      ADR2 => registre_nb_cycle_conv_q_out(9),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(8),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi4_286
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi3 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(7),
      ADR1 => registre_nb_cycle_conv_q_out(6),
      ADR2 => registre_nb_cycle_conv_q_out(7),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(6),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi3_289
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi2 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(5),
      ADR1 => registre_nb_cycle_conv_q_out(4),
      ADR2 => registre_nb_cycle_conv_q_out(5),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(4),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi2_292
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi1 : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(3),
      ADR1 => registre_nb_cycle_conv_q_out(2),
      ADR2 => registre_nb_cycle_conv_q_out(3),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(2),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi1_295
    );
  ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi : X_LUT4
    generic map(
      INIT => X"D4F5"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(1),
      ADR1 => registre_nb_cycle_conv_q_out(0),
      ADR2 => registre_nb_cycle_conv_q_out(1),
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(0),
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_lutdi_298
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut_668
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_cy : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(15),
      IA => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_0_Q,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut_668,
      O => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_15_l1
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_cy1 : X_MUX2
    port map (
      IB => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy_15_l1,
      IA => N1,
      SEL => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut1_670,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_In1 : X_LUT5
    generic map(
      INIT => X"BCEC3CCC"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_In
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_In1 : X_LUT5
    generic map(
      INIT => X"A00CE0CC"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_Mcompar_n0000_cy(15),
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_In
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_10_mux_Mmux_output1_SW0 : X_LUT5
    generic map(
      INIT => X"00002000"
    )
    port map (
      ADR0 => registre_canal_conv_q_out(0),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      O => N14
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_12_mux_Mmux_output1_SW0 : X_LUT5
    generic map(
      INIT => X"00002000"
    )
    port map (
      ADR0 => registre_canal_conv_q_out(2),
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      O => N18
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut1 : X_LUT6
    generic map(
      INIT => X"FF0002FFFF0000FF"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In1_lut1_667
    );
  ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut1 : X_LUT6
    generic map(
      INIT => X"99899999F9E9F9F9"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR4 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR5 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      O => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_In1_lut1_670
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv1 : X_LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_enable_compteur_inv
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv1 : X_LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_enable_compteur_inv
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv1 : X_LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_rdc_recup_reg0_reset_inv
    );
  FSM_ctrl_mode_etat_present_FSM_FFd1_In1 : X_LUT6
    generic map(
      INIT => X"AA80808080808080"
    )
    port map (
      ADR0 => FSM_ctrl_mode_etat_present_FSM_FFd2_130,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      O => FSM_ctrl_mode_etat_present_FSM_FFd1_In
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_In1 : X_LUT6
    generic map(
      INIT => X"6767676708280808"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR4 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_In
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_3_mux_Mmux_output11 : X_LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_2_reg_q_out_519,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_3_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_4_mux_Mmux_output11 : X_LUT6
    generic map(
      INIT => X"AFAAAFAAACAAA0AA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_3_reg_q_out_518,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load21,
      ADR5 => ctrl_adc_12bits_load_config2(2),
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_4_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_6_mux_Mmux_output11 : X_LUT6
    generic map(
      INIT => X"AEA2A2A2A2A2A2A2"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_5_reg_q_out_516,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR4 => registre_sequence_conv_q_out(1),
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_6_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_8_mux_Mmux_output11 : X_LUT6
    generic map(
      INIT => X"AEA2A2A2A2A2A2A2"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_7_reg_q_out_514,
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR4 => registre_sequence_conv_q_out(3),
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_8_Q
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_13_mux_Mmux_output11 : X_LUT6
    generic map(
      INIT => X"AFAAAFAAA3AAA0AA"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_loop_12_reg_q_out_509,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR4 => ctrl_adc_12bits_FSM_conversion_1canal_Mmux_load21,
      ADR5 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In1,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_13_Q
    );
  occupe1 : X_LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR1 => FSM_ctrl_mode_etat_present_FSM_FFd7_128,
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      O => occupe_OBUF_119
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_mux_loop_2_mux_Mmux_output11 : X_LUT6
    generic map(
      INIT => X"0000000000000020"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR4 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR5 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_sortie_mux_2_Q
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_0_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(0),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_0_3,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_0_dpot_671
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_1_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(1),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_1_3,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_1_dpot_672
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_2_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(2),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_2_3,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_2_dpot_673
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_3_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(3),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_3_3,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_3_dpot_674
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_4_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(4),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_4_3,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_4_dpot_675
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_5_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(5),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_5_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_5_dpot_676
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_6_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(6),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_6_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_6_dpot_677
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_7_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(7),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_7_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_7_dpot_678
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_8_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(8),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_8_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_8_dpot_679
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_9_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(9),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_9_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_9_dpot_680
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_10_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(10),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_10_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_10_dpot_681
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_11_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(11),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_11_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_11_dpot_682
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_12_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(12),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_12_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_12_dpot_683
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_1_703,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_13_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(13),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_13_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_13_dpot_684
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_14_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(14),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_14_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_14_dpot_685
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_15_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(15),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_15_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_15_dpot_686
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_16_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(16),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_16_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_16_dpot_687
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_17_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(17),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_17_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_17_dpot_688
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_18_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(18),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_18_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_18_dpot_689
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_19_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(19),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_19_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_19_dpot_690
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_20_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(20),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_20_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_20_dpot_691
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_21_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(21),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_21_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_21_dpot_692
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_22_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(22),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_22_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_22_dpot_693
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_23_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(23),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_23_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_23_dpot_694
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_24_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(24),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_24_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_24_dpot_695
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_25_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(25),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_25_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_25_dpot_696
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_26_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(26),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_26_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_26_dpot_697
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_27_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(27),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_27_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_27_dpot_698
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_28_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(28),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_28_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_28_dpot_699
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_29_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(29),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_29_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_29_dpot_700
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_30_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(30),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_30_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_30_dpot_701
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_31_dpot : X_LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(31),
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_433,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR3 => ctrl_adc_12bits_Result_31_1,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur_31_dpot_702
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_335,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_1_704,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_1_705,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_In,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_2_706,
      CE => VCC,
      SET => GND
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_1 : X_LUT4
    generic map(
      INIT => X"55D7"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_1_703,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_1_704,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd3_1_705,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_reset_compteur_nb_cycle_conv_inv1_707
    );
  ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_1 : X_LUT4
    generic map(
      INIT => X"15DD"
    )
    port map (
      ADR0 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd1_467,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      O => ctrl_adc_12bits_FSM_conversion_1canal_reset_compteur_nb_cycle_conv_inv1_708
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_IBUF_BUFG_45,
      RST => ctrl_adc_12bits_registre_sortie_reset_inv,
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_In_335,
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_2_709,
      CE => VCC,
      SET => GND
    );
  clk_IBUF_BUFG : X_CKBUF
    port map (
      O => clk_IBUF_BUFG_45,
      I => clk_IBUF_710
    );
  ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_lut_0_INV_0 : X_INV
    port map (
      I => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_compteur(0),
      O => ctrl_adc_12bits_FSM_conversion_sequentielle_compteur_nb_cycle_conversion_Mcount_compteur_lut(0)
    );
  ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_lut_0_INV_0 : X_INV
    port map (
      I => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_compteur(0),
      O => ctrl_adc_12bits_FSM_conversion_1canal_compteur_nb_cycle_conversion_Mcount_compteur_lut(0)
    );
  reset_inv1_INV_0 : X_INV
    port map (
      I => reset_IBUF_46,
      O => ctrl_adc_12bits_registre_sortie_reset_inv
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_Mcount_compteur_xor_0_11_INV_0 : X_INV
    port map (
      I => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(0),
      O => ctrl_adc_12bits_Result_0_2
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_Mcount_compteur_xor_0_11_INV_0 : X_INV
    port map (
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      O => ctrl_adc_12bits_Result_0_1
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv1_INV_0 : X_INV
    port map (
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg0_reset_inv
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In4 : X_MUX2
    port map (
      IA => N24,
      IB => N25,
      SEL => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_396,
      O => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In4_F : X_LUT5
    generic map(
      INIT => X"55554044"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      ADR1 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd4_432,
      ADR2 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd2_434,
      ADR3 => ctrl_adc_12bits_FSM_conversion_sequentielle_etat_present_FSM_FFd1_431,
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In3_523,
      O => N24
    );
  ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd2_In4_G : X_LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(4),
      ADR1 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(2),
      ADR2 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(3),
      ADR3 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(1),
      ADR4 => ctrl_adc_12bits_rdc_configuration_adc12bits_compteur5bit_compteur(0),
      ADR5 => ctrl_adc_12bits_rdc_configuration_adc12bits_etat_present_FSM_FFd1_395,
      O => N25
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In : X_MUX2
    port map (
      IA => N26,
      IB => N27,
      SEL => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_394,
      O => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In_340
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In_F : X_LUT5
    generic map(
      INIT => X"55554000"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      ADR1 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd4_470,
      ADR2 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd3_469,
      ADR3 => ctrl_adc_12bits_FSM_conversion_1canal_etat_present_FSM_FFd2_468,
      ADR4 => ctrl_adc_12bits_start_recup2,
      O => N26
    );
  ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd2_In_G : X_LUT5
    generic map(
      INIT => X"1555FFFF"
    )
    port map (
      ADR0 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(4),
      ADR1 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(1),
      ADR2 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(3),
      ADR3 => ctrl_adc_12bits_rdc_recuperation_adc12bits_compteur_5bits_compteur(2),
      ADR4 => ctrl_adc_12bits_rdc_recuperation_adc12bits_etat_present_FSM_FFd1_392,
      O => N27
    );
  donne_conversion_15_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(15),
      O => donne_conversion(15)
    );
  donne_conversion_14_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(14),
      O => donne_conversion(14)
    );
  donne_conversion_13_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(13),
      O => donne_conversion(13)
    );
  donne_conversion_12_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(12),
      O => donne_conversion(12)
    );
  donne_conversion_11_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(11),
      O => donne_conversion(11)
    );
  donne_conversion_10_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(10),
      O => donne_conversion(10)
    );
  donne_conversion_9_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(9),
      O => donne_conversion(9)
    );
  donne_conversion_8_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(8),
      O => donne_conversion(8)
    );
  donne_conversion_7_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(7),
      O => donne_conversion(7)
    );
  donne_conversion_6_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(6),
      O => donne_conversion(6)
    );
  donne_conversion_5_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(5),
      O => donne_conversion(5)
    );
  donne_conversion_4_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(4),
      O => donne_conversion(4)
    );
  donne_conversion_3_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(3),
      O => donne_conversion(3)
    );
  donne_conversion_2_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(2),
      O => donne_conversion(2)
    );
  donne_conversion_1_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(1),
      O => donne_conversion(1)
    );
  donne_conversion_0_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_registre_sortie_q_out(0),
      O => donne_conversion(0)
    );
  donne_conversion_pret_OBUF : X_OBUF
    port map (
      I => donne_conversion_pret_OBUF_111,
      O => donne_conversion_pret
    );
  CS_OBUF : X_OBUF
    port map (
      I => CS_OBUF_112,
      O => CS
    );
  SCLK_OBUF : X_OBUF
    port map (
      I => SCLK_OBUF_113,
      O => SCLK
    );
  DIN_OBUF : X_OBUF
    port map (
      I => ctrl_adc_12bits_rdc_configuration_adc12bits_rdc_reg_fin_q_out_114,
      O => DIN
    );
  occupe_OBUF : X_OBUF
    port map (
      I => occupe_OBUF_119,
      O => occupe
    );
  termine_OBUF : X_OBUF
    port map (
      I => FSM_ctrl_mode_etat_present_FSM_FFd1_117,
      O => termine
    );
  NlwBlock_top_controle_adc_12bits_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_top_controle_adc_12bits_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;


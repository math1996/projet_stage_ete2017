/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *MODULES_P_2692609468;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    modules_p_2692609468_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    modules_a_0055594350_3212880686_init();
    modules_a_2105088786_3212880686_init();
    modules_a_3641411212_3212880686_init();
    modules_a_3287642754_3212880686_init();
    modules_a_4231643051_3212880686_init();
    work_a_2804292631_3212880686_init();
    work_a_4145623707_2372691052_init();


    xsi_register_tops("work_a_4145623707_2372691052");

    MODULES_P_2692609468 = xsi_get_engine_memory("modules_p_2692609468");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}

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

char *IEEE_P_3499444699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *MODULES_P_2692609468;
char *IEEE_P_2592010699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    modules_p_2692609468_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    modules_a_3405074221_3212880686_init();
    modules_a_0179147514_3212880686_init();
    modules_a_3409388826_3212880686_init();
    modules_a_3345140475_3212880686_init();
    modules_a_2105088786_3212880686_init();
    modules_a_3641411212_3212880686_init();
    modules_a_3101067846_3212880686_init();
    modules_a_0043132761_3212880686_init();
    modules_a_3642510944_3212880686_init();
    modules_a_4188901520_3212880686_init();
    modules_a_4110235325_3212880686_init();
    modules_a_3235543054_3212880686_init();
    modules_a_2482658366_3212880686_init();
    modules_a_2968276327_3212880686_init();
    modules_a_2813194925_3212880686_init();
    modules_a_3711436706_3212880686_init();
    modules_a_2712688330_3212880686_init();
    work_a_0687824943_3212880686_init();
    work_a_1975971928_2372691052_init();


    xsi_register_tops("work_a_1975971928_2372691052");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    MODULES_P_2692609468 = xsi_get_engine_memory("modules_p_2692609468");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);

    return xsi_run_simulation(argc, argv);

}

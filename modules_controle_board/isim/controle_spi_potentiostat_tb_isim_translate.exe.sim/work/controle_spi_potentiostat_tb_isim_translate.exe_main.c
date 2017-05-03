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

char *STD_STANDARD;
char *SIMPRIM_P_0947159679;
char *IEEE_P_2717149903;
char *IEEE_P_2592010699;
char *STD_TEXTIO;
char *IEEE_P_1367372525;
char *SIMPRIM_P_4208868169;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_2717149903_init();
    simprim_p_0947159679_init();
    ieee_p_1367372525_init();
    simprim_p_4208868169_init();
    simprim_a_1509725169_3980060181_0433961640_init();
    simprim_a_3395610110_2220797900_0433961640_init();
    simprim_a_4130118134_1564065396_0433961640_init();
    simprim_a_0860940424_1564065396_0433961640_init();
    simprim_a_3936907874_4055128042_0433961640_init();
    simprim_a_1387470219_3879906181_0433961640_init();
    simprim_a_3624651761_1883126775_0433961640_init();
    simprim_a_1385652478_1883126775_0433961640_init();
    simprim_a_4244631919_1883126775_0433961640_init();
    simprim_a_3482878344_1883126775_0433961640_init();
    simprim_a_1157900935_1883126775_0433961640_init();
    simprim_a_4216677804_1912361408_0433961640_init();
    simprim_a_3463845361_1912361408_0433961640_init();
    simprim_a_1455144347_1957906245_0433961640_init();
    simprim_a_3702995043_2431929443_0433961640_init();
    simprim_a_1859873907_2082082460_init();
    simprim_a_2027651288_3300903326_0433961640_init();
    simprim_a_3156740924_4150518722_0433961640_init();
    simprim_a_4181367278_3380326129_0433961640_init();
    simprim_a_2155285624_1178295121_0433961640_init();
    work_a_2804292631_0632001823_init();
    work_a_4145623707_2372691052_init();


    xsi_register_tops("work_a_4145623707_2372691052");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    SIMPRIM_P_0947159679 = xsi_get_engine_memory("simprim_p_0947159679");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    SIMPRIM_P_4208868169 = xsi_get_engine_memory("simprim_p_4208868169");

    return xsi_run_simulation(argc, argv);

}

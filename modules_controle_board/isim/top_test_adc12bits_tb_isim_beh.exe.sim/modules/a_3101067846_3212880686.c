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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Mathieu/Desktop/projet_stage_ete2017/modules_controle_board/rdc_load_nbits.vhd";



static void modules_a_3101067846_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(67, ng0);

LAB3:    t1 = (t0 + 9544U);
    t2 = *((char **)t1);
    t3 = (16 - 1);
    t4 = (t3 - 15);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t0 + 14744);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 14664);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void modules_a_3101067846_3212880686_init()
{
	static char *pe[] = {(void *)modules_a_3101067846_3212880686_p_0};
	xsi_register_didat("modules_a_3101067846_3212880686", "isim/top_test_adc12bits_tb_isim_beh.exe.sim/modules/a_3101067846_3212880686.didat");
	xsi_register_executes(pe);
}

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
static const char *ng0 = "D:/vhdl/pipelinedDatapath/regGen.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1108800195_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(60, ng0);
    t1 = xsi_get_transient_memory(154U);
    memset(t1, 0, 154U);
    t3 = t1;
    memset(t3, (unsigned char)2, 154U);
    t4 = (t0 + 3576);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 154U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 3512);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 154U);
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 1672U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 3512);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 154U);
    xsi_driver_first_trans_fast_port(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 1192U);
    t10 = *((char **)t3);
    t3 = (t0 + 3512);
    t11 = (t3 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 154U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 3576);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 154U);
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

}


extern void work_a_1108800195_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1108800195_3212880686_p_0};
	xsi_register_didat("work_a_1108800195_3212880686", "isim/processor_isim_beh.exe.sim/work/a_1108800195_3212880686.didat");
	xsi_register_executes(pe);
}

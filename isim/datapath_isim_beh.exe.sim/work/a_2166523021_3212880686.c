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
static const char *ng0 = "D:/vhdl/pipelined/RegisterFile.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2166523021_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2112U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 6264U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t1);
    t13 = (t12 - 0);
    t7 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t12);
    t14 = (32U * t7);
    t15 = (0 + t14);
    t5 = (t3 + t15);
    t8 = (t0 + 3872);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t17 = *((char **)t11);
    memcpy(t17, t5, 32U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 1832U);
    t4 = *((char **)t1);
    t1 = (t0 + 6280U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t1);
    t13 = (t12 - 0);
    t7 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t12);
    t14 = (32U * t7);
    t15 = (0 + t14);
    t5 = (t3 + t15);
    t8 = (t0 + 3936);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t17 = *((char **)t11);
    memcpy(t17, t5, 32U);
    xsi_driver_first_trans_fast_port(t8);

LAB3:    t1 = (t0 + 3792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 1992U);
    t5 = *((char **)t3);
    t6 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t6 = 0;

LAB10:    if ((!(t6)) != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t2 = 1;
    if (4U == 4U)
        goto LAB17;

LAB18:    t2 = 0;

LAB19:    if ((!(t2)) != 0)
        goto LAB14;

LAB16:
LAB15:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t6 = (t2 == (unsigned char)3);
    if (t6 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB3;

LAB5:    xsi_set_current_line(74, ng0);
    t9 = (t0 + 2312U);
    t10 = *((char **)t9);
    t9 = (t0 + 1672U);
    t11 = *((char **)t9);
    t9 = (t0 + 6264U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t11, t9);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t12);
    t15 = (32U * t14);
    t16 = (0 + t15);
    t17 = (t10 + t16);
    t18 = (t0 + 3872);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB6;

LAB8:    t7 = 0;

LAB11:    if (t7 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t3 = (t4 + t7);
    t8 = (t5 + t7);
    if (*((unsigned char *)t3) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t7 = (t7 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(77, ng0);
    t8 = (t0 + 2312U);
    t9 = *((char **)t8);
    t8 = (t0 + 1832U);
    t10 = *((char **)t8);
    t8 = (t0 + 6280U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t10, t8);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t12);
    t15 = (32U * t14);
    t16 = (0 + t15);
    t11 = (t9 + t16);
    t17 = (t0 + 3936);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 32U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB15;

LAB17:    t7 = 0;

LAB20:    if (t7 < 4U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t1 = (t3 + t7);
    t5 = (t4 + t7);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB18;

LAB22:    t7 = (t7 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t1 = (t0 + 6296U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t5, t1);
    t13 = (t12 - 0);
    t7 = (t13 * 1);
    t14 = (32U * t7);
    t15 = (0U + t14);
    t8 = (t0 + 4000);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t17 = *((char **)t11);
    memcpy(t17, t4, 32U);
    xsi_driver_first_trans_delta(t8, t15, 32U, 0LL);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t2 = 1;
    if (4U == 4U)
        goto LAB29;

LAB30:    t2 = 0;

LAB31:    if (t2 != 0)
        goto LAB26;

LAB28:
LAB27:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t2 = 1;
    if (4U == 4U)
        goto LAB38;

LAB39:    t2 = 0;

LAB40:    if (t2 != 0)
        goto LAB35;

LAB37:
LAB36:    goto LAB24;

LAB26:    xsi_set_current_line(83, ng0);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 3872);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t17 = (t11 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB27;

LAB29:    t7 = 0;

LAB32:    if (t7 < 4U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t1 = (t3 + t7);
    t5 = (t4 + t7);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB30;

LAB34:    t7 = (t7 + 1);
    goto LAB32;

LAB35:    xsi_set_current_line(86, ng0);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 3936);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t17 = (t11 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB36;

LAB38:    t7 = 0;

LAB41:    if (t7 < 4U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t1 = (t3 + t7);
    t5 = (t4 + t7);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB39;

LAB43:    t7 = (t7 + 1);
    goto LAB41;

}


extern void work_a_2166523021_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2166523021_3212880686_p_0};
	xsi_register_didat("work_a_2166523021_3212880686", "isim/datapath_isim_beh.exe.sim/work/a_2166523021_3212880686.didat");
	xsi_register_executes(pe);
}

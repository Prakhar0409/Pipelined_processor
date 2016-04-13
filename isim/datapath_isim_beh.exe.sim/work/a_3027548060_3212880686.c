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
static const char *ng0 = "D:/vhdl/pipelined/datapath.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );


static void work_a_3027548060_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(261, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = (25 - 31);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)3);
    if (t9 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(264, ng0);
    t2 = (t0 + 14464);
    t3 = (t2 + 56U);
    t10 = *((char **)t3);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 14256);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(262, ng0);
    t21 = (t0 + 14464);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)3;
    xsi_driver_first_trans_fast(t21);
    goto LAB3;

LAB5:    t10 = (t0 + 1832U);
    t11 = *((char **)t10);
    t12 = (31 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t15 = (t0 + 23455);
    t17 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t17 = 0;

LAB10:    t1 = t17;
    goto LAB7;

LAB8:    t18 = 0;

LAB11:    if (t18 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t19 = (t10 + t18);
    t20 = (t15 + t18);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB9;

LAB13:    t18 = (t18 + 1);
    goto LAB11;

}

static void work_a_3027548060_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(221, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 21584U);
    t4 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t1, t3, t2, 1);
    t5 = (t0 + 14528);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 10U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 14272);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3027548060_3212880686_p_2(char *t0)
{
    char t1[16];
    char t9[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(222, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 21584U);
    t4 = (t0 + 3432U);
    t5 = *((char **)t4);
    t6 = (123 - 9);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t4 = (t5 + t8);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 9;
    t11 = (t10 + 4U);
    *((int *)t11) = 0;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t12 = (0 - 9);
    t13 = (t12 * -1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t1, t3, t2, t4, t9);
    t14 = (t0 + 14592);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t11, 10U);
    xsi_driver_first_trans_fast(t14);

LAB2:    t19 = (t0 + 14288);
    *((int *)t19) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3027548060_3212880686_p_3(char *t0)
{
    char t5[16];
    char t8[16];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(242, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 23459);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 21584U);
    t9 = (t8 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 5;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t11 = (5 - 0);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t12;
    t4 = xsi_base_array_concat(t4, t5, t6, (char)97, t2, t7, (char)97, t1, t8, (char)101);
    t12 = (10U + 6U);
    t13 = (16U != t12);
    if (t13 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 14656);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t4, 16U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t18 = (t0 + 14304);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t12, 0);
    goto LAB6;

}

static void work_a_3027548060_3212880686_p_4(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char t23[16];
    char t25[16];
    char t31[16];
    char t36[16];
    char t44[16];
    char t46[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t24;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t45;
    char *t47;
    char *t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned char t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;

LAB0:    xsi_set_current_line(309, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (31 - 15);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 23465);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 15;
    t13 = (t12 + 4U);
    *((int *)t13) = 12;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t14 = (12 - 15);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 0;
    t17 = (t13 + 4U);
    *((int *)t17) = 19;
    t17 = (t13 + 8U);
    *((int *)t17) = 1;
    t18 = (19 - 0);
    t15 = (t18 * 1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t6, t16, (char)101);
    t17 = (t0 + 1832U);
    t19 = *((char **)t17);
    t15 = (31 - 11);
    t20 = (t15 * 1U);
    t21 = (0 + t20);
    t17 = (t19 + t21);
    t24 = ((IEEE_P_2592010699) + 4024);
    t26 = (t25 + 0U);
    t27 = (t26 + 0U);
    *((int *)t27) = 11;
    t27 = (t26 + 4U);
    *((int *)t27) = 0;
    t27 = (t26 + 8U);
    *((int *)t27) = -1;
    t28 = (0 - 11);
    t29 = (t28 * -1);
    t29 = (t29 + 1);
    t27 = (t26 + 12U);
    *((unsigned int *)t27) = t29;
    t22 = xsi_base_array_concat(t22, t23, t24, (char)97, t8, t9, (char)97, t17, t25, (char)101);
    t27 = (t0 + 2312U);
    t30 = *((char **)t27);
    t32 = ((IEEE_P_2592010699) + 4024);
    t33 = (t0 + 21664U);
    t27 = xsi_base_array_concat(t27, t31, t32, (char)97, t22, t23, (char)97, t30, t33, (char)101);
    t34 = (t0 + 2152U);
    t35 = *((char **)t34);
    t37 = ((IEEE_P_2592010699) + 4024);
    t38 = (t0 + 21648U);
    t34 = xsi_base_array_concat(t34, t36, t37, (char)97, t27, t31, (char)97, t35, t38, (char)101);
    t39 = (t0 + 1832U);
    t40 = *((char **)t39);
    t29 = (31 - 23);
    t41 = (t29 * 1U);
    t42 = (0 + t41);
    t39 = (t40 + t42);
    t45 = ((IEEE_P_2592010699) + 4024);
    t47 = (t46 + 0U);
    t48 = (t47 + 0U);
    *((int *)t48) = 23;
    t48 = (t47 + 4U);
    *((int *)t48) = 0;
    t48 = (t47 + 8U);
    *((int *)t48) = -1;
    t49 = (0 - 23);
    t50 = (t49 * -1);
    t50 = (t50 + 1);
    t48 = (t47 + 12U);
    *((unsigned int *)t48) = t50;
    t43 = xsi_base_array_concat(t43, t44, t45, (char)97, t34, t36, (char)97, t39, t46, (char)101);
    t50 = (4U + 20U);
    t51 = (t50 + 12U);
    t52 = (t51 + 32U);
    t53 = (t52 + 32U);
    t54 = (t53 + 24U);
    t55 = (124U != t54);
    if (t55 == 1)
        goto LAB5;

LAB6:    t48 = (t0 + 14720);
    t56 = (t48 + 56U);
    t57 = *((char **)t56);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    memcpy(t59, t43, 124U);
    xsi_driver_first_trans_fast(t48);

LAB2:    t60 = (t0 + 14320);
    *((int *)t60) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(124U, t54, 0);
    goto LAB6;

}

static void work_a_3027548060_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(354, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t1 = (t0 + 14784);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 14336);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3027548060_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(355, ng0);

LAB3:    t1 = (t0 + 6472U);
    t2 = *((char **)t1);
    t1 = (t0 + 14848);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 14352);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3027548060_3212880686_p_7(char *t0)
{
    char t12[16];
    char t14[16];
    char t19[16];
    char t23[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    char *t20;
    int t21;
    char *t22;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(375, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = (123 - 123);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3432U);
    t7 = *((char **)t6);
    t8 = (123 - 87);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t6 = (t7 + t10);
    t13 = ((IEEE_P_2592010699) + 4024);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 123;
    t16 = (t15 + 4U);
    *((int *)t16) = 120;
    t16 = (t15 + 8U);
    *((int *)t16) = -1;
    t17 = (120 - 123);
    t18 = (t17 * -1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t16 = (t19 + 0U);
    t20 = (t16 + 0U);
    *((int *)t20) = 87;
    t20 = (t16 + 4U);
    *((int *)t20) = 56;
    t20 = (t16 + 8U);
    *((int *)t20) = -1;
    t21 = (56 - 87);
    t18 = (t21 * -1);
    t18 = (t18 + 1);
    t20 = (t16 + 12U);
    *((unsigned int *)t20) = t18;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t1, t14, (char)97, t6, t19, (char)101);
    t20 = (t0 + 4872U);
    t22 = *((char **)t20);
    t24 = ((IEEE_P_2592010699) + 4024);
    t25 = (t0 + 21856U);
    t20 = xsi_base_array_concat(t20, t23, t24, (char)97, t11, t12, (char)97, t22, t25, (char)101);
    t18 = (4U + 32U);
    t26 = (t18 + 32U);
    t27 = (68U != t26);
    if (t27 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 14912);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t20, 68U);
    xsi_driver_first_trans_fast(t28);

LAB2:    t33 = (t0 + 14368);
    *((int *)t33) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(68U, t26, 0);
    goto LAB6;

}

static void work_a_3027548060_3212880686_p_8(char *t0)
{
    char t12[16];
    char t14[16];
    char t19[16];
    char t23[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    char *t20;
    int t21;
    char *t22;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(408, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = (67 - 67);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3112U);
    t7 = *((char **)t6);
    t8 = (67 - 31);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t6 = (t7 + t10);
    t13 = ((IEEE_P_2592010699) + 4024);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 67;
    t16 = (t15 + 4U);
    *((int *)t16) = 64;
    t16 = (t15 + 8U);
    *((int *)t16) = -1;
    t17 = (64 - 67);
    t18 = (t17 * -1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t16 = (t19 + 0U);
    t20 = (t16 + 0U);
    *((int *)t20) = 31;
    t20 = (t16 + 4U);
    *((int *)t20) = 0;
    t20 = (t16 + 8U);
    *((int *)t20) = -1;
    t21 = (0 - 31);
    t18 = (t21 * -1);
    t18 = (t18 + 1);
    t20 = (t16 + 12U);
    *((unsigned int *)t20) = t18;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t1, t14, (char)97, t6, t19, (char)101);
    t20 = (t0 + 5512U);
    t22 = *((char **)t20);
    t24 = ((IEEE_P_2592010699) + 4024);
    t25 = (t0 + 21872U);
    t20 = xsi_base_array_concat(t20, t23, t24, (char)97, t11, t12, (char)97, t22, t25, (char)101);
    t18 = (4U + 32U);
    t26 = (t18 + 32U);
    t27 = (68U != t26);
    if (t27 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 14976);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t20, 68U);
    xsi_driver_first_trans_fast(t28);

LAB2:    t33 = (t0 + 14384);
    *((int *)t33) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(68U, t26, 0);
    goto LAB6;

}


extern void work_a_3027548060_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3027548060_3212880686_p_0,(void *)work_a_3027548060_3212880686_p_1,(void *)work_a_3027548060_3212880686_p_2,(void *)work_a_3027548060_3212880686_p_3,(void *)work_a_3027548060_3212880686_p_4,(void *)work_a_3027548060_3212880686_p_5,(void *)work_a_3027548060_3212880686_p_6,(void *)work_a_3027548060_3212880686_p_7,(void *)work_a_3027548060_3212880686_p_8};
	xsi_register_didat("work_a_3027548060_3212880686", "isim/datapath_isim_beh.exe.sim/work/a_3027548060_3212880686.didat");
	xsi_register_executes(pe);
}

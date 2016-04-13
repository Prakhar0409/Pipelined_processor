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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_a_1067574770_3212880686_init();
    work_a_2188085564_3212880686_init();
    work_a_1208337864_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1103669798_3212880686_init();
    work_a_1991350011_3212880686_init();
    std_textio_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_4283679335_2959432447_init();
    xilinxcorelib_a_1556474411_2959432447_init();
    xilinxcorelib_a_1001158583_1709443946_init();
    xilinxcorelib_a_0412056691_0543512595_init();
    xilinxcorelib_a_4200025211_3212880686_init();
    work_a_4100369738_4277291687_init();
    work_a_1334498491_3212880686_init();
    work_a_2653298262_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_4293231395_3212880686_init();
    work_a_3896882883_3212880686_init();
    work_a_3487269560_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_3236447212_3212880686_init();
    xilinxcorelib_a_4255466247_0543512595_init();
    xilinxcorelib_a_0558842337_3212880686_init();
    work_a_3073701636_1075909370_init();
    work_a_1946274664_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_1667949733_3212880686_init();


    xsi_register_tops("work_a_1667949733_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}

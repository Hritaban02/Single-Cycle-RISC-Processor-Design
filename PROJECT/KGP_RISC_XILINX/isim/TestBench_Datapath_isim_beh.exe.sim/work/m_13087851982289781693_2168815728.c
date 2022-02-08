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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Desktop/Computer Oraganization Laboratory/KGP_RISC_XILINX/SignExtension21to32.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2047U, 0U};



static void Always_17_0(char *t0)
{
    char t6[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 2360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 2680);
    *((int *)t2) = 1;
    t3 = (t0 + 2392);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(17, ng0);

LAB5:    xsi_set_current_line(18, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 20);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 20);
    t13 = (t12 & 1);
    *((unsigned int *)t4) = t13;

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t6, 1, t14, 1);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t6, 1, t2, 1);
    if (t15 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    xsi_vlogtype_concat(t16, 32, 32, 2U, t2, 11, t3, 21);
    t4 = (t0 + 1448);
    xsi_vlogvar_assign_value(t4, t16, 0, 0, 32);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(19, ng0);
    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng1)));
    xsi_vlogtype_concat(t16, 32, 32, 2U, t17, 11, t18, 21);
    t19 = (t0 + 1448);
    xsi_vlogvar_assign_value(t19, t16, 0, 0, 32);
    goto LAB13;

LAB9:    xsi_set_current_line(20, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    xsi_vlogtype_concat(t16, 32, 32, 2U, t3, 11, t4, 21);
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 32);
    goto LAB13;

}


extern void work_m_13087851982289781693_2168815728_init()
{
	static char *pe[] = {(void *)Always_17_0};
	xsi_register_didat("work_m_13087851982289781693_2168815728", "isim/TestBench_Datapath_isim_beh.exe.sim/work/m_13087851982289781693_2168815728.didat");
	xsi_register_executes(pe);
}

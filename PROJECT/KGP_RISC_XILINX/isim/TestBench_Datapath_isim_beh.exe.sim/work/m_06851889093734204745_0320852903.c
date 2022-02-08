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
static const char *ng0 = "/home/ise/Desktop/Computer Oraganization Laboratory/KGP_RISC_XILINX/BranchComparisonSuccess.v";
static unsigned int ng1[] = {2U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {6U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {7U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {10U, 0U};
static unsigned int ng10[] = {11U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {9U, 0U};



static void Always_32_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 3000);
    *((int *)t2) = 1;
    t3 = (t0 + 2712);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t5 = (t0 + 1368U);
    t6 = *((char **)t5);
    t5 = (t0 + 1048U);
    t7 = *((char **)t5);
    t5 = (t0 + 1208U);
    t8 = *((char **)t5);
    xsi_vlogtype_concat(t4, 4, 4, 3U, t8, 2, t7, 1, t6, 1);

LAB6:    t5 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 4);
    if (t9 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t9 == 1)
        goto LAB29;

LAB30:
LAB32:
LAB31:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB33:    goto LAB2;

LAB7:    xsi_set_current_line(35, ng0);
    t10 = ((char*)((ng2)));
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 1);
    goto LAB33;

LAB9:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB11:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB13:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB15:    xsi_set_current_line(41, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB17:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB19:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB21:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB23:    xsi_set_current_line(47, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB25:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB27:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

LAB29:    xsi_set_current_line(50, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB33;

}


extern void work_m_06851889093734204745_0320852903_init()
{
	static char *pe[] = {(void *)Always_32_0};
	xsi_register_didat("work_m_06851889093734204745_0320852903", "isim/TestBench_Datapath_isim_beh.exe.sim/work/m_06851889093734204745_0320852903.didat");
	xsi_register_executes(pe);
}

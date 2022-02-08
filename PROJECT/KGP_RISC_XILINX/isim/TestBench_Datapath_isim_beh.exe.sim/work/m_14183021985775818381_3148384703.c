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
static const char *ng0 = "/home/ise/Desktop/Computer Oraganization Laboratory/KGP_RISC_XILINX/ALU_Control.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {64U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {63U, 0U};
static unsigned int ng8[] = {19U, 0U};
static unsigned int ng9[] = {35U, 0U};
static unsigned int ng10[] = {4U, 0U};
static unsigned int ng11[] = {5U, 0U};
static unsigned int ng12[] = {6U, 0U};



static void Always_26_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 2840);
    *((int *)t2) = 1;
    t3 = (t0 + 2552);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(120, ng0);

LAB76:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 7);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(30, ng0);

LAB24:    xsi_set_current_line(31, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);

LAB25:    t7 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 10, t7, 10);
    if (t9 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 10, t2, 10);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 10, t2, 10);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 10, t2, 10);
    if (t6 == 1)
        goto LAB32;

LAB33:
LAB35:
LAB34:    xsi_set_current_line(49, ng0);

LAB41:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 7);

LAB36:    goto LAB23;

LAB9:    xsi_set_current_line(56, ng0);

LAB42:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);

LAB43:    t3 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 10, t3, 10);
    if (t9 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 10, t2, 10);
    if (t6 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 10, t2, 10);
    if (t6 == 1)
        goto LAB48;

LAB49:
LAB51:
LAB50:    xsi_set_current_line(71, ng0);

LAB56:    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 7);

LAB52:    goto LAB23;

LAB11:    xsi_set_current_line(78, ng0);

LAB57:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);

LAB58:    t3 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 10, t3, 10);
    if (t9 == 1)
        goto LAB59;

LAB60:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 10, t2, 10);
    if (t6 == 1)
        goto LAB61;

LAB62:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 10, t2, 10);
    if (t6 == 1)
        goto LAB63;

LAB64:
LAB66:
LAB65:    xsi_set_current_line(93, ng0);

LAB71:    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 7);

LAB67:    goto LAB23;

LAB13:    xsi_set_current_line(100, ng0);

LAB72:    xsi_set_current_line(101, ng0);
    t3 = ((char*)((ng3)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB23;

LAB15:    xsi_set_current_line(105, ng0);

LAB73:    xsi_set_current_line(106, ng0);
    t3 = ((char*)((ng6)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB23;

LAB17:    xsi_set_current_line(110, ng0);

LAB74:    xsi_set_current_line(111, ng0);
    t3 = ((char*)((ng2)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB23;

LAB19:    xsi_set_current_line(115, ng0);

LAB75:    xsi_set_current_line(116, ng0);
    t3 = ((char*)((ng7)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB23;

LAB26:    xsi_set_current_line(33, ng0);

LAB37:    xsi_set_current_line(34, ng0);
    t10 = ((char*)((ng3)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 7);
    goto LAB36;

LAB28:    xsi_set_current_line(37, ng0);

LAB38:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB36;

LAB30:    xsi_set_current_line(41, ng0);

LAB39:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB36;

LAB32:    xsi_set_current_line(45, ng0);

LAB40:    xsi_set_current_line(46, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB36;

LAB44:    xsi_set_current_line(59, ng0);

LAB53:    xsi_set_current_line(60, ng0);
    t7 = ((char*)((ng8)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 7);
    goto LAB52;

LAB46:    xsi_set_current_line(63, ng0);

LAB54:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng5)));
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 7);
    goto LAB52;

LAB48:    xsi_set_current_line(67, ng0);

LAB55:    xsi_set_current_line(68, ng0);
    t3 = ((char*)((ng9)));
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 7);
    goto LAB52;

LAB59:    xsi_set_current_line(81, ng0);

LAB68:    xsi_set_current_line(82, ng0);
    t10 = ((char*)((ng8)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 7);
    goto LAB67;

LAB61:    xsi_set_current_line(85, ng0);

LAB69:    xsi_set_current_line(86, ng0);
    t3 = ((char*)((ng5)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB67;

LAB63:    xsi_set_current_line(89, ng0);

LAB70:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng9)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 7);
    goto LAB67;

}


extern void work_m_14183021985775818381_3148384703_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_14183021985775818381_3148384703", "isim/TestBench_Datapath_isim_beh.exe.sim/work/m_14183021985775818381_3148384703.didat");
	xsi_register_executes(pe);
}

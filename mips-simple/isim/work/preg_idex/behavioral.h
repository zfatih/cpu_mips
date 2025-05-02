////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_preg_idex_behavioral_H
#define H_Work_preg_idex_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_preg_idex_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[13];

  char t97;
  char t98;
  char t99;
  char *t100;
HSimConstraints *c101;
HSimConstraints *c102;
  char t103;
  char *t104;
HSimConstraints *c105;
HSimConstraints *c106;
  char t107;
  char t108;
  char t109;
  char *t110;
HSimConstraints *c111;
HSimConstraints *c112;
  char t113;
  char t114;
  char t115;
  char t116;
  char t117;
  char *t118;
HSimConstraints *c119;
HSimConstraints *c120;
  char t121;
  char *t122;
HSimConstraints *c123;
HSimConstraints *c124;
  char t125;
  char *t126;
HSimConstraints *c127;
HSimConstraints *c128;
  char t129;
  char t130;
  char t131;
  char t132;
  char *t133;
HSimConstraints *c134;
HSimConstraints *c135;
  char t136;
  char *t137;
HSimConstraints *c138;
HSimConstraints *c139;
  char t140;
  char t141;
  char t142;
  char t143;
  char *t144;
HSimConstraints *c145;
HSimConstraints *c146;
  char t147;
  char *t148;
HSimConstraints *c149;
HSimConstraints *c150;
    Work_preg_idex_behavioral(const char * name);
    ~Work_preg_idex_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_preg_idex_behavioral(const char *name);

#endif

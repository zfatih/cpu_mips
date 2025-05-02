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

    HSim__s1 SE[17];

  char t0;
  char t1;
  char t2;
  char t3;
  char t4;
  char t5;
  char *t6;
HSimConstraints *c7;
HSimConstraints *c8;
  char t9;
  char *t10;
HSimConstraints *c11;
HSimConstraints *c12;
  char t13;
  char *t14;
HSimConstraints *c15;
HSimConstraints *c16;
  char t17;
  char *t18;
HSimConstraints *c19;
HSimConstraints *c20;
  char t21;
  char *t22;
HSimConstraints *c23;
  char *t24;
HSimConstraints *c25;
  char t26;
  char t27;
  char t28;
  char t29;
  char t30;
  char t31;
  char t32;
  char t33;
  char *t34;
HSimConstraints *c35;
HSimConstraints *c36;
  char t37;
  char *t38;
HSimConstraints *c39;
HSimConstraints *c40;
  char t41;
  char *t42;
HSimConstraints *c43;
HSimConstraints *c44;
  char t45;
  char *t46;
HSimConstraints *c47;
HSimConstraints *c48;
  char t49;
  char *t50;
HSimConstraints *c51;
  char *t52;
HSimConstraints *c53;
  char t54;
  char t55;
  char t56;
  char t57;
  char t58;
  char *t59;
HSimConstraints *c60;
HSimConstraints *c61;
  char t62;
  char *t63;
HSimConstraints *c64;
HSimConstraints *c65;
  char t66;
  char *t67;
HSimConstraints *c68;
HSimConstraints *c69;
  char t70;
  char *t71;
HSimConstraints *c72;
HSimConstraints *c73;
  char t74;
  char *t75;
HSimConstraints *c76;
  char *t77;
HSimConstraints *c78;
  char t79;
  char t80;
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

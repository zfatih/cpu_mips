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

#ifndef H_Work_preg_memwb_behavioral_H
#define H_Work_preg_memwb_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_preg_memwb_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[10];

  char t0;
  char *t1;
HSimConstraints *c2;
HSimConstraints *c3;
  char t4;
  char t5;
  char *t6;
HSimConstraints *c7;
HSimConstraints *c8;
  char t9;
  char *t10;
HSimConstraints *c11;
HSimConstraints *c12;
  char *t13;
    Work_preg_memwb_behavioral(const char * name);
    ~Work_preg_memwb_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_preg_memwb_behavioral(const char *name);

#endif

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

#ifndef H_Work_registri_behavioral_H
#define H_Work_registri_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_registri_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[8];

  HSimArrayType Nizbase;
  HSimArrayType Niz;
  char *t36;
    HSim__s1 SA[1];
  int t37;
  char *t38;
  char t39;
  char t40;
  char t41;
  char t42;
HSimConstraints *c43;
    Work_registri_behavioral(const char * name);
    ~Work_registri_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_registri_behavioral(const char *name);

#endif

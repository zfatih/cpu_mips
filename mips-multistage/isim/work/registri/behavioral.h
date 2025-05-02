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

    HSim__s1 SE[9];

  HSimArrayType Nizbase;
  HSimArrayType Niz;
  char *t61;
    HSim__s1 SA[1];
  int t62;
  char *t63;
  char t64;
  char t65;
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

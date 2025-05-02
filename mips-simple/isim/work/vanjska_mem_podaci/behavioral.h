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

#ifndef H_Work_vanjska_mem_podaci_behavioral_H
#define H_Work_vanjska_mem_podaci_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_vanjska_mem_podaci_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[5];

  HSimArrayType Nizbase;
  HSimArrayType Niz;
  char *t396;
    HSim__s1 SA[1];
  int t397;
  char *t398;
  char t399;
  char t400;
    Work_vanjska_mem_podaci_behavioral(const char * name);
    ~Work_vanjska_mem_podaci_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_vanjska_mem_podaci_behavioral(const char *name);

#endif

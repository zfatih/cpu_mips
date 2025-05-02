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

#ifndef H_Work_preg_exmem_behavioral_H
#define H_Work_preg_exmem_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_preg_exmem_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[10];

  char t357;
  char *t358;
HSimConstraints *c359;
HSimConstraints *c360;
  char t361;
  char t362;
  char *t363;
HSimConstraints *c364;
HSimConstraints *c365;
  char t366;
  char *t367;
HSimConstraints *c368;
HSimConstraints *c369;
    Work_preg_exmem_behavioral(const char * name);
    ~Work_preg_exmem_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_preg_exmem_behavioral(const char *name);

#endif

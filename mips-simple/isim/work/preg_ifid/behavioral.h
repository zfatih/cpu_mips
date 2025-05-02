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

#ifndef H_Work_preg_ifid_behavioral_H
#define H_Work_preg_ifid_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_preg_ifid_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[8];

  char *t22;
  char *t23;
    Work_preg_ifid_behavioral(const char * name);
    ~Work_preg_ifid_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_preg_ifid_behavioral(const char *name);

#endif

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

#ifndef H_Work_alu_behave_H
#define H_Work_alu_behave_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_alu_behave: public HSim__s6 {
public:

    HSim__s1 SE[5];

    HSim__s1 SA[6];
HSimConstraints *c303;
  char *t304;
HSimConstraints *c305;
  char *t306;
HSimConstraints *c307;
  char *t308;
HSimConstraints *c309;
  char *t310;
  char t311;
  char t312;
  char t313;
  char t314;
  char t315;
  char t316;
    Work_alu_behave(const char * name);
    ~Work_alu_behave();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_alu_behave(const char *name);

#endif

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

#ifndef H_Work_alu_behavioral_H
#define H_Work_alu_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_alu_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[6];

    HSim__s1 SA[1];
  char t86;
HSimConstraints *c87;
HSimConstraints *c88;
  char *t89;
  char t90;
HSimConstraints *c91;
HSimConstraints *c92;
  char t93;
HSimConstraints *c94;
HSimConstraints *c95;
    Work_alu_behavioral(const char * name);
    ~Work_alu_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_alu_behavioral(const char *name);

#endif

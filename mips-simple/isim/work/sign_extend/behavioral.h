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

#ifndef H_Work_sign_extend_behavioral_H
#define H_Work_sign_extend_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_sign_extend_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[2];

HSimConstraints *c82;
  char *t83;
HSimConstraints *c84;
HSimConstraints *c85;
HSimConstraints *c86;
    Work_sign_extend_behavioral(const char * name);
    ~Work_sign_extend_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_sign_extend_behavioral(const char *name);

#endif

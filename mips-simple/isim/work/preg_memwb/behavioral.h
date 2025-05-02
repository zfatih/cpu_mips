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

    HSim__s1 SE[9];

  char t417;
  char *t418;
HSimConstraints *c419;
HSimConstraints *c420;
  char t421;
  char t422;
  char *t423;
HSimConstraints *c424;
HSimConstraints *c425;
  char t426;
  char *t427;
HSimConstraints *c428;
HSimConstraints *c429;
  char *t430;
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

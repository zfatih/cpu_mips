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

#ifndef H_Work_mux_mem_data_in_behavioral_H
#define H_Work_mux_mem_data_in_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mux_mem_data_in_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[5];

  char t625;
HSimConstraints *c626;
  char t627;
HSimConstraints *c628;
  char t629;
HSimConstraints *c630;
    Work_mux_mem_data_in_behavioral(const char * name);
    ~Work_mux_mem_data_in_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mux_mem_data_in_behavioral(const char *name);

#endif

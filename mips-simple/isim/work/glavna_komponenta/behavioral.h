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

#ifndef H_Work_glavna_komponenta_behavioral_H
#define H_Work_glavna_komponenta_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_glavna_komponenta_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[1];

    HSim__s1 SA[38];
    Work_glavna_komponenta_behavioral(const char * name);
    ~Work_glavna_komponenta_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_glavna_komponenta_behavioral(const char *name);

#endif

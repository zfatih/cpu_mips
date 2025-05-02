# MIPS CPU Pipeline Implementation in VHDL (Xilinx)

This project contains an implementation of a **MIPS CPU** with a 5-stage pipeline, developed using **VHDL** in **Xilinx ISE** platform. The project demonstrates the execution of a MIPS processor with different pipeline techniques to handle **data hazards**, **control hazards**, and **structural hazards**.

## Key Features:

- **MIPS Without Forwarding (Stall-based Hazard Resolution)**:  
  - The basic MIPS pipeline where data dependencies between instructions are resolved by inserting **pipeline stalls**. This technique highlights how the CPU handles **data hazards** when forwarding is not implemented.

- **MIPS With Forwarding (Hazard Prevention)**:  
  - This implementation includes **data forwarding**, where the result from one stage of the pipeline (e.g., EX or MEM) is forwarded to another stage to resolve data hazards without waiting for the data to be written to the register file. This results in efficiency improvements of the processor.

- **Complete MIPS 5-Stage Pipeline**:  
  - The CPU design follows the **classic MIPS 5-stage pipeline** model:  
    1. **IF** - Instruction Fetch  
    2. **ID** - Instruction Decode  
    3. **EX** - Execute  
    4. **MEM** - Memory Access  
    5. **WB** - Write-back  
  - This model simulates real-world instruction execution with the ability to observe the flow of instructions through each stage, handling hazards and forwarding mechanisms.

## Why This Is Useful:
- **Educational Tool**: This project serves as a practical demonstration of how a pipelined MIPS processor works in hardware and how different optimization techniques (forwarding, stalls) impact performance.
#include <iostream>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vcontrol_unit.h"

#define MAX_SIM_CYC 1000000

int main(int argc, char **argv, char **env) {
  int simcyc;     // simulation clock count
  int tick;       // each clk cycle has two ticks for two edges

  Verilated::commandArgs(argc, argv);
  // init top verilog instance
  Vcontrol_unit* top = new Vcontrol_unit;
  // init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("control_unit.vcd");

  std::vector<int> program = {0x0ff00313, 0x00000513, 0x00000593, 0x00058513, 0x00158593, 0xfe659ce3, 0xfe0318e3};

  // initialize simulation input 
  top->EQ = 0;
  top->INSTRUCTION = program[0];



  // run simulation for MAX_SIM_CYC clock cycles
  for (int a=0; a<program.size(); a++){
    top->INSTRUCTION = program[a];

    top->eval();
    
    std::cout << "PC_src: " << (int)top->PC_src << std::endl;
    std::cout << "ALU_src: " << (int)top->ALU_src << std::endl;
    std::cout << "ALU_control: " << (int)top->ALU_control << std::endl;
    std::cout << "imm_src: " << (int)top->imm_src << std::endl;
    std::cout << "reg_write: " << (int)top->reg_write << std::endl;
    std::cout << std::endl;

  }

  tfp->close(); 
  printf("Exiting\n");
  exit(0);
}

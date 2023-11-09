#include "Vcompositor.h"
#include "verilated.h"
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <iostream>

const char a[2] = {0, 15};

int main(int argc, char **argv) {
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  auto top = new Vcompositor{contextp};

  for (int i = 0; i < 10; i++) {
    top->eval();
  }

  delete top;
  delete contextp;
  return 0;
}

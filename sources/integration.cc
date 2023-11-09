#include "Vintegration.h"
#include "verilated.h"
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <iostream>

int main(int argc, char **argv) {
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  auto top = new Vintegration{contextp};

  delete top;
  delete contextp;
  return 0;
}

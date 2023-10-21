#include "Vmusic.h"
#include "verilated.h"
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <iostream>

const char a[2] = {0, 15};

int main(int argc, char **argv) {
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);

  auto top = new Vmusic{contextp};

  std::ofstream pcm("music.pcm", std::ios::trunc | std::ios::binary);

  uint64_t counter = 0;

  while (!top->finished) {
    top->clk = 0;
    top->eval();
    top->clk = 1;
    top->eval();

    counter++;

    // resample from 25MHz to 44100Hz
    if (counter == 567) {
      pcm.write(&a[top->speaker], 1);
      counter = 0;
    }
  }

  pcm.close();

  delete top;

  delete contextp;
  return 0;
}

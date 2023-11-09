#include "Vintegration.h"
#include "verilated.h"
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <format>
#include <fstream>
#include <iostream>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

int main(int argc, char **argv) {
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  auto top = new Vintegration{contextp};

  uint8_t image[800 * 525 * 4];

  int frames = 0;
  int vsync = 0;
  int idx = 0;

  while (frames < 10) {
    top->CLK100MHZ = 0;
    top->eval();

    top->CLK100MHZ = 1;
    top->eval();

    if (!vsync && top->VGA_VS) {
      frames++;

      assert(stbi_write_png(std::format("output{}.png", frames).c_str(), 800,
                            525, 4, image, 800 * 4));

      idx = 0;
    }

    image[idx++] = top->VGA_R << 4;
    image[idx++] = top->VGA_G << 4;
    image[idx++] = top->VGA_B << 4;
    image[idx++] = 255;

    vsync = top->VGA_VS;
  }

  delete top;
  delete contextp;
  return 0;
}

#include "Vcompositor.h"
#include "verilated.h"
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <iostream>

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

int main(int argc, char **argv) {
  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  auto top = new Vcompositor{contextp};

  int width_prev, height_prev, channels_prev;
  unsigned char *prev = stbi_load("../../artwork/background.png", &width_prev,
                                  &height_prev, &channels_prev, 0);
  assert(prev);
  assert(channels_prev == 4);

  int width_curr, height_curr, channels_curr;
  unsigned char *curr = stbi_load("../../artwork/logo.png", &width_curr,
                                  &height_curr, &channels_curr, 0);
  assert(curr);
  assert(channels_curr == 4);

  assert(width_curr == width_prev);
  assert(height_curr == height_prev);

  unsigned char *data =
      new unsigned char[width_prev * height_prev * channels_prev];

  for (int h = 0; h < height_prev; h++) {
    for (int w = 0; w < width_prev; w++) {
      auto i = (h * width_prev + w) * channels_prev;

      auto r_prev = prev[i + 0];
      auto g_prev = prev[i + 1];
      auto b_prev = prev[i + 2];
      auto a_prev = prev[i + 3];

      auto r_curr = curr[i + 0];
      auto g_curr = curr[i + 1];
      auto b_curr = curr[i + 2];
      auto a_curr = curr[i + 3];

      top->R_prev = r_prev >> 4;
      top->G_prev = g_prev >> 4;
      top->B_prev = b_prev >> 4;
      top->A_prev = a_prev >> 4;

      top->R_curr = r_curr >> 4;
      top->G_curr = g_curr >> 4;
      top->B_curr = b_curr >> 4;
      top->A_curr = a_curr != 0;

      top->eval();

      data[i + 0] = top->R_next << 4;
      data[i + 1] = top->G_next << 4;
      data[i + 2] = top->B_next << 4;
      data[i + 3] = top->A_next ? 255 : 0;
    }
  }

  assert(stbi_write_png("output.png", width_prev, height_prev, channels_prev,
                        data, width_prev * channels_prev));

  delete top;
  delete contextp;
  return 0;
}

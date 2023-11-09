#include "Vintegration.h"
#include "verilated.h"
#include <SDL2/SDL.h>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <format>
#include <fstream>
#include <iostream>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

int main(int argc, char **argv) {
  SDL_Window *window = NULL;
  SDL_Surface *surface = NULL;

  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
  }

  window =
      SDL_CreateWindow("VGA Display", SDL_WINDOWPOS_UNDEFINED,
                       SDL_WINDOWPOS_UNDEFINED, 800, 525, SDL_WINDOW_SHOWN);

  if (window == NULL) {
    printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
  }

  surface = SDL_GetWindowSurface(window);

  SDL_FillRect(surface, NULL, SDL_MapRGB(surface->format, 0xFF, 0xFF, 0xFF));
  SDL_UpdateWindowSurface(window);

  // Hack to get window to stay up
  SDL_Event e;
  bool quit = false;
  while (quit == false) {
    while (SDL_PollEvent(&e)) {
      if (e.type == SDL_QUIT)
        quit = true;
    }
  }

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

  SDL_DestroyWindow(window);
  SDL_Quit();
}

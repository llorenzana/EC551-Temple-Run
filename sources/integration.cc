#include "Vintegration.h"
#include "verilated.h"
#include <SDL2/SDL.h>
#include <SDL_events.h>
#include <SDL_stdinc.h>
#include <cassert>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <format>
#include <fstream>
#include <iostream>
#include <thread>

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

  VerilatedContext *contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  auto top = new Vintegration{contextp};

  top->CPU_RESETN = 1;

  uint8_t image[800 * 525 * 4];

  int frames = 0;
  int vsync = 0;
  int idx = 0;
  int div = 0;

  while (true) {
    top->CLK100MHZ = 0;
    top->eval();

    top->CLK100MHZ = 1;
    top->eval();

    if (!vsync && top->VGA_VS) {
      frames++;
      idx = 0;

      SDL_memcpy(surface->pixels, image, 800 * 525 * 4);
      SDL_UpdateWindowSurface(window);

      // std::this_thread::sleep_for(std::chrono::milliseconds(1));
      SDL_Event e;
      if (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT)
          break;
        if (e.type == SDL_KEYDOWN || e.type == SDL_KEYUP) {
          switch (e.key.keysym.sym) {
          case SDLK_LEFT:
            if (e.key.type == SDL_KEYDOWN) {
              top->BTNL = 1;
            } else {
              top->BTNL = 0;
            }
            break;
          case SDLK_RIGHT:
            if (e.key.type == SDL_KEYDOWN) {
              top->BTNR = 1;
            } else {
              top->BTNR = 0;
            }
            break;
          }
        }
      }
    }

    div++;

    if (div == 4) {
      image[idx++] = top->VGA_B << 4;
      image[idx++] = top->VGA_G << 4;
      image[idx++] = top->VGA_R << 4;
      image[idx++] = 255;
      div = 0;
    }

    vsync = top->VGA_VS;
  }

  delete top;
  delete contextp;

  SDL_DestroyWindow(window);
  SDL_Quit();

  return 0;
}

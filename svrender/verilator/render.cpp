#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>
#include <vector>

#include "absl/strings/str_format.h"

#include "Vrender.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vrender;

typedef int32_t vec3[3];

template<typename Rep, typename Period>
nanoseconds::rep to_ns(
    std::chrono::duration<Rep, Period> dur
) {
    return std::chrono::duration_cast<nanoseconds>(dur).count();
}

class DUT {
private:
    std::unique_ptr<Module> module;
    nanoseconds clock_period;
    vluint64_t m_counter;

public:
    DUT(nanoseconds clock_period):
        module(std::make_unique<Module>()),
        clock_period(clock_period),
        m_counter(0) {
        module->clk = 0;
        // module->rst = 1;
    }

    vluint64_t counter() {
        return m_counter;
    }

    nanoseconds time() {
        return clock_period * counter();
    }

     void tick() {
         const auto period = to_ns(clock_period);

         module->clk = 0;
         module->eval();

         module->clk = 1;
         module->eval();

         m_counter ++;
     }

    // void reset() {
       //  module->rst = 1;
      //   tick();
     //    module->rst = 0;
    // }

    virtual ~DUT() {
        module->final();
    }

    Module* operator->() {
        return module.get();
    }
};

double to_fixed(int32_t x) {
    return double((x << 5) >> 5) / double(1 << 22);
}
int32_t double_to_fixed(double x) {
   int32_t y = round(x * (1 << 22));
   return y & ((1 << 27) - 1);
}

double double_from_short_fixed(int32_t x) {
    return double((x << 14) >> 14) / double(1 << 13);
}

int32_t double_to_short_fixed(double x) {
   int32_t y = round(x * (1 << 13));
   return y & ((1 << 18) - 1);
}

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 1ms;
    DUT dut(clock_period);

    Verilated::mkdir("simout");

    // dut.reset();
    std::vector<std::array<int32_t, 3>> abuf, bbuf, cbuf, nbuf;
    double a0, a1, a2, b0, b1, b2, c0, c1, c2, n0, n1, n2;
    while(scanf("%lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf", &a0, &a1, &a2, &b0, &b1, &b2, &c0, &c1, &c2, &n0, &n1, &n2)!= EOF)
    {
      abuf.push_back({double_to_short_fixed(a0), double_to_short_fixed(a1), double_to_short_fixed(a2)});
      bbuf.push_back({double_to_short_fixed(b0), double_to_short_fixed(b1), double_to_short_fixed(b2)});
      cbuf.push_back({double_to_short_fixed(c0), double_to_short_fixed(c1), double_to_short_fixed(c2)});
      nbuf.push_back({double_to_short_fixed(n0), double_to_short_fixed(n1), double_to_short_fixed(n2)});
    }
    int32_t q[4] = { double_to_short_fixed(0), double_to_short_fixed(0) , double_to_short_fixed(0) , double_to_short_fixed(0)  };
    double dxy = 1.0 / 600.0;
    size_t ntri = abuf.size();

    dut->last_tri = true;
    dut->last_pix = true;
    dut.tick();

    for (size_t y = 0; y < 600; y++) {
      for (size_t x = 0; x < 600; x++) {
        uint32_t fb_addr = y * 600 + x;
        int32_t dir[3] = { double_to_fixed(dxy * x - dxy * 300.0), double_to_fixed(dxy * y - dxy * 300.0)  ,double_to_fixed(-1) };
        bool last_pix = x == 599 && y == 599;
        for (size_t i = 0; i < ntri; i++) {
          bool last_tri = i == ntri - 1;
          dut->a[0] = bbuf[i][0];
          dut->a[1] = bbuf[i][1];
          dut->a[2] = bbuf[i][2];
          dut->b[0] = cbuf[i][0];
          dut->b[1] = cbuf[i][1];
          dut->b[2] = cbuf[i][2];
          dut->c[0] = abuf[i][0];
          dut->c[1] = abuf[i][1];
          dut->c[2] = abuf[i][2];
          dut->n[0] = nbuf[i][0];
          dut->n[1] = nbuf[i][1];
          dut->n[2] = nbuf[i][2];
          dut->dir[0] = dir[0];
          dut->dir[1] = dir[1];
          dut->dir[2] = dir[2];
          dut->q[0] = q[0];
          dut->q[1] = q[1];
          dut->q[2] = q[2];
          dut->q[3] = q[3];
          dut->fb_addr = fb_addr;
          dut->last_tri = last_tri;
          dut->last_pix = last_pix;
          dut.tick();

          int32_t ofb_addr = dut->ofb_addr;
          bool olast_tri = dut->olast_tri;
          bool olast_pix = dut->olast_pix;
          bool hit = dut->hit;
          double oa = to_fixed(dut->oa);
          double t = to_fixed(dut->t);
          uint8_t bri = dut->bri;
          std::cout << absl::StreamFormat("%u %d %d %d %lf %lf %u\n", ofb_addr, olast_tri, olast_pix , hit, oa, t, bri);
        }
      }
    }
}

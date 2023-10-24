#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>
#include <vector>

#include "absl/strings/str_format.h"

#include "Vrender_reduce.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vrender_reduce;

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
   // int32_t q[4] = { double_to_short_fixed(0.13052619222005177), double_to_short_fixed(0) , double_to_short_fixed(0) , double_to_short_fixed(-0.991444861373810) };
    //dut->last_pix = true;
    dut.tick();

    for (size_t y = 0; y < 600 * 600 * 1024; y++) {
dut.tick();

          if (dut->valid_w) {
            if ((dut->fb_addr_w & 1023) == 0) {
              std::cerr << absl::StreamFormat(
                "[%9d] fb_addr_w = %d\n", dut.counter(), dut->fb_addr_w
              );
            }
            std::cout << absl::StreamFormat(
              "%d %d %d\n", dut->fb_addr_w, dut->hit_w, dut->bri_w
            );
          }
    }

    while (! (dut->valid_w && dut->swap)) {
      dut.tick();

      if (dut->valid_w) {
        std::cout << absl::StreamFormat(
          "%d %d %d\n", dut->fb_addr_w, dut->hit_w, dut->bri_w
        );
      }
    }

    std::cerr << absl::StreamFormat(
      "[%9d] == Finish ==\n", dut.counter()
    );

}

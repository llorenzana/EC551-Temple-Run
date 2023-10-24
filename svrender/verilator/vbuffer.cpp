#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vvbuffer.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vvbuffer;

template<typename Rep, typename Period>
nanoseconds::rep to_ns(
    std::chrono::duration<Rep, Period> dur
) {
    return std::chrono::duration_cast<nanoseconds>(dur).count();
}

class DUT {
private:
    std::unique_ptr<Module> module;
    std::unique_ptr<VerilatedFstC> trace;
    nanoseconds clock_period;
    vluint64_t m_counter;

public:
    DUT(nanoseconds clock_period):
        module(std::make_unique<Module>()),
        trace(),
        clock_period(clock_period),
        m_counter(0) {
        module->read_clock = 0;
        // module->rst = 1;
    }

    vluint64_t counter() {
        return m_counter;
    }

    nanoseconds time() {
        return clock_period * counter();
    }

    void open_trace(const char *filename) {
        Verilated::traceEverOn(true);
        trace = std::make_unique<VerilatedFstC>();
        module->trace(trace.get(), 0);
        trace->open(filename);
    }

     void tick() {
         const auto period = to_ns(clock_period);

         if (trace)
             trace->dump(period * m_counter);

         module->read_clock = 0;
         module->eval();

         if (trace)
             trace->dump(period * m_counter + period / 2);

         module->read_clock = 1;
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
    return double(x) / double(1 << 22);
}

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 1ms;
    DUT dut(clock_period);

    Verilated::mkdir("simout");
    dut.open_trace("simout/vbuffer.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<22), (1<<22)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < 4096; T ++) {
        dut->read_addr = T;
        dut.tick();
        for(int i = 0; i < 7; i++)
           std::cout << dut->q[i] << std::endl;
    }
}

#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vbrightness.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vbrightness;

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
        module->clk = 0;
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

         module->clk = 0;
         module->eval();

         if (trace)
             trace->dump(period * m_counter + period / 2);

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
    return double(x) / double(1 << 22);
}

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 1ms;
    DUT dut(clock_period);

    Verilated::mkdir("simout");
    dut.open_trace("simout/brightness.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<22), (1<<22)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < total_tests; T ++) {
        int32_t a0 = dist(rng),a1 = dist(rng),a2 = dist(rng), b0 = dist(rng),b1 = dist(rng),b2 = dist(rng);
        dut->tnorm[0] = a0;
        dut->tnorm[1] = a1;
        dut->tnorm[2] = a2;
        dut->dir[0] = b0;
        dut->dir[1] = b1;
        dut->dir[2] = b2;
        dut.tick();
        int32_t a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->tnorm[0] = a01;
        dut->tnorm[1] = a11;
        dut->tnorm[2] = a21;
        dut->dir[0] = b01;
        dut->dir[1] = b11;
        dut->dir[2] = b21;
        dut.tick();
        a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->tnorm[0] = a01;
        dut->tnorm[1] = a11;
        dut->tnorm[2] = a21;
        dut->dir[0] = b01;
        dut->dir[1] = b11;
        dut->dir[2] = b21;
        dut.tick();
        a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->tnorm[0] = a01;
        dut->tnorm[1] = a11;
        dut->tnorm[2] = a21;
        dut->dir[0] = b01;
        dut->dir[1] = b11;
        dut->dir[2] = b21;
        dut.tick();
        a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->tnorm[0] = a01;
        dut->tnorm[1] = a11;
        dut->tnorm[2] = a21;
        dut->dir[0] = b01;
        dut->dir[1] = b11;
        dut->dir[2] = b21;
        dut.tick();
        a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->tnorm[0] = a01;
        dut->tnorm[1] = a11;
        dut->tnorm[2] = a21;
        dut->dir[0] = b01;
        dut->dir[1] = b11;
        dut->dir[2] = b21;
        uint8_t res = dut->res;
        double tny2 = (to_fixed(a1) * 2);
        double sv0 = to_fixed(a0) * tny2;
        double sv1 = to_fixed(a1) * tny2 - 1;
        double sv2 = to_fixed(a2) * tny2;
        double ref = (sv0 * to_fixed(b0) + sv1 * to_fixed(b1) + sv2 * to_fixed(b2) + 1) * 127.5;
        if (ref < 0) ref = 0;
        if (ref > 255) ref = 255;
        total_error += abs(res - ref);
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

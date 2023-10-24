#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vfixed_qv.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vfixed_qv;

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
    return double(x) / double(1 << 13);
}

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 1ms;
    DUT dut(clock_period);

    Verilated::mkdir("simout");
    dut.open_trace("simout/fixed_qv.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<13), (1<<13)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < total_tests; T ++) {
        int32_t a0 = dist(rng),a1 = dist(rng),a2 = dist(rng), b0 = dist(rng), b1 = dist(rng), b2 = dist(rng),b = dist(rng);
        dut->v[0] = a0;
        dut->v[1] = a1;
        dut->v[2] = a2;
        dut->q[0] = b0;
        dut->q[1] = b1;
        dut->q[2] = b2;
        dut->q[3] = b;
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        double result0 = to_fixed(int32_t(dut->res[0] << 14) >> 14);
        double result1 = to_fixed(int32_t(dut->res[1] << 14) >> 14);
        double result2 = to_fixed(int32_t(dut->res[2] << 14) >> 14);
        double t0 = (to_fixed(b1) * to_fixed(a2) - to_fixed(b2) * to_fixed(a1)) * 2;
        double t1 = (to_fixed(b2) * to_fixed(a0) - to_fixed(b0) * to_fixed(a2)) * 2;
        double t2 = (to_fixed(b0) * to_fixed(a1) - to_fixed(b1) * to_fixed(a0)) * 2;
        double qt0 = (to_fixed(b1) * t2 - to_fixed(b2) * t1);
        double qt1 = (to_fixed(b2) * t0 - to_fixed(b0) * t2);
        double qt2 = (to_fixed(b0) * t1 - to_fixed(b1) * t0);
        double ref0 = to_fixed(a0) + t0 * to_fixed(b) + qt0;
        double ref1 = to_fixed(a1) + t1 * to_fixed(b) + qt1;
        double ref2 = to_fixed(a2) + t2 * to_fixed(b) + qt2;
        total_error += abs(result0 - ref0) + abs(result1 - ref1) + abs(result2 - ref2);
        if ( abs(result0 - ref0) + abs(result1 - ref1) + abs(result2 - ref2)> 1e-6) {
        }
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

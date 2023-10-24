#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vfixed_dot.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vfixed_dot;

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
    dut.open_trace("simout/fixed_dot.fst");

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
        dut->a[0] = a0;
        dut->a[1] = a1;
        dut->a[2] = a2;
        dut->b[0] = b0;
        dut->b[1] = b1;
        dut->b[2] = b2;
        dut.tick();
        int32_t a01 = dist(rng),a11 = dist(rng),a21 = dist(rng), b01 = dist(rng),b11 = dist(rng),b21 = dist(rng);
        dut->a[0] = a01;
        dut->a[1] = a11;
        dut->a[2] = a21;
        dut->b[0] = b01;
        dut->b[1] = b11;
        dut->b[2] = b21;
        dut.tick();
        int32_t a02 = dist(rng),a12 = dist(rng),a22 = dist(rng), b02 = dist(rng),b12 = dist(rng),b22 = dist(rng);
        dut->a[0] = a02;
        dut->a[1] = a12;
        dut->a[2] = a22;
        dut->b[0] = b02;
        dut->b[1] = b12;
        dut->b[2] = b22;
        dut.tick();
        int32_t a03 = dist(rng),a13 = dist(rng),a23 = dist(rng), b03 = dist(rng),b13 = dist(rng),b23 = dist(rng);
        dut->a[0] = a03;
        dut->a[1] = a13;
        dut->a[2] = a23;
        dut->b[0] = b03;
        dut->b[1] = b13;
        dut->b[2] = b23;
 
        double result = to_fixed(int32_t(dut->res << 5) >> 5);
        double ref = to_fixed(a0) * to_fixed(b0) + to_fixed(a1) * to_fixed(b1) + to_fixed(a2) * to_fixed(b2);
        total_error += abs(result - ref);
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vfixed_qq.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vfixed_qq;

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
    dut.open_trace("simout/fixed_qq.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<13), (1<<13)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < total_tests; T ++) {
        int32_t aq10 = dist(rng),aq11 = dist(rng),aq12 = dist(rng), aq13 = dist(rng), aq20 = dist(rng), aq21 = dist(rng),aq22 = dist(rng), aq23 = dist(rng);
        dut->q1[0] = aq10;
        dut->q1[1] = aq11;
        dut->q1[2] = aq12;
        dut->q1[3] = aq13;
        dut->q2[0] = aq20;
        dut->q2[1] = aq21;
        dut->q2[2] = aq22;
        dut->q2[3] = aq23;
        dut.tick();
        int32_t q10 = dist(rng),q11 = dist(rng),q12 = dist(rng), q13 = dist(rng), q20 = dist(rng), q21 = dist(rng),q22 = dist(rng), q23 = dist(rng);
        dut->q1[0] = q10;
        dut->q1[1] = q11;
        dut->q1[2] = q12;
        dut->q1[3] = q13;
        dut->q2[0] = q20;
        dut->q2[1] = q21;
        dut->q2[2] = q22;
        dut->q2[3] = q23;
        dut.tick();
        q10 = dist(rng),q11 = dist(rng),q12 = dist(rng), q13 = dist(rng), q20 = dist(rng), q21 = dist(rng),q22 = dist(rng), q23 = dist(rng);
        dut->q1[0] = q10;
        dut->q1[1] = q11;
        dut->q1[2] = q12;
        dut->q1[3] = q13;
        dut->q2[0] = q20;
        dut->q2[1] = q21;
        dut->q2[2] = q22;
        dut->q2[3] = q23;
        dut.tick();
        q10 = dist(rng),q11 = dist(rng),q12 = dist(rng), q13 = dist(rng), q20 = dist(rng), q21 = dist(rng),q22 = dist(rng), q23 = dist(rng);
        dut->q1[0] = q10;
        dut->q1[1] = q11;
        dut->q1[2] = q12;
        dut->q1[3] = q13;
        dut->q2[0] = q20;
        dut->q2[1] = q21;
        dut->q2[2] = q22;
        dut->q2[3] = q23;
        dut.tick();
        q10 = dist(rng),q11 = dist(rng),q12 = dist(rng), q13 = dist(rng), q20 = dist(rng), q21 = dist(rng),q22 = dist(rng), q23 = dist(rng);
        dut->q1[0] = q10;
        dut->q1[1] = q11;
        dut->q1[2] = q12;
        dut->q1[3] = q13;
        dut->q2[0] = q20;
        dut->q2[1] = q21;
        dut->q2[2] = q22;
        dut->q2[3] = q23;
        double result0 = to_fixed(int32_t(dut->res[0] << 14) >> 14);
        double result1 = to_fixed(int32_t(dut->res[1] << 14) >> 14);
        double result2 = to_fixed(int32_t(dut->res[2] << 14) >> 14);
        double result3 = to_fixed(int32_t(dut->res[3] << 14) >> 14);
        double t0 = to_fixed(aq11) * to_fixed(aq22) - to_fixed(aq12) * to_fixed(aq21);
        double t1 = to_fixed(aq12) * to_fixed(aq20) - to_fixed(aq10) * to_fixed(aq22);
        double t2 = to_fixed(aq10) * to_fixed(aq21) - to_fixed(aq11) * to_fixed(aq20);
        double ref0 = t0 + to_fixed(aq10) * to_fixed(aq23) + to_fixed(aq20) * to_fixed(aq13);
        double ref1 = t1 + to_fixed(aq11) * to_fixed(aq23) + to_fixed(aq21) * to_fixed(aq13);
        double ref2 = t2 + to_fixed(aq12) * to_fixed(aq23) + to_fixed(aq22) * to_fixed(aq13);
        double ref3 = to_fixed(aq13) * to_fixed(aq23) 
          - to_fixed(aq10) * to_fixed(aq20)
          - to_fixed(aq11) * to_fixed(aq21)
          - to_fixed(aq12) * to_fixed(aq22);
        total_error += abs(result0 - ref0) + abs(result1 - ref1) + abs(result2 - ref2) + abs(result3 - ref3);
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

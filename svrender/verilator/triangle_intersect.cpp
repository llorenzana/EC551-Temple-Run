#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vtriangle_intersect.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vtriangle_intersect;

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
    dut.open_trace("simout/triangle_intersect.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<20), (1<<20)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < total_tests; T ++) {
        int32_t a0 = dist(rng),a1 = dist(rng),a2 = dist(rng);
        int32_t b0 = dist(rng),b1 = dist(rng),b2 = dist(rng);
        int32_t c0 = dist(rng),c1 = dist(rng),c2 = dist(rng);
        int32_t n0 = dist(rng),n1 = dist(rng),n2 = dist(rng);
        int32_t d0 = dist(rng),d1 = dist(rng),d2 = dist(rng);
        dut->a[0] = a0;
        dut->a[1] = a1;
        dut->a[2] = a2;
        dut->b[0] = b0;
        dut->b[1] = b1;
        dut->b[2] = b2;
        dut->c[0] = c0;
        dut->c[1] = c1;
        dut->c[2] = c2;
        dut->n[0] = n0;
        dut->n[1] = n1;
        dut->n[2] = n2;
        dut->dir[0] = d0;
        dut->dir[1] = d1;
        dut->dir[2] = d2;
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        dut.tick();
        double t = to_fixed(int32_t(dut->t << 5) >> 5);
        double oa = to_fixed(int32_t(dut->oa << 5) >> 5);
        double hit = dut->hit;

        
        bool k = to_fixed(d0) * to_fixed(n0)  + to_fixed(d1) * to_fixed(n1) + to_fixed(d2) * to_fixed(n2)  > 0;
        double edge10 = (k ? to_fixed(a0) : to_fixed(b0)) - to_fixed(c0);
        double edge11 = (k ? to_fixed(a1) : to_fixed(b1)) - to_fixed(c1);
        double edge12 = (k ? to_fixed(a2) : to_fixed(b2)) - to_fixed(c2);
        double edge20 = (!k ? to_fixed(a0) : to_fixed(b0)) - to_fixed(c0);
        double edge21 = (!k ? to_fixed(a1) : to_fixed(b1)) - to_fixed(c1);
        double edge22 = (!k ? to_fixed(a2) : to_fixed(b2)) - to_fixed(c2);
        double h0 = to_fixed(d1) * edge22 - to_fixed(d2) * edge21;
        double h1 = to_fixed(d2) * edge20 - to_fixed(d0) * edge22;
        double h2 = to_fixed(d0) * edge21 - to_fixed(d1) * edge20;
        double a = edge10 * h0 + edge11 * h1 + edge12 * h2;
        double s0 = 0 - to_fixed(c0);
        double s1 = 0 - to_fixed(c1);
        double s2 = 4 - to_fixed(c2);
        double u = s0 * h0 + s1 * h1 + s2 * h2;
        double q0 = s1 * edge12 - s2 * edge11;
        double q1 = s2 * edge10 - s0 * edge12;
        double q2 = s0 * edge11 - s1 * edge10;
        double v = to_fixed(d0) * q0 + to_fixed(d1) * q1 + to_fixed(d2) * q2;
        double reft = edge20 * q0 + edge21 * q1 + edge22 * q2;
        double refhit = u >= 0 && u <= a && v >= 0 && v <= a - u && t > 0;
        total_error += abs(t - reft) + abs(oa - a) + abs(hit - refhit);
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

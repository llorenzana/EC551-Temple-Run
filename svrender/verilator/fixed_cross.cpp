#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>

#include "absl/strings/str_format.h"

#include "Vfixed_cross.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vfixed_cross;

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
    //     module->rst = 1;
    //     tick();
    //     module->rst = 0;
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

void cross(const double a[3], const double b[3], double res[3]) {
    res[0] = a[1] * b[2] - a[2] * b[1];
    res[1] = a[2] * b[0] - a[0] * b[2];
    res[2] = a[0] * b[1] - a[1] * b[0];
}

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 1ms;
    DUT dut(clock_period);

    Verilated::mkdir("simout");
    dut.open_trace("simout/fixed_cross.fst");

    // dut.reset();

    std::random_device rd;
    std::mt19937 rng(rd());

    std::uniform_int_distribution<int32_t> dist(
        -(1<<22), (1<<22)
    );

    size_t total_tests = 10000;
    double total_error = 0;

    for (size_t T = 0; T < total_tests; T ++) {
        double af[3], bf[3], rf[3];

        for (size_t i = 0; i < 3; i ++) {
            dut->a[i] = dist(rng) & ((1 << 27) - 1);
            af[i] = to_fixed(dut->a[i]);
            dut->b[i] = dist(rng) & ((1 << 27) - 1);
            bf[i] = to_fixed(dut->b[i]);
        }

        cross(af, bf, rf);

        for (size_t tick = 0; tick < 3; tick ++) {
            dut.tick();

            // Generate garbage
            for (size_t i = 0; i < 3; i ++) {
                dut->a[i] = dist(rng) & ((1 << 27) - 1);
                dut->b[i] = dist(rng) & ((1 << 27) - 1);
            }
        }

        for (size_t i = 0; i < 3; i ++) {
            total_error += abs(rf[i] - to_fixed(dut->res[i]));
        }
    }

    std::cout << absl::StreamFormat(
        "Average error: %g\n", total_error / double(total_tests)
    );
}

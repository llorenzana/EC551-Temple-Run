#include <memory>
#include <utility>
#include <random>
#include <iostream>
#include <chrono>
#include <limits>
#include <cmath>
#include <vector>

#include "absl/strings/str_format.h"

#include "Vserial_data.h"
#include "verilated_fst_c.h"

using std::chrono::nanoseconds;

using Module = Vserial_data;

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
    std::unique_ptr<VerilatedFstC> trace;
    nanoseconds clock_period;
    vluint64_t m_counter;
    uint32_t last_size;

public:
    DUT(nanoseconds clock_period):
        module(std::make_unique<Module>()),
        clock_period(clock_period),
        m_counter(0),
        last_size(0) {
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

        if (module->size != last_size) {
            std::cout << absl::StreamFormat(
                "[%9d] size changed to %d\n",
                counter(), module->size);
            last_size = module->size;
        }

        if (module->we) {
            std::cout << absl::StreamFormat(
                "[%9d] Write to %d",
                counter(), module->addr_w);

            for (size_t i = 0; i < 27; i ++) {
                std::cout << absl::StreamFormat(
                    " %02x", ((char*)(module->data_w))[i]);
            }

            std::cout << "\n";
        }
    }

    virtual ~DUT() {
        module->final();
    }

    Module* operator->() {
        return module.get();
    }
};

int main(int argc, char *argv[]) {
    using namespace std::chrono_literals;

    Verilated::commandArgs(argc, argv);

    auto clock_period = 20ns;
    DUT dut(clock_period);

    Verilated::mkdir("simout");
    dut.open_trace("simout/serial_data.fst");

    dut->valid = 1;

    char cmds[] = {
        2,2,2,2,2,2,2,2,2,2,
        1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 0,
        1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        0,0,0,0,0,5,6,7,8,9,
        2,2,2,2,2,2,2,2,2,2,
        1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
    };

    for (size_t i = 0; i < sizeof(cmds); i ++) {
        dut->data = cmds[i];
        dut.tick();
    }

    dut->valid = 0;

    for (size_t i = 0; i < 10; i ++) {
        dut.tick();
    }

}

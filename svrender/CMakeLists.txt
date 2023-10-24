cmake_minimum_required(VERSION 3.18.0)

project(fixed_mult)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})
find_package(absl REQUIRED)

add_executable(Vfixed_mult verilator/fixed_mult.cpp)

set(verilate_args
    INCLUDE_DIRS src verilator
    TRACE_FST
    VERILATOR_ARGS --trace-params --trace-structs -Wall -O3)

verilate(Vfixed_mult
    TOP_MODULE fixed_mult
    PREFIX Vfixed_mult
    SOURCES src/fixed_mult.sv
    ${verilate_args})

target_link_libraries(Vfixed_mult PRIVATE absl::strings absl::str_format)

add_executable(Vfixed_sv verilator/fixed_sv.cpp)

verilate(Vfixed_sv
    TOP_MODULE fixed_sv
    PREFIX Vfixed_sv
    SOURCES src/fixed_sv.sv
    ${verilate_args})

target_link_libraries(Vfixed_sv PRIVATE absl::strings absl::str_format)

add_executable(Vfixed_dot verilator/fixed_dot.cpp)

verilate(Vfixed_dot
    TOP_MODULE fixed_dot
    PREFIX Vfixed_dot
    SOURCES src/fixed_dot.sv
    ${verilate_args})

target_link_libraries(Vfixed_dot PRIVATE absl::strings absl::str_format)

add_executable(Vfixed_cross verilator/fixed_cross.cpp)

verilate(Vfixed_cross
    TOP_MODULE fixed_cross
    PREFIX Vfixed_cross
    SOURCES src/fixed_cross.sv
    ${verilate_args})

target_link_libraries(Vfixed_cross PRIVATE absl::strings absl::str_format)

add_executable(Vbrightness verilator/brightness.cpp)

verilate(Vbrightness
    TOP_MODULE brightness
    PREFIX Vbrightness
    SOURCES src/brightness.sv
    ${verilate_args})

target_link_libraries(Vbrightness PRIVATE absl::strings absl::str_format)

add_executable(Vfixed_qv verilator/fixed_qv.cpp)

verilate(Vfixed_qv
    TOP_MODULE fixed_qv
    PREFIX Vfixed_qv
    SOURCES src/fixed_qv.sv
    ${verilate_args})

target_link_libraries(Vfixed_qv PRIVATE absl::strings absl::str_format)

add_executable(Vfixed_qq verilator/fixed_qq.cpp)

verilate(Vfixed_qq
    TOP_MODULE fixed_qq
    PREFIX Vfixed_qq
    SOURCES src/fixed_qq.sv
    ${verilate_args})

target_link_libraries(Vfixed_qq PRIVATE absl::strings absl::str_format)

add_executable(Vbutton verilator/button.cpp)

verilate(Vbutton
    TOP_MODULE button
    PREFIX Vbutton
    SOURCES src/button.sv
    ${verilate_args})

target_link_libraries(Vbutton PRIVATE absl::strings absl::str_format)

add_executable(Vvbuffer verilator/vbuffer.cpp)

verilate(Vvbuffer
    TOP_MODULE vbuffer
    PREFIX Vvbuffer
    SOURCES src/vbuffer.v
    ${verilate_args})

target_link_libraries(Vvbuffer PRIVATE absl::strings absl::str_format)

add_executable(Vscan verilator/scan.cpp)

verilate(Vscan
    TOP_MODULE scan
    PREFIX Vscan
    SOURCES src/scan.sv
    ${verilate_args})

target_link_libraries(Vscan PRIVATE absl::strings absl::str_format)

add_executable(Vtriangle_intersect verilator/triangle_intersect.cpp)

verilate(Vtriangle_intersect
    TOP_MODULE triangle_intersect
    PREFIX Vtriangle_intersect
    SOURCES verilator/triangle_intersect_top.sv
    ${verilate_args})

target_link_libraries(Vtriangle_intersect PRIVATE absl::strings absl::str_format)

add_executable(Vrender verilator/render.cpp)

set(verilate_args_no_trace
    INCLUDE_DIRS src verilator
    VERILATOR_ARGS -Wall -O3)

verilate(Vrender
    TOP_MODULE render
    PREFIX Vrender
    SOURCES src/render.sv
    ${verilate_args_no_trace})

target_link_libraries(Vrender PRIVATE absl::strings absl::str_format)

add_executable(Vrender_reduce verilator/render_reduce.cpp)

verilate(Vrender_reduce
    TOP_MODULE render_reduce
    PREFIX Vrender_reduce
    SOURCES src/render_reduce.sv
    ${verilate_args_no_trace})

target_link_libraries(Vrender_reduce PRIVATE absl::strings absl::str_format)

add_executable(Vfb_display verilator/fb_display.cpp)

verilate(Vfb_display
    TOP_MODULE fb_display
    PREFIX Vfb_display
    SOURCES src/fb_display.sv
    ${verilate_args})

target_link_libraries(Vfb_display PRIVATE absl::strings absl::str_format)

add_executable(Vserial_data verilator/serial_data.cpp)

verilate(Vserial_data
    TOP_MODULE serial_data
    PREFIX Vserial_data
    SOURCES src/serial_data.sv
    ${verilate_args})

target_link_libraries(Vserial_data PRIVATE absl::strings absl::str_format)

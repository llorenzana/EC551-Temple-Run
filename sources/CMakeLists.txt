cmake_minimum_required(VERSION 3.26)
project(EC551-Temple-Run)

find_package(verilator HINTS $ENV{VERILATOR_ROOT})

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(Vcompositor compositor.cc)
verilate(Vcompositor SOURCES compositor.sv)

cmake_minimum_required(VERSION 3.26)
project(EC551-Temple-Run)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(verilator HINTS $ENV{VERILATOR_ROOT})

include(FindPkgConfig)
pkg_check_modules(STB REQUIRED stb)

add_executable(Vcompositor compositor.cc)
target_include_directories(Vcompositor PUBLIC ${STB_INCLUDE_DIRS})
verilate(Vcompositor SOURCES compositor.sv)

add_executable(Vintegration integration.cc)
target_include_directories(Vintegration PUBLIC ${STB_INCLUDE_DIRS})
verilate(Vintegration SOURCES integration.sv)

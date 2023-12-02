cmake_minimum_required(VERSION 3.26)
project(EC551-Temple-Run)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_BUILD_TYPE Release)

find_package(verilator HINTS $ENV{VERILATOR_ROOT})
find_package(SDL2 REQUIRED CONFIG REQUIRED COMPONENTS SDL2)

add_executable(Vintegration integration.cc)
target_include_directories(Vintegration PUBLIC ${STB_INCLUDE_DIRS})
target_link_libraries(Vintegration PRIVATE SDL2::SDL2)
verilate(Vintegration SOURCES integration.sv VERILATOR_ARGS -Wall -Wno-PINCONNECTEMPTY -Wno-UNUSED)

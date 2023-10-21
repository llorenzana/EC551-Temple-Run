cmake_minimum_required(VERSION 3.26)
project(music)

find_package(verilator HINTS $ENV{VERILATOR_ROOT})

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(Vmusic music.cc)
verilate(Vmusic SOURCES music.v)

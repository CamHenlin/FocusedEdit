# HOW TO BUILD USING CMAKE as a standalone project:
# mkdir build
# cd build
# cmake .. -DCMAKE_TOOLCHAIN_FILE=path/to/Retro68-build/toolchain/cmake/retro68.toolchain.cmake
# make

cmake_minimum_required(VERSION 2.8)

set (CMAKE_C_FLAGS "-Ofast -Wuninitialized -Wmaybe-uninitialized -mcpu=68000 -mtune=68000 -m68000 -Wall")

project (te_sample)

add_application(FocusedEdit
   SerialHelper.c
   coprocessorjs.c
   TESample.c
   TESample.r
   )

cmake_minimum_required(VERSION 3.10)
project(arm_display_emulator C)

set(CMAKE_C_STANDARD 99)

file( GLOB LIB_FIX_MATH_SOURCE shared/libfixmath/*.c )
file( GLOB LIB_FIX_MATRIX_SOURCE shared/libfixmatrix/*.c )
file( GLOB LIB_DIVIDE_SOURCE shared/libdivide/*.c)

add_definitions(-DFIXMATH_NO_64BIT=1)
add_definitions(-DFIXMATH_NO_CACHE=1)
add_definitions(-DFIXMATH_FAST_SIN=1)
add_definitions(-DFIXMATH_OPTIMIZE_8BIT=1)

add_executable(arm_display_emulator emulator/main.c emulator/sdl_emulator.c emulator/sdl_emulator.h shared/game.c shared/game.h shared/sprite.c shared/sprite.h shared/util.c shared/util.h shared/canvas.c shared/canvas.h shared/external.h shared/vector_drawing.c shared/vector_drawing.h
    ${LIB_FIX_MATH_SOURCE}
    ${LIB_FIX_MATRIX_SOURCE}
    ${LIB_DIVIDE_SOURCE}
)

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIR})
target_link_libraries(arm_display_emulator ${SDL2_LIBRARIES})

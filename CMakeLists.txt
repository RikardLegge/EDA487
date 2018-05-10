cmake_minimum_required(VERSION 3.10)
project(arm_display_emulator C)

set(CMAKE_C_STANDARD 99)



add_executable(arm_display_emulator emulator/main.c emulator/sdl_emulator.c emulator/sdl_emulator.h shared/game.c shared/game.h shared/sprite.c shared/sprite.h shared/util.c shared/util.h shared/canvas.c shared/canvas.h shared/external.h shared/vector_drawing.c shared/vector_drawing.h
    ${MATRIX_LIB}
    ${MATH_LIB}
)

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIR})
target_link_libraries(arm_display_emulator ${SDL2_LIBRARIES})

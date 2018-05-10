#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"

int camera_x = 0;
int camera_y = 0;
int camera_z = 0;
int camera_rot = 0;
int camera_rot_2 = 0;

void handle_input() {
    if (key_is_active(0x4)) {
        camera_rot -= 1;
    }
    if (key_is_active(0x6)) {
        camera_rot += 1;
    }

    if (key_is_active(0x3)) {
        camera_rot_2 -= 1;
    }
    if (key_is_active(0xF)) {
        camera_rot_2 += 1;
    }

    if (key_is_active(0x7)) {
        camera_x -= 1;
    }
    if (key_is_active(0x9)) {
        camera_x += 1;
    }

    if (key_is_active(0x2)) {
        camera_y -= 1;
    }
    if (key_is_active(0x0)) {
        camera_y += 1;
    }

    if (key_is_active(0x5)) {
        camera_z -= 1;
    }
    if (key_is_active(0x8)) {
        camera_z += 1;
    }

    if (key_is_active(0x1)) {
        camera_x = 0;
        camera_y = 0;
        camera_z = 0;
        camera_rot = 0;
        camera_rot_2 = 0;
    }
}

void game_init() {
    canvas_clear();
}

void game_loop() {
    handle_input();

    canvas_clear();
    
    canvas_pixel(10,10,1);
    
    canvas_flush();
}
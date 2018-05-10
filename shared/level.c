#include "images/level_1.xbm"
#include "sprite.h"

Sprite levels[1];

void load_levels() {
    levels[0] = sprite_load(level_1_bits, level_1_width, level_1_height);
}

int level_sample_at(int x, int y) {
    x /= 4;
    y /= 4;

    int width = 32;
    int height = 16;
    Sprite level = levels[0];

//    return level.data[x * width + height];
//
//    int height = sprite->height;
//    int width = sprite->width;
//
//    int sprite_width = width / 8;
//    if (width % 8 != 0)
//        sprite_width += 1;
//
//    for (int row = 0; row < height; row++) {
//        for (int col = 0; col < sprite_width; col++) {
//            uint8_t byte = sprite->data[row * sprite_width + col];
//            for_range(0, 8) {
//                for (int sx = 0; sx < scale; sx++) {
//                    for (int sy = 0; sy < scale; sy++) {
//                        int set = byte & (0x1 << index);
//                        if (set && !invert) {
//                            canvas_pixel((8 * col + index) * scale + sx + x, row * scale + sy + y, 1);
//                        } else if(!set && invert) {
//                            canvas_pixel((8 * col + index) * scale + sx + x, row * scale + sy + y, 1);
//                        }
//                    }
//                }
//            }
//        }
//    }
}

void draw_level() {
    sprite_draw_scaled(&levels[0], 0, 0, 4, 1);
}


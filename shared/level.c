#include "images/level_1.xbm"
#include "sprite.h"

Sprite levels[1];

void load_levels() {
    levels[0] = sprite_load(level_1_bits, level_1_width, level_1_height);
}

void draw_level() {
    sprite_draw_scaled(&levels[0], 0, 0, 4, 1);
}


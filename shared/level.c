#include "images/level_1.xbm"
#include "images/level_2.xbm"
#include "level.h"
#include "sprite.h"
#include "canvas.h"

Sprite levels[2];

void load_levels() {
    levels[0] = sprite_load(level_1_bits, level_1_width, level_1_height);
    levels[1] = sprite_load(level_2_bits, level_2_width, level_2_height);
}

int level_sample_at(int x, int y, uint8_t  level_id) {
    if(x < 0 || x > 128 || y < 0 || y > 64) return 0;
    if(level_id >= LEVEL_COUNT) return 0;

    Sprite level = levels[level_id];
    int height = level.height;
    int width = level.width;

    int sprite_width = width / 8;
    if (width % 8 != 0)
        sprite_width += 1;

    int col = x/4/8;
    int index = (x/4) % 8;
    int row = y/4;

    uint8_t byte = level.data[row * sprite_width + col];

    return byte & (0x1 << index);
}

void draw_level(uint8_t level_id) {
    if(level_id >= LEVEL_COUNT) return;
    sprite_draw_scaled(&levels[level_id], 0, 0, 4, 1, 1);
}


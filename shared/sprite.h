#ifndef ARM_DISPLAY_EMULATOR_DRAW_H
#define ARM_DISPLAY_EMULATOR_DRAW_H

#include "util.h"

typedef struct Sprite {
    uint8_t width;
    uint8_t height;
    unsigned char* data;
} Sprite;

#endif //ARM_DISPLAY_EMULATOR_DRAW_H

Sprite sprite_load(unsigned char* data, uint8_t width, uint8_t height);
void sprite_draw(Sprite* sprite, uint8_t x, uint8_t y);
void sprite_draw_scaled(Sprite *sprite, uint8_t x, uint8_t y, uint8_t scale, uint8_t invert);

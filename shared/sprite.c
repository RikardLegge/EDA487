#include "sprite.h"
#include "canvas.h"

Sprite sprite_load(unsigned char *data, uint8_t width, uint8_t height) {
    return (Sprite) {.width= width, .height= height, .data= data};
}

void sprite_draw(Sprite *sprite, uint8_t x, uint8_t y) {
    int height = sprite->height;
    int width = sprite->width;

    int sprite_width = width / 8;
    if (width % 8 != 0)
        sprite_width += 1;

    for (int row = 0; row < height; row++) {
        for (int col = 0; col < sprite_width; col++) {
            uint8_t byte = sprite->data[row * sprite_width + col];
            for_range(0, 8) {
                if (byte & (0x1 << index)) {
                    canvas_pixel(8 * col + index + x, row + y, 1);
                }
            }
        }
    }
}

void sprite_draw_scaled(Sprite *sprite, uint8_t x, uint8_t y, uint8_t scale, uint8_t invert) {
    int height = sprite->height;
    int width = sprite->width;

    int sprite_width = width / 8;
    if (width % 8 != 0)
        sprite_width += 1;

    for (int row = 0; row < height; row++) {
        for (int col = 0; col < sprite_width; col++) {
            uint8_t byte = sprite->data[row * sprite_width + col];
            for_range(0, 8) {
                for (int sx = 0; sx < scale; sx++) {
                    for (int sy = 0; sy < scale; sy++) {
                        int set = byte & (0x1 << index);
                        if (set && !invert) {
                            canvas_pixel((8 * col + index) * scale + sx + x, row * scale + sy + y, 1);
                        } else if(!set && invert) {
                            canvas_pixel((8 * col + index) * scale + sx + x, row * scale + sy + y, 1);
                        }
                    }
                }
            }
        }
    }
}
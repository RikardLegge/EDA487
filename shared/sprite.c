#include "sprite.h"
#include "canvas.h"

Sprite sprite_load(unsigned char* data, uint8_t width, uint8_t height) {
    return (Sprite) {width: width, height: height, data: data};
}

void sprite_draw(Sprite* sprite, uint8_t x, uint8_t y) {
    int height = sprite->height;
    int width = sprite->width;

    int sprite_width = width / 8;
    if(width % 8 != 0)
        sprite_width += 1;

    for(int row = 0; row < height; row++) {
        for(int col = 0; col < sprite_width; col++) {
            uint8_t byte = sprite->data[row * sprite_width + col];
            for_range(0,8) {
                if(byte & (0x1 << index)) {
                    canvas_pixel(8 * col + index + x, row + y, 1);
                }
            }
        }
    }
}
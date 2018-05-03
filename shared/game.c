#include "game.h"

#include "external.h"
#include "canvas.h"
#include "sprite.h"

#include "images/ball.xbm"
#include "images/smily.xbm"

Sprite smily_sprite;
Sprite ball_sprite;

void game_init() {
    canvas_clear();

    smily_sprite = sprite_load(smily_bits, smily_width, smily_height);
    ball_sprite = sprite_load(ball_bits, ball_width, ball_height);
}

int t = 0;
void game_loop() {
    int set = (t / 64) %2;
    for(uint8_t i = 0; i < 128; i++){
        canvas_pixel(i, t%64, set);
    }

    sprite_draw(&smily_sprite, 10, 10);

    canvas_flush();
    t++;
}
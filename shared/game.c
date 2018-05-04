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
    canvas_clear();
    sprite_draw(&smily_sprite, t % 128, (t/128)%64);

    canvas_flush();
    t++;
}
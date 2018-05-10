#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"
#include "level.h"
#include "images/won.xbm"

int player_x = 20;
int player_y = 0;

void handle_input() {
    if (key_is_active(0x7)) {
        player_x -= 1;
    }
    if (key_is_active(0x9)) {
        player_x += 1;
    }

    if (key_is_active(0x2)) {
        player_y -= 1;
    }
    if (key_is_active(0x0)) {
        player_y += 1;
    }

    if (key_is_active(0x1)) {
        player_x = 0;
        player_y = 0;
    }
}

Sprite won_sprite;

void game_init() {
    canvas_clear();
    won_sprite = sprite_load(won_bits, won_width, won_height);
    load_levels();
}

void move_player(){
    handle_input();
    canvas_pixel(player_x,player_y,1);
}

void you_lost(){
    if((player_x < 0) || (player_y < 0)){
        canvas_clear();
        sprite_draw(&won_sprite, 0, 0);
    }
}




void game_loop() {

    canvas_clear();
    draw_level();
    canvas_pixel(10,10,0);
    move_player();
    you_lost();
    
    canvas_flush();
}




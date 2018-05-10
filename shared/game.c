#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"
#include "level.h"
#include "images/won.xbm"

typedef struct Player {
    float x;
    float y;
    float dx;
    float dy;
} Player;

Player player;

void reset_player() {
    player.x = 0;
    player.y = 50;
}

void player_handle_collission() {
    int is_floor = level_sample_at(player.x, player.y);
    int sign_y = sign(player.dy);
    while(is_floor) {
        player.y -= player.dy;
        is_floor = level_sample_at(player.x, player.y);

        if(!is_floor) {
            while(!level_sample_at(player.x, player.y+sign_y)) {
                player.y += sign_y;
            }
            return;
        }

        player.x -= player.dx;
        is_floor = level_sample_at(player.x, player.y);
    }
}

void player_step() {
    player.x += player.dx;
    player.y += player.dy;

    player_handle_collission();

    player.dy += 0.5;
    if(player.dy > 3) {
        player.dy = 3;
    }

    player.dx = 0;
}

void handle_input() {
    if (key_is_active(0x7)) {
        player.dx = -1;
    }
    if (key_is_active(0x9)) {
        player.dx = 1;
    }

    if (key_is_active(0x5)) {
        if(level_sample_at(player.x, player.y + 1)) {
            player.dy = -4;
        }
    }

    if (key_is_active(0x1)) {
        reset_player();
    }
}

Sprite won_sprite;

void game_init() {
    canvas_clear();
    load_levels();
    reset_player();

    won_sprite = sprite_load(won_bits, won_width, won_height);
}

void move_player(){
    handle_input();
    player_step();
    canvas_pixel(player.x,player.y,0);
}

void you_lost(){
    if((player.x < 0) || (player.y < 0)){
        canvas_clear();
        sprite_draw(&won_sprite, 0, 0);
    }
}


void game_loop() {
    canvas_clear();
    draw_level();

    move_player();

    you_lost();
    canvas_flush();
}




#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"
#include "level.h"
#include "images/won.xbm"
#include "images/alien.xbm"

typedef struct Player {
    float x;
    float y;
    float dx;
    float dy;
    uint8_t level;
} Player;

Player player;

void reset_player() {
    player.x = 1;
    player.y = 50;
    player.level = 0;
}

void player_handle_collission() {
    int is_floor = level_sample_at(player.x, player.y, player.level);
    int sign_y = sign(player.dy);
    while(is_floor) {
        player.y -= player.dy;
        is_floor = level_sample_at(player.x, player.y, player.level);

        if(!is_floor && sign_y) {
            while(!level_sample_at(player.x, player.y+sign_y, player.level)) {
                player.y += sign_y;
            }
            return;
        }

        player.x -= player.dx;
        is_floor = level_sample_at(player.x, player.y, player.level);
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
        if(level_sample_at(player.x, player.y + 1, player.level)) {
            player.dy = -4;
        }
    }

    if (key_is_active(0x1)) {
        reset_player();
    }
}

Sprite won_sprite;
Sprite player_sprite;

void game_init() {
    canvas_clear();
    load_levels();
    reset_player();

    won_sprite = sprite_load(won_bits, won_width, won_height);
    player_sprite = sprite_load(alien_bits, alien_width, alien_height);
}

void move_player(){
    handle_input();
    player_step();
    
    int x = (int)player.x-player_sprite.width/2+1;
    int y = (int)player.y-player_sprite.height+1;
    sprite_draw_scaled(&player_sprite, x, y, 1, 0, 0);
}

void you_lost(){
    if((player.x < 0) || (player.y < 0)){
        canvas_clear();
        sprite_draw(&won_sprite, 0, 0);
    }
}


void game_loop() {
    canvas_clear();
    draw_level(player.level);

    move_player();

    you_lost();
    canvas_flush();
}




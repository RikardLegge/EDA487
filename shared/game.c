#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"
#include "level.h"
#include "images/won.xbm"
#include "images/alien.xbm"
#include "images/lost.xbm"

typedef struct Player {
    float x;
    float y;
    float dx;
    float dy;
    uint8_t level;
} Player;

typedef struct Enemy {
    int x0;
    int y0;
    int x;
    int y;
    int dx;
    int dy;
} Enemy;

Player player;
Enemy enemy;
int  is_end_of_game = 0;

void reset_player() {
    player.x = 1;
    player.y = 50;
    player.level = 0;
}

void reset_enemy(int x, int y){
    enemy.x0 = x;
    enemy.y0 = y;
    enemy.x = 0;
    enemy.y = 0;
    enemy.dx = 1;
    enemy.dy = 0;
}

void reset_game(){
        canvas_clear();
        load_levels();
        reset_player();
        is_end_of_game = 0;
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

//gravity
void player_step() {
    player.x += player.dx;
    player.y += player.dy;

    player_handle_collission();

    player.dy += 0.5;
    if(player.dy > 3)
        player.dy = 3;

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
        reset_game();
    }
}

void handle_input_reset() {
    if (key_is_active(0x1)) {
        reset_game();
    }
}

Sprite won_sprite;
Sprite player_sprite;
Sprite lost_sprite;

void game_init() {
    canvas_clear();
    load_levels();
    reset_player();

    won_sprite = sprite_load(won_bits, won_width, won_height);
    player_sprite = sprite_load(alien_bits, alien_width, alien_height);
    lost_sprite = sprite_load(lost_bits, lost_width, won_height);
}

void move_player(){
    handle_input();
    player_step();
    
    int x = (int)player.x-player_sprite.width/2+1;
    int y = (int)player.y-player_sprite.height+1;
    sprite_draw_scaled(&player_sprite, x, y, 1, 0, 0);
}

void stop_player(){
    player.dy = 0;
}

void check_won(){
    if(player.x > 127){
        is_end_of_game = 1;
    }
}

void check_lost(){
    if((player.y < 0) || (player.y > 64)){
        is_end_of_game = 2;
    }
}

void draw_lost(){
    if(is_end_of_game == 2){
        canvas_clear();
        sprite_draw(&lost_sprite, 0, 0);
        stop_player();
    }
}

void draw_won(){
    if(is_end_of_game == 1){
        canvas_clear();
        sprite_draw(&won_sprite, 0, 0);
        stop_player();
    }
}

void enemy_path(){
    //reset_enemy(20, 20);
    int pathway = 10;
    int distance = abs(enemy.x0 - enemy.x);
    
    if(distance > pathway) {
        enemy.x = pathway * sign(enemy.dx);
        enemy.dx = -enemy.dx;
    }
    enemy.x += enemy.dx;
    
    canvas_pixel(enemy.x0+enemy.x,enemy.y0 + enemy.y,0);
}


void game_loop() {
    check_won();
    check_lost();
    canvas_clear();
    
    if(is_end_of_game) {
        draw_lost();
        draw_won();
        handle_input_reset();
    } else {
        draw_level(player.level);
        move_player();
        reset_enemy(20,20);
        enemy_path();
    }
    canvas_flush();
}




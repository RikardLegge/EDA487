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
#include "images/enemy.xbm"

typedef struct Player {
    float x;
    float y;
    float dx;
    float dy;
    uint8_t level;
} Player;

typedef struct Enemy {
    float x0;
    float y0;
    float x;
    float y;
    float dx;
    float dy;
} Enemy;

Player player;
Enemy enemy;
int  is_end_of_game = 0;

void reset_player() {
    player.x = 1;
    player.y = 50;
}

void reset_enemy(int x, int y){
    enemy.x0 = x;
    enemy.y0 = y;
    enemy.x = 0;
    enemy.y = 0;
    enemy.dx = 0.5;
    enemy.dy = 0;
}

void reset_game(){
        canvas_clear();
        reset_player();
        is_end_of_game = 0;
}

void reset_level(uint8_t level) {
    level %= LEVEL_COUNT;
    player.level = level;

    switch(level) {
        case 0:
            reset_enemy(20,45);
            break;
        case 1:
            reset_enemy(80,45);
            break;
        case 2:
            reset_enemy(80,45);
            break;
        case 3:
            reset_enemy(10,50);
            break;
    }
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
        reset_level(player.level);
        player.level = 0;
    }
}

void handle_input_reset() {
    if (key_is_active(0x1)) {
        reset_game();
        reset_level(0);
        player.level = 0;
    }

    if (key_is_active(0x2)) {
        if (is_end_of_game == 1) {
            reset_level(player.level + 1);
        } else {
            reset_level(player.level);
        }
        reset_game();
    }
}

Sprite won_sprite;
Sprite player_sprite;
Sprite lost_sprite;
Sprite enemy_sprite;

void game_init() {
    canvas_clear();
    load_levels();
    reset_player();
    reset_enemy(20,45);
    reset_level(2);

    won_sprite = sprite_load(won_bits, won_width, won_height);
    player_sprite = sprite_load(alien_bits, alien_width, alien_height);
    lost_sprite = sprite_load(lost_bits, lost_width, won_height);
    enemy_sprite = sprite_load(enemy_bits, enemy_width, enemy_height);
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
    if(player.x > 110 && player.y < 20){
        is_end_of_game = 1;
    }
}

void check_lost(){
    float xdist = absf(player.x - (enemy.x0+enemy.x));
    float ydist = absf(player.y - (enemy.y0+enemy.y));
    float dist = (xdist*xdist) + (ydist*ydist);
    if(player.y > 64 ||dist < 44) {
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
    int pathway = 5;
    float distance = absf(enemy.x);
    
    if(distance > pathway) {
        enemy.x = pathway * sign(enemy.dx * 1000);
        enemy.dx = -enemy.dx;
    }

    enemy.x += enemy.dx;

    sprite_draw_scaled(&enemy_sprite,(enemy.x0+enemy.x),(enemy.y0 + enemy.y), 1, 0, 0);
}

void write_int_to_string(char* str, unsigned int number, int index) {
    str[index+2] = 48+(number % 10);
    str[index+1] = 48+(number/10 % 10);
    str[index] = 48+(number/100 % 10);
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
        enemy_path();

        char text[] = "Player x: XXX, y: XXX";
        write_int_to_string(text, player.x, 10);
        write_int_to_string(text, player.y, 18);

        ascii_write_text(text,1,1);
    }
    canvas_flush();
}




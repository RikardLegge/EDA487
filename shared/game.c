#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"

#include "images/ball.xbm"
#include "images/smily.xbm"

//Sprite smily_sprite;
//Sprite ball_sprite;

#include "libfixmatrix/fixmatrix.h"
#include "libfixmath/fix16.h"

#define mat4_new() (mf16){ \
.rows= 4,\
.columns= 4,\
.data={{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}\
}

mf16 persp_proj = mat4_new();
mf16 camera_proj = mat4_new();

void perspective_projection_init() {
    fix16_t near = F16C(1,0);
    fix16_t far = F16C(100,0);
    fix16_t fov = F16C(0,5235987756); // 60dev

    fix16_t scale = fix16_div(F16C(1,0), fix16_tan(fov));

    // set the basic projection matrix
    persp_proj.data[0][0] = scale; // scale the x coordinates of the projected point
    persp_proj.data[1][1] = scale; // scale the y coordinates of the projected point
    persp_proj.data[2][2] = fix16_mul(F16C(-1,0), fix16_div(far,fix16_sub(far ,near))); // used to remap z to [0,1]
    persp_proj.data[3][2] = fix16_mul(fix16_mul(F16C(-1,0),near), fix16_div(far,fix16_sub(far ,near)));// -far * near / (far - near); // used to remap z [0,1]
    persp_proj.data[2][3] = F16C(-1,0); // set w = -z
    persp_proj.data[4][4] = 0;
    persp_proj.data[4][3] = -1;

    persp_proj.data[4][1] = F16C(1,0);
    persp_proj.data[4][2] = F16C(1,0);
    persp_proj.data[4][3] = F16C(1,0);
}

void game_init() {
    canvas_clear();

    perspective_projection_init();

//    smily_sprite = sprite_load(smily_bits, smily_width, smily_height);
//    ball_sprite = sprite_load(ball_bits, ball_width, ball_height);
}

int t = 0;



void game_loop() {
    canvas_clear();

    if(key_is_active(0x7)) {
        t -= 1;
    }
    if(key_is_active(0x9)) {
        t += 1;
    }

    Point pos = {.x=20 + t, .y=20};

//    vector_line((Point) {.x=40, .y=40}, (Point) {.x=40, .y=55});
    vector_plane(pos, point_offset(pos, 50, 0), point_offset(pos, 50, 30), point_offset(pos, 0, 30));
//    t++;

    canvas_flush();
}
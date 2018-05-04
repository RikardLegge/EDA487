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
mf16 ortho_proj = mat4_new();
mf16 camera_proj = mat4_new();

void perspective_projection_init() {
    fix16_t near = 1;
    fix16_t far = 100;
    fix16_t fov = F16C(0,5235987756); // 60dev

    fix16_t scale = fix16_div(F16C(1,0), fix16_tan(fov));

    // set the basic projection matrix
//    persp_proj.data[0][0] = scale; // scale the x coordinates of the projected point
//    persp_proj.data[1][1] = scale; // scale the y coordinates of the projected point
//    persp_proj.data[2][2] = fix16_mul(F16C(-1,0), fix16_div(far,fix16_sub(far ,near))); // used to remap z to [0,1]
//    persp_proj.data[3][2] = fix16_mul(fix16_mul(F16C(-1,0),near), fix16_div(far,fix16_sub(far ,near)));// -far * near / (far - near); // used to remap z [0,1]
//    persp_proj.data[2][3] = F16C(-1,0); // set w = -z
//    persp_proj.data[4][4] = 0;
//    persp_proj.data[4][3] = -1;

    ortho_proj.data[0][0] = fix16_div(F16C(2,0), F16C(128,0));
    ortho_proj.data[1][1] = fix16_div(F16C(2,0), F16C(64,0));
    ortho_proj.data[2][2] = fix16_div(F16C(-2,0), F16C(far-near,0));
    ortho_proj.data[3][3] = fix16_div(F16C(-(far+near),0), F16C(far-near,0));

    mf16_fill_diagonal(&camera_proj, F16C(1, 0));
}

void game_init() {
    canvas_clear();

    perspective_projection_init();

//    smily_sprite = sprite_load(smily_bits, smily_width, smily_height);
//    ball_sprite = sprite_load(ball_bits, ball_width, ball_height);
}

int camera_x = 0;
int camera_y = 0;
void game_loop() {
    canvas_clear();

    if(key_is_active(0x7)) {
        camera_x -= 1;
    }
    if(key_is_active(0x9)) {
        camera_x += 1;
    }
    if(key_is_active(0x5)) {
        camera_y -= 1;
    }
    if(key_is_active(0x8)) {
        camera_y += 1;
    }

//    camera_proj.data[0][0] = fix16_from_int(t);
    camera_proj.data[1][1] = fix16_div(F16C(1,0), F16C(100,0));
    camera_proj.data[0][0] = fix16_div(F16C(1,0), F16C(100,0));

    camera_proj.data[0][4] = fix16_div(fix16_from_int(camera_y), F16C(10000,0));
    camera_proj.data[1][4] = fix16_div(fix16_from_int(camera_y), F16C(10,0));
    camera_proj.data[1][4] = fix16_div(fix16_from_int(camera_x), F16C(10,0));

    v4d vectors[] = {
            (v4d) {F16C(0,0),  F16C(0,0),F16C(20,0),0},
            (v4d) {F16C(10,0), F16C(00,0),F16C(20,0),0},
            (v4d) {F16C(10,0), F16C(1,0),F16C(20,0),0},
            (v4d) {F16C(0,0),  F16C(1,0),F16C(20,0),0}
    };

    Point points[4];

    for(int i = 0; i < 4; i++) {
        v4d vertCamera, vector_transformed;
        v4d_mf16_mult(&vectors[i], &camera_proj, &vertCamera);
        v4d_mf16_mult(&vertCamera, &ortho_proj, &vector_transformed);
        points[i] = point_from_v4d(&vector_transformed);
    }

    vector_plane(points[0], points[1], points[2], points[3]);

//    Point pos = {.x=20 + t, .y=20};
//    vector_line((Point) {.x=40, .y=40}, (Point) {.x=40, .y=55});
//    vector_plane(pos, point_offset(pos, 50, 0), point_offset(pos, 50, 30), point_offset(pos, 0, 30));
//    t++;

    canvas_flush();
}
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

mf16 projection = mat4_new();

typedef struct mf16_to_float_ret {
    float data[4][4];
} mf16_to_float_ret;
mf16_to_float_ret mf16_float_arr_ret;
mf16_to_float_ret* mf16_to_float(mf16* mat) {
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            mf16_float_arr_ret.data[i][j] = fix16_to_float(mat->data[i][j]);
        }
    }
    return &mf16_float_arr_ret;
}

void debug_methods_exist() {
    mf16_to_float(0);
    fix16_from_float(0);
}

void set_perspective_projection(int fovx, int fovy, int near, int far) {
    fix16_t two_f = F16C(2,0);

    fix16_t fovx_div2_f = fix16_div(fix16_from_int(fovx), two_f);
    fix16_t fovx_f = fix16_div(fix16_one, fix16_tan(fovx_div2_f));

    fix16_t fovy_div2_f = fix16_div(fix16_from_int(fovy), two_f);
    fix16_t fovy_f = fix16_div(fix16_one, fix16_tan(fovy_div2_f));

    fix16_t nf_f = fix16_from_int(near - far);

    projection.data[0][0] = fovx_f;
    projection.data[0][1] = 0;
    projection.data[0][2] = 0;
    projection.data[0][3] = 0;

    projection.data[1][0] = 0;
    projection.data[1][1] = fovy_f;
    projection.data[1][2] = 0;
    projection.data[1][3] = 0;

    projection.data[2][0] = 0;
    projection.data[2][1] = 0;
    projection.data[2][2] = fix16_div(fix16_from_int(far + near), nf_f);
    projection.data[2][3] = -1;

    projection.data[3][0] = 0;
    projection.data[3][1] = 0;
    projection.data[3][2] = fix16_div(fix16_from_int(2*far*near), nf_f);
    projection.data[3][3] = 0;
};

void set_orthographic_projection(int right, int left, int bottom, int top, int near, int far) {
    projection.data[0][0] = fix16_div(F16C(-2, 0), fix16_from_int(left-right));
    projection.data[0][1] = 0;
    projection.data[0][2] = 0;
    projection.data[0][3] = 0;

    projection.data[1][0] = 0;
    projection.data[1][1] = fix16_div(F16C(-2, 0), fix16_from_int(bottom-top));
    projection.data[1][2] = 0;
    projection.data[1][3] = 0;

    projection.data[2][0] = 0;
    projection.data[2][1] = 0;
    projection.data[2][2] = fix16_div(F16C(2, 0), F16C(near - far, 0));
    projection.data[2][3] = 0;

    projection.data[3][0] = fix16_div(fix16_from_int(left + right), fix16_from_int(left-right));
    projection.data[3][1] = fix16_div(fix16_from_int(top + bottom), fix16_from_int(bottom-top));
    projection.data[3][2] = fix16_div(fix16_from_int(far + near), fix16_from_int(near-far));
    projection.data[3][3] = fix16_one;
}

int always_false = 0;
void game_init() {
    if(always_false)
        debug_methods_exist();

    canvas_clear();
    set_perspective_projection(1, 1, 1, 100);
//    set_orthographic_projection(32, -32, 64, -64, 1, 100);
}

int camera_x = 0;
int camera_y = 0;
int camera_z = 0;
int camera_rot = 1;

void handle_input() {
    if (key_is_active(0x4)) {
        camera_rot -= 1;
    }
    if (key_is_active(0x6)) {
        camera_rot += 1;
    }

    if (key_is_active(0x7)) {
        camera_x -= 1;
    }
    if (key_is_active(0x9)) {
        camera_x += 1;
    }

    if (key_is_active(0x5)) {
        camera_z -= 1;
    }
    if (key_is_active(0x8)) {
        camera_z += 1;
    }
}

void create_scale(mf16* M, fix16_t x, fix16_t y, fix16_t z) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][0] = x;
    M->data[1][1] = y;
    M->data[2][2] = z;
}

void create_translation(mf16* M, fix16_t x, fix16_t y, fix16_t z) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][3] = x;
    M->data[1][3] = y;
    M->data[2][3] = z;
}

void create_rotation_y(mf16* M, fix16_t angle) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][0] = fix16_cos(angle);
    M->data[0][2] = fix16_sin(angle);
    M->data[2][0] = -fix16_sin(angle);
    M->data[2][2] = fix16_cos(angle);
}

void draw_plane(Point p0, Point p1, Point p2, Point p3, mf16* transform_matrix) {
v4d vectors[] = {
        point_to_v4d(&p0),
        point_to_v4d(&p1),
        point_to_v4d(&p2),
        point_to_v4d(&p3),
};

    Point points[4];
    for (int i = 0; i < 4; i++) {
        v4d vector_transformed;
        v4d_mf16_mult(&vectors[i], transform_matrix, &vector_transformed);
        points[i] = point_from_v4d(&vector_transformed);
    }
    vector_plane(points[0], points[1], points[2], points[3]);
}

mf16 wm_trans = mat4_new();
mf16 wm_rot = mat4_new();
mf16 wm_scale = mat4_new();
mf16 wm_temp = mat4_new();
mf16 world_matrix = mat4_new();

mf16 cam_trans = mat4_new();
mf16 cam_rot = mat4_new();
mf16 cam_projection = mat4_new();

mf16 cam_matrix = mat4_new();
mf16 transform_matrix = mat4_new();

void draw_scene() {
    fix16_t angle = fix16_div(fix16_from_int(camera_rot), F16C(10,0));

    {
        create_translation(&wm_trans, fix16_one, fix16_one, fix16_one);
        create_rotation_y(&wm_rot, angle);
        create_scale(&wm_scale, fix16_one, fix16_one, fix16_one);

        mf16_mul(&wm_temp, &wm_scale, &wm_rot);
        mf16_mul(&world_matrix, &wm_temp, &wm_trans);
    }

    {
        create_translation(&cam_trans,
                fix16_from_int(camera_x),
                fix16_from_int(camera_y),
                fix16_from_int(camera_z));
        create_rotation_y(&cam_rot,
                fix16_div(fix16_from_int(camera_rot), F16C(40,0)));

        mf16_mul(&cam_projection, &cam_trans, &cam_rot);
    }

    mf16_mul(&cam_matrix, &cam_projection, &world_matrix);
    mf16_mul(&transform_matrix, &projection, &cam_matrix);

    draw_plane(
            point_new(0, 0, 10),
            point_new(10,0, 10),
            point_new(10,10,10),
            point_new(0, 10,10),
            &transform_matrix
    );

    draw_plane(
            point_new(0,0, 0),
            point_new(0,0, 10),
            point_new(0,10,10),
            point_new(0,10,0),
            &transform_matrix
    );

//    v4d vectors[] = {
//        (v4d) {F16C(0,0),    F16C(0,0),  F16C(10,0),fix16_one},
//        (v4d) {F16C(10,0),   F16C(0,0),  F16C(10,0),fix16_one},
//        (v4d) {F16C(10,0),   F16C(20,0),  F16C(10,0),fix16_one},
//        (v4d) {F16C(0,0),    F16C(20,0),  F16C(10,0),fix16_one}
//    };
//
//    Point points[4];
//    for (int i = 0; i < 4; i++) {
//        v4d vector_transformed;
//        v4d_mf16_mult(&vectors[i], &transform_matrix, &vector_transformed);
//        points[i] = point_from_v4d(&vector_transformed);
//    }
//    vector_plane(points[0], points[1], points[2], points[3]);


}

void game_loop() {
    handle_input();

    canvas_clear();
    draw_scene();

//    Point pos = {.x=20 + t, .y=20};
//    vector_line((Point) {.x=40, .y=40}, (Point) {.x=40, .y=55});
//    vector_plane(pos, point_offset(pos, 50, 0), point_offset(pos, 50, 30), point_offset(pos, 0, 30));
//    t++;

    canvas_flush();
}
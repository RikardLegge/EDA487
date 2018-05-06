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
#include "libfixmatrix/fixvector4d.h"

#define mat4_new() (mf16){ \
.rows= 4,\
.columns= 4,\
.data={{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}\
}

mf16 projection_matrix = mat4_new();

typedef struct mf16_to_float_ret {
    float data[4][4];
} mf16_to_float_ret;
mf16_to_float_ret mf16_float_arr_ret;

mf16_to_float_ret *mf16_to_float(const mf16 *mat) {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            mf16_float_arr_ret.data[i][j] = fix16_to_float(mat->data[i][j]);
        }
    }
    return &mf16_float_arr_ret;
}

void debug_methods_exist() {
    mf16_to_float(0);
    fix16_from_float(0);
}

void set_perspective_projection(fix16_t fovx, fix16_t fovy, int near, int far) {
    fix16_t two_f = F16C(2, 0);

    fix16_t fovx_div2_f = fix16_div(fovx, two_f);
    fix16_t fovx_f = fix16_div(fix16_one, fix16_tan(fovx_div2_f));

    fix16_t fovy_div2_f = fix16_div(fovy, two_f);
    fix16_t fovy_f = fix16_div(fix16_one, fix16_tan(fovy_div2_f));

    fix16_t nf_f = fix16_from_int(near - far);

    projection_matrix.data[0][0] = fovx_f;
    projection_matrix.data[0][1] = 0;
    projection_matrix.data[0][2] = 0;
    projection_matrix.data[0][3] = 0;

    projection_matrix.data[1][0] = 0;
    projection_matrix.data[1][1] = fovy_f;
    projection_matrix.data[1][2] = 0;
    projection_matrix.data[1][3] = 0;

    projection_matrix.data[2][0] = 0;
    projection_matrix.data[2][1] = 0;
    projection_matrix.data[2][2] = fix16_div(fix16_from_int(far + near), nf_f);
    projection_matrix.data[2][3] = fix16_div(fix16_from_int(2 * far * near), nf_f);

    projection_matrix.data[3][0] = 0;
    projection_matrix.data[3][1] = 0;
    projection_matrix.data[3][2] = -fix16_one;
    projection_matrix.data[3][3] = 0;
};

int always_false = 0;

void game_init() {
    if (always_false)
        debug_methods_exist();

    canvas_clear();
    fix16_t fov = fix16_div(fix16_one, F16C(0.1, 0));
    set_perspective_projection(fov, fov, 5, 1000);
}

int camera_x = 0;
int camera_y = 0;
int camera_z = 0;
int camera_rot = 0;
int camera_rot_2 = 0;

void handle_input() {
    if (key_is_active(0x4)) {
        camera_rot -= 1;
    }
    if (key_is_active(0x6)) {
        camera_rot += 1;
    }

    if (key_is_active(0x3)) {
        camera_rot_2 -= 1;
    }
    if (key_is_active(0xF)) {
        camera_rot_2 += 1;
    }

    if (key_is_active(0x7)) {
        camera_x -= 1;
    }
    if (key_is_active(0x9)) {
        camera_x += 1;
    }

    if (key_is_active(0x2)) {
        camera_y -= 1;
    }
    if (key_is_active(0x0)) {
        camera_y += 1;
    }

    if (key_is_active(0x5)) {
        camera_z -= 1;
    }
    if (key_is_active(0x8)) {
        camera_z += 1;
    }

    if (key_is_active(0x1)) {
        camera_x = 0;
        camera_y = 0;
        camera_z = 0;
        camera_rot = 0;
        camera_rot_2 = 0;
    }
}

void create_scale(mf16 *M, fix16_t x, fix16_t y, fix16_t z) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][0] = x;
    M->data[1][1] = y;
    M->data[2][2] = z;
}

void create_translation(mf16 *M, fix16_t x, fix16_t y, fix16_t z) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][3] = x;
    M->data[1][3] = y;
    M->data[2][3] = z;
}

void create_rotation_x(mf16 *M, fix16_t angle) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[1][1] = fix16_cos(angle);
    M->data[1][2] = -fix16_sin(angle);
    M->data[2][1] = fix16_sin(angle);
    M->data[2][2] = fix16_cos(angle);
}

void create_rotation_y(mf16 *M, fix16_t angle) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][0] = fix16_cos(angle);
    M->data[0][2] = fix16_sin(angle);
    M->data[2][0] = -fix16_sin(angle);
    M->data[2][2] = fix16_cos(angle);
}

void create_rotation_z(mf16 *M, fix16_t angle) {
    mf16_fill(M, 0);
    mf16_fill_diagonal(M, fix16_one);
    M->data[0][0] = fix16_cos(angle);
    M->data[0][1] = -fix16_sin(angle);
    M->data[1][0] = fix16_sin(angle);
    M->data[1][1] = fix16_cos(angle);
}


void create_look_at(const v4d *camera_position, const v4d *target, const v4d *up, mf16 *dest) {
    v4d zAxis;
    v4d_sub(&zAxis, camera_position, target);
    v4d_normalize(&zAxis, &zAxis);

    v4d xAxis;
    v4d_cross(&xAxis, up, &zAxis);

    v4d yAxis;
    v4d_cross(&yAxis, &zAxis, &xAxis);

    dest->data[0][0] = xAxis.x;
    dest->data[0][1] = xAxis.y;
    dest->data[0][2] = xAxis.z;
    dest->data[0][3] = 0;

    dest->data[1][0] = yAxis.x;
    dest->data[1][1] = yAxis.y;
    dest->data[1][2] = yAxis.z;
    dest->data[1][3] = 0;

    dest->data[2][0] = zAxis.x;
    dest->data[2][1] = zAxis.y;
    dest->data[2][2] = zAxis.z;
    dest->data[2][3] = 0;

    dest->data[3][0] = camera_position->x;
    dest->data[3][1] = camera_position->y;
    dest->data[3][2] = camera_position->z;
    dest->data[3][3] = fix16_one;
}

v4d fps_x;
v4d fps_y;
v4d fps_z;

void create_first_person_matrix(const v4d *eye, fix16_t pitch, fix16_t yaw, mf16 *dest) {
    fix16_t cos_pitch = fix16_cos(pitch);
    fix16_t sin_pitch = fix16_sin(pitch);
    fix16_t cos_yaw = fix16_cos(yaw);
    fix16_t sin_yaw = fix16_sin(yaw);

    fps_x.x = cos_yaw;
    fps_x.y = 0;
    fps_x.z = -sin_yaw;

    fps_y.x = fix16_mul(sin_yaw, sin_pitch);
    fps_y.y = cos_pitch;
    fps_y.z = fix16_mul(cos_yaw, sin_pitch);

    fps_z.x = fix16_mul(sin_yaw, cos_pitch);
    fps_z.y = -sin_pitch;
    fps_z.z = fix16_mul(cos_yaw, cos_pitch);

    dest->data[0][0] = fps_x.x;
    dest->data[0][1] = fps_y.x;
    dest->data[0][2] = fps_z.x;
    dest->data[0][3] = 0;

    dest->data[1][0] = fps_x.y;
    dest->data[1][1] = fps_y.y;
    dest->data[1][2] = fps_z.y;
    dest->data[1][3] = 0;

    dest->data[2][0] = fps_x.z;
    dest->data[2][1] = fps_y.z;
    dest->data[2][2] = fps_z.z;
    dest->data[2][3] = 0;

    dest->data[3][0] = -v4d_dot(&fps_x, eye);
    dest->data[3][1] = -v4d_dot(&fps_y, eye);
    dest->data[3][2] = -v4d_dot(&fps_z, eye);
    dest->data[3][3] = fix16_one;
}

mf16 view_matrix = mat4_new();
mf16 transform_matrix = mat4_new();

mf16 tmp_matrix = mat4_new();
mf16 tmp_matrix1 = mat4_new();
mf16 tmp_matrix2 = mat4_new();
mf16 tmp_matrix3 = mat4_new();

v4d v4d_tmp1;
v4d v4d_tmp2;
v4d v4d_tmp3;

void look_at_camera(mf16 *dest) {
    create_translation(&tmp_matrix,
                       fix16_from_int(camera_x),
                       fix16_from_int(camera_y),
                       fix16_from_int(camera_z));
    create_rotation_y(&tmp_matrix1,
                      fix16_div(fix16_from_int(camera_rot), F16C(10, 0)));
    create_rotation_x(&tmp_matrix2,
                      fix16_div(fix16_from_int(camera_rot_2), F16C(10, 0)));

    mf16_mul(&tmp_matrix3, &tmp_matrix1, &tmp_matrix);
    mf16_mul(&tmp_matrix1, &tmp_matrix2, &tmp_matrix3);

    v4d_tmp1.x = tmp_matrix1.data[0][3];
    v4d_tmp1.y = tmp_matrix1.data[1][3];
    v4d_tmp1.z = tmp_matrix1.data[2][3];

    v4d_tmp2.x = fix16_from_int(25);
    v4d_tmp2.y = fix16_from_int(25);
    v4d_tmp2.z = fix16_from_int(25);

    v4d_tmp3.x = 0;
    v4d_tmp3.y = fix16_one;
    v4d_tmp3.z = 0;

    create_look_at(&v4d_tmp1, &v4d_tmp2, &v4d_tmp3, &tmp_matrix);
    mf16_transpose(&tmp_matrix, &tmp_matrix);

    mf16_cholesky(&tmp_matrix1, &tmp_matrix);
    mf16_invert_lt(&view_matrix, &tmp_matrix1);

    create_translation(&tmp_matrix1,
                       fix16_from_int(64),
                       fix16_from_int(32),
                       fix16_from_int(0));

    mf16_mul(dest, &tmp_matrix1, &tmp_matrix);
}

void fps_camera(mf16 *dest) {
    fix16_t PI_2 = fix16_mul(fix16_pi, F16C(2,0));

    v4d_tmp1.x = fix16_div(fix16_from_int(-camera_x), fix16_from_int(1000));
    v4d_tmp1.y = fix16_div(fix16_from_int(-camera_y), fix16_from_int(1000));
    v4d_tmp1.z = fix16_div(fix16_from_int(-camera_z), fix16_from_int(100));

    fix16_t pitch = fix16_div(fix16_from_int(camera_rot_2), F16C(100, 0));
    fix16_t yaw = fix16_div(fix16_from_int(camera_rot), F16C(100, 0));

    pitch = fix16_mod(pitch, PI_2);
    yaw = fix16_mod(yaw, PI_2);

    create_first_person_matrix(&v4d_tmp1, pitch, yaw, &tmp_matrix);

    mf16_cholesky(&tmp_matrix1, &tmp_matrix);
    mf16_invert_lt(dest, &tmp_matrix1);
}

void draw_scene() {
    fps_camera(&view_matrix);
    mf16_mul(&tmp_matrix, &view_matrix, &projection_matrix);

    create_translation(&tmp_matrix1,
                       fix16_from_int(64),
                       fix16_from_int(32),
                       fix16_from_int(0));

    mf16_mul(&transform_matrix, &tmp_matrix1, &tmp_matrix);

    vector_draw_box((Point) {-250, -250, 50}, 100, 100, 25, &transform_matrix);
    vector_draw_box((Point) {250, -250, 50}, 100, 100, 25, &transform_matrix);
    vector_draw_box((Point) {-250, 250, 50}, 100, 100, 25, &transform_matrix);
    vector_draw_box((Point) {250, 250, 50}, 100, 100, 25, &transform_matrix);
}

void game_loop() {
    handle_input();

    canvas_clear();
    draw_scene();

    canvas_flush();
}
#include "game.h"

#include "util.h"
#include "external.h"
#include "canvas.h"
#include "sprite.h"
#include "vector_drawing.h"

//#include "images/ball.xbm"
//#include "images/smily.xbm"

//Sprite smily_sprite;
//Sprite ball_sprite;

#include "libfixmatrix/fixmatrix.h"
#include "libfixmath/fix16.h"
#include "libfixmatrix/fixvector4d.h"
#include "libfixmatrix/fixquat.h"

#define mat4_new() (mf16){ \
.rows= 4,\
.columns= 4,\
.data={{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}\
}


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

//void set_perspective_projection(fix16_t fovx, fix16_t fovy, int near, int far) {
//    fix16_t two_f = F16C(2, 0);
//
//    fix16_t fovx_div2_f = fix16_div(fovx, two_f);
//    fix16_t fovx_f = fix16_div(fix16_one, fix16_tan(fovx_div2_f));
//
//    fix16_t fovy_div2_f = fix16_div(fovy, two_f);
//    fix16_t fovy_f = fix16_div(fix16_one, fix16_tan(fovy_div2_f));
//
//    fix16_t nf_f = fix16_from_int(near - far);
//
//    projection_matrix.data[0][0] = fovx_f;
//    projection_matrix.data[0][1] = 0;
//    projection_matrix.data[0][2] = 0;
//    projection_matrix.data[0][3] = 0;
//
//    projection_matrix.data[1][0] = 0;
//    projection_matrix.data[1][1] = fovy_f;
//    projection_matrix.data[1][2] = 0;
//    projection_matrix.data[1][3] = 0;
//
//    projection_matrix.data[2][0] = 0;
//    projection_matrix.data[2][1] = 0;
//    projection_matrix.data[2][2] = fix16_div(fix16_from_int(far + near), nf_f);
//    projection_matrix.data[2][3] = fix16_div(fix16_from_int(2 * far * near), nf_f);
//
//    projection_matrix.data[3][0] = 0;
//    projection_matrix.data[3][1] = 0;
//    projection_matrix.data[3][2] = -fix16_one;
//    projection_matrix.data[3][3] = 0;
//};
//
//

//

//
//
//void create_look_at(const v4d *camera_position, const v4d *target, const v4d *up, mf16 *dest) {
//    v4d zAxis;
//    v4d_sub(&zAxis, camera_position, target);
//    v4d_normalize(&zAxis, &zAxis);
//
//    v4d xAxis;
//    v4d_cross(&xAxis, up, &zAxis);
//
//    v4d yAxis;
//    v4d_cross(&yAxis, &zAxis, &xAxis);
//
//    dest->data[0][0] = xAxis.x;
//    dest->data[0][1] = xAxis.y;
//    dest->data[0][2] = xAxis.z;
//    dest->data[0][3] = 0;
//
//    dest->data[1][0] = yAxis.x;
//    dest->data[1][1] = yAxis.y;
//    dest->data[1][2] = yAxis.z;
//    dest->data[1][3] = 0;
//
//    dest->data[2][0] = zAxis.x;
//    dest->data[2][1] = zAxis.y;
//    dest->data[2][2] = zAxis.z;
//    dest->data[2][3] = 0;
//
//    dest->data[3][0] = camera_position->x;
//    dest->data[3][1] = camera_position->y;
//    dest->data[3][2] = camera_position->z;
//    dest->data[3][3] = fix16_one;
//}
//
//v4d fps_x;
//v4d fps_y;
//v4d fps_z;
//
//void create_first_person_matrix(const v4d *eye, fix16_t pitch, fix16_t yaw, mf16 *dest) {
//    fix16_t cos_pitch = fix16_cos(pitch);
//    fix16_t sin_pitch = fix16_sin(pitch);
//    fix16_t cos_yaw = fix16_cos(yaw);
//    fix16_t sin_yaw = fix16_sin(yaw);
//
//    fps_x.x = cos_yaw;
//    fps_x.y = 0;
//    fps_x.z = -sin_yaw;
//
//    fps_y.x = fix16_mul(sin_yaw, sin_pitch);
//    fps_y.y = cos_pitch;
//    fps_y.z = fix16_mul(cos_yaw, sin_pitch);
//
//    fps_z.x = fix16_mul(sin_yaw, cos_pitch);
//    fps_z.y = -sin_pitch;
//    fps_z.z = fix16_mul(cos_yaw, cos_pitch);
//
//    dest->data[0][0] = fps_x.x;
//    dest->data[0][1] = fps_y.x;
//    dest->data[0][2] = fps_z.x;
//    dest->data[0][3] = 0;
//
//    dest->data[1][0] = fps_x.y;
//    dest->data[1][1] = fps_y.y;
//    dest->data[1][2] = fps_z.y;
//    dest->data[1][3] = 0;
//
//    dest->data[2][0] = fps_x.z;
//    dest->data[2][1] = fps_y.z;
//    dest->data[2][2] = fps_z.z;
//    dest->data[2][3] = 0;
//
//    dest->data[3][0] = -v4d_dot(&fps_x, eye);
//    dest->data[3][1] = -v4d_dot(&fps_y, eye);
//    dest->data[3][2] = -v4d_dot(&fps_z, eye);
//    dest->data[3][3] = fix16_one;
//}
//
//mf16 view_matrix = mat4_new();
//mf16 transform_matrix = mat4_new();
//
//mf16 tmp_matrix = mat4_new();
//mf16 tmp_matrix1 = mat4_new();
//mf16 tmp_matrix2 = mat4_new();
//mf16 tmp_matrix3 = mat4_new();
//
//v4d v4d_tmp1;
//v4d v4d_tmp2;
//v4d v4d_tmp3;
//
//void look_at_camera(mf16 *dest) {
//    create_translation(&tmp_matrix,
//                       fix16_from_int(camera_x),
//                       fix16_from_int(camera_y),
//                       fix16_from_int(camera_z));
//    create_rotation_y(&tmp_matrix1,
//                      fix16_div(fix16_from_int(camera_rot), F16C(10, 0)));
//    create_rotation_x(&tmp_matrix2,
//                      fix16_div(fix16_from_int(camera_rot_2), F16C(10, 0)));
//
//    mf16_mul(&tmp_matrix3, &tmp_matrix1, &tmp_matrix);
//    mf16_mul(&tmp_matrix1, &tmp_matrix2, &tmp_matrix3);
//
//    v4d_tmp1.x = tmp_matrix1.data[0][3];
//    v4d_tmp1.y = tmp_matrix1.data[1][3];
//    v4d_tmp1.z = tmp_matrix1.data[2][3];
//
//    v4d_tmp2.x = fix16_from_int(25);
//    v4d_tmp2.y = fix16_from_int(25);
//    v4d_tmp2.z = fix16_from_int(25);
//
//    v4d_tmp3.x = 0;
//    v4d_tmp3.y = fix16_one;
//    v4d_tmp3.z = 0;
//
//    create_look_at(&v4d_tmp1, &v4d_tmp2, &v4d_tmp3, &tmp_matrix);
//    mf16_transpose(&tmp_matrix, &tmp_matrix);
//
//    mf16_cholesky(&tmp_matrix1, &tmp_matrix);
//    mf16_invert_lt(&view_matrix, &tmp_matrix1);
//
//    create_translation(&tmp_matrix1,
//                       fix16_from_int(64),
//                       fix16_from_int(32),
//                       fix16_from_int(0));
//
//    mf16_mul(dest, &tmp_matrix1, &tmp_matrix);
//}
//
//void fps_camera(mf16 *dest) {
//    fix16_t PI_2 = fix16_mul(fix16_pi, F16C(2,0));
//
//    v4d_tmp1.x = fix16_div(fix16_from_int(-camera_x), fix16_from_int(1000));
//    v4d_tmp1.y = fix16_div(fix16_from_int(-camera_y), fix16_from_int(1000));
//    v4d_tmp1.z = fix16_div(fix16_from_int(-camera_z), fix16_from_int(100));
//
//    fix16_t pitch = fix16_div(fix16_from_int(camera_rot_2), F16C(100, 0));
//    fix16_t yaw = fix16_div(fix16_from_int(camera_rot), F16C(100, 0));
//
//    pitch = fix16_mod(pitch, PI_2);
//    yaw = fix16_mod(yaw, PI_2);
//
//    create_first_person_matrix(&v4d_tmp1, pitch, yaw, &tmp_matrix);
//
//    mf16_cholesky(&tmp_matrix1, &tmp_matrix);
//    mf16_invert_lt(dest, &tmp_matrix1);
//}
//
//
//
//void draw_scene() {
//    fps_camera(&view_matrix);
//    mf16_mul(&tmp_matrix, &view_matrix, &projection_matrix);
//
//    create_translation(&tmp_matrix1,
//                       fix16_from_int(64),
//                       fix16_from_int(32),
//                       fix16_from_int(0));
//
//    mf16_mul(&transform_matrix, &tmp_matrix1, &tmp_matrix);
//
//    vector_draw_box((Point) {0,0,0}, 1, 1, 1, &transform_matrix);
//}

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

void transform_coordinate(v4d* dest, v4d* coordinate, mf16* transform) {
    fix16_t x_1 = fix16_mul(coordinate->x,transform->data[0][0]);
    fix16_t x_2 = fix16_mul(coordinate->y,transform->data[1][0]);
    fix16_t x_3 = fix16_add(x_1, x_2);
    fix16_t x = fix16_add(x_3, transform->data[3][0]);

    fix16_t y_1 = fix16_mul(coordinate->x,transform->data[0][1]);
    fix16_t y_2 = fix16_mul(coordinate->y,transform->data[1][1]);
    fix16_t y_3 = fix16_add(y_1, y_2);
    fix16_t y = fix16_add(y_3, transform->data[3][1]);

    fix16_t z_1 = fix16_mul(coordinate->x,transform->data[0][2]);
    fix16_t z_2 = fix16_mul(coordinate->y,transform->data[1][2]);
    fix16_t z_3 = fix16_add(z_1, z_2);
    fix16_t z = fix16_add(z_3, transform->data[3][2]);

    fix16_t w_1 = fix16_mul(coordinate->x,transform->data[0][3]);
    fix16_t w_2 = fix16_mul(coordinate->y,transform->data[1][3]);
    fix16_t w_3 = fix16_add(w_1, w_2);
    fix16_t w_4 = fix16_mul(coordinate->z,transform->data[2][3]);
    fix16_t w_5 = fix16_add(w_3, w_4);
    fix16_t w_6 = fix16_add(w_5, transform->data[3][3]);
    fix16_t w = fix16_div(fix16_one, w_6);

    dest->x = fix16_mul(x, w);
    dest->y = fix16_mul(y, w);
    dest->z = fix16_mul(z, w);
    dest->w = 0;
}

void project(v4d* dest, v4d* coord, mf16* transform) {
    transform_coordinate(dest, coord, transform);

    dest->x = fix16_add(fix16_mul(dest->x, fix16_from_int(128)), fix16_from_int(64));
    dest->y = fix16_add(-fix16_mul(dest->y, fix16_from_int(64)), fix16_from_int(32));
}

//void look_at_lh(mf16* dest, v4d* eye, v4d* target, v4d* up) {
//    v4d z_axis;
//    v4d_sub(&z_axis, target, eye);
//    v4d_normalize(&z_axis, &z_axis);
//
//    v4d x_axis;
//    v4d_cross(&x_axis, up, &z_axis);
//    v4d_normalize(&x_axis, &x_axis);
//
//    v4d y_axis;
//    v4d_cross(&y_axis, &z_axis, &x_axis);
//
//    mf16_fill_diagonal(dest, fix16_one);
//
//    dest->data[0][0] = x_axis.x;
//    dest->data[0][1] = y_axis.x;
//    dest->data[0][2] = z_axis.x;
//
//    dest->data[1][0] = x_axis.y;
//    dest->data[1][1] = y_axis.y;
//    dest->data[1][2] = z_axis.y;
//
//    dest->data[2][0] = x_axis.z;
//    dest->data[2][1] = y_axis.z;
//    dest->data[2][2] = z_axis.z;
//
//    dest->data[3][0] = -v4d_dot(&x_axis, eye);
//    dest->data[3][1] = -v4d_dot(&y_axis, eye);
//    dest->data[3][2] = -v4d_dot(&z_axis, eye);
//}

void look_at_rh(mf16* dest, v4d* eye, v4d* target, v4d* up) {
    v4d z_axis;
    v4d_sub(&z_axis, eye, target);
    v4d_normalize(&z_axis, &z_axis);

    v4d x_axis;
    v4d_cross(&x_axis, up, &z_axis);
    v4d_normalize(&x_axis, &x_axis);

    v4d y_axis;
    v4d_cross(&y_axis, &x_axis, &z_axis);

    mf16_fill_diagonal(dest, fix16_one);

    dest->data[0][0] = x_axis.x;
    dest->data[0][1] = y_axis.x;
    dest->data[0][2] = z_axis.x;

    dest->data[1][0] = x_axis.y;
    dest->data[1][1] = y_axis.y;
    dest->data[1][2] = z_axis.y;

    dest->data[2][0] = x_axis.z;
    dest->data[2][1] = y_axis.z;
    dest->data[2][2] = z_axis.z;

    dest->data[3][0] = -v4d_dot(&x_axis, eye);
    dest->data[3][1] = -v4d_dot(&y_axis, eye);
    dest->data[3][2] = -v4d_dot(&z_axis, eye);
}

void perspective_fov_rh(mf16* dest, fix16_t fov, fix16_t aspect, fix16_t near, fix16_t far) {
    fix16_t y_scale = fix16_div(fix16_one, fix16_tan(fix16_div(fov, F16C(2,0))));
    fix16_t q = fix16_div(far, fix16_sub(near, far));

    mf16_fill(dest, 0);

    dest->data[0][0] = fix16_div(y_scale, aspect);
    dest->data[1][1] = y_scale;
    dest->data[2][2] = q;
    dest->data[2][3] = -fix16_one;
    dest->data[3][2] = fix16_mul(q, near);
}

void rotation_quaternion(mf16* dest, qf16* rot) {
    fix16_t xx = fix16_mul(rot->a, rot->a);
    fix16_t yy = fix16_mul(rot->b, rot->b);
    fix16_t zz = fix16_mul(rot->c, rot->c);

    fix16_t xw = fix16_mul(rot->a, rot->d);
    fix16_t xy = fix16_mul(rot->a, rot->b);

    fix16_t zw = fix16_mul(rot->c, rot->d);
    fix16_t zx = fix16_mul(rot->c, rot->a);

    fix16_t yw = fix16_mul(rot->b, rot->d);
    fix16_t yz = fix16_mul(rot->b, rot->c);

    mf16_fill_diagonal(dest, fix16_one);
    dest->data[0][0] = fix16_sub(fix16_one, fix16_mul(F16C(2,0), fix16_add(yy, zz)));
    dest->data[0][1] = fix16_mul(F16C(2,0), fix16_add(xy, zw));
    dest->data[0][2] = fix16_mul(F16C(2,0), fix16_sub(zx, yw));

    dest->data[1][0] = fix16_mul(F16C(2,0), fix16_sub(xy, zw));
    dest->data[1][1] = fix16_sub(fix16_one, fix16_mul(F16C(2,0), fix16_add(zz, xx)));
    dest->data[0][1] = fix16_mul(F16C(2,0), fix16_add(yz, xw));

    dest->data[2][0] = fix16_mul(F16C(2,0), fix16_add(zx, yw));
    dest->data[2][1] = fix16_mul(F16C(2,0), fix16_sub(yz, xw));
    dest->data[2][2] = fix16_sub(fix16_one, fix16_mul(F16C(2,0), fix16_add(yy, xx)));
}

void rotation_yaw_pitch_roll(mf16* dest, fix16_t yaw, fix16_t pitch, fix16_t roll) {

    fix16_t half_roll = fix16_div(roll, F16C(2,0));
    fix16_t half_pitch = fix16_div(pitch, F16C(2,0));
    fix16_t half_yaw = fix16_div(yaw, F16C(2,0));

    fix16_t sin_roll = fix16_sin(half_roll);
    fix16_t cos_roll = fix16_cos(half_roll);
    fix16_t sin_pitch = fix16_sin(half_pitch);
    fix16_t cos_pitch = fix16_sin(half_pitch);
    fix16_t sin_yaw = fix16_sin(half_yaw);
    fix16_t cos_yaw = fix16_sin(half_yaw);

    qf16 quat;
    quat.a = fix16_add(
            fix16_mul(fix16_mul(cos_yaw, sin_pitch), cos_roll),
            fix16_mul(fix16_mul(sin_yaw, cos_pitch), sin_roll));
    quat.b = fix16_sub(
            fix16_mul(fix16_mul(sin_yaw, cos_pitch), cos_roll),
            fix16_mul(fix16_mul(cos_yaw, sin_pitch), sin_roll));
    quat.c = fix16_sub(
            fix16_mul(fix16_mul(cos_yaw, cos_pitch), sin_roll),
            fix16_mul(fix16_mul(sin_yaw, sin_pitch), cos_roll));
    quat.d = fix16_add(
            fix16_mul(fix16_mul(cos_yaw, cos_pitch), cos_roll),
            fix16_mul(fix16_mul(sin_yaw, sin_pitch), sin_roll));

    rotation_quaternion(dest, &quat);

}

void translation(mf16* dest, v4d* trans) {
    mf16_fill_diagonal(dest, fix16_one);

    dest->data[3][0] = trans->x;
    dest->data[3][1] = trans->x;
    dest->data[3][2] = trans->x;
}

mf16 rotation_tmp_matrix_1 = mat4_new();
mf16 rotation_tmp_matrix_2 = mat4_new();
void rotation(mf16* dest, v4d* rot) {
    mf16_fill_diagonal(&rotation_tmp_matrix_2, fix16_one);

    create_rotation_x(&rotation_tmp_matrix_1, rot->x);
    mf16_mul(dest, &rotation_tmp_matrix_2, &rotation_tmp_matrix_1);

    create_rotation_y(&rotation_tmp_matrix_1, rot->y);
    mf16_mul(&rotation_tmp_matrix_2, dest, &rotation_tmp_matrix_1);

    create_rotation_z(&rotation_tmp_matrix_1, rot->z);
    mf16_mul(dest, &rotation_tmp_matrix_2, &rotation_tmp_matrix_1);
}

mf16 world_view_matrix = mat4_new();
mf16 view_matrix = mat4_new();
mf16 world_matrix = mat4_new();
mf16 projection_matrix = mat4_new();

mf16 rotation_matrix = mat4_new();
mf16 translation_matrix = mat4_new();
mf16 transform_matrix = mat4_new();

v4d camera_up = {0,0x00010000,0,0};
v4d mesh_rotation = (v4d){0,0,0,0};
v4d mesh_position = (v4d){0,0,0,0};

int time = 0;
void render() {
    time++;
    fix16_t angle = fix16_div(fix16_from_int(-camera_rot), F16C(100,0));

    fix16_t x = fix16_div(fix16_from_int(camera_x), F16C(10,0));
    fix16_t y = fix16_div(fix16_from_int(camera_y), F16C(10,0));
    fix16_t z = fix16_div(fix16_from_int(camera_z), F16C(1,0));

//    fix16_t x_r = fix16_mul(x, fix16_cos(angle));
//    fix16_t z_r = fix16_mul(z, fix16_sin(angle));

    fix16_t x_r = fix16_mul(fix16_sin(angle), fix16_from_int(10));
    fix16_t z_r = fix16_mul(fix16_cos(angle), fix16_from_int(10));

    v4d camera_position = (v4d){x,y,fix16_add(z,F16C(10,0)),0};
    v4d target_position = (v4d){fix16_add(x,10),y,fix16_add(z, fix16_one),0};

    look_at_rh(&view_matrix, &camera_position, &target_position, &camera_up);

    perspective_fov_rh(&projection_matrix, F16C(0,78), fix16_from_int(2), fix16_div(fix16_one, fix16_from_int(100)), fix16_one);

//    rotation_yaw_pitch_roll(&rotation_matrix, mesh_rotation.x,mesh_rotation.y,mesh_rotation.z);
    rotation(&rotation_matrix, &mesh_rotation);
    translation(&translation_matrix, &mesh_position);

    mf16_mul(&world_matrix, &rotation_matrix, &translation_matrix);
    mf16_mul(&world_view_matrix, &world_matrix, &view_matrix);
    mf16_mul(&transform_matrix, &world_view_matrix, &projection_matrix);

    vector_draw_plane((Point){-1,-1,1}, (Point){1,-1,1}, (Point){1, 1,1}, (Point){-1, 1,1}, &transform_matrix);
    vector_draw_plane((Point){-1,-1,-1}, (Point){1,-1,-1}, (Point){1, 1,-1}, (Point){-1, 1,-1}, &transform_matrix);
    vector_draw_plane((Point){-1,-1,-1}, (Point){-1,-1,1}, (Point){-1, 1,1}, (Point){-1, 1,-1}, &transform_matrix);
    vector_draw_plane((Point){1,-1,-1}, (Point){1,-1,1}, (Point){1, 1,1}, (Point){1, 1,-1}, &transform_matrix);
}

void vector_draw_plane(Point p0, Point p1, Point p2, Point p3, mf16 *transform_matrix) {
    v4d vertexes[] = {
            point_to_v4d(&p0),
            point_to_v4d(&p1),
            point_to_v4d(&p2),
            point_to_v4d(&p3),
    };

    Point points[4];
    for (int i = 0; i < 4; i++) {
        v4d* vertex = &vertexes[i];
        v4d point;

        project(&point, vertex, transform_matrix);

        int x = fix16_to_int(point.x);
        int y = fix16_to_int(point.y);
        int z = fix16_to_int(point.y);
        points[i] = (Point){x,y,z};
    }
    vector_plane(points[0], points[1], points[2], points[3]);
}



















int always_false = 0;
void game_init() {
    if (always_false)
        debug_methods_exist();

    canvas_clear();
//    fix16_t fov = fix16_div(fix16_one, F16C(0.1, 0));
//    set_perspective_projection(fov, fov, 5, 1000);
}

void game_loop() {
    handle_input();

    canvas_clear();
//    draw_scene();
    render();

    canvas_flush();
}
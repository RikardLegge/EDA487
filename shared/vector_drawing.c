#include "vector_drawing.h"
#include "canvas.h"
#include "libfixmatrix/fixvector4d.h"

int point_dist(Point p0, Point p1) {
    int dx = p0.x - p0.y;
    int dy = p0.y - p1.y;
    int dz = p0.z - p1.z;
    return dx*dx+dy*dy+dz*dz;
}

Point point_new(int x, int y, int z) {
    return (Point) {.x=x, .y=y, .z=z};
}

Point point_add(Point p0, Point p1){
    return (Point) {.x=p0.x + p1.x, .y=p0.y+p1.y, .z=p0.z+p1.z};
}
Point point_offset(Point p, int x, int y, int z) {
    return (Point) {.x=p.x+x, .y=p.y+y, .z=p.z+z};
}

Point point_from_v4d(v4d* vec) {
    return (Point) {.x=fix16_to_int(vec->x), .y=fix16_to_int(vec->y), .z=-fix16_to_int(vec->z)};
}

v4d point_to_v4d(Point* point) {
    return (v4d) {
            .x=fix16_from_int(point->x),
            .y=fix16_from_int(point->y),
            .z=fix16_from_int(-point->z),
            .w=fix16_one,
    };
}

// https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
void vector_line_low(int x0, int y0, int x1, int y1) {
    int dx = x1 - x0;
    int dy = y1 - y0;
    int yi = 1;
    if(dy < 0) {
        yi = -1;
        dy = -dy;
    }
    int D = 2*dy - dx;
    int y = y0;

    for(int x = x0; x <= x1; x++) {
        canvas_pixel(x, y,1);
        if(D > 0){
            y = y + yi;
            D = D - 2 * dx;
        }
        D = D + 2 * dy;
    }
}

void vector_line_high(int x0, int y0, int x1, int y1) {
    int dx = x1 - x0;
    int dy = y1 - y0;
    int xi = 1;
    if(dx < 0) {
        xi = -1;
        dx = -dx;
    }
    int D = 2*dx - dy;
    int x = x0;

    for(int y = y0; y <= y1; y++) {
        canvas_pixel(x, y,1);
        if(D > 0){
        x = x + xi;
        D = D - 2 * dy;
    }
        D = D + 2 * dx;
    }
}

void vector_line(Point p0, Point p1) {
    int x0 = p0.x;
    int y0 = p0.y;
    int x1 = p1.x;
    int y1 = p1.y;
    if (abs(y1 - y0) < abs(x1 - x0)) {
        if (x0 > x1) {
            vector_line_low(x1, y1, x0, y0);
        } else {
            vector_line_low(x0, y0, x1, y1);
        }
    } else {
        if (y0 > y1) {
            vector_line_high(x1, y1, x0, y0);
        } else {
            vector_line_high(x0, y0, x1, y1);
        }
    }
}

void vector_plane(Point p0, Point p1, Point p2, Point p3) {
    int near = 5;
    if(p0.z > near || p1.z > near || p2.z > near || p3.z > near )
        return;

    vector_line(p0, p1);
    vector_line(p1, p2);
    vector_line(p2, p3);
    vector_line(p3, p0);

//    vector_line(p0, p2);
}


void to_cartesian(v4d* vec) {
    vec->x = fix16_div(vec->x, vec->w);
    vec->y = fix16_div(vec->y, vec->w);
    vec->z = fix16_div(vec->z, vec->w);
}

void to_homogeneous(v4d* vec) {
    fix16_t w = vec->w;

    vec->x = fix16_mul(vec->x, w);
    vec->y = fix16_mul(vec->y, w);
    vec->z = fix16_mul(vec->z, w);
}

void vector_draw_plane(Point p0, Point p1, Point p2, Point p3, mf16 *transform_matrix) {
    v4d vectors[] = {
            point_to_v4d(&p0),
            point_to_v4d(&p1),
            point_to_v4d(&p2),
            point_to_v4d(&p3),
    };

    Point points[4];
    for (int i = 0; i < 4; i++) {
//        to_cartesian(&vectors[i]);
        v4d vector_transformed;
        v4d_mf16_mult(&vectors[i], transform_matrix, &vector_transformed);
        to_cartesian(&vector_transformed);
        points[i] = point_from_v4d(&vector_transformed);
    }
    vector_plane(points[0], points[1], points[2], points[3]);
}

void vector_draw_box(Point tl, int w, int h, int d, mf16 *transform_matrix) {
    int x = tl.x;
    int y = tl.y;
    int z = tl.z;

    vector_draw_plane(
            point_new(x - w, y - h, z - d),
            point_new(x + w, y - h, z - d),
            point_new(x + w, y + h, z - d),
            point_new(x - w, y + h, z - d),
            transform_matrix
    );

    vector_draw_plane(
            point_new(x - w, y - h, z + d),
            point_new(x + w, y - h, z + d),
            point_new(x + w, y + h, z + d),
            point_new(x - w, y + h, z + d),
            transform_matrix
    );

    vector_draw_plane(
            point_new(x - w, y - h, z + d),
            point_new(x - w, y + h, z + d),
            point_new(x - w, y + h, z - d),
            point_new(x - w, y - h, z - d),
            transform_matrix
    );

    vector_draw_plane(
            point_new(x + w, y - h, z + d),
            point_new(x + w, y + h, z + d),
            point_new(x + w, y + h, z - d),
            point_new(x + w, y - h, z - d),
            transform_matrix
    );
}
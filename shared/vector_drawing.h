#ifndef ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H
#define ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

#include "libfixmatrix/fixvector4d.h"

typedef struct Point {
    int x;
    int y;
    int z;
} Point;

Point point_new(int x, int y, int z);

int point_dist(Point p0, Point p1);
Point point_add(Point p0, Point p1);
Point point_offset(Point p0, int x, int y, int z);

Point point_from_v4d(v4d* vec);
v4d point_to_v4d(Point* point);

#endif //ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

void vector_line(Point p0, Point p1);
void vector_plane(Point p0, Point p1, Point p2, Point p3);

void vector_draw_plane(Point p0, Point p1, Point p2, Point p3, mf16 *transform_matrix);
void vector_draw_box(Point tl, int w, int h, int d, mf16 *transform_matrix);
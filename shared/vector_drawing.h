#ifndef ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H
#define ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

#include "libfixmatrix/fixvector4d.h"

typedef struct Point {
    int x;
    int y;
} Point;

int point_dist(Point p0, Point p1);
Point point_add(Point p0, Point p1);
Point point_offset(Point p0, int x, int y);
Point point_from_v4d(v4d* vec);

#endif //ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

void vector_line(Point p0, Point p1);
void vector_plane(Point p0, Point p1, Point p2, Point p3);
#include "matrix-lib/gl-matrix.h"

#ifndef ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H
#define ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

typedef struct Point {
    int x;
    int y;
} Point;

Point point_new(int x, int y);

#endif //ARM_DISPLAY_EMULATOR_VECTOR_DRAWING_H

void vector_line(Point p0, Point p1);
void vector_plane(Point p0, Point p1, Point p2, Point p3);

#include "vector_drawing.h"
#include "canvas.h"
#include "libfixmatrix/fixvector4d.h"

int point_dist(Point p0, Point p1) {
    int dx = p0.x - p0.y;
    int dy = p1.x - p1.y;
    return dx*dx+dy*dy;
}

Point point_add(Point p0, Point p1){
    return (Point) {.x=p0.x + p1.x, .y=p0.y+p1.y};
}
Point point_offset(Point p, int x, int y) {
    return (Point) {.x=p.x+x, .y=p.y+y};
}

Point point_from_v4d(v4d* vec) {
    return (Point) {.x=vec->x, .y=vec->y};
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
    vector_line(p0, p1);
    vector_line(p1, p2);
    vector_line(p2, p3);
    vector_line(p3, p0);

    vector_line(p0, p2);
}
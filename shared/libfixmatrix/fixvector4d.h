/* 3D vector operations */

#ifndef _fixvector4d_h_
#define _fixvector4d_h_

#include "../libfixmath/fix16.h"
#include "fixmatrix.h"

typedef struct {
	fix16_t x;
	fix16_t y;
	fix16_t z;
	fix16_t w;
} v4d;

// Basic arithmetic
void v4d_mf16_mult(const v4d *v, const mf16 *M, v4d *dest);
void v4d_add(v4d *dest, const v4d *a, const v4d *b);
void v4d_sub(v4d *dest, const v4d *a, const v4d *b);
void v4d_mul_s(v4d *dest, const v4d *a, fix16_t b);
void v4d_div_s(v4d *dest, const v4d *a, fix16_t b);

// Norm
fix16_t v4d_norm(const v4d *a);
void v4d_normalize(v4d *dest, const v4d *a);

// Dot product
fix16_t v4d_dot(const v4d *a, const v4d *b);
void v4d_cross(v4d *dest, const v4d *a, const v4d *b);

#endif
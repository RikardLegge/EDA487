#include "fixvector4d.h"
#include "fixarray.h"

void v4d_add(v4d *dest, const v4d *a, const v4d *b)
{
        dest->x = fix16_add(a->x, b->x);
        dest->y = fix16_add(a->y, b->y);
        dest->z = fix16_add(a->z, b->z);
        dest->w = fix16_add(a->w, b->w);
}

void v4d_sub(v4d *dest, const v4d *a, const v4d *b)
{
        dest->x = fix16_sub(a->x, b->x);
        dest->y = fix16_sub(a->y, b->y);
        dest->z = fix16_sub(a->z, b->z);
        dest->w = fix16_sub(a->w, b->w);
}

void v4d_mul_s(v4d *dest, const v4d *a, fix16_t b)
{
        dest->x = fix16_mul(a->x, b);
        dest->y = fix16_mul(a->y, b);
        dest->z = fix16_mul(a->z, b);
        dest->w = fix16_mul(a->w, b);
}

void v4d_div_s(v4d *dest, const v4d *a, fix16_t b)
{
        dest->x = fix16_div(a->x, b);
        dest->y = fix16_div(a->y, b);
        dest->z = fix16_div(a->z, b);
        dest->w = fix16_div(a->w, b);
}

// Norm
fix16_t v4d_norm(const v4d *a)
{
    return fa16_norm(&a->x, &a->y - &a->x, 4);
}

void v4d_normalize(v4d *dest, const v4d *a)
{
    v4d_div_s(dest, a, v4d_norm(a));
}

// Dot product
fix16_t v4d_dot(const v4d *a, const v4d *b)
{
    return fa16_dot(&a->x, &a->y - &a->x, &b->x, &b->y - &b->x, 4);
}

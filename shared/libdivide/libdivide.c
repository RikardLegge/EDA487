#include "libdivide.h"

//int32_t mod(int32_t val, int32_t div) {
//    while(val >= div) val -= div;
//    return val;
//}

int32_t mod(int32_t number, uint32_t divisor) {
    int sign = 1;
    if(number < 0) {
        sign = -1;
        number = -number;
    } 
    int32_t Q = 0;
    int32_t R = 0;

    for(int i = sizeof(int32_t)*8-1; i >= 0; i--) {
        R = R << 1;

        if(0x1 & (number >> i))
            R |= 0x1;
        else
            R &= ~0x1;

        if(R >= divisor) {
            R = R - divisor;
            Q |= 0x1<<i;
        }
    }
    return R*sign;
}

int32_t divide_s(int32_t number, uint32_t divisor) {
    int sign = 1;
    if(number < 0) {
        sign = -1;
        number = -number;
    }
    int32_t Q = 0;
    int32_t R = 0;

    for(int i = sizeof(int32_t)*8-1; i >= 0; i--) {
        R = R << 1;

        if(0x1 & (number >> i))
            R |= 0x1;
        else
            R &= ~0x1;

        if(R >= divisor) {
            R = R - divisor;
            Q |= 0x1<<i;
        }
    }
    return Q*sign;
}

//https://en.wikipedia.org/wiki/Division_algorithm#Integer_division_(unsigned)_with_remainder
uint32_t divide_u(uint32_t number, uint32_t divisor) {
    uint32_t Q = 0;
    uint32_t R = 0;

    for(int i = sizeof(uint32_t)*8-1; i >= 0; i--) {
        R = R << 1;

        if(0x1 & (number >> i))
            R |= 0x1;
        else
            R &= ~0x1;

        if(R >= divisor) {
            R = R - divisor;
            Q |= 0x1<<i;
        }
    }
    return Q;
}

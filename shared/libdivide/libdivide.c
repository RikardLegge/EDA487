#include "libdivide.h"

int32_t mod(int32_t val, int32_t div) {
    while(val > mod) val -= div;
    return val;
}

int32_t divide(int32_t number, int32_t divisor) {
    return 0;
}

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

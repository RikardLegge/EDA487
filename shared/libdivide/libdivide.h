#ifndef ARM_DISPLAY_EMULATOR_LIBDIVIDE_H
#define ARM_DISPLAY_EMULATOR_LIBDIVIDE_H

#endif //ARM_DISPLAY_EMULATOR_LIBDIVIDE_H

#include <stdint.h>

int32_t mod(int32_t val, uint32_t div);
uint32_t divide_u(uint32_t number, uint32_t divisor);
int32_t divide_s(int32_t number, uint32_t divisor);
#ifndef ARM_DISPLAY_EMULATOR_UTIL_H
#define ARM_DISPLAY_EMULATOR_UTIL_H

#define repeat_forever while(1)
#define for_range(start, stop) for(int index = start; index < stop; index++)

typedef unsigned char uint8_t;
#endif

int abs(int number);
int sign(int num);

float absf(float num);
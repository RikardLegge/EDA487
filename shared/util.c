#include "util.h"

int abs(int num) {
    return num > 0 ? num : -num;
}

int sign(int num) {
    if(num < 0) {
        return -1;
    } else if (num > 0) {
        return 1;
    } else {
        return 0;
    }
}
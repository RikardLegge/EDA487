#include <stdlib.h>
#include "sdl_emulator.h"
#include "../shared/game.h"
#include "../shared/external.h"

#include "../shared/libdivide/libdivide.h"
int main(int argc, char *argv[]) {
    emulator_init();
    game_init();

    while(!emulator_exit()) {
        game_loop();
        emulator_end_frame();
        delay_milli(20);
    }

    emulator_dispose();

    exit(0);
}

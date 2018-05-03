void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
    asm volatile(
    " LDR R0,=0x2001C000\n"		/* set stack */
    " MOV SP,R0\n"
    " BL main\n"				/* call main */
    ".L1: B .L1\n"				/* never return */
    ) ;
}

#include "../shared/game.h"

void main() {
    *((unsigned long *) 0x40023830) = 0x18;
    asm volatile(
        " LDR r0,=0x08000209 \n"
        " BLX r0 \n"
    );

    game_main();
}
   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"main.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "/Users/legge/Development/moppen-game/device/main.c"
   1:/Users/legge/Development/moppen-game/device/main.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   2:/Users/legge/Development/moppen-game/device/main.c **** 
   3:/Users/legge/Development/moppen-game/device/main.c **** void startup ( void )
   4:/Users/legge/Development/moppen-game/device/main.c **** {
  26              		.loc 1 4 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   5:/Users/legge/Development/moppen-game/device/main.c ****     asm volatile(
  31              		.loc 1 5 0
  32              		.syntax divided
  33              	@ 5 "/Users/legge/Development/moppen-game/device/main.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
   6:/Users/legge/Development/moppen-game/device/main.c ****     " LDR R0,=0x2001C000\n"		/* set stack */
   7:/Users/legge/Development/moppen-game/device/main.c ****     " MOV SP,R0\n"
   8:/Users/legge/Development/moppen-game/device/main.c ****     " BL main\n"				/* call main */
   9:/Users/legge/Development/moppen-game/device/main.c ****     ".L1: B .L1\n"				/* never return */
  10:/Users/legge/Development/moppen-game/device/main.c ****     ) ;
  11:/Users/legge/Development/moppen-game/device/main.c **** }
  40              		.loc 1 11 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.section	.rodata
  48              		.align	2
  49              	.LC0:
  50 0000 54657374 		.ascii	"Test\000"
  50      00
  51              		.text
  52              		.align	1
  53              		.global	main
  54              		.syntax unified
  55              		.code	16
  56              		.thumb_func
  57              		.fpu softvfp
  59              	main:
  60              	.LFB1:
  12:/Users/legge/Development/moppen-game/device/main.c **** 
  13:/Users/legge/Development/moppen-game/device/main.c **** #include "../shared/game.h"
  14:/Users/legge/Development/moppen-game/device/main.c **** #include "device/device_runtime.h"
  15:/Users/legge/Development/moppen-game/device/main.c **** 
  16:/Users/legge/Development/moppen-game/device/main.c **** void main() {
  61              		.loc 1 16 0
  62              		.cfi_startproc
  63              		@ args = 0, pretend = 0, frame = 0
  64              		@ frame_needed = 1, uses_anonymous_args = 0
  65 0000 80B5     		push	{r7, lr}
  66              		.cfi_def_cfa_offset 8
  67              		.cfi_offset 7, -8
  68              		.cfi_offset 14, -4
  69 0002 00AF     		add	r7, sp, #0
  70              		.cfi_def_cfa_register 7
  17:/Users/legge/Development/moppen-game/device/main.c **** //    *((unsigned long *) 0x40023830) = 0x18;
  18:/Users/legge/Development/moppen-game/device/main.c **** //    asm volatile(
  19:/Users/legge/Development/moppen-game/device/main.c **** //        " LDR r0,=0x08000209 \n"
  20:/Users/legge/Development/moppen-game/device/main.c **** //        " BLX r0 \n"
  21:/Users/legge/Development/moppen-game/device/main.c **** //    );
  22:/Users/legge/Development/moppen-game/device/main.c ****     
  23:/Users/legge/Development/moppen-game/device/main.c ****     device_init();
  71              		.loc 1 23 0
  72 0004 FFF7FEFF 		bl	device_init
  24:/Users/legge/Development/moppen-game/device/main.c ****     ascii_write_text("Test", 1,1);
  73              		.loc 1 24 0
  74 0008 044B     		ldr	r3, .L4
  75 000a 0122     		movs	r2, #1
  76 000c 0121     		movs	r1, #1
  77 000e 1800     		movs	r0, r3
  78 0010 FFF7FEFF 		bl	ascii_write_text
  25:/Users/legge/Development/moppen-game/device/main.c ****     return;
  79              		.loc 1 25 0
  80 0014 C046     		nop
  26:/Users/legge/Development/moppen-game/device/main.c ****     game_init();
  27:/Users/legge/Development/moppen-game/device/main.c **** 
  28:/Users/legge/Development/moppen-game/device/main.c ****     while(1) {
  29:/Users/legge/Development/moppen-game/device/main.c ****         game_loop();
  30:/Users/legge/Development/moppen-game/device/main.c ****     }
  31:/Users/legge/Development/moppen-game/device/main.c **** }...
  81              		.loc 1 31 0
  82 0016 BD46     		mov	sp, r7
  83              		@ sp needed
  84 0018 80BD     		pop	{r7, pc}
  85              	.L5:
  86 001a C046     		.align	2
  87              	.L4:
  88 001c 00000000 		.word	.LC0
  89              		.cfi_endproc
  90              	.LFE1:
  92              	.Letext0:

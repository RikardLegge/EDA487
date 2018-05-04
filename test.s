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
  47              		.text
  48              		.align	1
  49              		.global	main
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	main:
  56              	.LFB1:
  12:/Users/legge/Development/moppen-game/device/main.c **** 
  13:/Users/legge/Development/moppen-game/device/main.c **** #include "../shared/game.h"
  14:/Users/legge/Development/moppen-game/device/main.c **** #include "device/device_runtime.h"
  15:/Users/legge/Development/moppen-game/device/main.c **** 
  16:/Users/legge/Development/moppen-game/device/main.c **** void main() {
  57              		.loc 1 16 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  17:/Users/legge/Development/moppen-game/device/main.c **** //    *((unsigned long *) 0x40023830) = 0x18;
  18:/Users/legge/Development/moppen-game/device/main.c **** //    asm volatile(
  19:/Users/legge/Development/moppen-game/device/main.c **** //        " LDR r0,=0x08000209 \n"
  20:/Users/legge/Development/moppen-game/device/main.c **** //        " BLX r0 \n"
  21:/Users/legge/Development/moppen-game/device/main.c **** //    );
  22:/Users/legge/Development/moppen-game/device/main.c ****     
  23:/Users/legge/Development/moppen-game/device/main.c ****     device_init();
  67              		.loc 1 23 0
  68 0004 FFF7FEFF 		bl	device_init
  24:/Users/legge/Development/moppen-game/device/main.c ****     game_init();
  69              		.loc 1 24 0
  70 0008 FFF7FEFF 		bl	game_init
  71              	.L3:
  25:/Users/legge/Development/moppen-game/device/main.c **** 
  26:/Users/legge/Development/moppen-game/device/main.c ****     while(1) {
  27:/Users/legge/Development/moppen-game/device/main.c ****         game_loop();
  72              		.loc 1 27 0 discriminator 1
  73 000c FFF7FEFF 		bl	game_loop
  74 0010 FCE7     		b	.L3
  75              		.cfi_endproc
  76              	.LFE1:
  78              	.Letext0:

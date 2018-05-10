   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 1
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"util.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	abs
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	abs:
  23              	.LFB0:
  24              		.file 1 "/Users/legge/Development/moppen-game/shared/util.c"
   1:/Users/legge/Development/moppen-game/shared/util.c **** #include "util.h"
   2:/Users/legge/Development/moppen-game/shared/util.c **** 
   3:/Users/legge/Development/moppen-game/shared/util.c **** int abs(int num) {
  25              		.loc 1 3 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 0, uses_anonymous_args = 0
  29              		@ link register save eliminated.
  30              	.LVL0:
   4:/Users/legge/Development/moppen-game/shared/util.c ****     return num > 0 ? num : -num;
  31              		.loc 1 4 0
  32 0000 C317     		asrs	r3, r0, #31
  33 0002 C018     		adds	r0, r0, r3
  34              	.LVL1:
  35 0004 5840     		eors	r0, r3
   5:/Users/legge/Development/moppen-game/shared/util.c **** }
  36              		.loc 1 5 0
  37              		@ sp needed
  38 0006 7047     		bx	lr
  39              		.cfi_endproc
  40              	.LFE0:
  42              	.Letext0:

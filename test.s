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
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 7860     		str	r0, [r7, #4]
   4:/Users/legge/Development/moppen-game/shared/util.c ****     return num > 0 ? num : -num;
  38              		.loc 1 4 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a DA17     		asrs	r2, r3, #31
  41 000c 9B18     		adds	r3, r3, r2
  42 000e 5340     		eors	r3, r2
   5:/Users/legge/Development/moppen-game/shared/util.c **** }
  43              		.loc 1 5 0
  44 0010 1800     		movs	r0, r3
  45 0012 BD46     		mov	sp, r7
  46 0014 02B0     		add	sp, sp, #8
  47              		@ sp needed
  48 0016 80BD     		pop	{r7, pc}
  49              		.cfi_endproc
  50              	.LFE0:
  52              		.global	__aeabi_fcmpgt
  53              		.align	1
  54              		.global	absf
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	absf:
  61              	.LFB1:
   6:/Users/legge/Development/moppen-game/shared/util.c **** 
   7:/Users/legge/Development/moppen-game/shared/util.c **** float absf(float num) {
  62              		.loc 1 7 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 8
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0018 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 001a 82B0     		sub	sp, sp, #8
  71              		.cfi_def_cfa_offset 16
  72 001c 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  74 001e 7860     		str	r0, [r7, #4]
   8:/Users/legge/Development/moppen-game/shared/util.c ****     return num > 0 ? num : -num;
  75              		.loc 1 8 0
  76 0020 0021     		movs	r1, #0
  77 0022 7868     		ldr	r0, [r7, #4]
  78 0024 FFF7FEFF 		bl	__aeabi_fcmpgt
  79              	.LVL0:
  80 0028 031E     		subs	r3, r0, #0
  81 002a 01D0     		beq	.L9
  82              		.loc 1 8 0 is_stmt 0 discriminator 1
  83 002c 7B68     		ldr	r3, [r7, #4]
  84 002e 03E0     		b	.L7
  85              	.L9:
  86              		.loc 1 8 0 discriminator 2
  87 0030 7B68     		ldr	r3, [r7, #4]
  88 0032 8022     		movs	r2, #128
  89 0034 1206     		lsls	r2, r2, #24
  90 0036 5340     		eors	r3, r2
  91              	.L7:
   9:/Users/legge/Development/moppen-game/shared/util.c **** }
  92              		.loc 1 9 0 is_stmt 1 discriminator 5
  93 0038 181C     		adds	r0, r3, #0
  94 003a BD46     		mov	sp, r7
  95 003c 02B0     		add	sp, sp, #8
  96              		@ sp needed
  97 003e 80BD     		pop	{r7, pc}
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	1
 102              		.global	sign
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	sign:
 109              	.LFB2:
  10:/Users/legge/Development/moppen-game/shared/util.c **** 
  11:/Users/legge/Development/moppen-game/shared/util.c **** int sign(int num) {
 110              		.loc 1 11 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 8
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 0040 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 0042 82B0     		sub	sp, sp, #8
 119              		.cfi_def_cfa_offset 16
 120 0044 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
 122 0046 7860     		str	r0, [r7, #4]
  12:/Users/legge/Development/moppen-game/shared/util.c ****     if(num < 0) {
 123              		.loc 1 12 0
 124 0048 7B68     		ldr	r3, [r7, #4]
 125 004a 002B     		cmp	r3, #0
 126 004c 02DA     		bge	.L11
  13:/Users/legge/Development/moppen-game/shared/util.c ****         return -1;
 127              		.loc 1 13 0
 128 004e 0123     		movs	r3, #1
 129 0050 5B42     		rsbs	r3, r3, #0
 130 0052 05E0     		b	.L12
 131              	.L11:
  14:/Users/legge/Development/moppen-game/shared/util.c ****     } else if (num > 0) {
 132              		.loc 1 14 0
 133 0054 7B68     		ldr	r3, [r7, #4]
 134 0056 002B     		cmp	r3, #0
 135 0058 01DD     		ble	.L13
  15:/Users/legge/Development/moppen-game/shared/util.c ****         return 1;
 136              		.loc 1 15 0
 137 005a 0123     		movs	r3, #1
 138 005c 00E0     		b	.L12
 139              	.L13:
  16:/Users/legge/Development/moppen-game/shared/util.c ****     } else {
  17:/Users/legge/Development/moppen-game/shared/util.c ****         return 0;
 140              		.loc 1 17 0
 141 005e 0023     		movs	r3, #0
 142              	.L12:
  18:/Users/legge/Development/moppen-game/shared/util.c ****     }
  19:/Users/legge/Development/moppen-game/shared/util.c **** }...
 143              		.loc 1 19 0
 144 0060 1800     		movs	r0, r3
 145 0062 BD46     		mov	sp, r7
 146 0064 02B0     		add	sp, sp, #8
 147              		@ sp needed
 148 0066 80BD     		pop	{r7, pc}
 149              		.cfi_endproc
 150              	.LFE2:
 152              	.Letext0:

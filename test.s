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
  11              		.file	"export.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	sin
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	sin:
  23              	.LFB0:
  24              		.file 1 "/Users/legge/Development/moppen-game/shared/math/export.c"
   1:/Users/legge/Development/moppen-game/shared/math/export.c **** #include "arm_math.h"
   2:/Users/legge/Development/moppen-game/shared/math/export.c **** 
   3:/Users/legge/Development/moppen-game/shared/math/export.c **** float sin(float v) {
  25              		.loc 1 3 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 0, uses_anonymous_args = 0
  29              	.LVL0:
  30 0000 10B5     		push	{r4, lr}
  31              		.cfi_def_cfa_offset 8
  32              		.cfi_offset 4, -8
  33              		.cfi_offset 14, -4
   4:/Users/legge/Development/moppen-game/shared/math/export.c ****     return ARM__sinf(v);
  34              		.loc 1 4 0
  35 0002 FFF7FEFF 		bl	ARM__sinf
  36              	.LVL1:
   5:/Users/legge/Development/moppen-game/shared/math/export.c **** }
  37              		.loc 1 5 0
  38              		@ sp needed
  39 0006 10BD     		pop	{r4, pc}
  40              		.cfi_endproc
  41              	.LFE0:
  43              		.align	1
  44              		.global	cos
  45              		.syntax unified
  46              		.code	16
  47              		.thumb_func
  48              		.fpu softvfp
  50              	cos:
  51              	.LFB1:
   6:/Users/legge/Development/moppen-game/shared/math/export.c **** 
   7:/Users/legge/Development/moppen-game/shared/math/export.c **** float cos(float v) {
  52              		.loc 1 7 0
  53              		.cfi_startproc
  54              		@ args = 0, pretend = 0, frame = 0
  55              		@ frame_needed = 0, uses_anonymous_args = 0
  56              	.LVL2:
  57 0008 10B5     		push	{r4, lr}
  58              		.cfi_def_cfa_offset 8
  59              		.cfi_offset 4, -8
  60              		.cfi_offset 14, -4
   8:/Users/legge/Development/moppen-game/shared/math/export.c ****     return ARM__cosf(v);
  61              		.loc 1 8 0
  62 000a FFF7FEFF 		bl	ARM__cosf
  63              	.LVL3:
   9:/Users/legge/Development/moppen-game/shared/math/export.c **** }
  64              		.loc 1 9 0
  65              		@ sp needed
  66 000e 10BD     		pop	{r4, pc}
  67              		.cfi_endproc
  68              	.LFE1:
  70              		.align	1
  71              		.global	tan
  72              		.syntax unified
  73              		.code	16
  74              		.thumb_func
  75              		.fpu softvfp
  77              	tan:
  78              	.LFB2:
  10:/Users/legge/Development/moppen-game/shared/math/export.c **** 
  11:/Users/legge/Development/moppen-game/shared/math/export.c **** float tan(float v) {
  79              		.loc 1 11 0
  80              		.cfi_startproc
  81              		@ args = 0, pretend = 0, frame = 0
  82              		@ frame_needed = 0, uses_anonymous_args = 0
  83              	.LVL4:
  84 0010 10B5     		push	{r4, lr}
  85              		.cfi_def_cfa_offset 8
  86              		.cfi_offset 4, -8
  87              		.cfi_offset 14, -4
  12:/Users/legge/Development/moppen-game/shared/math/export.c ****     return ARM__tanf(v);
  88              		.loc 1 12 0
  89 0012 FFF7FEFF 		bl	ARM__tanf
  90              	.LVL5:
  13:/Users/legge/Development/moppen-game/shared/math/export.c **** }
  91              		.loc 1 13 0
  92              		@ sp needed
  93 0016 10BD     		pop	{r4, pc}
  94              		.cfi_endproc
  95              	.LFE2:
  97              		.align	1
  98              		.global	sqrt
  99              		.syntax unified
 100              		.code	16
 101              		.thumb_func
 102              		.fpu softvfp
 104              	sqrt:
 105              	.LFB3:
  14:/Users/legge/Development/moppen-game/shared/math/export.c **** 
  15:/Users/legge/Development/moppen-game/shared/math/export.c **** float sqrt(float v) {
 106              		.loc 1 15 0
 107              		.cfi_startproc
 108              		@ args = 0, pretend = 0, frame = 0
 109              		@ frame_needed = 0, uses_anonymous_args = 0
 110              	.LVL6:
 111 0018 10B5     		push	{r4, lr}
 112              		.cfi_def_cfa_offset 8
 113              		.cfi_offset 4, -8
 114              		.cfi_offset 14, -4
  16:/Users/legge/Development/moppen-game/shared/math/export.c ****     return ARM__sqrtf(v);
 115              		.loc 1 16 0
 116 001a FFF7FEFF 		bl	ARM__sqrtf
 117              	.LVL7:
  17:/Users/legge/Development/moppen-game/shared/math/export.c **** }...
 118              		.loc 1 17 0
 119              		@ sp needed
 120 001e 10BD     		pop	{r4, pc}
 121              		.cfi_endproc
 122              	.LFE3:
 124              	.Letext0:
 125              		.file 2 "/Users/legge/Development/moppen-game/shared/math/arm_math.h"

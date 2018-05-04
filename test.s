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
  11              		.file	"fix16.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.rodata
  16              		.align	2
  19              	FOUR_DIV_PI:
  20 0000 F3450100 		.word	83443
  21              		.align	2
  24              	_FOUR_DIV_PI2:
  25 0004 4098FFFF 		.word	-26560
  26              		.align	2
  29              	X4_CORRECTION_COMPONENT:
  30 0008 9A390000 		.word	14746
  31              		.align	2
  34              	PI_DIV_4:
  35 000c 0FC90000 		.word	51471
  36              		.align	2
  39              	THREE_PI_DIV_4:
  40 0010 2F5B0200 		.word	154415
  41              		.align	2
  44              	fix16_maximum:
  45 0014 FFFFFF7F 		.word	2147483647
  46              		.align	2
  49              	fix16_minimum:
  50 0018 00000080 		.word	-2147483648
  51              		.align	2
  54              	fix16_overflow:
  55 001c 00000080 		.word	-2147483648
  56              		.align	2
  59              	fix16_pi:
  60 0020 3F240300 		.word	205887
  61              		.align	2
  64              	fix16_e:
  65 0024 E1B70200 		.word	178145
  66              		.align	2
  69              	fix16_one:
  70 0028 00000100 		.word	65536
  71              		.align	2
  74              	fix16_rad_to_deg_mult:
  75 002c B84B3900 		.word	3754936
  76              		.align	2
  79              	fix16_deg_to_rad_mult:
  80 0030 78040000 		.word	1144
  81              		.text
  82              		.align	1
  83              		.global	fix16_add
  84              		.syntax unified
  85              		.code	16
  86              		.thumb_func
  87              		.fpu softvfp
  89              	fix16_add:
  90              	.LFB32:
  91              		.file 1 "/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c"
   1:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #include "fix16.h"
   2:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #include "int64.h"
   3:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #include "../libdivide/libdivide.h"
   4:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
   5:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* Subtraction and addition with overflow detection.
   6:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * The versions without overflow detection are inlined in the header.
   7:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
   8:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #ifndef FIXMATH_NO_OVERFLOW
   9:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_add(fix16_t a, fix16_t b)
  10:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
  92              		.loc 1 10 0
  93              		.cfi_startproc
  94              		@ args = 0, pretend = 0, frame = 24
  95              		@ frame_needed = 1, uses_anonymous_args = 0
  96 0000 80B5     		push	{r7, lr}
  97              		.cfi_def_cfa_offset 8
  98              		.cfi_offset 7, -8
  99              		.cfi_offset 14, -4
 100 0002 86B0     		sub	sp, sp, #24
 101              		.cfi_def_cfa_offset 32
 102 0004 00AF     		add	r7, sp, #0
 103              		.cfi_def_cfa_register 7
 104 0006 7860     		str	r0, [r7, #4]
 105 0008 3960     		str	r1, [r7]
  11:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Use unsigned integers because overflow with signed integers is
  12:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// an undefined operation (http://www.airs.com/blog/archives/120).
  13:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t _a = a, _b = b;
 106              		.loc 1 13 0
 107 000a 7B68     		ldr	r3, [r7, #4]
 108 000c 7B61     		str	r3, [r7, #20]
 109 000e 3B68     		ldr	r3, [r7]
 110 0010 3B61     		str	r3, [r7, #16]
  14:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t sum = _a + _b;
 111              		.loc 1 14 0
 112 0012 7A69     		ldr	r2, [r7, #20]
 113 0014 3B69     		ldr	r3, [r7, #16]
 114 0016 D318     		adds	r3, r2, r3
 115 0018 FB60     		str	r3, [r7, #12]
  15:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  16:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Overflow can only happen if sign of a == sign of b, and then
  17:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// it causes sign of sum != sign of a.
  18:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (!((_a ^ _b) & 0x80000000) && ((_a ^ sum) & 0x80000000))
 116              		.loc 1 18 0
 117 001a 7A69     		ldr	r2, [r7, #20]
 118 001c 3B69     		ldr	r3, [r7, #16]
 119 001e 5340     		eors	r3, r2
 120 0020 06D4     		bmi	.L2
 121              		.loc 1 18 0 is_stmt 0 discriminator 1
 122 0022 7A69     		ldr	r2, [r7, #20]
 123 0024 FB68     		ldr	r3, [r7, #12]
 124 0026 5340     		eors	r3, r2
 125 0028 02D5     		bpl	.L2
  19:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_overflow;
 126              		.loc 1 19 0 is_stmt 1
 127 002a 8023     		movs	r3, #128
 128 002c 1B06     		lsls	r3, r3, #24
 129 002e 00E0     		b	.L3
 130              	.L2:
  20:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
  21:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return sum;
 131              		.loc 1 21 0
 132 0030 FB68     		ldr	r3, [r7, #12]
 133              	.L3:
  22:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 134              		.loc 1 22 0
 135 0032 1800     		movs	r0, r3
 136 0034 BD46     		mov	sp, r7
 137 0036 06B0     		add	sp, sp, #24
 138              		@ sp needed
 139 0038 80BD     		pop	{r7, pc}
 140              		.cfi_endproc
 141              	.LFE32:
 143              		.align	1
 144              		.global	fix16_sub
 145              		.syntax unified
 146              		.code	16
 147              		.thumb_func
 148              		.fpu softvfp
 150              	fix16_sub:
 151              	.LFB33:
  23:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  24:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_sub(fix16_t a, fix16_t b)
  25:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 152              		.loc 1 25 0
 153              		.cfi_startproc
 154              		@ args = 0, pretend = 0, frame = 24
 155              		@ frame_needed = 1, uses_anonymous_args = 0
 156 003a 80B5     		push	{r7, lr}
 157              		.cfi_def_cfa_offset 8
 158              		.cfi_offset 7, -8
 159              		.cfi_offset 14, -4
 160 003c 86B0     		sub	sp, sp, #24
 161              		.cfi_def_cfa_offset 32
 162 003e 00AF     		add	r7, sp, #0
 163              		.cfi_def_cfa_register 7
 164 0040 7860     		str	r0, [r7, #4]
 165 0042 3960     		str	r1, [r7]
  26:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t _a = a, _b = b;
 166              		.loc 1 26 0
 167 0044 7B68     		ldr	r3, [r7, #4]
 168 0046 7B61     		str	r3, [r7, #20]
 169 0048 3B68     		ldr	r3, [r7]
 170 004a 3B61     		str	r3, [r7, #16]
  27:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t diff = _a - _b;
 171              		.loc 1 27 0
 172 004c 7A69     		ldr	r2, [r7, #20]
 173 004e 3B69     		ldr	r3, [r7, #16]
 174 0050 D31A     		subs	r3, r2, r3
 175 0052 FB60     		str	r3, [r7, #12]
  28:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  29:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Overflow can only happen if sign of a != sign of b, and then
  30:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// it causes sign of diff != sign of a.
  31:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (((_a ^ _b) & 0x80000000) && ((_a ^ diff) & 0x80000000))
 176              		.loc 1 31 0
 177 0054 7A69     		ldr	r2, [r7, #20]
 178 0056 3B69     		ldr	r3, [r7, #16]
 179 0058 5340     		eors	r3, r2
 180 005a 06D5     		bpl	.L5
 181              		.loc 1 31 0 is_stmt 0 discriminator 1
 182 005c 7A69     		ldr	r2, [r7, #20]
 183 005e FB68     		ldr	r3, [r7, #12]
 184 0060 5340     		eors	r3, r2
 185 0062 02D5     		bpl	.L5
  32:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_overflow;
 186              		.loc 1 32 0 is_stmt 1
 187 0064 8023     		movs	r3, #128
 188 0066 1B06     		lsls	r3, r3, #24
 189 0068 00E0     		b	.L6
 190              	.L5:
  33:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
  34:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return diff;
 191              		.loc 1 34 0
 192 006a FB68     		ldr	r3, [r7, #12]
 193              	.L6:
  35:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 194              		.loc 1 35 0
 195 006c 1800     		movs	r0, r3
 196 006e BD46     		mov	sp, r7
 197 0070 06B0     		add	sp, sp, #24
 198              		@ sp needed
 199 0072 80BD     		pop	{r7, pc}
 200              		.cfi_endproc
 201              	.LFE33:
 203              		.align	1
 204              		.global	fix16_sadd
 205              		.syntax unified
 206              		.code	16
 207              		.thumb_func
 208              		.fpu softvfp
 210              	fix16_sadd:
 211              	.LFB34:
  36:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  37:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* Saturating arithmetic */
  38:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_sadd(fix16_t a, fix16_t b)
  39:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 212              		.loc 1 39 0
 213              		.cfi_startproc
 214              		@ args = 0, pretend = 0, frame = 16
 215              		@ frame_needed = 1, uses_anonymous_args = 0
 216 0074 80B5     		push	{r7, lr}
 217              		.cfi_def_cfa_offset 8
 218              		.cfi_offset 7, -8
 219              		.cfi_offset 14, -4
 220 0076 84B0     		sub	sp, sp, #16
 221              		.cfi_def_cfa_offset 24
 222 0078 00AF     		add	r7, sp, #0
 223              		.cfi_def_cfa_register 7
 224 007a 7860     		str	r0, [r7, #4]
 225 007c 3960     		str	r1, [r7]
  40:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = fix16_add(a, b);
 226              		.loc 1 40 0
 227 007e 3A68     		ldr	r2, [r7]
 228 0080 7B68     		ldr	r3, [r7, #4]
 229 0082 1100     		movs	r1, r2
 230 0084 1800     		movs	r0, r3
 231 0086 FFF7FEFF 		bl	fix16_add
 232 008a 0300     		movs	r3, r0
 233 008c FB60     		str	r3, [r7, #12]
  41:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  42:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (result == fix16_overflow)
 234              		.loc 1 42 0
 235 008e 8023     		movs	r3, #128
 236 0090 1B06     		lsls	r3, r3, #24
 237 0092 FA68     		ldr	r2, [r7, #12]
 238 0094 9A42     		cmp	r2, r3
 239 0096 07D1     		bne	.L8
  43:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return (a >= 0) ? fix16_maximum : fix16_minimum;
 240              		.loc 1 43 0
 241 0098 7B68     		ldr	r3, [r7, #4]
 242 009a 002B     		cmp	r3, #0
 243 009c 01DB     		blt	.L9
 244              		.loc 1 43 0 is_stmt 0 discriminator 1
 245 009e 054B     		ldr	r3, .L12
 246 00a0 03E0     		b	.L11
 247              	.L9:
 248              		.loc 1 43 0 discriminator 2
 249 00a2 8023     		movs	r3, #128
 250 00a4 1B06     		lsls	r3, r3, #24
 251 00a6 00E0     		b	.L11
 252              	.L8:
  44:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  45:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 253              		.loc 1 45 0 is_stmt 1
 254 00a8 FB68     		ldr	r3, [r7, #12]
 255              	.L11:
  46:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }	
 256              		.loc 1 46 0
 257 00aa 1800     		movs	r0, r3
 258 00ac BD46     		mov	sp, r7
 259 00ae 04B0     		add	sp, sp, #16
 260              		@ sp needed
 261 00b0 80BD     		pop	{r7, pc}
 262              	.L13:
 263 00b2 C046     		.align	2
 264              	.L12:
 265 00b4 FFFFFF7F 		.word	2147483647
 266              		.cfi_endproc
 267              	.LFE34:
 269              		.align	1
 270              		.global	fix16_ssub
 271              		.syntax unified
 272              		.code	16
 273              		.thumb_func
 274              		.fpu softvfp
 276              	fix16_ssub:
 277              	.LFB35:
  47:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  48:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_ssub(fix16_t a, fix16_t b)
  49:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 278              		.loc 1 49 0
 279              		.cfi_startproc
 280              		@ args = 0, pretend = 0, frame = 16
 281              		@ frame_needed = 1, uses_anonymous_args = 0
 282 00b8 80B5     		push	{r7, lr}
 283              		.cfi_def_cfa_offset 8
 284              		.cfi_offset 7, -8
 285              		.cfi_offset 14, -4
 286 00ba 84B0     		sub	sp, sp, #16
 287              		.cfi_def_cfa_offset 24
 288 00bc 00AF     		add	r7, sp, #0
 289              		.cfi_def_cfa_register 7
 290 00be 7860     		str	r0, [r7, #4]
 291 00c0 3960     		str	r1, [r7]
  50:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = fix16_sub(a, b);
 292              		.loc 1 50 0
 293 00c2 3A68     		ldr	r2, [r7]
 294 00c4 7B68     		ldr	r3, [r7, #4]
 295 00c6 1100     		movs	r1, r2
 296 00c8 1800     		movs	r0, r3
 297 00ca FFF7FEFF 		bl	fix16_sub
 298 00ce 0300     		movs	r3, r0
 299 00d0 FB60     		str	r3, [r7, #12]
  51:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  52:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (result == fix16_overflow)
 300              		.loc 1 52 0
 301 00d2 8023     		movs	r3, #128
 302 00d4 1B06     		lsls	r3, r3, #24
 303 00d6 FA68     		ldr	r2, [r7, #12]
 304 00d8 9A42     		cmp	r2, r3
 305 00da 07D1     		bne	.L15
  53:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return (a >= 0) ? fix16_maximum : fix16_minimum;
 306              		.loc 1 53 0
 307 00dc 7B68     		ldr	r3, [r7, #4]
 308 00de 002B     		cmp	r3, #0
 309 00e0 01DB     		blt	.L16
 310              		.loc 1 53 0 is_stmt 0 discriminator 1
 311 00e2 054B     		ldr	r3, .L19
 312 00e4 03E0     		b	.L18
 313              	.L16:
 314              		.loc 1 53 0 discriminator 2
 315 00e6 8023     		movs	r3, #128
 316 00e8 1B06     		lsls	r3, r3, #24
 317 00ea 00E0     		b	.L18
 318              	.L15:
  54:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  55:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 319              		.loc 1 55 0 is_stmt 1
 320 00ec FB68     		ldr	r3, [r7, #12]
 321              	.L18:
  56:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 322              		.loc 1 56 0
 323 00ee 1800     		movs	r0, r3
 324 00f0 BD46     		mov	sp, r7
 325 00f2 04B0     		add	sp, sp, #16
 326              		@ sp needed
 327 00f4 80BD     		pop	{r7, pc}
 328              	.L20:
 329 00f6 C046     		.align	2
 330              	.L19:
 331 00f8 FFFFFF7F 		.word	2147483647
 332              		.cfi_endproc
 333              	.LFE35:
 335              		.align	1
 336              		.global	fix16_mul
 337              		.syntax unified
 338              		.code	16
 339              		.thumb_func
 340              		.fpu softvfp
 342              	fix16_mul:
 343              	.LFB36:
  57:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
  58:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  59:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  60:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
  61:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* 64-bit implementation for fix16_mul. Fastest version for e.g. ARM Cortex M3.
  62:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * Performs a 32*32 -> 64bit multiplication. The middle 32 bits are the result,
  63:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * bottom 16 bits are used for rounding, and upper 16 bits are used for overflow
  64:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * detection.
  65:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
  66:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  
  67:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #if !defined(FIXMATH_NO_64BIT) && !defined(FIXMATH_OPTIMIZE_8BIT)
  68:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_mul(fix16_t inArg0, fix16_t inArg1)
  69:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
  70:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int64_t product = (int64_t)inArg0 * inArg1;
  71:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
  72:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
  73:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// The upper 17 bits should all be the same (the sign).
  74:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t upper = (product >> 47);
  75:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
  76:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
  77:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (product < 0)
  78:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
  79:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_OVERFLOW
  80:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (~upper)
  81:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				return fix16_overflow;
  82:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
  83:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
  84:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_ROUNDING
  85:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		// This adjustment is required in order to round -1/2 correctly
  86:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		product--;
  87:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
  88:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
  89:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	else
  90:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
  91:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_OVERFLOW
  92:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (upper)
  93:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				return fix16_overflow;
  94:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
  95:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
  96:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
  97:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifdef FIXMATH_NO_ROUNDING
  98:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return product >> 16;
  99:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#else
 100:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = product >> 16;
 101:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	result += (product & 0x8000) >> 15;
 102:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 103:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 104:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 105:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 106:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 107:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 108:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* 32-bit implementation of fix16_mul. Potentially fast on 16-bit processors,
 109:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * and this is a relatively good compromise for compilers that do not support
 110:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * uint64_t. Uses 16*16->32bit multiplications.
 111:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
 112:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #if defined(FIXMATH_NO_64BIT) && !defined(FIXMATH_OPTIMIZE_8BIT)
 113:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_mul(fix16_t inArg0, fix16_t inArg1)
 114:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 344              		.loc 1 114 0
 345              		.cfi_startproc
 346              		@ args = 0, pretend = 0, frame = 56
 347              		@ frame_needed = 1, uses_anonymous_args = 0
 348 00fc 80B5     		push	{r7, lr}
 349              		.cfi_def_cfa_offset 8
 350              		.cfi_offset 7, -8
 351              		.cfi_offset 14, -4
 352 00fe 8EB0     		sub	sp, sp, #56
 353              		.cfi_def_cfa_offset 64
 354 0100 00AF     		add	r7, sp, #0
 355              		.cfi_def_cfa_register 7
 356 0102 7860     		str	r0, [r7, #4]
 357 0104 3960     		str	r1, [r7]
 115:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Each argument is divided to 16-bit parts.
 116:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//					AB
 117:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//			*	 CD
 118:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// -----------
 119:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//					BD	16 * 16 -> 32 bit products
 120:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//				 CB
 121:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//				 AD
 122:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//				AC
 123:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	//			 |----| 64 bit product
 124:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int32_t A = (inArg0 >> 16), C = (inArg1 >> 16);
 358              		.loc 1 124 0
 359 0106 7B68     		ldr	r3, [r7, #4]
 360 0108 1B14     		asrs	r3, r3, #16
 361 010a 3B63     		str	r3, [r7, #48]
 362 010c 3B68     		ldr	r3, [r7]
 363 010e 1B14     		asrs	r3, r3, #16
 364 0110 FB62     		str	r3, [r7, #44]
 125:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t B = (inArg0 & 0xFFFF), D = (inArg1 & 0xFFFF);
 365              		.loc 1 125 0
 366 0112 7B68     		ldr	r3, [r7, #4]
 367 0114 1B04     		lsls	r3, r3, #16
 368 0116 1B0C     		lsrs	r3, r3, #16
 369 0118 BB62     		str	r3, [r7, #40]
 370 011a 3B68     		ldr	r3, [r7]
 371 011c 1B04     		lsls	r3, r3, #16
 372 011e 1B0C     		lsrs	r3, r3, #16
 373 0120 7B62     		str	r3, [r7, #36]
 126:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 127:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int32_t AC = A*C;
 374              		.loc 1 127 0
 375 0122 3B6B     		ldr	r3, [r7, #48]
 376 0124 FA6A     		ldr	r2, [r7, #44]
 377 0126 5343     		muls	r3, r2
 378 0128 3B62     		str	r3, [r7, #32]
 128:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int32_t AD_CB = A*D + C*B;
 379              		.loc 1 128 0
 380 012a 3B6B     		ldr	r3, [r7, #48]
 381 012c 7A6A     		ldr	r2, [r7, #36]
 382 012e 5A43     		muls	r2, r3
 383 0130 FB6A     		ldr	r3, [r7, #44]
 384 0132 B96A     		ldr	r1, [r7, #40]
 385 0134 4B43     		muls	r3, r1
 386 0136 D318     		adds	r3, r2, r3
 387 0138 FB61     		str	r3, [r7, #28]
 129:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t BD = B*D;
 388              		.loc 1 129 0
 389 013a BB6A     		ldr	r3, [r7, #40]
 390 013c 7A6A     		ldr	r2, [r7, #36]
 391 013e 5343     		muls	r3, r2
 392 0140 BB61     		str	r3, [r7, #24]
 130:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 131:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int32_t product_hi = AC + (AD_CB >> 16);
 393              		.loc 1 131 0
 394 0142 FB69     		ldr	r3, [r7, #28]
 395 0144 1B14     		asrs	r3, r3, #16
 396 0146 3A6A     		ldr	r2, [r7, #32]
 397 0148 D318     		adds	r3, r2, r3
 398 014a 7B63     		str	r3, [r7, #52]
 132:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 133:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Handle carry from lower 32 bits to upper part of result.
 134:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t ad_cb_temp = AD_CB << 16;
 399              		.loc 1 134 0
 400 014c FB69     		ldr	r3, [r7, #28]
 401 014e 1B04     		lsls	r3, r3, #16
 402 0150 7B61     		str	r3, [r7, #20]
 135:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t product_lo = BD + ad_cb_temp;
 403              		.loc 1 135 0
 404 0152 BA69     		ldr	r2, [r7, #24]
 405 0154 7B69     		ldr	r3, [r7, #20]
 406 0156 D318     		adds	r3, r2, r3
 407 0158 3B61     		str	r3, [r7, #16]
 136:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (product_lo < BD)
 408              		.loc 1 136 0
 409 015a 3A69     		ldr	r2, [r7, #16]
 410 015c BB69     		ldr	r3, [r7, #24]
 411 015e 9A42     		cmp	r2, r3
 412 0160 02D2     		bcs	.L22
 137:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		product_hi++;
 413              		.loc 1 137 0
 414 0162 7B6B     		ldr	r3, [r7, #52]
 415 0164 0133     		adds	r3, r3, #1
 416 0166 7B63     		str	r3, [r7, #52]
 417              	.L22:
 138:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 139:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #ifndef FIXMATH_NO_OVERFLOW
 140:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// The upper 17 bits should all be the same (the sign).
 141:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (product_hi >> 31 != product_hi >> 15)
 418              		.loc 1 141 0
 419 0168 7B6B     		ldr	r3, [r7, #52]
 420 016a DA17     		asrs	r2, r3, #31
 421 016c 7B6B     		ldr	r3, [r7, #52]
 422 016e DB13     		asrs	r3, r3, #15
 423 0170 9A42     		cmp	r2, r3
 424 0172 02D0     		beq	.L23
 142:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_overflow;
 425              		.loc 1 142 0
 426 0174 8023     		movs	r3, #128
 427 0176 1B06     		lsls	r3, r3, #24
 428 0178 1EE0     		b	.L24
 429              	.L23:
 143:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 144:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 145:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #ifdef FIXMATH_NO_ROUNDING
 146:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return (product_hi << 16) | (product_lo >> 16);
 147:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #else
 148:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Subtracting 0x8000 (= 0.5) and then using signed right shift
 149:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// achieves proper rounding to result-1, except in the corner
 150:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// case of negative numbers and lowest word = 0x8000.
 151:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// To handle that, we also have to subtract 1 for negative numbers.
 152:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t product_lo_tmp = product_lo;
 430              		.loc 1 152 0
 431 017a 3B69     		ldr	r3, [r7, #16]
 432 017c FB60     		str	r3, [r7, #12]
 153:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	product_lo -= 0x8000;
 433              		.loc 1 153 0
 434 017e 3B69     		ldr	r3, [r7, #16]
 435 0180 0F4A     		ldr	r2, .L26
 436 0182 9446     		mov	ip, r2
 437 0184 6344     		add	r3, r3, ip
 438 0186 3B61     		str	r3, [r7, #16]
 154:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	product_lo -= (uint32_t)product_hi >> 31;
 439              		.loc 1 154 0
 440 0188 7B6B     		ldr	r3, [r7, #52]
 441 018a DB17     		asrs	r3, r3, #31
 442 018c 1A00     		movs	r2, r3
 443 018e 3B69     		ldr	r3, [r7, #16]
 444 0190 9B18     		adds	r3, r3, r2
 445 0192 3B61     		str	r3, [r7, #16]
 155:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (product_lo > product_lo_tmp)
 446              		.loc 1 155 0
 447 0194 3A69     		ldr	r2, [r7, #16]
 448 0196 FB68     		ldr	r3, [r7, #12]
 449 0198 9A42     		cmp	r2, r3
 450 019a 02D9     		bls	.L25
 156:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		product_hi--;
 451              		.loc 1 156 0
 452 019c 7B6B     		ldr	r3, [r7, #52]
 453 019e 013B     		subs	r3, r3, #1
 454 01a0 7B63     		str	r3, [r7, #52]
 455              	.L25:
 157:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 158:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Discard the lowest 16 bits. Note that this is not exactly the same
 159:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// as dividing by 0x10000. For example if product = -1, result will
 160:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// also be -1 and not 0. This is compensated by adding +1 to the result
 161:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// and compensating this in turn in the rounding above.
 162:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = (product_hi << 16) | (product_lo >> 16);
 456              		.loc 1 162 0
 457 01a2 7B6B     		ldr	r3, [r7, #52]
 458 01a4 1B04     		lsls	r3, r3, #16
 459 01a6 1A00     		movs	r2, r3
 460 01a8 3B69     		ldr	r3, [r7, #16]
 461 01aa 1B0C     		lsrs	r3, r3, #16
 462 01ac 1343     		orrs	r3, r2
 463 01ae BB60     		str	r3, [r7, #8]
 163:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	result += 1;
 464              		.loc 1 163 0
 465 01b0 BB68     		ldr	r3, [r7, #8]
 466 01b2 0133     		adds	r3, r3, #1
 467 01b4 BB60     		str	r3, [r7, #8]
 164:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 468              		.loc 1 164 0
 469 01b6 BB68     		ldr	r3, [r7, #8]
 470              	.L24:
 165:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 166:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 471              		.loc 1 166 0
 472 01b8 1800     		movs	r0, r3
 473 01ba BD46     		mov	sp, r7
 474 01bc 0EB0     		add	sp, sp, #56
 475              		@ sp needed
 476 01be 80BD     		pop	{r7, pc}
 477              	.L27:
 478              		.align	2
 479              	.L26:
 480 01c0 0080FFFF 		.word	-32768
 481              		.cfi_endproc
 482              	.LFE36:
 484              		.align	1
 485              		.global	fix16_smul
 486              		.syntax unified
 487              		.code	16
 488              		.thumb_func
 489              		.fpu softvfp
 491              	fix16_smul:
 492              	.LFB37:
 167:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 168:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 169:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* 8-bit implementation of fix16_mul. Fastest on e.g. Atmel AVR.
 170:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * Uses 8*8->16bit multiplications, and also skips any bytes that
 171:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * are zero.
 172:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
 173:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #if defined(FIXMATH_OPTIMIZE_8BIT)
 174:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_mul(fix16_t inArg0, fix16_t inArg1)
 175:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 176:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t _a = (inArg0 >= 0) ? inArg0 : (-inArg0);
 177:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t _b = (inArg1 >= 0) ? inArg1 : (-inArg1);
 178:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 179:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint8_t va[4] = {_a, (_a >> 8), (_a >> 16), (_a >> 24)};
 180:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint8_t vb[4] = {_b, (_b >> 8), (_b >> 16), (_b >> 24)};
 181:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 182:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t low = 0;
 183:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t mid = 0;
 184:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 185:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Result column i depends on va[0..i] and vb[i..0]
 186:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 187:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
 188:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 6
 189:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[3] && vb[3]) return fix16_overflow;
 190:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 191:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 192:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 5
 193:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[2] && vb[3]) mid += (uint16_t)va[2] * vb[3];
 194:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[3] && vb[2]) mid += (uint16_t)va[3] * vb[2];
 195:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	mid <<= 8;
 196:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 197:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 4
 198:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[1] && vb[3]) mid += (uint16_t)va[1] * vb[3];
 199:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[2] && vb[2]) mid += (uint16_t)va[2] * vb[2];
 200:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[3] && vb[1]) mid += (uint16_t)va[3] * vb[1];
 201:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 202:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
 203:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (mid & 0xFF000000) return fix16_overflow;
 204:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 205:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	mid <<= 8;
 206:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 207:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 3
 208:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[0] && vb[3]) mid += (uint16_t)va[0] * vb[3];
 209:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[1] && vb[2]) mid += (uint16_t)va[1] * vb[2];
 210:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[2] && vb[1]) mid += (uint16_t)va[2] * vb[1];
 211:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[3] && vb[0]) mid += (uint16_t)va[3] * vb[0];
 212:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 213:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
 214:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (mid & 0xFF000000) return fix16_overflow;
 215:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 216:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	mid <<= 8;
 217:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 218:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 2
 219:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[0] && vb[2]) mid += (uint16_t)va[0] * vb[2];
 220:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[1] && vb[1]) mid += (uint16_t)va[1] * vb[1];
 221:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[2] && vb[0]) mid += (uint16_t)va[2] * vb[0];		
 222:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 223:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 1
 224:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[0] && vb[1]) low += (uint16_t)va[0] * vb[1];
 225:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[1] && vb[0]) low += (uint16_t)va[1] * vb[0];
 226:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	low <<= 8;
 227:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 228:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// i = 0
 229:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (va[0] && vb[0]) low += (uint16_t)va[0] * vb[0];
 230:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 231:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_ROUNDING
 232:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	low += 0x8000;
 233:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 234:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	mid += (low >> 16);
 235:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 236:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
 237:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (mid & 0x80000000)
 238:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_overflow;
 239:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 240:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 241:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = mid;
 242:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 243:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	/* Figure out the sign of result */
 244:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if ((inArg0 >= 0) != (inArg1 >= 0))
 245:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 246:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		result = -result;
 247:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 248:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 249:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 250:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 251:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 252:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 253:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #ifndef FIXMATH_NO_OVERFLOW
 254:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* Wrapper around fix16_mul to add saturating arithmetic. */
 255:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_smul(fix16_t inArg0, fix16_t inArg1)
 256:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 493              		.loc 1 256 0
 494              		.cfi_startproc
 495              		@ args = 0, pretend = 0, frame = 16
 496              		@ frame_needed = 1, uses_anonymous_args = 0
 497 01c4 80B5     		push	{r7, lr}
 498              		.cfi_def_cfa_offset 8
 499              		.cfi_offset 7, -8
 500              		.cfi_offset 14, -4
 501 01c6 84B0     		sub	sp, sp, #16
 502              		.cfi_def_cfa_offset 24
 503 01c8 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 505 01ca 7860     		str	r0, [r7, #4]
 506 01cc 3960     		str	r1, [r7]
 257:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = fix16_mul(inArg0, inArg1);
 507              		.loc 1 257 0
 508 01ce 3A68     		ldr	r2, [r7]
 509 01d0 7B68     		ldr	r3, [r7, #4]
 510 01d2 1100     		movs	r1, r2
 511 01d4 1800     		movs	r0, r3
 512 01d6 FFF7FEFF 		bl	fix16_mul
 513 01da 0300     		movs	r3, r0
 514 01dc FB60     		str	r3, [r7, #12]
 258:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 259:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (result == fix16_overflow)
 515              		.loc 1 259 0
 516 01de 8023     		movs	r3, #128
 517 01e0 1B06     		lsls	r3, r3, #24
 518 01e2 FA68     		ldr	r2, [r7, #12]
 519 01e4 9A42     		cmp	r2, r3
 520 01e6 0FD1     		bne	.L29
 260:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 261:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if ((inArg0 >= 0) == (inArg1 >= 0))
 521              		.loc 1 261 0
 522 01e8 7B68     		ldr	r3, [r7, #4]
 523 01ea DB0F     		lsrs	r3, r3, #31
 524 01ec DAB2     		uxtb	r2, r3
 525 01ee 3B68     		ldr	r3, [r7]
 526 01f0 DB43     		mvns	r3, r3
 527 01f2 DB0F     		lsrs	r3, r3, #31
 528 01f4 DBB2     		uxtb	r3, r3
 529 01f6 5340     		eors	r3, r2
 530 01f8 DBB2     		uxtb	r3, r3
 531 01fa 002B     		cmp	r3, #0
 532 01fc 01D0     		beq	.L30
 262:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			return fix16_maximum;
 533              		.loc 1 262 0
 534 01fe 054B     		ldr	r3, .L32
 535 0200 03E0     		b	.L31
 536              	.L30:
 263:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		else
 264:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			return fix16_minimum;
 537              		.loc 1 264 0
 538 0202 8023     		movs	r3, #128
 539 0204 1B06     		lsls	r3, r3, #24
 540 0206 00E0     		b	.L31
 541              	.L29:
 265:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 266:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 267:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 542              		.loc 1 267 0
 543 0208 FB68     		ldr	r3, [r7, #12]
 544              	.L31:
 268:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 545              		.loc 1 268 0
 546 020a 1800     		movs	r0, r3
 547 020c BD46     		mov	sp, r7
 548 020e 04B0     		add	sp, sp, #16
 549              		@ sp needed
 550 0210 80BD     		pop	{r7, pc}
 551              	.L33:
 552 0212 C046     		.align	2
 553              	.L32:
 554 0214 FFFFFF7F 		.word	2147483647
 555              		.cfi_endproc
 556              	.LFE37:
 558              		.align	1
 559              		.syntax unified
 560              		.code	16
 561              		.thumb_func
 562              		.fpu softvfp
 564              	clz:
 565              	.LFB38:
 269:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 270:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 271:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* 32-bit implementation of fix16_div. Fastest version for e.g. ARM Cortex M3.
 272:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * Performs 32-bit divisions repeatedly to reduce the remainder. For this to
 273:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * be efficient, the processor has to have 32-bit hardware division.
 274:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
 275:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #if !defined(FIXMATH_OPTIMIZE_8BIT)
 276:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //#ifdef __GNUC__
 277:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** // Count leading zeros, using processor-specific instruction if available.
 278:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //#define clz(x) (__builtin_clzl(x) - (8 * sizeof(long) - 32))
 279:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //#else
 280:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** static uint8_t clz(uint32_t x)
 281:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 566              		.loc 1 281 0
 567              		.cfi_startproc
 568              		@ args = 0, pretend = 0, frame = 16
 569              		@ frame_needed = 1, uses_anonymous_args = 0
 570 0218 80B5     		push	{r7, lr}
 571              		.cfi_def_cfa_offset 8
 572              		.cfi_offset 7, -8
 573              		.cfi_offset 14, -4
 574 021a 84B0     		sub	sp, sp, #16
 575              		.cfi_def_cfa_offset 24
 576 021c 00AF     		add	r7, sp, #0
 577              		.cfi_def_cfa_register 7
 578 021e 7860     		str	r0, [r7, #4]
 282:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint8_t result = 0;
 579              		.loc 1 282 0
 580 0220 0F23     		movs	r3, #15
 581 0222 FB18     		adds	r3, r7, r3
 582 0224 0022     		movs	r2, #0
 583 0226 1A70     		strb	r2, [r3]
 283:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (x == 0) return 32;
 584              		.loc 1 283 0
 585 0228 7B68     		ldr	r3, [r7, #4]
 586 022a 002B     		cmp	r3, #0
 587 022c 0AD1     		bne	.L37
 588              		.loc 1 283 0 is_stmt 0 discriminator 1
 589 022e 2023     		movs	r3, #32
 590 0230 1CE0     		b	.L36
 591              	.L38:
 284:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (!(x & 0xF0000000)) { result += 4; x <<= 4; }
 592              		.loc 1 284 0 is_stmt 1 discriminator 2
 593 0232 0F22     		movs	r2, #15
 594 0234 BB18     		adds	r3, r7, r2
 595 0236 BA18     		adds	r2, r7, r2
 596 0238 1278     		ldrb	r2, [r2]
 597 023a 0432     		adds	r2, r2, #4
 598 023c 1A70     		strb	r2, [r3]
 599 023e 7B68     		ldr	r3, [r7, #4]
 600 0240 1B01     		lsls	r3, r3, #4
 601 0242 7B60     		str	r3, [r7, #4]
 602              	.L37:
 603              		.loc 1 284 0 is_stmt 0 discriminator 1
 604 0244 7B68     		ldr	r3, [r7, #4]
 605 0246 1B0F     		lsrs	r3, r3, #28
 606 0248 1B07     		lsls	r3, r3, #28
 607 024a F2D0     		beq	.L38
 285:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (!(x & 0x80000000)) { result += 1; x <<= 1; }
 608              		.loc 1 285 0 is_stmt 1
 609 024c 08E0     		b	.L39
 610              	.L40:
 611              		.loc 1 285 0 is_stmt 0 discriminator 2
 612 024e 0F22     		movs	r2, #15
 613 0250 BB18     		adds	r3, r7, r2
 614 0252 BA18     		adds	r2, r7, r2
 615 0254 1278     		ldrb	r2, [r2]
 616 0256 0132     		adds	r2, r2, #1
 617 0258 1A70     		strb	r2, [r3]
 618 025a 7B68     		ldr	r3, [r7, #4]
 619 025c 5B00     		lsls	r3, r3, #1
 620 025e 7B60     		str	r3, [r7, #4]
 621              	.L39:
 622              		.loc 1 285 0 discriminator 1
 623 0260 7B68     		ldr	r3, [r7, #4]
 624 0262 002B     		cmp	r3, #0
 625 0264 F3DA     		bge	.L40
 286:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 626              		.loc 1 286 0 is_stmt 1
 627 0266 0F23     		movs	r3, #15
 628 0268 FB18     		adds	r3, r7, r3
 629 026a 1B78     		ldrb	r3, [r3]
 630              	.L36:
 287:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 631              		.loc 1 287 0
 632 026c 1800     		movs	r0, r3
 633 026e BD46     		mov	sp, r7
 634 0270 04B0     		add	sp, sp, #16
 635              		@ sp needed
 636 0272 80BD     		pop	{r7, pc}
 637              		.cfi_endproc
 638              	.LFE38:
 640              		.align	1
 641              		.global	fix16_div
 642              		.syntax unified
 643              		.code	16
 644              		.thumb_func
 645              		.fpu softvfp
 647              	fix16_div:
 648              	.LFB39:
 288:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //#endif
 289:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 290:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_div(fix16_t a, fix16_t b)
 291:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 649              		.loc 1 291 0
 650              		.cfi_startproc
 651              		@ args = 0, pretend = 0, frame = 40
 652              		@ frame_needed = 1, uses_anonymous_args = 0
 653 0274 80B5     		push	{r7, lr}
 654              		.cfi_def_cfa_offset 8
 655              		.cfi_offset 7, -8
 656              		.cfi_offset 14, -4
 657 0276 8AB0     		sub	sp, sp, #40
 658              		.cfi_def_cfa_offset 48
 659 0278 00AF     		add	r7, sp, #0
 660              		.cfi_def_cfa_register 7
 661 027a 7860     		str	r0, [r7, #4]
 662 027c 3960     		str	r1, [r7]
 292:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// This uses a hardware 32/32 bit division multiple times, until we have
 293:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// computed all the bits in (a<<17)/b. Usually this takes 1-3 iterations.
 294:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 295:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (b == 0)
 663              		.loc 1 295 0
 664 027e 3B68     		ldr	r3, [r7]
 665 0280 002B     		cmp	r3, #0
 666 0282 02D1     		bne	.L42
 296:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			return fix16_minimum;
 667              		.loc 1 296 0
 668 0284 8023     		movs	r3, #128
 669 0286 1B06     		lsls	r3, r3, #24
 670 0288 76E0     		b	.L43
 671              	.L42:
 297:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 298:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t remainder = (a >= 0) ? a : (-a);
 672              		.loc 1 298 0
 673 028a 7B68     		ldr	r3, [r7, #4]
 674 028c DA17     		asrs	r2, r3, #31
 675 028e 9B18     		adds	r3, r3, r2
 676 0290 5340     		eors	r3, r2
 677 0292 7B62     		str	r3, [r7, #36]
 299:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t divider = (b >= 0) ? b : (-b);
 678              		.loc 1 299 0
 679 0294 3B68     		ldr	r3, [r7]
 680 0296 DA17     		asrs	r2, r3, #31
 681 0298 9B18     		adds	r3, r3, r2
 682 029a 5340     		eors	r3, r2
 683 029c 3B62     		str	r3, [r7, #32]
 300:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t quotient = 0;
 684              		.loc 1 300 0
 685 029e 0023     		movs	r3, #0
 686 02a0 FB61     		str	r3, [r7, #28]
 301:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	int bit_pos = 17;
 687              		.loc 1 301 0
 688 02a2 1123     		movs	r3, #17
 689 02a4 BB61     		str	r3, [r7, #24]
 302:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 303:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Kick-start the division a bit.
 304:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// This improves speed in the worst-case scenarios where N and D are large
 305:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// It gets a lower estimate for the result by N/(D >> 17 + 1).
 306:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //	if (divider & 0xFFF00000)
 307:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //	{
 308:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //		uint32_t shifted_div = ((divider >> 17) + 1);
 309:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //		quotient = remainder / shifted_div;
 310:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //        quotient = divide_u(remainder, shifted_div);
 311:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //		remainder -= ((uint64_t)quotient * divider) >> 17;
 312:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //	}
 313:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 314:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// If the divider is divisible by 2^n, take advantage of it.
 315:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (!(divider & 0xF) && bit_pos >= 4)
 690              		.loc 1 315 0
 691 02a6 05E0     		b	.L44
 692              	.L46:
 316:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 317:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		divider >>= 4;
 693              		.loc 1 317 0
 694 02a8 3B6A     		ldr	r3, [r7, #32]
 695 02aa 1B09     		lsrs	r3, r3, #4
 696 02ac 3B62     		str	r3, [r7, #32]
 318:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit_pos -= 4;
 697              		.loc 1 318 0
 698 02ae BB69     		ldr	r3, [r7, #24]
 699 02b0 043B     		subs	r3, r3, #4
 700 02b2 BB61     		str	r3, [r7, #24]
 701              	.L44:
 315:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 702              		.loc 1 315 0
 703 02b4 3B6A     		ldr	r3, [r7, #32]
 704 02b6 0F22     		movs	r2, #15
 705 02b8 1340     		ands	r3, r2
 706 02ba 41D1     		bne	.L47
 315:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 707              		.loc 1 315 0 is_stmt 0 discriminator 1
 708 02bc BB69     		ldr	r3, [r7, #24]
 709 02be 032B     		cmp	r3, #3
 710 02c0 F2DC     		bgt	.L46
 319:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 320:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 321:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (remainder && bit_pos >= 0)
 711              		.loc 1 321 0 is_stmt 1
 712 02c2 3DE0     		b	.L47
 713              	.L51:
 714              	.LBB2:
 322:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 323:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		// Shift remainder as much as we can without overflowing
 324:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		int shift = clz(remainder);
 715              		.loc 1 324 0
 716 02c4 7B6A     		ldr	r3, [r7, #36]
 717 02c6 1800     		movs	r0, r3
 718 02c8 FFF7A6FF 		bl	clz
 719 02cc 0300     		movs	r3, r0
 720 02ce 7B61     		str	r3, [r7, #20]
 325:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (shift > bit_pos) shift = bit_pos;
 721              		.loc 1 325 0
 722 02d0 7A69     		ldr	r2, [r7, #20]
 723 02d2 BB69     		ldr	r3, [r7, #24]
 724 02d4 9A42     		cmp	r2, r3
 725 02d6 01DD     		ble	.L48
 726              		.loc 1 325 0 is_stmt 0 discriminator 1
 727 02d8 BB69     		ldr	r3, [r7, #24]
 728 02da 7B61     		str	r3, [r7, #20]
 729              	.L48:
 326:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		remainder <<= shift;
 730              		.loc 1 326 0 is_stmt 1
 731 02dc 7A6A     		ldr	r2, [r7, #36]
 732 02de 7B69     		ldr	r3, [r7, #20]
 733 02e0 9A40     		lsls	r2, r2, r3
 734 02e2 1300     		movs	r3, r2
 735 02e4 7B62     		str	r3, [r7, #36]
 327:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit_pos -= shift;
 736              		.loc 1 327 0
 737 02e6 BA69     		ldr	r2, [r7, #24]
 738 02e8 7B69     		ldr	r3, [r7, #20]
 739 02ea D31A     		subs	r3, r2, r3
 740 02ec BB61     		str	r3, [r7, #24]
 328:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
 329:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //		uint32_t div = remainder / divider;
 330:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****         uint32_t div = divide_u(remainder, divider);
 741              		.loc 1 330 0
 742 02ee 3A6A     		ldr	r2, [r7, #32]
 743 02f0 7B6A     		ldr	r3, [r7, #36]
 744 02f2 1100     		movs	r1, r2
 745 02f4 1800     		movs	r0, r3
 746 02f6 FFF7FEFF 		bl	divide_u
 747 02fa 0300     		movs	r3, r0
 748 02fc FB60     		str	r3, [r7, #12]
 331:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** //		remainder = remainder % divider;
 332:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****         remainder = mod(remainder, divider);
 749              		.loc 1 332 0
 750 02fe 7B6A     		ldr	r3, [r7, #36]
 751 0300 3A6A     		ldr	r2, [r7, #32]
 752 0302 1100     		movs	r1, r2
 753 0304 1800     		movs	r0, r3
 754 0306 FFF7FEFF 		bl	mod
 755 030a 0300     		movs	r3, r0
 756 030c 7B62     		str	r3, [r7, #36]
 333:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		quotient += div << bit_pos;
 757              		.loc 1 333 0
 758 030e FA68     		ldr	r2, [r7, #12]
 759 0310 BB69     		ldr	r3, [r7, #24]
 760 0312 9A40     		lsls	r2, r2, r3
 761 0314 1300     		movs	r3, r2
 762 0316 FA69     		ldr	r2, [r7, #28]
 763 0318 D318     		adds	r3, r2, r3
 764 031a FB61     		str	r3, [r7, #28]
 334:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 335:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_OVERFLOW
 336:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (div & ~(0xFFFFFFFF >> bit_pos))
 765              		.loc 1 336 0
 766 031c 0123     		movs	r3, #1
 767 031e 5A42     		rsbs	r2, r3, #0
 768 0320 BB69     		ldr	r3, [r7, #24]
 769 0322 DA40     		lsrs	r2, r2, r3
 770 0324 1300     		movs	r3, r2
 771 0326 DB43     		mvns	r3, r3
 772 0328 FA68     		ldr	r2, [r7, #12]
 773 032a 1340     		ands	r3, r2
 774 032c 02D0     		beq	.L49
 337:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				return fix16_overflow;
 775              		.loc 1 337 0
 776 032e 8023     		movs	r3, #128
 777 0330 1B06     		lsls	r3, r3, #24
 778 0332 21E0     		b	.L43
 779              	.L49:
 338:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
 339:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
 340:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		remainder <<= 1;
 780              		.loc 1 340 0
 781 0334 7B6A     		ldr	r3, [r7, #36]
 782 0336 5B00     		lsls	r3, r3, #1
 783 0338 7B62     		str	r3, [r7, #36]
 341:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit_pos--;
 784              		.loc 1 341 0
 785 033a BB69     		ldr	r3, [r7, #24]
 786 033c 013B     		subs	r3, r3, #1
 787 033e BB61     		str	r3, [r7, #24]
 788              	.L47:
 789              	.LBE2:
 321:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 790              		.loc 1 321 0
 791 0340 7B6A     		ldr	r3, [r7, #36]
 792 0342 002B     		cmp	r3, #0
 793 0344 02D0     		beq	.L50
 321:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 794              		.loc 1 321 0 is_stmt 0 discriminator 1
 795 0346 BB69     		ldr	r3, [r7, #24]
 796 0348 002B     		cmp	r3, #0
 797 034a BBDA     		bge	.L51
 798              	.L50:
 342:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 343:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 344:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_ROUNDING
 345:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Quotient is always positive so rounding is easy
 346:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	quotient++;
 799              		.loc 1 346 0 is_stmt 1
 800 034c FB69     		ldr	r3, [r7, #28]
 801 034e 0133     		adds	r3, r3, #1
 802 0350 FB61     		str	r3, [r7, #28]
 347:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 348:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 349:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = quotient >> 1;
 803              		.loc 1 349 0
 804 0352 FB69     		ldr	r3, [r7, #28]
 805 0354 5B08     		lsrs	r3, r3, #1
 806 0356 3B61     		str	r3, [r7, #16]
 350:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 351:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// Figure out the sign of the result
 352:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if ((a ^ b) & 0x80000000)
 807              		.loc 1 352 0
 808 0358 7A68     		ldr	r2, [r7, #4]
 809 035a 3B68     		ldr	r3, [r7]
 810 035c 5340     		eors	r3, r2
 811 035e 0AD5     		bpl	.L52
 353:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 354:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_OVERFLOW
 355:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (result == fix16_minimum)
 812              		.loc 1 355 0
 813 0360 8023     		movs	r3, #128
 814 0362 1B06     		lsls	r3, r3, #24
 815 0364 3A69     		ldr	r2, [r7, #16]
 816 0366 9A42     		cmp	r2, r3
 817 0368 02D1     		bne	.L53
 356:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				return fix16_overflow;
 818              		.loc 1 356 0
 819 036a 8023     		movs	r3, #128
 820 036c 1B06     		lsls	r3, r3, #24
 821 036e 03E0     		b	.L43
 822              	.L53:
 357:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
 358:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
 359:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		result = -result;
 823              		.loc 1 359 0
 824 0370 3B69     		ldr	r3, [r7, #16]
 825 0372 5B42     		rsbs	r3, r3, #0
 826 0374 3B61     		str	r3, [r7, #16]
 827              	.L52:
 360:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 361:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 362:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 828              		.loc 1 362 0
 829 0376 3B69     		ldr	r3, [r7, #16]
 830              	.L43:
 363:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 831              		.loc 1 363 0
 832 0378 1800     		movs	r0, r3
 833 037a BD46     		mov	sp, r7
 834 037c 0AB0     		add	sp, sp, #40
 835              		@ sp needed
 836 037e 80BD     		pop	{r7, pc}
 837              		.cfi_endproc
 838              	.LFE39:
 840              		.align	1
 841              		.global	fix16_sdiv
 842              		.syntax unified
 843              		.code	16
 844              		.thumb_func
 845              		.fpu softvfp
 847              	fix16_sdiv:
 848              	.LFB40:
 364:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 365:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 366:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* Alternative 32-bit implementation of fix16_div. Fastest on e.g. Atmel AVR.
 367:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * This does the division manually, and is therefore good for processors that
 368:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  * do not have hardware division.
 369:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c ****  */
 370:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #if defined(FIXMATH_OPTIMIZE_8BIT)
 371:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_div(fix16_t a, fix16_t b)
 372:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 373:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// This uses the basic binary restoring division algorithm.
 374:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// It appears to be faster to do the whole division manually than
 375:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// trying to compose a 64-bit libdivide out of 32-bit divisions on
 376:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	// platforms without hardware libdivide.
 377:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 378:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (b == 0)
 379:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_minimum;
 380:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 381:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t remainder = (a >= 0) ? a : (-a);
 382:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t divider = (b >= 0) ? b : (-b);
 383:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 384:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t quotient = 0;
 385:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	uint32_t bit = 0x10000;
 386:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 387:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	/* The algorithm requires D >= R */
 388:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (divider < remainder)
 389:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 390:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		divider <<= 1;
 391:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit <<= 1;
 392:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 393:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 394:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_OVERFLOW
 395:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (!bit)
 396:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		return fix16_overflow;
 397:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 398:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 399:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (divider & 0x80000000)
 400:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 401:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		// Perform one step manually to avoid overflows later.
 402:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		// We know that divider's bottom bit is 0 here.
 403:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (remainder >= divider)
 404:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		{
 405:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				quotient |= bit;
 406:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				remainder -= divider;
 407:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		}
 408:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		divider >>= 1;
 409:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit >>= 1;
 410:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 411:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 412:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	/* Main division loop */
 413:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	while (bit && remainder)
 414:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 415:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (remainder >= divider)
 416:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		{
 417:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				quotient |= bit;
 418:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				remainder -= divider;
 419:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		}
 420:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
 421:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		remainder <<= 1;
 422:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		bit >>= 1;
 423:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}	 
 424:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			
 425:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifndef FIXMATH_NO_ROUNDING
 426:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (remainder >= divider)
 427:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 428:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		quotient++;
 429:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 430:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 431:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 432:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = quotient;
 433:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 434:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	/* Figure out the sign of result */
 435:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if ((a ^ b) & 0x80000000)
 436:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 437:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#ifndef FIXMATH_NO_OVERFLOW
 438:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if (result == fix16_minimum)
 439:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 				return fix16_overflow;
 440:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		#endif
 441:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		
 442:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		result = -result;
 443:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 444:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 445:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 446:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 447:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 448:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 449:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #ifndef FIXMATH_NO_OVERFLOW
 450:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** /* Wrapper around fix16_div to add saturating arithmetic. */
 451:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_sdiv(fix16_t inArg0, fix16_t inArg1)
 452:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 849              		.loc 1 452 0
 850              		.cfi_startproc
 851              		@ args = 0, pretend = 0, frame = 16
 852              		@ frame_needed = 1, uses_anonymous_args = 0
 853 0380 80B5     		push	{r7, lr}
 854              		.cfi_def_cfa_offset 8
 855              		.cfi_offset 7, -8
 856              		.cfi_offset 14, -4
 857 0382 84B0     		sub	sp, sp, #16
 858              		.cfi_def_cfa_offset 24
 859 0384 00AF     		add	r7, sp, #0
 860              		.cfi_def_cfa_register 7
 861 0386 7860     		str	r0, [r7, #4]
 862 0388 3960     		str	r1, [r7]
 453:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	fix16_t result = fix16_div(inArg0, inArg1);
 863              		.loc 1 453 0
 864 038a 3A68     		ldr	r2, [r7]
 865 038c 7B68     		ldr	r3, [r7, #4]
 866 038e 1100     		movs	r1, r2
 867 0390 1800     		movs	r0, r3
 868 0392 FFF7FEFF 		bl	fix16_div
 869 0396 0300     		movs	r3, r0
 870 0398 FB60     		str	r3, [r7, #12]
 454:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 455:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	if (result == fix16_overflow)
 871              		.loc 1 455 0
 872 039a 8023     		movs	r3, #128
 873 039c 1B06     		lsls	r3, r3, #24
 874 039e FA68     		ldr	r2, [r7, #12]
 875 03a0 9A42     		cmp	r2, r3
 876 03a2 0FD1     		bne	.L55
 456:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	{
 457:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		if ((inArg0 >= 0) == (inArg1 >= 0))
 877              		.loc 1 457 0
 878 03a4 7B68     		ldr	r3, [r7, #4]
 879 03a6 DB0F     		lsrs	r3, r3, #31
 880 03a8 DAB2     		uxtb	r2, r3
 881 03aa 3B68     		ldr	r3, [r7]
 882 03ac DB43     		mvns	r3, r3
 883 03ae DB0F     		lsrs	r3, r3, #31
 884 03b0 DBB2     		uxtb	r3, r3
 885 03b2 5340     		eors	r3, r2
 886 03b4 DBB2     		uxtb	r3, r3
 887 03b6 002B     		cmp	r3, #0
 888 03b8 01D0     		beq	.L56
 458:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			return fix16_maximum;
 889              		.loc 1 458 0
 890 03ba 054B     		ldr	r3, .L58
 891 03bc 03E0     		b	.L57
 892              	.L56:
 459:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		else
 460:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 			return fix16_minimum;
 893              		.loc 1 460 0
 894 03be 8023     		movs	r3, #128
 895 03c0 1B06     		lsls	r3, r3, #24
 896 03c2 00E0     		b	.L57
 897              	.L55:
 461:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	}
 462:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	
 463:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return result;
 898              		.loc 1 463 0
 899 03c4 FB68     		ldr	r3, [r7, #12]
 900              	.L57:
 464:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 901              		.loc 1 464 0
 902 03c6 1800     		movs	r0, r3
 903 03c8 BD46     		mov	sp, r7
 904 03ca 04B0     		add	sp, sp, #16
 905              		@ sp needed
 906 03cc 80BD     		pop	{r7, pc}
 907              	.L59:
 908 03ce C046     		.align	2
 909              	.L58:
 910 03d0 FFFFFF7F 		.word	2147483647
 911              		.cfi_endproc
 912              	.LFE40:
 914              		.global	__aeabi_idivmod
 915              		.align	1
 916              		.global	fix16_mod
 917              		.syntax unified
 918              		.code	16
 919              		.thumb_func
 920              		.fpu softvfp
 922              	fix16_mod:
 923              	.LFB41:
 465:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** #endif
 466:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 467:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** fix16_t fix16_mod(fix16_t x, fix16_t y)
 468:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** {
 924              		.loc 1 468 0
 925              		.cfi_startproc
 926              		@ args = 0, pretend = 0, frame = 8
 927              		@ frame_needed = 1, uses_anonymous_args = 0
 928 03d4 80B5     		push	{r7, lr}
 929              		.cfi_def_cfa_offset 8
 930              		.cfi_offset 7, -8
 931              		.cfi_offset 14, -4
 932 03d6 82B0     		sub	sp, sp, #8
 933              		.cfi_def_cfa_offset 16
 934 03d8 00AF     		add	r7, sp, #0
 935              		.cfi_def_cfa_register 7
 936 03da 7860     		str	r0, [r7, #4]
 937 03dc 3960     		str	r1, [r7]
 469:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#ifdef FIXMATH_OPTIMIZE_8BIT
 470:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		/* The reason we do this, rather than use a modulo operator
 471:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		 * is that if you don't have a hardware divider, this will result
 472:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		 * in faster operations when the angles are close to the bounds. 
 473:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		 */
 474:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		while(x >=  y) x -= y;
 475:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		while(x <= -y) x += y;
 476:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#else
 477:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		/* Note that in C90, the sign of result of the modulo operation is
 478:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		 * undefined. in C99, it's the same as the dividend (aka numerator).
 479:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		 */
 480:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 		x %= y;
 938              		.loc 1 480 0
 939 03de 7B68     		ldr	r3, [r7, #4]
 940 03e0 3968     		ldr	r1, [r7]
 941 03e2 1800     		movs	r0, r3
 942 03e4 FFF7FEFF 		bl	__aeabi_idivmod
 943              	.LVL0:
 944 03e8 0B00     		movs	r3, r1
 945 03ea 7B60     		str	r3, [r7, #4]
 481:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	#endif
 482:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 
 483:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** 	return x;
 946              		.loc 1 483 0
 947 03ec 7B68     		ldr	r3, [r7, #4]
 484:/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c **** }
 948              		.loc 1 484 0
 949 03ee 1800     		movs	r0, r3
 950 03f0 BD46     		mov	sp, r7
 951 03f2 02B0     		add	sp, sp, #8
 952              		@ sp needed
 953 03f4 80BD     		pop	{r7, pc}
 954              		.cfi_endproc
 955              	.LFE41:
 957              	.Letext0:
 958              		.file 2 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 959              		.file 3 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 960              		.file 4 "/Users/legge/Development/moppen-game/shared/libfixmath/fix16.h"

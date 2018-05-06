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
  11              		.file	"game.c"
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
  71              		.text
  72              		.align	1
  73              		.syntax unified
  74              		.code	16
  75              		.thumb_func
  76              		.fpu softvfp
  78              	fix16_from_int:
  79              	.LFB0:
  80              		.file 1 "/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h"
   1:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef __libfixmath_fix16_h__
   2:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #define __libfixmath_fix16_h__
   3:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
   4:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifdef __cplusplus
   5:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern "C"
   6:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
   7:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
   8:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
   9:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* These options may let the optimizer to remove some calls to the functions.
  10:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  * Refer to http://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html
  11:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  */
  12:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_FUNC_ATTRS
  13:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** # ifdef __GNUC__
  14:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #   if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 6)
  15:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #     define FIXMATH_FUNC_ATTRS __attribute__((leaf, nothrow, const))
  16:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #   else
  17:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #     define FIXMATH_FUNC_ATTRS __attribute__((nothrow, const))
  18:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #   endif
  19:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** # else
  20:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #   define FIXMATH_FUNC_ATTRS
  21:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** # endif
  22:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  23:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  24:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #include <stdint.h>
  25:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #include "../libdivide/libdivide.h"
  26:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  27:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** typedef int32_t fix16_t;
  28:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  29:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t FOUR_DIV_PI  = 0x145F3;            /*!< Fix16 value of 4/PI */
  30:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t _FOUR_DIV_PI2 = 0xFFFF9840;        /*!< Fix16 value of -4/PI² */
  31:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t X4_CORRECTION_COMPONENT = 0x399A; 	/*!< Fix16 value of 0.225 */
  32:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t PI_DIV_4 = 0x0000C90F;             /*!< Fix16 value of PI/4 */
  33:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t THREE_PI_DIV_4 = 0x00025B2F;       /*!< Fix16 value of 3PI/4 */
  34:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  35:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_maximum  = 0x7FFFFFFF; /*!< the maximum value of fix16_t */
  36:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_minimum  = 0x80000000; /*!< the minimum value of fix16_t */
  37:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_overflow = 0x80000000; /*!< the value used to indicate overflows when FI
  38:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  39:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_pi  = 205887;     /*!< fix16_t value of pi */
  40:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_e   = 178145;     /*!< fix16_t value of e */
  41:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_one = 0x00010000; /*!< fix16_t value of 1 */
  42:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  43:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* Conversion functions between fix16_t and float/integer.
  44:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  * These are inlined to allow compiler to optimize away constant numbers
  45:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  */
  46:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_from_int(int a)     { return a * fix16_one; }
  81              		.loc 1 46 0
  82              		.cfi_startproc
  83              		@ args = 0, pretend = 0, frame = 8
  84              		@ frame_needed = 1, uses_anonymous_args = 0
  85 0000 80B5     		push	{r7, lr}
  86              		.cfi_def_cfa_offset 8
  87              		.cfi_offset 7, -8
  88              		.cfi_offset 14, -4
  89 0002 82B0     		sub	sp, sp, #8
  90              		.cfi_def_cfa_offset 16
  91 0004 00AF     		add	r7, sp, #0
  92              		.cfi_def_cfa_register 7
  93 0006 7860     		str	r0, [r7, #4]
  94              		.loc 1 46 0
  95 0008 8023     		movs	r3, #128
  96 000a 5B02     		lsls	r3, r3, #9
  97 000c 7A68     		ldr	r2, [r7, #4]
  98 000e 5343     		muls	r3, r2
  99 0010 1800     		movs	r0, r3
 100 0012 BD46     		mov	sp, r7
 101 0014 02B0     		add	sp, sp, #8
 102              		@ sp needed
 103 0016 80BD     		pop	{r7, pc}
 104              		.cfi_endproc
 105              	.LFE0:
 107              		.global	__aeabi_i2f
 108              		.global	__aeabi_fdiv
 109              		.align	1
 110              		.syntax unified
 111              		.code	16
 112              		.thumb_func
 113              		.fpu softvfp
 115              	fix16_to_float:
 116              	.LFB1:
  47:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline float   fix16_to_float(fix16_t a) { return (float)a / fix16_one; }
 117              		.loc 1 47 0
 118              		.cfi_startproc
 119              		@ args = 0, pretend = 0, frame = 8
 120              		@ frame_needed = 1, uses_anonymous_args = 0
 121 0018 90B5     		push	{r4, r7, lr}
 122              		.cfi_def_cfa_offset 12
 123              		.cfi_offset 4, -12
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 001a 83B0     		sub	sp, sp, #12
 127              		.cfi_def_cfa_offset 24
 128 001c 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
 130 001e 7860     		str	r0, [r7, #4]
 131              		.loc 1 47 0
 132 0020 7868     		ldr	r0, [r7, #4]
 133 0022 FFF7FEFF 		bl	__aeabi_i2f
 134              	.LVL0:
 135 0026 041C     		adds	r4, r0, #0
 136 0028 8023     		movs	r3, #128
 137 002a 5B02     		lsls	r3, r3, #9
 138 002c 1800     		movs	r0, r3
 139 002e FFF7FEFF 		bl	__aeabi_i2f
 140              	.LVL1:
 141 0032 031C     		adds	r3, r0, #0
 142 0034 191C     		adds	r1, r3, #0
 143 0036 201C     		adds	r0, r4, #0
 144 0038 FFF7FEFF 		bl	__aeabi_fdiv
 145              	.LVL2:
 146 003c 031C     		adds	r3, r0, #0
 147 003e 181C     		adds	r0, r3, #0
 148 0040 BD46     		mov	sp, r7
 149 0042 03B0     		add	sp, sp, #12
 150              		@ sp needed
 151 0044 90BD     		pop	{r4, r7, pc}
 152              		.cfi_endproc
 153              	.LFE1:
 155              		.global	__aeabi_fmul
 156              		.global	__aeabi_fcmpge
 157              		.global	__aeabi_fadd
 158              		.global	__aeabi_f2iz
 159              		.align	1
 160              		.syntax unified
 161              		.code	16
 162              		.thumb_func
 163              		.fpu softvfp
 165              	fix16_from_float:
 166              	.LFB4:
  48:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline double  fix16_to_dbl(fix16_t a)   { return (double)a / fix16_one; }
  49:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  50:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline int fix16_to_int(fix16_t a)
  51:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
  52:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifdef FIXMATH_NO_ROUNDING
  53:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****     return (a >> 16);
  54:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #else
  55:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	if (a >= 0)
  56:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****         return divide_s(a + (fix16_one >> 1), fix16_one);
  57:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** //		return (a + (fix16_one >> 1)) / fix16_one;
  58:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****     return divide_s(a - (fix16_one >> 1), fix16_one);
  59:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** //	return (a - (fix16_one >> 1)) / fix16_one;
  60:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  61:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** }
  62:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  63:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_from_float(float a)
  64:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
 167              		.loc 1 64 0
 168              		.cfi_startproc
 169              		@ args = 0, pretend = 0, frame = 16
 170              		@ frame_needed = 1, uses_anonymous_args = 0
 171 0046 80B5     		push	{r7, lr}
 172              		.cfi_def_cfa_offset 8
 173              		.cfi_offset 7, -8
 174              		.cfi_offset 14, -4
 175 0048 84B0     		sub	sp, sp, #16
 176              		.cfi_def_cfa_offset 24
 177 004a 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
 179 004c 7860     		str	r0, [r7, #4]
  65:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	float temp = a * fix16_one;
 180              		.loc 1 65 0
 181 004e 8023     		movs	r3, #128
 182 0050 5B02     		lsls	r3, r3, #9
 183 0052 1800     		movs	r0, r3
 184 0054 FFF7FEFF 		bl	__aeabi_i2f
 185              	.LVL3:
 186 0058 031C     		adds	r3, r0, #0
 187 005a 191C     		adds	r1, r3, #0
 188 005c 7868     		ldr	r0, [r7, #4]
 189 005e FFF7FEFF 		bl	__aeabi_fmul
 190              	.LVL4:
 191 0062 031C     		adds	r3, r0, #0
 192 0064 FB60     		str	r3, [r7, #12]
  66:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_NO_ROUNDING
  67:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	temp += (temp >= 0) ? 0.5f : -0.5f;
 193              		.loc 1 67 0
 194 0066 0021     		movs	r1, #0
 195 0068 F868     		ldr	r0, [r7, #12]
 196 006a FFF7FEFF 		bl	__aeabi_fcmpge
 197              	.LVL5:
 198 006e 031E     		subs	r3, r0, #0
 199 0070 02D0     		beq	.L11
 200              		.loc 1 67 0 is_stmt 0 discriminator 1
 201 0072 FC23     		movs	r3, #252
 202 0074 9B05     		lsls	r3, r3, #22
 203 0076 01E0     		b	.L8
 204              	.L11:
 205              		.loc 1 67 0 discriminator 2
 206 0078 BF23     		movs	r3, #191
 207 007a 1B06     		lsls	r3, r3, #24
 208              	.L8:
 209              		.loc 1 67 0 discriminator 4
 210 007c 191C     		adds	r1, r3, #0
 211 007e F868     		ldr	r0, [r7, #12]
 212 0080 FFF7FEFF 		bl	__aeabi_fadd
 213              	.LVL6:
 214 0084 031C     		adds	r3, r0, #0
 215 0086 FB60     		str	r3, [r7, #12]
  68:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  69:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	return (fix16_t)temp;
 216              		.loc 1 69 0 is_stmt 1 discriminator 4
 217 0088 F868     		ldr	r0, [r7, #12]
 218 008a FFF7FEFF 		bl	__aeabi_f2iz
 219              	.LVL7:
 220 008e 0300     		movs	r3, r0
  70:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** }
 221              		.loc 1 70 0 discriminator 4
 222 0090 1800     		movs	r0, r3
 223 0092 BD46     		mov	sp, r7
 224 0094 04B0     		add	sp, sp, #16
 225              		@ sp needed
 226 0096 80BD     		pop	{r7, pc}
 227              		.cfi_endproc
 228              	.LFE4:
 230              		.section	.rodata
 231              		.align	2
 234              	fix16_rad_to_deg_mult:
 235 002c B84B3900 		.word	3754936
 236              		.align	2
 239              	fix16_deg_to_rad_mult:
 240 0030 78040000 		.word	1144
 241              		.data
 242              		.align	2
 245              	ball_bits:
 246 0000 06       		.byte	6
 247 0001 09       		.byte	9
 248 0002 09       		.byte	9
 249 0003 06       		.byte	6
 250              		.align	2
 253              	smily_bits:
 254 0004 0C       		.byte	12
 255 0005 03       		.byte	3
 256 0006 92       		.byte	-110
 257 0007 04       		.byte	4
 258 0008 04       		.byte	4
 259 0009 02       		.byte	2
 260 000a 04       		.byte	4
 261 000b 02       		.byte	2
 262 000c 04       		.byte	4
 263 000d 02       		.byte	2
 264 000e 04       		.byte	4
 265 000f 02       		.byte	2
 266 0010 64       		.byte	100
 267 0011 02       		.byte	2
 268 0012 60       		.byte	96
 269 0013 00       		.byte	0
 270 0014 02       		.byte	2
 271 0015 04       		.byte	4
 272 0016 04       		.byte	4
 273 0017 02       		.byte	2
 274 0018 F8       		.byte	-8
 275 0019 01       		.byte	1
 276 001a 00       		.byte	0
 277 001b 00       		.byte	0
 278              		.global	projection_matrix
 279              		.align	2
 282              	projection_matrix:
 283 001c 04       		.byte	4
 284 001d 04       		.byte	4
 285 001e 0000     		.space	2
 286 0020 00000000 		.word	0
 287 0024 00000000 		.word	0
 288 0028 00000000 		.word	0
 289 002c 00000000 		.word	0
 290 0030 00000000 		.word	0
 291 0034 00000000 		.word	0
 292 0038 00000000 		.word	0
 293 003c 00000000 		.word	0
 294 0040 00000000 		.word	0
 295 0044 00000000 		.word	0
 296 0048 00000000 		.word	0
 297 004c 00000000 		.word	0
 298 0050 00000000 		.word	0
 299 0054 00000000 		.word	0
 300 0058 00000000 		.word	0
 301 005c 00000000 		.word	0
 302              		.comm	mf16_float_arr_ret,64,4
 303              		.text
 304              		.align	1
 305              		.global	mf16_to_float
 306              		.syntax unified
 307              		.code	16
 308              		.thumb_func
 309              		.fpu softvfp
 311              	mf16_to_float:
 312              	.LFB15:
 313              		.file 2 "/Users/legge/Development/moppen-game/shared/game.c"
   1:/Users/legge/Development/moppen-game/shared/game.c **** #include "game.h"
   2:/Users/legge/Development/moppen-game/shared/game.c **** 
   3:/Users/legge/Development/moppen-game/shared/game.c **** #include "util.h"
   4:/Users/legge/Development/moppen-game/shared/game.c **** #include "external.h"
   5:/Users/legge/Development/moppen-game/shared/game.c **** #include "canvas.h"
   6:/Users/legge/Development/moppen-game/shared/game.c **** #include "sprite.h"
   7:/Users/legge/Development/moppen-game/shared/game.c **** #include "vector_drawing.h"
   8:/Users/legge/Development/moppen-game/shared/game.c **** 
   9:/Users/legge/Development/moppen-game/shared/game.c **** #include "images/ball.xbm"
  10:/Users/legge/Development/moppen-game/shared/game.c **** #include "images/smily.xbm"
  11:/Users/legge/Development/moppen-game/shared/game.c **** 
  12:/Users/legge/Development/moppen-game/shared/game.c **** //Sprite smily_sprite;
  13:/Users/legge/Development/moppen-game/shared/game.c **** //Sprite ball_sprite;
  14:/Users/legge/Development/moppen-game/shared/game.c **** 
  15:/Users/legge/Development/moppen-game/shared/game.c **** #include "libfixmatrix/fixmatrix.h"
  16:/Users/legge/Development/moppen-game/shared/game.c **** #include "libfixmath/fix16.h"
  17:/Users/legge/Development/moppen-game/shared/game.c **** #include "libfixmatrix/fixvector4d.h"
  18:/Users/legge/Development/moppen-game/shared/game.c **** 
  19:/Users/legge/Development/moppen-game/shared/game.c **** #define mat4_new() (mf16){ \
  20:/Users/legge/Development/moppen-game/shared/game.c **** .rows= 4,\
  21:/Users/legge/Development/moppen-game/shared/game.c **** .columns= 4,\
  22:/Users/legge/Development/moppen-game/shared/game.c **** .data={{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}\
  23:/Users/legge/Development/moppen-game/shared/game.c **** }
  24:/Users/legge/Development/moppen-game/shared/game.c **** 
  25:/Users/legge/Development/moppen-game/shared/game.c **** mf16 projection_matrix = mat4_new();
  26:/Users/legge/Development/moppen-game/shared/game.c **** 
  27:/Users/legge/Development/moppen-game/shared/game.c **** typedef struct mf16_to_float_ret {
  28:/Users/legge/Development/moppen-game/shared/game.c ****     float data[4][4];
  29:/Users/legge/Development/moppen-game/shared/game.c **** } mf16_to_float_ret;
  30:/Users/legge/Development/moppen-game/shared/game.c **** mf16_to_float_ret mf16_float_arr_ret;
  31:/Users/legge/Development/moppen-game/shared/game.c **** 
  32:/Users/legge/Development/moppen-game/shared/game.c **** mf16_to_float_ret *mf16_to_float(const mf16 *mat) {
 314              		.loc 2 32 0
 315              		.cfi_startproc
 316              		@ args = 0, pretend = 0, frame = 16
 317              		@ frame_needed = 1, uses_anonymous_args = 0
 318 0098 80B5     		push	{r7, lr}
 319              		.cfi_def_cfa_offset 8
 320              		.cfi_offset 7, -8
 321              		.cfi_offset 14, -4
 322 009a 84B0     		sub	sp, sp, #16
 323              		.cfi_def_cfa_offset 24
 324 009c 00AF     		add	r7, sp, #0
 325              		.cfi_def_cfa_register 7
 326 009e 7860     		str	r0, [r7, #4]
 327              	.LBB2:
  33:/Users/legge/Development/moppen-game/shared/game.c ****     for (int i = 0; i < 4; i++) {
 328              		.loc 2 33 0
 329 00a0 0023     		movs	r3, #0
 330 00a2 FB60     		str	r3, [r7, #12]
 331 00a4 1EE0     		b	.L13
 332              	.L16:
 333              	.LBB3:
  34:/Users/legge/Development/moppen-game/shared/game.c ****         for (int j = 0; j < 4; j++) {
 334              		.loc 2 34 0
 335 00a6 0023     		movs	r3, #0
 336 00a8 BB60     		str	r3, [r7, #8]
 337 00aa 15E0     		b	.L14
 338              	.L15:
  35:/Users/legge/Development/moppen-game/shared/game.c ****             mf16_float_arr_ret.data[i][j] = fix16_to_float(mat->data[i][j]);
 339              		.loc 2 35 0 discriminator 3
 340 00ac 7A68     		ldr	r2, [r7, #4]
 341 00ae FB68     		ldr	r3, [r7, #12]
 342 00b0 9900     		lsls	r1, r3, #2
 343 00b2 BB68     		ldr	r3, [r7, #8]
 344 00b4 CB18     		adds	r3, r1, r3
 345 00b6 9B00     		lsls	r3, r3, #2
 346 00b8 D318     		adds	r3, r2, r3
 347 00ba 0433     		adds	r3, r3, #4
 348 00bc 1B68     		ldr	r3, [r3]
 349 00be 1800     		movs	r0, r3
 350 00c0 FFF7AAFF 		bl	fix16_to_float
 351 00c4 0B4B     		ldr	r3, .L18
 352 00c6 FA68     		ldr	r2, [r7, #12]
 353 00c8 9100     		lsls	r1, r2, #2
 354 00ca BA68     		ldr	r2, [r7, #8]
 355 00cc 8A18     		adds	r2, r1, r2
 356 00ce 9200     		lsls	r2, r2, #2
 357 00d0 D050     		str	r0, [r2, r3]
  34:/Users/legge/Development/moppen-game/shared/game.c ****         for (int j = 0; j < 4; j++) {
 358              		.loc 2 34 0 discriminator 3
 359 00d2 BB68     		ldr	r3, [r7, #8]
 360 00d4 0133     		adds	r3, r3, #1
 361 00d6 BB60     		str	r3, [r7, #8]
 362              	.L14:
  34:/Users/legge/Development/moppen-game/shared/game.c ****         for (int j = 0; j < 4; j++) {
 363              		.loc 2 34 0 is_stmt 0 discriminator 1
 364 00d8 BB68     		ldr	r3, [r7, #8]
 365 00da 032B     		cmp	r3, #3
 366 00dc E6DD     		ble	.L15
 367              	.LBE3:
  33:/Users/legge/Development/moppen-game/shared/game.c ****     for (int i = 0; i < 4; i++) {
 368              		.loc 2 33 0 is_stmt 1 discriminator 2
 369 00de FB68     		ldr	r3, [r7, #12]
 370 00e0 0133     		adds	r3, r3, #1
 371 00e2 FB60     		str	r3, [r7, #12]
 372              	.L13:
  33:/Users/legge/Development/moppen-game/shared/game.c ****     for (int i = 0; i < 4; i++) {
 373              		.loc 2 33 0 is_stmt 0 discriminator 1
 374 00e4 FB68     		ldr	r3, [r7, #12]
 375 00e6 032B     		cmp	r3, #3
 376 00e8 DDDD     		ble	.L16
 377              	.LBE2:
  36:/Users/legge/Development/moppen-game/shared/game.c ****         }
  37:/Users/legge/Development/moppen-game/shared/game.c ****     }
  38:/Users/legge/Development/moppen-game/shared/game.c ****     return &mf16_float_arr_ret;
 378              		.loc 2 38 0 is_stmt 1
 379 00ea 024B     		ldr	r3, .L18
  39:/Users/legge/Development/moppen-game/shared/game.c **** }
 380              		.loc 2 39 0
 381 00ec 1800     		movs	r0, r3
 382 00ee BD46     		mov	sp, r7
 383 00f0 04B0     		add	sp, sp, #16
 384              		@ sp needed
 385 00f2 80BD     		pop	{r7, pc}
 386              	.L19:
 387              		.align	2
 388              	.L18:
 389 00f4 00000000 		.word	mf16_float_arr_ret
 390              		.cfi_endproc
 391              	.LFE15:
 393              		.align	1
 394              		.global	debug_methods_exist
 395              		.syntax unified
 396              		.code	16
 397              		.thumb_func
 398              		.fpu softvfp
 400              	debug_methods_exist:
 401              	.LFB16:
  40:/Users/legge/Development/moppen-game/shared/game.c **** 
  41:/Users/legge/Development/moppen-game/shared/game.c **** void debug_methods_exist() {
 402              		.loc 2 41 0
 403              		.cfi_startproc
 404              		@ args = 0, pretend = 0, frame = 0
 405              		@ frame_needed = 1, uses_anonymous_args = 0
 406 00f8 80B5     		push	{r7, lr}
 407              		.cfi_def_cfa_offset 8
 408              		.cfi_offset 7, -8
 409              		.cfi_offset 14, -4
 410 00fa 00AF     		add	r7, sp, #0
 411              		.cfi_def_cfa_register 7
  42:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_to_float(0);
 412              		.loc 2 42 0
 413 00fc 0020     		movs	r0, #0
 414 00fe FFF7FEFF 		bl	mf16_to_float
  43:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_from_float(0);
 415              		.loc 2 43 0
 416 0102 0023     		movs	r3, #0
 417 0104 181C     		adds	r0, r3, #0
 418 0106 FFF79EFF 		bl	fix16_from_float
  44:/Users/legge/Development/moppen-game/shared/game.c **** }
 419              		.loc 2 44 0
 420 010a C046     		nop
 421 010c BD46     		mov	sp, r7
 422              		@ sp needed
 423 010e 80BD     		pop	{r7, pc}
 424              		.cfi_endproc
 425              	.LFE16:
 427              		.align	1
 428              		.global	set_perspective_projection
 429              		.syntax unified
 430              		.code	16
 431              		.thumb_func
 432              		.fpu softvfp
 434              	set_perspective_projection:
 435              	.LFB17:
  45:/Users/legge/Development/moppen-game/shared/game.c **** 
  46:/Users/legge/Development/moppen-game/shared/game.c **** void set_perspective_projection(fix16_t fovx, fix16_t fovy, int near, int far) {
 436              		.loc 2 46 0
 437              		.cfi_startproc
 438              		@ args = 0, pretend = 0, frame = 40
 439              		@ frame_needed = 1, uses_anonymous_args = 0
 440 0110 90B5     		push	{r4, r7, lr}
 441              		.cfi_def_cfa_offset 12
 442              		.cfi_offset 4, -12
 443              		.cfi_offset 7, -8
 444              		.cfi_offset 14, -4
 445 0112 8BB0     		sub	sp, sp, #44
 446              		.cfi_def_cfa_offset 56
 447 0114 00AF     		add	r7, sp, #0
 448              		.cfi_def_cfa_register 7
 449 0116 F860     		str	r0, [r7, #12]
 450 0118 B960     		str	r1, [r7, #8]
 451 011a 7A60     		str	r2, [r7, #4]
 452 011c 3B60     		str	r3, [r7]
  47:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t two_f = F16C(2, 0);
 453              		.loc 2 47 0
 454 011e 8023     		movs	r3, #128
 455 0120 9B02     		lsls	r3, r3, #10
 456 0122 7B62     		str	r3, [r7, #36]
  48:/Users/legge/Development/moppen-game/shared/game.c **** 
  49:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t fovx_div2_f = fix16_div(fovx, two_f);
 457              		.loc 2 49 0
 458 0124 7A6A     		ldr	r2, [r7, #36]
 459 0126 FB68     		ldr	r3, [r7, #12]
 460 0128 1100     		movs	r1, r2
 461 012a 1800     		movs	r0, r3
 462 012c FFF7FEFF 		bl	fix16_div
 463 0130 0300     		movs	r3, r0
 464 0132 3B62     		str	r3, [r7, #32]
  50:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t fovx_f = fix16_div(fix16_one, fix16_tan(fovx_div2_f));
 465              		.loc 2 50 0
 466 0134 8023     		movs	r3, #128
 467 0136 5C02     		lsls	r4, r3, #9
 468 0138 3B6A     		ldr	r3, [r7, #32]
 469 013a 1800     		movs	r0, r3
 470 013c FFF7FEFF 		bl	fix16_tan
 471 0140 0300     		movs	r3, r0
 472 0142 1900     		movs	r1, r3
 473 0144 2000     		movs	r0, r4
 474 0146 FFF7FEFF 		bl	fix16_div
 475 014a 0300     		movs	r3, r0
 476 014c FB61     		str	r3, [r7, #28]
  51:/Users/legge/Development/moppen-game/shared/game.c **** 
  52:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t fovy_div2_f = fix16_div(fovy, two_f);
 477              		.loc 2 52 0
 478 014e 7A6A     		ldr	r2, [r7, #36]
 479 0150 BB68     		ldr	r3, [r7, #8]
 480 0152 1100     		movs	r1, r2
 481 0154 1800     		movs	r0, r3
 482 0156 FFF7FEFF 		bl	fix16_div
 483 015a 0300     		movs	r3, r0
 484 015c BB61     		str	r3, [r7, #24]
  53:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t fovy_f = fix16_div(fix16_one, fix16_tan(fovy_div2_f));
 485              		.loc 2 53 0
 486 015e 8023     		movs	r3, #128
 487 0160 5C02     		lsls	r4, r3, #9
 488 0162 BB69     		ldr	r3, [r7, #24]
 489 0164 1800     		movs	r0, r3
 490 0166 FFF7FEFF 		bl	fix16_tan
 491 016a 0300     		movs	r3, r0
 492 016c 1900     		movs	r1, r3
 493 016e 2000     		movs	r0, r4
 494 0170 FFF7FEFF 		bl	fix16_div
 495 0174 0300     		movs	r3, r0
 496 0176 7B61     		str	r3, [r7, #20]
  54:/Users/legge/Development/moppen-game/shared/game.c **** 
  55:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t nf_f = fix16_from_int(near - far);
 497              		.loc 2 55 0
 498 0178 7A68     		ldr	r2, [r7, #4]
 499 017a 3B68     		ldr	r3, [r7]
 500 017c D31A     		subs	r3, r2, r3
 501 017e 1800     		movs	r0, r3
 502 0180 FFF73EFF 		bl	fix16_from_int
 503 0184 0300     		movs	r3, r0
 504 0186 3B61     		str	r3, [r7, #16]
  56:/Users/legge/Development/moppen-game/shared/game.c **** 
  57:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[0][0] = fovx_f;
 505              		.loc 2 57 0
 506 0188 274B     		ldr	r3, .L22
 507 018a FA69     		ldr	r2, [r7, #28]
 508 018c 5A60     		str	r2, [r3, #4]
  58:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[0][1] = 0;
 509              		.loc 2 58 0
 510 018e 264B     		ldr	r3, .L22
 511 0190 0022     		movs	r2, #0
 512 0192 9A60     		str	r2, [r3, #8]
  59:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[0][2] = 0;
 513              		.loc 2 59 0
 514 0194 244B     		ldr	r3, .L22
 515 0196 0022     		movs	r2, #0
 516 0198 DA60     		str	r2, [r3, #12]
  60:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[0][3] = 0;
 517              		.loc 2 60 0
 518 019a 234B     		ldr	r3, .L22
 519 019c 0022     		movs	r2, #0
 520 019e 1A61     		str	r2, [r3, #16]
  61:/Users/legge/Development/moppen-game/shared/game.c **** 
  62:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[1][0] = 0;
 521              		.loc 2 62 0
 522 01a0 214B     		ldr	r3, .L22
 523 01a2 0022     		movs	r2, #0
 524 01a4 5A61     		str	r2, [r3, #20]
  63:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[1][1] = fovy_f;
 525              		.loc 2 63 0
 526 01a6 204B     		ldr	r3, .L22
 527 01a8 7A69     		ldr	r2, [r7, #20]
 528 01aa 9A61     		str	r2, [r3, #24]
  64:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[1][2] = 0;
 529              		.loc 2 64 0
 530 01ac 1E4B     		ldr	r3, .L22
 531 01ae 0022     		movs	r2, #0
 532 01b0 DA61     		str	r2, [r3, #28]
  65:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[1][3] = 0;
 533              		.loc 2 65 0
 534 01b2 1D4B     		ldr	r3, .L22
 535 01b4 0022     		movs	r2, #0
 536 01b6 1A62     		str	r2, [r3, #32]
  66:/Users/legge/Development/moppen-game/shared/game.c **** 
  67:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[2][0] = 0;
 537              		.loc 2 67 0
 538 01b8 1B4B     		ldr	r3, .L22
 539 01ba 0022     		movs	r2, #0
 540 01bc 5A62     		str	r2, [r3, #36]
  68:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[2][1] = 0;
 541              		.loc 2 68 0
 542 01be 1A4B     		ldr	r3, .L22
 543 01c0 0022     		movs	r2, #0
 544 01c2 9A62     		str	r2, [r3, #40]
  69:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[2][2] = fix16_div(fix16_from_int(far + near), nf_f);
 545              		.loc 2 69 0
 546 01c4 3A68     		ldr	r2, [r7]
 547 01c6 7B68     		ldr	r3, [r7, #4]
 548 01c8 D318     		adds	r3, r2, r3
 549 01ca 1800     		movs	r0, r3
 550 01cc FFF718FF 		bl	fix16_from_int
 551 01d0 0200     		movs	r2, r0
 552 01d2 3B69     		ldr	r3, [r7, #16]
 553 01d4 1900     		movs	r1, r3
 554 01d6 1000     		movs	r0, r2
 555 01d8 FFF7FEFF 		bl	fix16_div
 556 01dc 0200     		movs	r2, r0
 557 01de 124B     		ldr	r3, .L22
 558 01e0 DA62     		str	r2, [r3, #44]
  70:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[2][3] = fix16_div(fix16_from_int(2 * far * near), nf_f);
 559              		.loc 2 70 0
 560 01e2 3B68     		ldr	r3, [r7]
 561 01e4 5B00     		lsls	r3, r3, #1
 562 01e6 7A68     		ldr	r2, [r7, #4]
 563 01e8 5343     		muls	r3, r2
 564 01ea 1800     		movs	r0, r3
 565 01ec FFF708FF 		bl	fix16_from_int
 566 01f0 0200     		movs	r2, r0
 567 01f2 3B69     		ldr	r3, [r7, #16]
 568 01f4 1900     		movs	r1, r3
 569 01f6 1000     		movs	r0, r2
 570 01f8 FFF7FEFF 		bl	fix16_div
 571 01fc 0200     		movs	r2, r0
 572 01fe 0A4B     		ldr	r3, .L22
 573 0200 1A63     		str	r2, [r3, #48]
  71:/Users/legge/Development/moppen-game/shared/game.c **** 
  72:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[3][0] = 0;
 574              		.loc 2 72 0
 575 0202 094B     		ldr	r3, .L22
 576 0204 0022     		movs	r2, #0
 577 0206 5A63     		str	r2, [r3, #52]
  73:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[3][1] = 0;
 578              		.loc 2 73 0
 579 0208 074B     		ldr	r3, .L22
 580 020a 0022     		movs	r2, #0
 581 020c 9A63     		str	r2, [r3, #56]
  74:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[3][2] = -fix16_one;
 582              		.loc 2 74 0
 583 020e 8023     		movs	r3, #128
 584 0210 5B02     		lsls	r3, r3, #9
 585 0212 5A42     		rsbs	r2, r3, #0
 586 0214 044B     		ldr	r3, .L22
 587 0216 DA63     		str	r2, [r3, #60]
  75:/Users/legge/Development/moppen-game/shared/game.c ****     projection_matrix.data[3][3] = 0;
 588              		.loc 2 75 0
 589 0218 034B     		ldr	r3, .L22
 590 021a 0022     		movs	r2, #0
 591 021c 1A64     		str	r2, [r3, #64]
  76:/Users/legge/Development/moppen-game/shared/game.c **** };
 592              		.loc 2 76 0
 593 021e C046     		nop
 594 0220 BD46     		mov	sp, r7
 595 0222 0BB0     		add	sp, sp, #44
 596              		@ sp needed
 597 0224 90BD     		pop	{r4, r7, pc}
 598              	.L23:
 599 0226 C046     		.align	2
 600              	.L22:
 601 0228 00000000 		.word	projection_matrix
 602              		.cfi_endproc
 603              	.LFE17:
 605              		.global	always_false
 606              		.bss
 607              		.align	2
 610              	always_false:
 611 0000 00000000 		.space	4
 612              		.text
 613              		.align	1
 614              		.global	game_init
 615              		.syntax unified
 616              		.code	16
 617              		.thumb_func
 618              		.fpu softvfp
 620              	game_init:
 621              	.LFB18:
  77:/Users/legge/Development/moppen-game/shared/game.c **** 
  78:/Users/legge/Development/moppen-game/shared/game.c **** int always_false = 0;
  79:/Users/legge/Development/moppen-game/shared/game.c **** 
  80:/Users/legge/Development/moppen-game/shared/game.c **** void game_init() {
 622              		.loc 2 80 0
 623              		.cfi_startproc
 624              		@ args = 0, pretend = 0, frame = 8
 625              		@ frame_needed = 1, uses_anonymous_args = 0
 626 022c 80B5     		push	{r7, lr}
 627              		.cfi_def_cfa_offset 8
 628              		.cfi_offset 7, -8
 629              		.cfi_offset 14, -4
 630 022e 82B0     		sub	sp, sp, #8
 631              		.cfi_def_cfa_offset 16
 632 0230 00AF     		add	r7, sp, #0
 633              		.cfi_def_cfa_register 7
  81:/Users/legge/Development/moppen-game/shared/game.c ****     if (always_false)
 634              		.loc 2 81 0
 635 0232 0D4B     		ldr	r3, .L26
 636 0234 1B68     		ldr	r3, [r3]
 637 0236 002B     		cmp	r3, #0
 638 0238 01D0     		beq	.L25
  82:/Users/legge/Development/moppen-game/shared/game.c ****         debug_methods_exist();
 639              		.loc 2 82 0
 640 023a FFF7FEFF 		bl	debug_methods_exist
 641              	.L25:
  83:/Users/legge/Development/moppen-game/shared/game.c **** 
  84:/Users/legge/Development/moppen-game/shared/game.c ****     canvas_clear();
 642              		.loc 2 84 0
 643 023e FFF7FEFF 		bl	canvas_clear
  85:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t fov = fix16_div(fix16_one, F16C(0.1, 0));
 644              		.loc 2 85 0
 645 0242 8023     		movs	r3, #128
 646 0244 5B02     		lsls	r3, r3, #9
 647 0246 0021     		movs	r1, #0
 648 0248 1800     		movs	r0, r3
 649 024a FFF7FEFF 		bl	fix16_div
 650 024e 0300     		movs	r3, r0
 651 0250 7B60     		str	r3, [r7, #4]
  86:/Users/legge/Development/moppen-game/shared/game.c ****     set_perspective_projection(fov, fov, 5, 1000);
 652              		.loc 2 86 0
 653 0252 FA23     		movs	r3, #250
 654 0254 9B00     		lsls	r3, r3, #2
 655 0256 7968     		ldr	r1, [r7, #4]
 656 0258 7868     		ldr	r0, [r7, #4]
 657 025a 0522     		movs	r2, #5
 658 025c FFF7FEFF 		bl	set_perspective_projection
  87:/Users/legge/Development/moppen-game/shared/game.c **** }
 659              		.loc 2 87 0
 660 0260 C046     		nop
 661 0262 BD46     		mov	sp, r7
 662 0264 02B0     		add	sp, sp, #8
 663              		@ sp needed
 664 0266 80BD     		pop	{r7, pc}
 665              	.L27:
 666              		.align	2
 667              	.L26:
 668 0268 00000000 		.word	always_false
 669              		.cfi_endproc
 670              	.LFE18:
 672              		.global	camera_x
 673              		.bss
 674              		.align	2
 677              	camera_x:
 678 0004 00000000 		.space	4
 679              		.global	camera_y
 680              		.align	2
 683              	camera_y:
 684 0008 00000000 		.space	4
 685              		.global	camera_z
 686              		.align	2
 689              	camera_z:
 690 000c 00000000 		.space	4
 691              		.global	camera_rot
 692              		.align	2
 695              	camera_rot:
 696 0010 00000000 		.space	4
 697              		.global	camera_rot_2
 698              		.align	2
 701              	camera_rot_2:
 702 0014 00000000 		.space	4
 703              		.text
 704              		.align	1
 705              		.global	handle_input
 706              		.syntax unified
 707              		.code	16
 708              		.thumb_func
 709              		.fpu softvfp
 711              	handle_input:
 712              	.LFB19:
  88:/Users/legge/Development/moppen-game/shared/game.c **** 
  89:/Users/legge/Development/moppen-game/shared/game.c **** int camera_x = 0;
  90:/Users/legge/Development/moppen-game/shared/game.c **** int camera_y = 0;
  91:/Users/legge/Development/moppen-game/shared/game.c **** int camera_z = 0;
  92:/Users/legge/Development/moppen-game/shared/game.c **** int camera_rot = 0;
  93:/Users/legge/Development/moppen-game/shared/game.c **** int camera_rot_2 = 0;
  94:/Users/legge/Development/moppen-game/shared/game.c **** 
  95:/Users/legge/Development/moppen-game/shared/game.c **** void handle_input() {
 713              		.loc 2 95 0
 714              		.cfi_startproc
 715              		@ args = 0, pretend = 0, frame = 0
 716              		@ frame_needed = 1, uses_anonymous_args = 0
 717 026c 80B5     		push	{r7, lr}
 718              		.cfi_def_cfa_offset 8
 719              		.cfi_offset 7, -8
 720              		.cfi_offset 14, -4
 721 026e 00AF     		add	r7, sp, #0
 722              		.cfi_def_cfa_register 7
  96:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x4)) {
 723              		.loc 2 96 0
 724 0270 0420     		movs	r0, #4
 725 0272 FFF7FEFF 		bl	key_is_active
 726 0276 031E     		subs	r3, r0, #0
 727 0278 04D0     		beq	.L29
  97:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot -= 1;
 728              		.loc 2 97 0
 729 027a 3B4B     		ldr	r3, .L41
 730 027c 1B68     		ldr	r3, [r3]
 731 027e 5A1E     		subs	r2, r3, #1
 732 0280 394B     		ldr	r3, .L41
 733 0282 1A60     		str	r2, [r3]
 734              	.L29:
  98:/Users/legge/Development/moppen-game/shared/game.c ****     }
  99:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x6)) {
 735              		.loc 2 99 0
 736 0284 0620     		movs	r0, #6
 737 0286 FFF7FEFF 		bl	key_is_active
 738 028a 031E     		subs	r3, r0, #0
 739 028c 04D0     		beq	.L30
 100:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot += 1;
 740              		.loc 2 100 0
 741 028e 364B     		ldr	r3, .L41
 742 0290 1B68     		ldr	r3, [r3]
 743 0292 5A1C     		adds	r2, r3, #1
 744 0294 344B     		ldr	r3, .L41
 745 0296 1A60     		str	r2, [r3]
 746              	.L30:
 101:/Users/legge/Development/moppen-game/shared/game.c ****     }
 102:/Users/legge/Development/moppen-game/shared/game.c **** 
 103:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x3)) {
 747              		.loc 2 103 0
 748 0298 0320     		movs	r0, #3
 749 029a FFF7FEFF 		bl	key_is_active
 750 029e 031E     		subs	r3, r0, #0
 751 02a0 04D0     		beq	.L31
 104:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot_2 -= 1;
 752              		.loc 2 104 0
 753 02a2 324B     		ldr	r3, .L41+4
 754 02a4 1B68     		ldr	r3, [r3]
 755 02a6 5A1E     		subs	r2, r3, #1
 756 02a8 304B     		ldr	r3, .L41+4
 757 02aa 1A60     		str	r2, [r3]
 758              	.L31:
 105:/Users/legge/Development/moppen-game/shared/game.c ****     }
 106:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0xF)) {
 759              		.loc 2 106 0
 760 02ac 0F20     		movs	r0, #15
 761 02ae FFF7FEFF 		bl	key_is_active
 762 02b2 031E     		subs	r3, r0, #0
 763 02b4 04D0     		beq	.L32
 107:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot_2 += 1;
 764              		.loc 2 107 0
 765 02b6 2D4B     		ldr	r3, .L41+4
 766 02b8 1B68     		ldr	r3, [r3]
 767 02ba 5A1C     		adds	r2, r3, #1
 768 02bc 2B4B     		ldr	r3, .L41+4
 769 02be 1A60     		str	r2, [r3]
 770              	.L32:
 108:/Users/legge/Development/moppen-game/shared/game.c ****     }
 109:/Users/legge/Development/moppen-game/shared/game.c **** 
 110:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x7)) {
 771              		.loc 2 110 0
 772 02c0 0720     		movs	r0, #7
 773 02c2 FFF7FEFF 		bl	key_is_active
 774 02c6 031E     		subs	r3, r0, #0
 775 02c8 04D0     		beq	.L33
 111:/Users/legge/Development/moppen-game/shared/game.c ****         camera_x -= 1;
 776              		.loc 2 111 0
 777 02ca 294B     		ldr	r3, .L41+8
 778 02cc 1B68     		ldr	r3, [r3]
 779 02ce 5A1E     		subs	r2, r3, #1
 780 02d0 274B     		ldr	r3, .L41+8
 781 02d2 1A60     		str	r2, [r3]
 782              	.L33:
 112:/Users/legge/Development/moppen-game/shared/game.c ****     }
 113:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x9)) {
 783              		.loc 2 113 0
 784 02d4 0920     		movs	r0, #9
 785 02d6 FFF7FEFF 		bl	key_is_active
 786 02da 031E     		subs	r3, r0, #0
 787 02dc 04D0     		beq	.L34
 114:/Users/legge/Development/moppen-game/shared/game.c ****         camera_x += 1;
 788              		.loc 2 114 0
 789 02de 244B     		ldr	r3, .L41+8
 790 02e0 1B68     		ldr	r3, [r3]
 791 02e2 5A1C     		adds	r2, r3, #1
 792 02e4 224B     		ldr	r3, .L41+8
 793 02e6 1A60     		str	r2, [r3]
 794              	.L34:
 115:/Users/legge/Development/moppen-game/shared/game.c ****     }
 116:/Users/legge/Development/moppen-game/shared/game.c **** 
 117:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x2)) {
 795              		.loc 2 117 0
 796 02e8 0220     		movs	r0, #2
 797 02ea FFF7FEFF 		bl	key_is_active
 798 02ee 031E     		subs	r3, r0, #0
 799 02f0 04D0     		beq	.L35
 118:/Users/legge/Development/moppen-game/shared/game.c ****         camera_y -= 1;
 800              		.loc 2 118 0
 801 02f2 204B     		ldr	r3, .L41+12
 802 02f4 1B68     		ldr	r3, [r3]
 803 02f6 5A1E     		subs	r2, r3, #1
 804 02f8 1E4B     		ldr	r3, .L41+12
 805 02fa 1A60     		str	r2, [r3]
 806              	.L35:
 119:/Users/legge/Development/moppen-game/shared/game.c ****     }
 120:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x0)) {
 807              		.loc 2 120 0
 808 02fc 0020     		movs	r0, #0
 809 02fe FFF7FEFF 		bl	key_is_active
 810 0302 031E     		subs	r3, r0, #0
 811 0304 04D0     		beq	.L36
 121:/Users/legge/Development/moppen-game/shared/game.c ****         camera_y += 1;
 812              		.loc 2 121 0
 813 0306 1B4B     		ldr	r3, .L41+12
 814 0308 1B68     		ldr	r3, [r3]
 815 030a 5A1C     		adds	r2, r3, #1
 816 030c 194B     		ldr	r3, .L41+12
 817 030e 1A60     		str	r2, [r3]
 818              	.L36:
 122:/Users/legge/Development/moppen-game/shared/game.c ****     }
 123:/Users/legge/Development/moppen-game/shared/game.c **** 
 124:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x5)) {
 819              		.loc 2 124 0
 820 0310 0520     		movs	r0, #5
 821 0312 FFF7FEFF 		bl	key_is_active
 822 0316 031E     		subs	r3, r0, #0
 823 0318 04D0     		beq	.L37
 125:/Users/legge/Development/moppen-game/shared/game.c ****         camera_z -= 1;
 824              		.loc 2 125 0
 825 031a 174B     		ldr	r3, .L41+16
 826 031c 1B68     		ldr	r3, [r3]
 827 031e 5A1E     		subs	r2, r3, #1
 828 0320 154B     		ldr	r3, .L41+16
 829 0322 1A60     		str	r2, [r3]
 830              	.L37:
 126:/Users/legge/Development/moppen-game/shared/game.c ****     }
 127:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x8)) {
 831              		.loc 2 127 0
 832 0324 0820     		movs	r0, #8
 833 0326 FFF7FEFF 		bl	key_is_active
 834 032a 031E     		subs	r3, r0, #0
 835 032c 04D0     		beq	.L38
 128:/Users/legge/Development/moppen-game/shared/game.c ****         camera_z += 1;
 836              		.loc 2 128 0
 837 032e 124B     		ldr	r3, .L41+16
 838 0330 1B68     		ldr	r3, [r3]
 839 0332 5A1C     		adds	r2, r3, #1
 840 0334 104B     		ldr	r3, .L41+16
 841 0336 1A60     		str	r2, [r3]
 842              	.L38:
 129:/Users/legge/Development/moppen-game/shared/game.c ****     }
 130:/Users/legge/Development/moppen-game/shared/game.c **** 
 131:/Users/legge/Development/moppen-game/shared/game.c ****     if (key_is_active(0x1)) {
 843              		.loc 2 131 0
 844 0338 0120     		movs	r0, #1
 845 033a FFF7FEFF 		bl	key_is_active
 846 033e 031E     		subs	r3, r0, #0
 847 0340 0ED0     		beq	.L40
 132:/Users/legge/Development/moppen-game/shared/game.c ****         camera_x = 0;
 848              		.loc 2 132 0
 849 0342 0B4B     		ldr	r3, .L41+8
 850 0344 0022     		movs	r2, #0
 851 0346 1A60     		str	r2, [r3]
 133:/Users/legge/Development/moppen-game/shared/game.c ****         camera_y = 0;
 852              		.loc 2 133 0
 853 0348 0A4B     		ldr	r3, .L41+12
 854 034a 0022     		movs	r2, #0
 855 034c 1A60     		str	r2, [r3]
 134:/Users/legge/Development/moppen-game/shared/game.c ****         camera_z = 0;
 856              		.loc 2 134 0
 857 034e 0A4B     		ldr	r3, .L41+16
 858 0350 0022     		movs	r2, #0
 859 0352 1A60     		str	r2, [r3]
 135:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot = 0;
 860              		.loc 2 135 0
 861 0354 044B     		ldr	r3, .L41
 862 0356 0022     		movs	r2, #0
 863 0358 1A60     		str	r2, [r3]
 136:/Users/legge/Development/moppen-game/shared/game.c ****         camera_rot_2 = 0;
 864              		.loc 2 136 0
 865 035a 044B     		ldr	r3, .L41+4
 866 035c 0022     		movs	r2, #0
 867 035e 1A60     		str	r2, [r3]
 868              	.L40:
 137:/Users/legge/Development/moppen-game/shared/game.c ****     }
 138:/Users/legge/Development/moppen-game/shared/game.c **** }
 869              		.loc 2 138 0
 870 0360 C046     		nop
 871 0362 BD46     		mov	sp, r7
 872              		@ sp needed
 873 0364 80BD     		pop	{r7, pc}
 874              	.L42:
 875 0366 C046     		.align	2
 876              	.L41:
 877 0368 00000000 		.word	camera_rot
 878 036c 00000000 		.word	camera_rot_2
 879 0370 00000000 		.word	camera_x
 880 0374 00000000 		.word	camera_y
 881 0378 00000000 		.word	camera_z
 882              		.cfi_endproc
 883              	.LFE19:
 885              		.align	1
 886              		.global	create_scale
 887              		.syntax unified
 888              		.code	16
 889              		.thumb_func
 890              		.fpu softvfp
 892              	create_scale:
 893              	.LFB20:
 139:/Users/legge/Development/moppen-game/shared/game.c **** 
 140:/Users/legge/Development/moppen-game/shared/game.c **** void create_scale(mf16 *M, fix16_t x, fix16_t y, fix16_t z) {
 894              		.loc 2 140 0
 895              		.cfi_startproc
 896              		@ args = 0, pretend = 0, frame = 16
 897              		@ frame_needed = 1, uses_anonymous_args = 0
 898 037c 80B5     		push	{r7, lr}
 899              		.cfi_def_cfa_offset 8
 900              		.cfi_offset 7, -8
 901              		.cfi_offset 14, -4
 902 037e 84B0     		sub	sp, sp, #16
 903              		.cfi_def_cfa_offset 24
 904 0380 00AF     		add	r7, sp, #0
 905              		.cfi_def_cfa_register 7
 906 0382 F860     		str	r0, [r7, #12]
 907 0384 B960     		str	r1, [r7, #8]
 908 0386 7A60     		str	r2, [r7, #4]
 909 0388 3B60     		str	r3, [r7]
 141:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill(M, 0);
 910              		.loc 2 141 0
 911 038a FB68     		ldr	r3, [r7, #12]
 912 038c 0021     		movs	r1, #0
 913 038e 1800     		movs	r0, r3
 914 0390 FFF7FEFF 		bl	mf16_fill
 142:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill_diagonal(M, fix16_one);
 915              		.loc 2 142 0
 916 0394 8023     		movs	r3, #128
 917 0396 5A02     		lsls	r2, r3, #9
 918 0398 FB68     		ldr	r3, [r7, #12]
 919 039a 1100     		movs	r1, r2
 920 039c 1800     		movs	r0, r3
 921 039e FFF7FEFF 		bl	mf16_fill_diagonal
 143:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][0] = x;
 922              		.loc 2 143 0
 923 03a2 FB68     		ldr	r3, [r7, #12]
 924 03a4 BA68     		ldr	r2, [r7, #8]
 925 03a6 5A60     		str	r2, [r3, #4]
 144:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][1] = y;
 926              		.loc 2 144 0
 927 03a8 FB68     		ldr	r3, [r7, #12]
 928 03aa 7A68     		ldr	r2, [r7, #4]
 929 03ac 9A61     		str	r2, [r3, #24]
 145:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][2] = z;
 930              		.loc 2 145 0
 931 03ae FB68     		ldr	r3, [r7, #12]
 932 03b0 3A68     		ldr	r2, [r7]
 933 03b2 DA62     		str	r2, [r3, #44]
 146:/Users/legge/Development/moppen-game/shared/game.c **** }
 934              		.loc 2 146 0
 935 03b4 C046     		nop
 936 03b6 BD46     		mov	sp, r7
 937 03b8 04B0     		add	sp, sp, #16
 938              		@ sp needed
 939 03ba 80BD     		pop	{r7, pc}
 940              		.cfi_endproc
 941              	.LFE20:
 943              		.align	1
 944              		.global	create_translation
 945              		.syntax unified
 946              		.code	16
 947              		.thumb_func
 948              		.fpu softvfp
 950              	create_translation:
 951              	.LFB21:
 147:/Users/legge/Development/moppen-game/shared/game.c **** 
 148:/Users/legge/Development/moppen-game/shared/game.c **** void create_translation(mf16 *M, fix16_t x, fix16_t y, fix16_t z) {
 952              		.loc 2 148 0
 953              		.cfi_startproc
 954              		@ args = 0, pretend = 0, frame = 16
 955              		@ frame_needed = 1, uses_anonymous_args = 0
 956 03bc 80B5     		push	{r7, lr}
 957              		.cfi_def_cfa_offset 8
 958              		.cfi_offset 7, -8
 959              		.cfi_offset 14, -4
 960 03be 84B0     		sub	sp, sp, #16
 961              		.cfi_def_cfa_offset 24
 962 03c0 00AF     		add	r7, sp, #0
 963              		.cfi_def_cfa_register 7
 964 03c2 F860     		str	r0, [r7, #12]
 965 03c4 B960     		str	r1, [r7, #8]
 966 03c6 7A60     		str	r2, [r7, #4]
 967 03c8 3B60     		str	r3, [r7]
 149:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill(M, 0);
 968              		.loc 2 149 0
 969 03ca FB68     		ldr	r3, [r7, #12]
 970 03cc 0021     		movs	r1, #0
 971 03ce 1800     		movs	r0, r3
 972 03d0 FFF7FEFF 		bl	mf16_fill
 150:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill_diagonal(M, fix16_one);
 973              		.loc 2 150 0
 974 03d4 8023     		movs	r3, #128
 975 03d6 5A02     		lsls	r2, r3, #9
 976 03d8 FB68     		ldr	r3, [r7, #12]
 977 03da 1100     		movs	r1, r2
 978 03dc 1800     		movs	r0, r3
 979 03de FFF7FEFF 		bl	mf16_fill_diagonal
 151:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][3] = x;
 980              		.loc 2 151 0
 981 03e2 FB68     		ldr	r3, [r7, #12]
 982 03e4 BA68     		ldr	r2, [r7, #8]
 983 03e6 1A61     		str	r2, [r3, #16]
 152:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][3] = y;
 984              		.loc 2 152 0
 985 03e8 FB68     		ldr	r3, [r7, #12]
 986 03ea 7A68     		ldr	r2, [r7, #4]
 987 03ec 1A62     		str	r2, [r3, #32]
 153:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][3] = z;
 988              		.loc 2 153 0
 989 03ee FB68     		ldr	r3, [r7, #12]
 990 03f0 3A68     		ldr	r2, [r7]
 991 03f2 1A63     		str	r2, [r3, #48]
 154:/Users/legge/Development/moppen-game/shared/game.c **** }
 992              		.loc 2 154 0
 993 03f4 C046     		nop
 994 03f6 BD46     		mov	sp, r7
 995 03f8 04B0     		add	sp, sp, #16
 996              		@ sp needed
 997 03fa 80BD     		pop	{r7, pc}
 998              		.cfi_endproc
 999              	.LFE21:
 1001              		.align	1
 1002              		.global	create_rotation_x
 1003              		.syntax unified
 1004              		.code	16
 1005              		.thumb_func
 1006              		.fpu softvfp
 1008              	create_rotation_x:
 1009              	.LFB22:
 155:/Users/legge/Development/moppen-game/shared/game.c **** 
 156:/Users/legge/Development/moppen-game/shared/game.c **** void create_rotation_x(mf16 *M, fix16_t angle) {
 1010              		.loc 2 156 0
 1011              		.cfi_startproc
 1012              		@ args = 0, pretend = 0, frame = 8
 1013              		@ frame_needed = 1, uses_anonymous_args = 0
 1014 03fc 80B5     		push	{r7, lr}
 1015              		.cfi_def_cfa_offset 8
 1016              		.cfi_offset 7, -8
 1017              		.cfi_offset 14, -4
 1018 03fe 82B0     		sub	sp, sp, #8
 1019              		.cfi_def_cfa_offset 16
 1020 0400 00AF     		add	r7, sp, #0
 1021              		.cfi_def_cfa_register 7
 1022 0402 7860     		str	r0, [r7, #4]
 1023 0404 3960     		str	r1, [r7]
 157:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill(M, 0);
 1024              		.loc 2 157 0
 1025 0406 7B68     		ldr	r3, [r7, #4]
 1026 0408 0021     		movs	r1, #0
 1027 040a 1800     		movs	r0, r3
 1028 040c FFF7FEFF 		bl	mf16_fill
 158:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill_diagonal(M, fix16_one);
 1029              		.loc 2 158 0
 1030 0410 8023     		movs	r3, #128
 1031 0412 5A02     		lsls	r2, r3, #9
 1032 0414 7B68     		ldr	r3, [r7, #4]
 1033 0416 1100     		movs	r1, r2
 1034 0418 1800     		movs	r0, r3
 1035 041a FFF7FEFF 		bl	mf16_fill_diagonal
 159:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][1] = fix16_cos(angle);
 1036              		.loc 2 159 0
 1037 041e 3B68     		ldr	r3, [r7]
 1038 0420 1800     		movs	r0, r3
 1039 0422 FFF7FEFF 		bl	fix16_cos
 1040 0426 0200     		movs	r2, r0
 1041 0428 7B68     		ldr	r3, [r7, #4]
 1042 042a 9A61     		str	r2, [r3, #24]
 160:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][2] = -fix16_sin(angle);
 1043              		.loc 2 160 0
 1044 042c 3B68     		ldr	r3, [r7]
 1045 042e 1800     		movs	r0, r3
 1046 0430 FFF7FEFF 		bl	fix16_sin
 1047 0434 0300     		movs	r3, r0
 1048 0436 5A42     		rsbs	r2, r3, #0
 1049 0438 7B68     		ldr	r3, [r7, #4]
 1050 043a DA61     		str	r2, [r3, #28]
 161:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][1] = fix16_sin(angle);
 1051              		.loc 2 161 0
 1052 043c 3B68     		ldr	r3, [r7]
 1053 043e 1800     		movs	r0, r3
 1054 0440 FFF7FEFF 		bl	fix16_sin
 1055 0444 0200     		movs	r2, r0
 1056 0446 7B68     		ldr	r3, [r7, #4]
 1057 0448 9A62     		str	r2, [r3, #40]
 162:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][2] = fix16_cos(angle);
 1058              		.loc 2 162 0
 1059 044a 3B68     		ldr	r3, [r7]
 1060 044c 1800     		movs	r0, r3
 1061 044e FFF7FEFF 		bl	fix16_cos
 1062 0452 0200     		movs	r2, r0
 1063 0454 7B68     		ldr	r3, [r7, #4]
 1064 0456 DA62     		str	r2, [r3, #44]
 163:/Users/legge/Development/moppen-game/shared/game.c **** }
 1065              		.loc 2 163 0
 1066 0458 C046     		nop
 1067 045a BD46     		mov	sp, r7
 1068 045c 02B0     		add	sp, sp, #8
 1069              		@ sp needed
 1070 045e 80BD     		pop	{r7, pc}
 1071              		.cfi_endproc
 1072              	.LFE22:
 1074              		.align	1
 1075              		.global	create_rotation_y
 1076              		.syntax unified
 1077              		.code	16
 1078              		.thumb_func
 1079              		.fpu softvfp
 1081              	create_rotation_y:
 1082              	.LFB23:
 164:/Users/legge/Development/moppen-game/shared/game.c **** 
 165:/Users/legge/Development/moppen-game/shared/game.c **** void create_rotation_y(mf16 *M, fix16_t angle) {
 1083              		.loc 2 165 0
 1084              		.cfi_startproc
 1085              		@ args = 0, pretend = 0, frame = 8
 1086              		@ frame_needed = 1, uses_anonymous_args = 0
 1087 0460 80B5     		push	{r7, lr}
 1088              		.cfi_def_cfa_offset 8
 1089              		.cfi_offset 7, -8
 1090              		.cfi_offset 14, -4
 1091 0462 82B0     		sub	sp, sp, #8
 1092              		.cfi_def_cfa_offset 16
 1093 0464 00AF     		add	r7, sp, #0
 1094              		.cfi_def_cfa_register 7
 1095 0466 7860     		str	r0, [r7, #4]
 1096 0468 3960     		str	r1, [r7]
 166:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill(M, 0);
 1097              		.loc 2 166 0
 1098 046a 7B68     		ldr	r3, [r7, #4]
 1099 046c 0021     		movs	r1, #0
 1100 046e 1800     		movs	r0, r3
 1101 0470 FFF7FEFF 		bl	mf16_fill
 167:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill_diagonal(M, fix16_one);
 1102              		.loc 2 167 0
 1103 0474 8023     		movs	r3, #128
 1104 0476 5A02     		lsls	r2, r3, #9
 1105 0478 7B68     		ldr	r3, [r7, #4]
 1106 047a 1100     		movs	r1, r2
 1107 047c 1800     		movs	r0, r3
 1108 047e FFF7FEFF 		bl	mf16_fill_diagonal
 168:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][0] = fix16_cos(angle);
 1109              		.loc 2 168 0
 1110 0482 3B68     		ldr	r3, [r7]
 1111 0484 1800     		movs	r0, r3
 1112 0486 FFF7FEFF 		bl	fix16_cos
 1113 048a 0200     		movs	r2, r0
 1114 048c 7B68     		ldr	r3, [r7, #4]
 1115 048e 5A60     		str	r2, [r3, #4]
 169:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][2] = fix16_sin(angle);
 1116              		.loc 2 169 0
 1117 0490 3B68     		ldr	r3, [r7]
 1118 0492 1800     		movs	r0, r3
 1119 0494 FFF7FEFF 		bl	fix16_sin
 1120 0498 0200     		movs	r2, r0
 1121 049a 7B68     		ldr	r3, [r7, #4]
 1122 049c DA60     		str	r2, [r3, #12]
 170:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][0] = -fix16_sin(angle);
 1123              		.loc 2 170 0
 1124 049e 3B68     		ldr	r3, [r7]
 1125 04a0 1800     		movs	r0, r3
 1126 04a2 FFF7FEFF 		bl	fix16_sin
 1127 04a6 0300     		movs	r3, r0
 1128 04a8 5A42     		rsbs	r2, r3, #0
 1129 04aa 7B68     		ldr	r3, [r7, #4]
 1130 04ac 5A62     		str	r2, [r3, #36]
 171:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[2][2] = fix16_cos(angle);
 1131              		.loc 2 171 0
 1132 04ae 3B68     		ldr	r3, [r7]
 1133 04b0 1800     		movs	r0, r3
 1134 04b2 FFF7FEFF 		bl	fix16_cos
 1135 04b6 0200     		movs	r2, r0
 1136 04b8 7B68     		ldr	r3, [r7, #4]
 1137 04ba DA62     		str	r2, [r3, #44]
 172:/Users/legge/Development/moppen-game/shared/game.c **** }
 1138              		.loc 2 172 0
 1139 04bc C046     		nop
 1140 04be BD46     		mov	sp, r7
 1141 04c0 02B0     		add	sp, sp, #8
 1142              		@ sp needed
 1143 04c2 80BD     		pop	{r7, pc}
 1144              		.cfi_endproc
 1145              	.LFE23:
 1147              		.align	1
 1148              		.global	create_rotation_z
 1149              		.syntax unified
 1150              		.code	16
 1151              		.thumb_func
 1152              		.fpu softvfp
 1154              	create_rotation_z:
 1155              	.LFB24:
 173:/Users/legge/Development/moppen-game/shared/game.c **** 
 174:/Users/legge/Development/moppen-game/shared/game.c **** void create_rotation_z(mf16 *M, fix16_t angle) {
 1156              		.loc 2 174 0
 1157              		.cfi_startproc
 1158              		@ args = 0, pretend = 0, frame = 8
 1159              		@ frame_needed = 1, uses_anonymous_args = 0
 1160 04c4 80B5     		push	{r7, lr}
 1161              		.cfi_def_cfa_offset 8
 1162              		.cfi_offset 7, -8
 1163              		.cfi_offset 14, -4
 1164 04c6 82B0     		sub	sp, sp, #8
 1165              		.cfi_def_cfa_offset 16
 1166 04c8 00AF     		add	r7, sp, #0
 1167              		.cfi_def_cfa_register 7
 1168 04ca 7860     		str	r0, [r7, #4]
 1169 04cc 3960     		str	r1, [r7]
 175:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill(M, 0);
 1170              		.loc 2 175 0
 1171 04ce 7B68     		ldr	r3, [r7, #4]
 1172 04d0 0021     		movs	r1, #0
 1173 04d2 1800     		movs	r0, r3
 1174 04d4 FFF7FEFF 		bl	mf16_fill
 176:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_fill_diagonal(M, fix16_one);
 1175              		.loc 2 176 0
 1176 04d8 8023     		movs	r3, #128
 1177 04da 5A02     		lsls	r2, r3, #9
 1178 04dc 7B68     		ldr	r3, [r7, #4]
 1179 04de 1100     		movs	r1, r2
 1180 04e0 1800     		movs	r0, r3
 1181 04e2 FFF7FEFF 		bl	mf16_fill_diagonal
 177:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][0] = fix16_cos(angle);
 1182              		.loc 2 177 0
 1183 04e6 3B68     		ldr	r3, [r7]
 1184 04e8 1800     		movs	r0, r3
 1185 04ea FFF7FEFF 		bl	fix16_cos
 1186 04ee 0200     		movs	r2, r0
 1187 04f0 7B68     		ldr	r3, [r7, #4]
 1188 04f2 5A60     		str	r2, [r3, #4]
 178:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[0][1] = -fix16_sin(angle);
 1189              		.loc 2 178 0
 1190 04f4 3B68     		ldr	r3, [r7]
 1191 04f6 1800     		movs	r0, r3
 1192 04f8 FFF7FEFF 		bl	fix16_sin
 1193 04fc 0300     		movs	r3, r0
 1194 04fe 5A42     		rsbs	r2, r3, #0
 1195 0500 7B68     		ldr	r3, [r7, #4]
 1196 0502 9A60     		str	r2, [r3, #8]
 179:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][0] = fix16_sin(angle);
 1197              		.loc 2 179 0
 1198 0504 3B68     		ldr	r3, [r7]
 1199 0506 1800     		movs	r0, r3
 1200 0508 FFF7FEFF 		bl	fix16_sin
 1201 050c 0200     		movs	r2, r0
 1202 050e 7B68     		ldr	r3, [r7, #4]
 1203 0510 5A61     		str	r2, [r3, #20]
 180:/Users/legge/Development/moppen-game/shared/game.c ****     M->data[1][1] = fix16_cos(angle);
 1204              		.loc 2 180 0
 1205 0512 3B68     		ldr	r3, [r7]
 1206 0514 1800     		movs	r0, r3
 1207 0516 FFF7FEFF 		bl	fix16_cos
 1208 051a 0200     		movs	r2, r0
 1209 051c 7B68     		ldr	r3, [r7, #4]
 1210 051e 9A61     		str	r2, [r3, #24]
 181:/Users/legge/Development/moppen-game/shared/game.c **** }
 1211              		.loc 2 181 0
 1212 0520 C046     		nop
 1213 0522 BD46     		mov	sp, r7
 1214 0524 02B0     		add	sp, sp, #8
 1215              		@ sp needed
 1216 0526 80BD     		pop	{r7, pc}
 1217              		.cfi_endproc
 1218              	.LFE24:
 1220              		.align	1
 1221              		.global	create_look_at
 1222              		.syntax unified
 1223              		.code	16
 1224              		.thumb_func
 1225              		.fpu softvfp
 1227              	create_look_at:
 1228              	.LFB25:
 182:/Users/legge/Development/moppen-game/shared/game.c **** 
 183:/Users/legge/Development/moppen-game/shared/game.c **** 
 184:/Users/legge/Development/moppen-game/shared/game.c **** void create_look_at(const v4d *camera_position, const v4d *target, const v4d *up, mf16 *dest) {
 1229              		.loc 2 184 0
 1230              		.cfi_startproc
 1231              		@ args = 0, pretend = 0, frame = 64
 1232              		@ frame_needed = 1, uses_anonymous_args = 0
 1233 0528 F0B5     		push	{r4, r5, r6, r7, lr}
 1234              		.cfi_def_cfa_offset 20
 1235              		.cfi_offset 4, -20
 1236              		.cfi_offset 5, -16
 1237              		.cfi_offset 6, -12
 1238              		.cfi_offset 7, -8
 1239              		.cfi_offset 14, -4
 1240 052a 91B0     		sub	sp, sp, #68
 1241              		.cfi_def_cfa_offset 88
 1242 052c 00AF     		add	r7, sp, #0
 1243              		.cfi_def_cfa_register 7
 1244 052e F860     		str	r0, [r7, #12]
 1245 0530 B960     		str	r1, [r7, #8]
 1246 0532 7A60     		str	r2, [r7, #4]
 1247 0534 3B60     		str	r3, [r7]
 185:/Users/legge/Development/moppen-game/shared/game.c ****     v4d zAxis;
 186:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_sub(&zAxis, camera_position, target);
 1248              		.loc 2 186 0
 1249 0536 BA68     		ldr	r2, [r7, #8]
 1250 0538 F968     		ldr	r1, [r7, #12]
 1251 053a 3024     		movs	r4, #48
 1252 053c 3B19     		adds	r3, r7, r4
 1253 053e 1800     		movs	r0, r3
 1254 0540 FFF7FEFF 		bl	v4d_sub
 187:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_normalize(&zAxis, &zAxis);
 1255              		.loc 2 187 0
 1256 0544 3A19     		adds	r2, r7, r4
 1257 0546 3B19     		adds	r3, r7, r4
 1258 0548 1100     		movs	r1, r2
 1259 054a 1800     		movs	r0, r3
 1260 054c FFF7FEFF 		bl	v4d_normalize
 188:/Users/legge/Development/moppen-game/shared/game.c **** 
 189:/Users/legge/Development/moppen-game/shared/game.c ****     v4d xAxis;
 190:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_cross(&xAxis, up, &zAxis);
 1261              		.loc 2 190 0
 1262 0550 3A19     		adds	r2, r7, r4
 1263 0552 7968     		ldr	r1, [r7, #4]
 1264 0554 2025     		movs	r5, #32
 1265 0556 7B19     		adds	r3, r7, r5
 1266 0558 1800     		movs	r0, r3
 1267 055a FFF7FEFF 		bl	v4d_cross
 191:/Users/legge/Development/moppen-game/shared/game.c **** 
 192:/Users/legge/Development/moppen-game/shared/game.c ****     v4d yAxis;
 193:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_cross(&yAxis, &zAxis, &xAxis);
 1268              		.loc 2 193 0
 1269 055e 7A19     		adds	r2, r7, r5
 1270 0560 3919     		adds	r1, r7, r4
 1271 0562 1026     		movs	r6, #16
 1272 0564 BB19     		adds	r3, r7, r6
 1273 0566 1800     		movs	r0, r3
 1274 0568 FFF7FEFF 		bl	v4d_cross
 194:/Users/legge/Development/moppen-game/shared/game.c **** 
 195:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][0] = xAxis.x;
 1275              		.loc 2 195 0
 1276 056c 7B19     		adds	r3, r7, r5
 1277 056e 1A68     		ldr	r2, [r3]
 1278 0570 3B68     		ldr	r3, [r7]
 1279 0572 5A60     		str	r2, [r3, #4]
 196:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][1] = xAxis.y;
 1280              		.loc 2 196 0
 1281 0574 7B19     		adds	r3, r7, r5
 1282 0576 5A68     		ldr	r2, [r3, #4]
 1283 0578 3B68     		ldr	r3, [r7]
 1284 057a 9A60     		str	r2, [r3, #8]
 197:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][2] = xAxis.z;
 1285              		.loc 2 197 0
 1286 057c 7B19     		adds	r3, r7, r5
 1287 057e 9A68     		ldr	r2, [r3, #8]
 1288 0580 3B68     		ldr	r3, [r7]
 1289 0582 DA60     		str	r2, [r3, #12]
 198:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][3] = 0;
 1290              		.loc 2 198 0
 1291 0584 3B68     		ldr	r3, [r7]
 1292 0586 0022     		movs	r2, #0
 1293 0588 1A61     		str	r2, [r3, #16]
 199:/Users/legge/Development/moppen-game/shared/game.c **** 
 200:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][0] = yAxis.x;
 1294              		.loc 2 200 0
 1295 058a BB19     		adds	r3, r7, r6
 1296 058c 1A68     		ldr	r2, [r3]
 1297 058e 3B68     		ldr	r3, [r7]
 1298 0590 5A61     		str	r2, [r3, #20]
 201:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][1] = yAxis.y;
 1299              		.loc 2 201 0
 1300 0592 BB19     		adds	r3, r7, r6
 1301 0594 5A68     		ldr	r2, [r3, #4]
 1302 0596 3B68     		ldr	r3, [r7]
 1303 0598 9A61     		str	r2, [r3, #24]
 202:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][2] = yAxis.z;
 1304              		.loc 2 202 0
 1305 059a BB19     		adds	r3, r7, r6
 1306 059c 9A68     		ldr	r2, [r3, #8]
 1307 059e 3B68     		ldr	r3, [r7]
 1308 05a0 DA61     		str	r2, [r3, #28]
 203:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][3] = 0;
 1309              		.loc 2 203 0
 1310 05a2 3B68     		ldr	r3, [r7]
 1311 05a4 0022     		movs	r2, #0
 1312 05a6 1A62     		str	r2, [r3, #32]
 204:/Users/legge/Development/moppen-game/shared/game.c **** 
 205:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][0] = zAxis.x;
 1313              		.loc 2 205 0
 1314 05a8 3B19     		adds	r3, r7, r4
 1315 05aa 1A68     		ldr	r2, [r3]
 1316 05ac 3B68     		ldr	r3, [r7]
 1317 05ae 5A62     		str	r2, [r3, #36]
 206:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][1] = zAxis.y;
 1318              		.loc 2 206 0
 1319 05b0 3B19     		adds	r3, r7, r4
 1320 05b2 5A68     		ldr	r2, [r3, #4]
 1321 05b4 3B68     		ldr	r3, [r7]
 1322 05b6 9A62     		str	r2, [r3, #40]
 207:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][2] = zAxis.z;
 1323              		.loc 2 207 0
 1324 05b8 3B19     		adds	r3, r7, r4
 1325 05ba 9A68     		ldr	r2, [r3, #8]
 1326 05bc 3B68     		ldr	r3, [r7]
 1327 05be DA62     		str	r2, [r3, #44]
 208:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][3] = 0;
 1328              		.loc 2 208 0
 1329 05c0 3B68     		ldr	r3, [r7]
 1330 05c2 0022     		movs	r2, #0
 1331 05c4 1A63     		str	r2, [r3, #48]
 209:/Users/legge/Development/moppen-game/shared/game.c **** 
 210:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][0] = camera_position->x;
 1332              		.loc 2 210 0
 1333 05c6 FB68     		ldr	r3, [r7, #12]
 1334 05c8 1A68     		ldr	r2, [r3]
 1335 05ca 3B68     		ldr	r3, [r7]
 1336 05cc 5A63     		str	r2, [r3, #52]
 211:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][1] = camera_position->y;
 1337              		.loc 2 211 0
 1338 05ce FB68     		ldr	r3, [r7, #12]
 1339 05d0 5A68     		ldr	r2, [r3, #4]
 1340 05d2 3B68     		ldr	r3, [r7]
 1341 05d4 9A63     		str	r2, [r3, #56]
 212:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][2] = camera_position->z;
 1342              		.loc 2 212 0
 1343 05d6 FB68     		ldr	r3, [r7, #12]
 1344 05d8 9A68     		ldr	r2, [r3, #8]
 1345 05da 3B68     		ldr	r3, [r7]
 1346 05dc DA63     		str	r2, [r3, #60]
 213:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][3] = fix16_one;
 1347              		.loc 2 213 0
 1348 05de 8023     		movs	r3, #128
 1349 05e0 5A02     		lsls	r2, r3, #9
 1350 05e2 3B68     		ldr	r3, [r7]
 1351 05e4 1A64     		str	r2, [r3, #64]
 214:/Users/legge/Development/moppen-game/shared/game.c **** }
 1352              		.loc 2 214 0
 1353 05e6 C046     		nop
 1354 05e8 BD46     		mov	sp, r7
 1355 05ea 11B0     		add	sp, sp, #68
 1356              		@ sp needed
 1357 05ec F0BD     		pop	{r4, r5, r6, r7, pc}
 1358              		.cfi_endproc
 1359              	.LFE25:
 1361              		.comm	fps_x,16,4
 1362              		.comm	fps_y,16,4
 1363              		.comm	fps_z,16,4
 1364              		.align	1
 1365              		.global	create_first_person_matrix
 1366              		.syntax unified
 1367              		.code	16
 1368              		.thumb_func
 1369              		.fpu softvfp
 1371              	create_first_person_matrix:
 1372              	.LFB26:
 215:/Users/legge/Development/moppen-game/shared/game.c **** 
 216:/Users/legge/Development/moppen-game/shared/game.c **** v4d fps_x;
 217:/Users/legge/Development/moppen-game/shared/game.c **** v4d fps_y;
 218:/Users/legge/Development/moppen-game/shared/game.c **** v4d fps_z;
 219:/Users/legge/Development/moppen-game/shared/game.c **** 
 220:/Users/legge/Development/moppen-game/shared/game.c **** void create_first_person_matrix(const v4d *eye, fix16_t pitch, fix16_t yaw, mf16 *dest) {
 1373              		.loc 2 220 0
 1374              		.cfi_startproc
 1375              		@ args = 0, pretend = 0, frame = 32
 1376              		@ frame_needed = 1, uses_anonymous_args = 0
 1377 05ee 80B5     		push	{r7, lr}
 1378              		.cfi_def_cfa_offset 8
 1379              		.cfi_offset 7, -8
 1380              		.cfi_offset 14, -4
 1381 05f0 88B0     		sub	sp, sp, #32
 1382              		.cfi_def_cfa_offset 40
 1383 05f2 00AF     		add	r7, sp, #0
 1384              		.cfi_def_cfa_register 7
 1385 05f4 F860     		str	r0, [r7, #12]
 1386 05f6 B960     		str	r1, [r7, #8]
 1387 05f8 7A60     		str	r2, [r7, #4]
 1388 05fa 3B60     		str	r3, [r7]
 221:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t cos_pitch = fix16_cos(pitch);
 1389              		.loc 2 221 0
 1390 05fc BB68     		ldr	r3, [r7, #8]
 1391 05fe 1800     		movs	r0, r3
 1392 0600 FFF7FEFF 		bl	fix16_cos
 1393 0604 0300     		movs	r3, r0
 1394 0606 FB61     		str	r3, [r7, #28]
 222:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t sin_pitch = fix16_sin(pitch);
 1395              		.loc 2 222 0
 1396 0608 BB68     		ldr	r3, [r7, #8]
 1397 060a 1800     		movs	r0, r3
 1398 060c FFF7FEFF 		bl	fix16_sin
 1399 0610 0300     		movs	r3, r0
 1400 0612 BB61     		str	r3, [r7, #24]
 223:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t cos_yaw = fix16_cos(yaw);
 1401              		.loc 2 223 0
 1402 0614 7B68     		ldr	r3, [r7, #4]
 1403 0616 1800     		movs	r0, r3
 1404 0618 FFF7FEFF 		bl	fix16_cos
 1405 061c 0300     		movs	r3, r0
 1406 061e 7B61     		str	r3, [r7, #20]
 224:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t sin_yaw = fix16_sin(yaw);
 1407              		.loc 2 224 0
 1408 0620 7B68     		ldr	r3, [r7, #4]
 1409 0622 1800     		movs	r0, r3
 1410 0624 FFF7FEFF 		bl	fix16_sin
 1411 0628 0300     		movs	r3, r0
 1412 062a 3B61     		str	r3, [r7, #16]
 225:/Users/legge/Development/moppen-game/shared/game.c **** 
 226:/Users/legge/Development/moppen-game/shared/game.c ****     fps_x.x = cos_yaw;
 1413              		.loc 2 226 0
 1414 062c 434B     		ldr	r3, .L50
 1415 062e 7A69     		ldr	r2, [r7, #20]
 1416 0630 1A60     		str	r2, [r3]
 227:/Users/legge/Development/moppen-game/shared/game.c ****     fps_x.y = 0;
 1417              		.loc 2 227 0
 1418 0632 424B     		ldr	r3, .L50
 1419 0634 0022     		movs	r2, #0
 1420 0636 5A60     		str	r2, [r3, #4]
 228:/Users/legge/Development/moppen-game/shared/game.c ****     fps_x.z = -sin_yaw;
 1421              		.loc 2 228 0
 1422 0638 3B69     		ldr	r3, [r7, #16]
 1423 063a 5A42     		rsbs	r2, r3, #0
 1424 063c 3F4B     		ldr	r3, .L50
 1425 063e 9A60     		str	r2, [r3, #8]
 229:/Users/legge/Development/moppen-game/shared/game.c **** 
 230:/Users/legge/Development/moppen-game/shared/game.c ****     fps_y.x = fix16_mul(sin_yaw, sin_pitch);
 1426              		.loc 2 230 0
 1427 0640 BA69     		ldr	r2, [r7, #24]
 1428 0642 3B69     		ldr	r3, [r7, #16]
 1429 0644 1100     		movs	r1, r2
 1430 0646 1800     		movs	r0, r3
 1431 0648 FFF7FEFF 		bl	fix16_mul
 1432 064c 0200     		movs	r2, r0
 1433 064e 3C4B     		ldr	r3, .L50+4
 1434 0650 1A60     		str	r2, [r3]
 231:/Users/legge/Development/moppen-game/shared/game.c ****     fps_y.y = cos_pitch;
 1435              		.loc 2 231 0
 1436 0652 3B4B     		ldr	r3, .L50+4
 1437 0654 FA69     		ldr	r2, [r7, #28]
 1438 0656 5A60     		str	r2, [r3, #4]
 232:/Users/legge/Development/moppen-game/shared/game.c ****     fps_y.z = fix16_mul(cos_yaw, sin_pitch);
 1439              		.loc 2 232 0
 1440 0658 BA69     		ldr	r2, [r7, #24]
 1441 065a 7B69     		ldr	r3, [r7, #20]
 1442 065c 1100     		movs	r1, r2
 1443 065e 1800     		movs	r0, r3
 1444 0660 FFF7FEFF 		bl	fix16_mul
 1445 0664 0200     		movs	r2, r0
 1446 0666 364B     		ldr	r3, .L50+4
 1447 0668 9A60     		str	r2, [r3, #8]
 233:/Users/legge/Development/moppen-game/shared/game.c **** 
 234:/Users/legge/Development/moppen-game/shared/game.c ****     fps_z.x = fix16_mul(sin_yaw, cos_pitch);
 1448              		.loc 2 234 0
 1449 066a FA69     		ldr	r2, [r7, #28]
 1450 066c 3B69     		ldr	r3, [r7, #16]
 1451 066e 1100     		movs	r1, r2
 1452 0670 1800     		movs	r0, r3
 1453 0672 FFF7FEFF 		bl	fix16_mul
 1454 0676 0200     		movs	r2, r0
 1455 0678 324B     		ldr	r3, .L50+8
 1456 067a 1A60     		str	r2, [r3]
 235:/Users/legge/Development/moppen-game/shared/game.c ****     fps_z.y = -sin_pitch;
 1457              		.loc 2 235 0
 1458 067c BB69     		ldr	r3, [r7, #24]
 1459 067e 5A42     		rsbs	r2, r3, #0
 1460 0680 304B     		ldr	r3, .L50+8
 1461 0682 5A60     		str	r2, [r3, #4]
 236:/Users/legge/Development/moppen-game/shared/game.c ****     fps_z.z = fix16_mul(cos_yaw, cos_pitch);
 1462              		.loc 2 236 0
 1463 0684 FA69     		ldr	r2, [r7, #28]
 1464 0686 7B69     		ldr	r3, [r7, #20]
 1465 0688 1100     		movs	r1, r2
 1466 068a 1800     		movs	r0, r3
 1467 068c FFF7FEFF 		bl	fix16_mul
 1468 0690 0200     		movs	r2, r0
 1469 0692 2C4B     		ldr	r3, .L50+8
 1470 0694 9A60     		str	r2, [r3, #8]
 237:/Users/legge/Development/moppen-game/shared/game.c **** 
 238:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][0] = fps_x.x;
 1471              		.loc 2 238 0
 1472 0696 294B     		ldr	r3, .L50
 1473 0698 1A68     		ldr	r2, [r3]
 1474 069a 3B68     		ldr	r3, [r7]
 1475 069c 5A60     		str	r2, [r3, #4]
 239:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][1] = fps_y.x;
 1476              		.loc 2 239 0
 1477 069e 284B     		ldr	r3, .L50+4
 1478 06a0 1A68     		ldr	r2, [r3]
 1479 06a2 3B68     		ldr	r3, [r7]
 1480 06a4 9A60     		str	r2, [r3, #8]
 240:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][2] = fps_z.x;
 1481              		.loc 2 240 0
 1482 06a6 274B     		ldr	r3, .L50+8
 1483 06a8 1A68     		ldr	r2, [r3]
 1484 06aa 3B68     		ldr	r3, [r7]
 1485 06ac DA60     		str	r2, [r3, #12]
 241:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[0][3] = 0;
 1486              		.loc 2 241 0
 1487 06ae 3B68     		ldr	r3, [r7]
 1488 06b0 0022     		movs	r2, #0
 1489 06b2 1A61     		str	r2, [r3, #16]
 242:/Users/legge/Development/moppen-game/shared/game.c **** 
 243:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][0] = fps_x.y;
 1490              		.loc 2 243 0
 1491 06b4 214B     		ldr	r3, .L50
 1492 06b6 5A68     		ldr	r2, [r3, #4]
 1493 06b8 3B68     		ldr	r3, [r7]
 1494 06ba 5A61     		str	r2, [r3, #20]
 244:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][1] = fps_y.y;
 1495              		.loc 2 244 0
 1496 06bc 204B     		ldr	r3, .L50+4
 1497 06be 5A68     		ldr	r2, [r3, #4]
 1498 06c0 3B68     		ldr	r3, [r7]
 1499 06c2 9A61     		str	r2, [r3, #24]
 245:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][2] = fps_z.y;
 1500              		.loc 2 245 0
 1501 06c4 1F4B     		ldr	r3, .L50+8
 1502 06c6 5A68     		ldr	r2, [r3, #4]
 1503 06c8 3B68     		ldr	r3, [r7]
 1504 06ca DA61     		str	r2, [r3, #28]
 246:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[1][3] = 0;
 1505              		.loc 2 246 0
 1506 06cc 3B68     		ldr	r3, [r7]
 1507 06ce 0022     		movs	r2, #0
 1508 06d0 1A62     		str	r2, [r3, #32]
 247:/Users/legge/Development/moppen-game/shared/game.c **** 
 248:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][0] = fps_x.z;
 1509              		.loc 2 248 0
 1510 06d2 1A4B     		ldr	r3, .L50
 1511 06d4 9A68     		ldr	r2, [r3, #8]
 1512 06d6 3B68     		ldr	r3, [r7]
 1513 06d8 5A62     		str	r2, [r3, #36]
 249:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][1] = fps_y.z;
 1514              		.loc 2 249 0
 1515 06da 194B     		ldr	r3, .L50+4
 1516 06dc 9A68     		ldr	r2, [r3, #8]
 1517 06de 3B68     		ldr	r3, [r7]
 1518 06e0 9A62     		str	r2, [r3, #40]
 250:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][2] = fps_z.z;
 1519              		.loc 2 250 0
 1520 06e2 184B     		ldr	r3, .L50+8
 1521 06e4 9A68     		ldr	r2, [r3, #8]
 1522 06e6 3B68     		ldr	r3, [r7]
 1523 06e8 DA62     		str	r2, [r3, #44]
 251:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[2][3] = 0;
 1524              		.loc 2 251 0
 1525 06ea 3B68     		ldr	r3, [r7]
 1526 06ec 0022     		movs	r2, #0
 1527 06ee 1A63     		str	r2, [r3, #48]
 252:/Users/legge/Development/moppen-game/shared/game.c **** 
 253:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][0] = -v4d_dot(&fps_x, eye);
 1528              		.loc 2 253 0
 1529 06f0 FA68     		ldr	r2, [r7, #12]
 1530 06f2 124B     		ldr	r3, .L50
 1531 06f4 1100     		movs	r1, r2
 1532 06f6 1800     		movs	r0, r3
 1533 06f8 FFF7FEFF 		bl	v4d_dot
 1534 06fc 0300     		movs	r3, r0
 1535 06fe 5A42     		rsbs	r2, r3, #0
 1536 0700 3B68     		ldr	r3, [r7]
 1537 0702 5A63     		str	r2, [r3, #52]
 254:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][1] = -v4d_dot(&fps_y, eye);
 1538              		.loc 2 254 0
 1539 0704 FA68     		ldr	r2, [r7, #12]
 1540 0706 0E4B     		ldr	r3, .L50+4
 1541 0708 1100     		movs	r1, r2
 1542 070a 1800     		movs	r0, r3
 1543 070c FFF7FEFF 		bl	v4d_dot
 1544 0710 0300     		movs	r3, r0
 1545 0712 5A42     		rsbs	r2, r3, #0
 1546 0714 3B68     		ldr	r3, [r7]
 1547 0716 9A63     		str	r2, [r3, #56]
 255:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][2] = -v4d_dot(&fps_z, eye);
 1548              		.loc 2 255 0
 1549 0718 FA68     		ldr	r2, [r7, #12]
 1550 071a 0A4B     		ldr	r3, .L50+8
 1551 071c 1100     		movs	r1, r2
 1552 071e 1800     		movs	r0, r3
 1553 0720 FFF7FEFF 		bl	v4d_dot
 1554 0724 0300     		movs	r3, r0
 1555 0726 5A42     		rsbs	r2, r3, #0
 1556 0728 3B68     		ldr	r3, [r7]
 1557 072a DA63     		str	r2, [r3, #60]
 256:/Users/legge/Development/moppen-game/shared/game.c ****     dest->data[3][3] = fix16_one;
 1558              		.loc 2 256 0
 1559 072c 8023     		movs	r3, #128
 1560 072e 5A02     		lsls	r2, r3, #9
 1561 0730 3B68     		ldr	r3, [r7]
 1562 0732 1A64     		str	r2, [r3, #64]
 257:/Users/legge/Development/moppen-game/shared/game.c **** }
 1563              		.loc 2 257 0
 1564 0734 C046     		nop
 1565 0736 BD46     		mov	sp, r7
 1566 0738 08B0     		add	sp, sp, #32
 1567              		@ sp needed
 1568 073a 80BD     		pop	{r7, pc}
 1569              	.L51:
 1570              		.align	2
 1571              	.L50:
 1572 073c 00000000 		.word	fps_x
 1573 0740 00000000 		.word	fps_y
 1574 0744 00000000 		.word	fps_z
 1575              		.cfi_endproc
 1576              	.LFE26:
 1578              		.global	view_matrix
 1579              		.data
 1580              		.align	2
 1583              	view_matrix:
 1584 0060 04       		.byte	4
 1585 0061 04       		.byte	4
 1586 0062 0000     		.space	2
 1587 0064 00000000 		.word	0
 1588 0068 00000000 		.word	0
 1589 006c 00000000 		.word	0
 1590 0070 00000000 		.word	0
 1591 0074 00000000 		.word	0
 1592 0078 00000000 		.word	0
 1593 007c 00000000 		.word	0
 1594 0080 00000000 		.word	0
 1595 0084 00000000 		.word	0
 1596 0088 00000000 		.word	0
 1597 008c 00000000 		.word	0
 1598 0090 00000000 		.word	0
 1599 0094 00000000 		.word	0
 1600 0098 00000000 		.word	0
 1601 009c 00000000 		.word	0
 1602 00a0 00000000 		.word	0
 1603              		.global	transform_matrix
 1604              		.align	2
 1607              	transform_matrix:
 1608 00a4 04       		.byte	4
 1609 00a5 04       		.byte	4
 1610 00a6 0000     		.space	2
 1611 00a8 00000000 		.word	0
 1612 00ac 00000000 		.word	0
 1613 00b0 00000000 		.word	0
 1614 00b4 00000000 		.word	0
 1615 00b8 00000000 		.word	0
 1616 00bc 00000000 		.word	0
 1617 00c0 00000000 		.word	0
 1618 00c4 00000000 		.word	0
 1619 00c8 00000000 		.word	0
 1620 00cc 00000000 		.word	0
 1621 00d0 00000000 		.word	0
 1622 00d4 00000000 		.word	0
 1623 00d8 00000000 		.word	0
 1624 00dc 00000000 		.word	0
 1625 00e0 00000000 		.word	0
 1626 00e4 00000000 		.word	0
 1627              		.global	tmp_matrix
 1628              		.align	2
 1631              	tmp_matrix:
 1632 00e8 04       		.byte	4
 1633 00e9 04       		.byte	4
 1634 00ea 0000     		.space	2
 1635 00ec 00000000 		.word	0
 1636 00f0 00000000 		.word	0
 1637 00f4 00000000 		.word	0
 1638 00f8 00000000 		.word	0
 1639 00fc 00000000 		.word	0
 1640 0100 00000000 		.word	0
 1641 0104 00000000 		.word	0
 1642 0108 00000000 		.word	0
 1643 010c 00000000 		.word	0
 1644 0110 00000000 		.word	0
 1645 0114 00000000 		.word	0
 1646 0118 00000000 		.word	0
 1647 011c 00000000 		.word	0
 1648 0120 00000000 		.word	0
 1649 0124 00000000 		.word	0
 1650 0128 00000000 		.word	0
 1651              		.global	tmp_matrix1
 1652              		.align	2
 1655              	tmp_matrix1:
 1656 012c 04       		.byte	4
 1657 012d 04       		.byte	4
 1658 012e 0000     		.space	2
 1659 0130 00000000 		.word	0
 1660 0134 00000000 		.word	0
 1661 0138 00000000 		.word	0
 1662 013c 00000000 		.word	0
 1663 0140 00000000 		.word	0
 1664 0144 00000000 		.word	0
 1665 0148 00000000 		.word	0
 1666 014c 00000000 		.word	0
 1667 0150 00000000 		.word	0
 1668 0154 00000000 		.word	0
 1669 0158 00000000 		.word	0
 1670 015c 00000000 		.word	0
 1671 0160 00000000 		.word	0
 1672 0164 00000000 		.word	0
 1673 0168 00000000 		.word	0
 1674 016c 00000000 		.word	0
 1675              		.global	tmp_matrix2
 1676              		.align	2
 1679              	tmp_matrix2:
 1680 0170 04       		.byte	4
 1681 0171 04       		.byte	4
 1682 0172 0000     		.space	2
 1683 0174 00000000 		.word	0
 1684 0178 00000000 		.word	0
 1685 017c 00000000 		.word	0
 1686 0180 00000000 		.word	0
 1687 0184 00000000 		.word	0
 1688 0188 00000000 		.word	0
 1689 018c 00000000 		.word	0
 1690 0190 00000000 		.word	0
 1691 0194 00000000 		.word	0
 1692 0198 00000000 		.word	0
 1693 019c 00000000 		.word	0
 1694 01a0 00000000 		.word	0
 1695 01a4 00000000 		.word	0
 1696 01a8 00000000 		.word	0
 1697 01ac 00000000 		.word	0
 1698 01b0 00000000 		.word	0
 1699              		.global	tmp_matrix3
 1700              		.align	2
 1703              	tmp_matrix3:
 1704 01b4 04       		.byte	4
 1705 01b5 04       		.byte	4
 1706 01b6 0000     		.space	2
 1707 01b8 00000000 		.word	0
 1708 01bc 00000000 		.word	0
 1709 01c0 00000000 		.word	0
 1710 01c4 00000000 		.word	0
 1711 01c8 00000000 		.word	0
 1712 01cc 00000000 		.word	0
 1713 01d0 00000000 		.word	0
 1714 01d4 00000000 		.word	0
 1715 01d8 00000000 		.word	0
 1716 01dc 00000000 		.word	0
 1717 01e0 00000000 		.word	0
 1718 01e4 00000000 		.word	0
 1719 01e8 00000000 		.word	0
 1720 01ec 00000000 		.word	0
 1721 01f0 00000000 		.word	0
 1722 01f4 00000000 		.word	0
 1723              		.comm	v4d_tmp1,16,4
 1724              		.comm	v4d_tmp2,16,4
 1725              		.comm	v4d_tmp3,16,4
 1726              		.text
 1727              		.align	1
 1728              		.global	look_at_camera
 1729              		.syntax unified
 1730              		.code	16
 1731              		.thumb_func
 1732              		.fpu softvfp
 1734              	look_at_camera:
 1735              	.LFB27:
 258:/Users/legge/Development/moppen-game/shared/game.c **** 
 259:/Users/legge/Development/moppen-game/shared/game.c **** mf16 view_matrix = mat4_new();
 260:/Users/legge/Development/moppen-game/shared/game.c **** mf16 transform_matrix = mat4_new();
 261:/Users/legge/Development/moppen-game/shared/game.c **** 
 262:/Users/legge/Development/moppen-game/shared/game.c **** mf16 tmp_matrix = mat4_new();
 263:/Users/legge/Development/moppen-game/shared/game.c **** mf16 tmp_matrix1 = mat4_new();
 264:/Users/legge/Development/moppen-game/shared/game.c **** mf16 tmp_matrix2 = mat4_new();
 265:/Users/legge/Development/moppen-game/shared/game.c **** mf16 tmp_matrix3 = mat4_new();
 266:/Users/legge/Development/moppen-game/shared/game.c **** 
 267:/Users/legge/Development/moppen-game/shared/game.c **** v4d v4d_tmp1;
 268:/Users/legge/Development/moppen-game/shared/game.c **** v4d v4d_tmp2;
 269:/Users/legge/Development/moppen-game/shared/game.c **** v4d v4d_tmp3;
 270:/Users/legge/Development/moppen-game/shared/game.c **** 
 271:/Users/legge/Development/moppen-game/shared/game.c **** void look_at_camera(mf16 *dest) {
 1736              		.loc 2 271 0
 1737              		.cfi_startproc
 1738              		@ args = 0, pretend = 0, frame = 8
 1739              		@ frame_needed = 1, uses_anonymous_args = 0
 1740 0748 B0B5     		push	{r4, r5, r7, lr}
 1741              		.cfi_def_cfa_offset 16
 1742              		.cfi_offset 4, -16
 1743              		.cfi_offset 5, -12
 1744              		.cfi_offset 7, -8
 1745              		.cfi_offset 14, -4
 1746 074a 82B0     		sub	sp, sp, #8
 1747              		.cfi_def_cfa_offset 24
 1748 074c 00AF     		add	r7, sp, #0
 1749              		.cfi_def_cfa_register 7
 1750 074e 7860     		str	r0, [r7, #4]
 272:/Users/legge/Development/moppen-game/shared/game.c ****     create_translation(&tmp_matrix,
 1751              		.loc 2 272 0
 1752 0750 504B     		ldr	r3, .L53
 1753 0752 1B68     		ldr	r3, [r3]
 1754 0754 1800     		movs	r0, r3
 1755 0756 FFF753FC 		bl	fix16_from_int
 1756 075a 0400     		movs	r4, r0
 1757 075c 4E4B     		ldr	r3, .L53+4
 1758 075e 1B68     		ldr	r3, [r3]
 1759 0760 1800     		movs	r0, r3
 1760 0762 FFF74DFC 		bl	fix16_from_int
 1761 0766 0500     		movs	r5, r0
 1762 0768 4C4B     		ldr	r3, .L53+8
 1763 076a 1B68     		ldr	r3, [r3]
 1764 076c 1800     		movs	r0, r3
 1765 076e FFF747FC 		bl	fix16_from_int
 1766 0772 0300     		movs	r3, r0
 1767 0774 4A48     		ldr	r0, .L53+12
 1768 0776 2A00     		movs	r2, r5
 1769 0778 2100     		movs	r1, r4
 1770 077a FFF7FEFF 		bl	create_translation
 273:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(camera_x),
 274:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(camera_y),
 275:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(camera_z));
 276:/Users/legge/Development/moppen-game/shared/game.c ****     create_rotation_y(&tmp_matrix1,
 1771              		.loc 2 276 0
 1772 077e 494B     		ldr	r3, .L53+16
 1773 0780 1B68     		ldr	r3, [r3]
 1774 0782 1800     		movs	r0, r3
 1775 0784 FFF73CFC 		bl	fix16_from_int
 1776 0788 0200     		movs	r2, r0
 1777 078a A023     		movs	r3, #160
 1778 078c 1B03     		lsls	r3, r3, #12
 1779 078e 1900     		movs	r1, r3
 1780 0790 1000     		movs	r0, r2
 1781 0792 FFF7FEFF 		bl	fix16_div
 1782 0796 0200     		movs	r2, r0
 1783 0798 434B     		ldr	r3, .L53+20
 1784 079a 1100     		movs	r1, r2
 1785 079c 1800     		movs	r0, r3
 1786 079e FFF7FEFF 		bl	create_rotation_y
 277:/Users/legge/Development/moppen-game/shared/game.c ****                       fix16_div(fix16_from_int(camera_rot), F16C(10, 0)));
 278:/Users/legge/Development/moppen-game/shared/game.c ****     create_rotation_x(&tmp_matrix2,
 1787              		.loc 2 278 0
 1788 07a2 424B     		ldr	r3, .L53+24
 1789 07a4 1B68     		ldr	r3, [r3]
 1790 07a6 1800     		movs	r0, r3
 1791 07a8 FFF72AFC 		bl	fix16_from_int
 1792 07ac 0200     		movs	r2, r0
 1793 07ae A023     		movs	r3, #160
 1794 07b0 1B03     		lsls	r3, r3, #12
 1795 07b2 1900     		movs	r1, r3
 1796 07b4 1000     		movs	r0, r2
 1797 07b6 FFF7FEFF 		bl	fix16_div
 1798 07ba 0200     		movs	r2, r0
 1799 07bc 3C4B     		ldr	r3, .L53+28
 1800 07be 1100     		movs	r1, r2
 1801 07c0 1800     		movs	r0, r3
 1802 07c2 FFF7FEFF 		bl	create_rotation_x
 279:/Users/legge/Development/moppen-game/shared/game.c ****                       fix16_div(fix16_from_int(camera_rot_2), F16C(10, 0)));
 280:/Users/legge/Development/moppen-game/shared/game.c **** 
 281:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_mul(&tmp_matrix3, &tmp_matrix1, &tmp_matrix);
 1803              		.loc 2 281 0
 1804 07c6 364A     		ldr	r2, .L53+12
 1805 07c8 3749     		ldr	r1, .L53+20
 1806 07ca 3A4B     		ldr	r3, .L53+32
 1807 07cc 1800     		movs	r0, r3
 1808 07ce FFF7FEFF 		bl	mf16_mul
 282:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_mul(&tmp_matrix1, &tmp_matrix2, &tmp_matrix3);
 1809              		.loc 2 282 0
 1810 07d2 384A     		ldr	r2, .L53+32
 1811 07d4 3649     		ldr	r1, .L53+28
 1812 07d6 344B     		ldr	r3, .L53+20
 1813 07d8 1800     		movs	r0, r3
 1814 07da FFF7FEFF 		bl	mf16_mul
 283:/Users/legge/Development/moppen-game/shared/game.c **** 
 284:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.x = tmp_matrix1.data[0][3];
 1815              		.loc 2 284 0
 1816 07de 324B     		ldr	r3, .L53+20
 1817 07e0 1A69     		ldr	r2, [r3, #16]
 1818 07e2 354B     		ldr	r3, .L53+36
 1819 07e4 1A60     		str	r2, [r3]
 285:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.y = tmp_matrix1.data[1][3];
 1820              		.loc 2 285 0
 1821 07e6 304B     		ldr	r3, .L53+20
 1822 07e8 1A6A     		ldr	r2, [r3, #32]
 1823 07ea 334B     		ldr	r3, .L53+36
 1824 07ec 5A60     		str	r2, [r3, #4]
 286:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.z = tmp_matrix1.data[2][3];
 1825              		.loc 2 286 0
 1826 07ee 2E4B     		ldr	r3, .L53+20
 1827 07f0 1A6B     		ldr	r2, [r3, #48]
 1828 07f2 314B     		ldr	r3, .L53+36
 1829 07f4 9A60     		str	r2, [r3, #8]
 287:/Users/legge/Development/moppen-game/shared/game.c **** 
 288:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp2.x = fix16_from_int(25);
 1830              		.loc 2 288 0
 1831 07f6 1920     		movs	r0, #25
 1832 07f8 FFF702FC 		bl	fix16_from_int
 1833 07fc 0200     		movs	r2, r0
 1834 07fe 2F4B     		ldr	r3, .L53+40
 1835 0800 1A60     		str	r2, [r3]
 289:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp2.y = fix16_from_int(25);
 1836              		.loc 2 289 0
 1837 0802 1920     		movs	r0, #25
 1838 0804 FFF7FCFB 		bl	fix16_from_int
 1839 0808 0200     		movs	r2, r0
 1840 080a 2C4B     		ldr	r3, .L53+40
 1841 080c 5A60     		str	r2, [r3, #4]
 290:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp2.z = fix16_from_int(25);
 1842              		.loc 2 290 0
 1843 080e 1920     		movs	r0, #25
 1844 0810 FFF7F6FB 		bl	fix16_from_int
 1845 0814 0200     		movs	r2, r0
 1846 0816 294B     		ldr	r3, .L53+40
 1847 0818 9A60     		str	r2, [r3, #8]
 291:/Users/legge/Development/moppen-game/shared/game.c **** 
 292:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp3.x = 0;
 1848              		.loc 2 292 0
 1849 081a 294B     		ldr	r3, .L53+44
 1850 081c 0022     		movs	r2, #0
 1851 081e 1A60     		str	r2, [r3]
 293:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp3.y = fix16_one;
 1852              		.loc 2 293 0
 1853 0820 8023     		movs	r3, #128
 1854 0822 5A02     		lsls	r2, r3, #9
 1855 0824 264B     		ldr	r3, .L53+44
 1856 0826 5A60     		str	r2, [r3, #4]
 294:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp3.z = 0;
 1857              		.loc 2 294 0
 1858 0828 254B     		ldr	r3, .L53+44
 1859 082a 0022     		movs	r2, #0
 1860 082c 9A60     		str	r2, [r3, #8]
 295:/Users/legge/Development/moppen-game/shared/game.c **** 
 296:/Users/legge/Development/moppen-game/shared/game.c ****     create_look_at(&v4d_tmp1, &v4d_tmp2, &v4d_tmp3, &tmp_matrix);
 1861              		.loc 2 296 0
 1862 082e 1C4B     		ldr	r3, .L53+12
 1863 0830 234A     		ldr	r2, .L53+44
 1864 0832 2249     		ldr	r1, .L53+40
 1865 0834 2048     		ldr	r0, .L53+36
 1866 0836 FFF7FEFF 		bl	create_look_at
 297:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_transpose(&tmp_matrix, &tmp_matrix);
 1867              		.loc 2 297 0
 1868 083a 194A     		ldr	r2, .L53+12
 1869 083c 184B     		ldr	r3, .L53+12
 1870 083e 1100     		movs	r1, r2
 1871 0840 1800     		movs	r0, r3
 1872 0842 FFF7FEFF 		bl	mf16_transpose
 298:/Users/legge/Development/moppen-game/shared/game.c **** 
 299:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_cholesky(&tmp_matrix1, &tmp_matrix);
 1873              		.loc 2 299 0
 1874 0846 164A     		ldr	r2, .L53+12
 1875 0848 174B     		ldr	r3, .L53+20
 1876 084a 1100     		movs	r1, r2
 1877 084c 1800     		movs	r0, r3
 1878 084e FFF7FEFF 		bl	mf16_cholesky
 300:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_invert_lt(&view_matrix, &tmp_matrix1);
 1879              		.loc 2 300 0
 1880 0852 154A     		ldr	r2, .L53+20
 1881 0854 1B4B     		ldr	r3, .L53+48
 1882 0856 1100     		movs	r1, r2
 1883 0858 1800     		movs	r0, r3
 1884 085a FFF7FEFF 		bl	mf16_invert_lt
 301:/Users/legge/Development/moppen-game/shared/game.c **** 
 302:/Users/legge/Development/moppen-game/shared/game.c ****     create_translation(&tmp_matrix1,
 1885              		.loc 2 302 0
 1886 085e 4020     		movs	r0, #64
 1887 0860 FFF7CEFB 		bl	fix16_from_int
 1888 0864 0400     		movs	r4, r0
 1889 0866 2020     		movs	r0, #32
 1890 0868 FFF7CAFB 		bl	fix16_from_int
 1891 086c 0500     		movs	r5, r0
 1892 086e 0020     		movs	r0, #0
 1893 0870 FFF7C6FB 		bl	fix16_from_int
 1894 0874 0300     		movs	r3, r0
 1895 0876 0C48     		ldr	r0, .L53+20
 1896 0878 2A00     		movs	r2, r5
 1897 087a 2100     		movs	r1, r4
 1898 087c FFF7FEFF 		bl	create_translation
 303:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(64),
 304:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(32),
 305:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(0));
 306:/Users/legge/Development/moppen-game/shared/game.c **** 
 307:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_mul(dest, &tmp_matrix1, &tmp_matrix);
 1899              		.loc 2 307 0
 1900 0880 074A     		ldr	r2, .L53+12
 1901 0882 0949     		ldr	r1, .L53+20
 1902 0884 7B68     		ldr	r3, [r7, #4]
 1903 0886 1800     		movs	r0, r3
 1904 0888 FFF7FEFF 		bl	mf16_mul
 308:/Users/legge/Development/moppen-game/shared/game.c **** }
 1905              		.loc 2 308 0
 1906 088c C046     		nop
 1907 088e BD46     		mov	sp, r7
 1908 0890 02B0     		add	sp, sp, #8
 1909              		@ sp needed
 1910 0892 B0BD     		pop	{r4, r5, r7, pc}
 1911              	.L54:
 1912              		.align	2
 1913              	.L53:
 1914 0894 00000000 		.word	camera_x
 1915 0898 00000000 		.word	camera_y
 1916 089c 00000000 		.word	camera_z
 1917 08a0 00000000 		.word	tmp_matrix
 1918 08a4 00000000 		.word	camera_rot
 1919 08a8 00000000 		.word	tmp_matrix1
 1920 08ac 00000000 		.word	camera_rot_2
 1921 08b0 00000000 		.word	tmp_matrix2
 1922 08b4 00000000 		.word	tmp_matrix3
 1923 08b8 00000000 		.word	v4d_tmp1
 1924 08bc 00000000 		.word	v4d_tmp2
 1925 08c0 00000000 		.word	v4d_tmp3
 1926 08c4 00000000 		.word	view_matrix
 1927              		.cfi_endproc
 1928              	.LFE27:
 1930              		.align	1
 1931              		.global	fps_camera
 1932              		.syntax unified
 1933              		.code	16
 1934              		.thumb_func
 1935              		.fpu softvfp
 1937              	fps_camera:
 1938              	.LFB28:
 309:/Users/legge/Development/moppen-game/shared/game.c **** 
 310:/Users/legge/Development/moppen-game/shared/game.c **** void fps_camera(mf16 *dest) {
 1939              		.loc 2 310 0
 1940              		.cfi_startproc
 1941              		@ args = 0, pretend = 0, frame = 24
 1942              		@ frame_needed = 1, uses_anonymous_args = 0
 1943 08c8 90B5     		push	{r4, r7, lr}
 1944              		.cfi_def_cfa_offset 12
 1945              		.cfi_offset 4, -12
 1946              		.cfi_offset 7, -8
 1947              		.cfi_offset 14, -4
 1948 08ca 87B0     		sub	sp, sp, #28
 1949              		.cfi_def_cfa_offset 40
 1950 08cc 00AF     		add	r7, sp, #0
 1951              		.cfi_def_cfa_register 7
 1952 08ce 7860     		str	r0, [r7, #4]
 311:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t PI_2 = fix16_mul(fix16_pi, F16C(2,0));
 1953              		.loc 2 311 0
 1954 08d0 424A     		ldr	r2, .L56
 1955 08d2 8023     		movs	r3, #128
 1956 08d4 9B02     		lsls	r3, r3, #10
 1957 08d6 1900     		movs	r1, r3
 1958 08d8 1000     		movs	r0, r2
 1959 08da FFF7FEFF 		bl	fix16_mul
 1960 08de 0300     		movs	r3, r0
 1961 08e0 7B61     		str	r3, [r7, #20]
 312:/Users/legge/Development/moppen-game/shared/game.c **** 
 313:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.x = fix16_div(fix16_from_int(-camera_x), fix16_from_int(1000));
 1962              		.loc 2 313 0
 1963 08e2 3F4B     		ldr	r3, .L56+4
 1964 08e4 1B68     		ldr	r3, [r3]
 1965 08e6 5B42     		rsbs	r3, r3, #0
 1966 08e8 1800     		movs	r0, r3
 1967 08ea FFF789FB 		bl	fix16_from_int
 1968 08ee 0400     		movs	r4, r0
 1969 08f0 FA23     		movs	r3, #250
 1970 08f2 9B00     		lsls	r3, r3, #2
 1971 08f4 1800     		movs	r0, r3
 1972 08f6 FFF783FB 		bl	fix16_from_int
 1973 08fa 0300     		movs	r3, r0
 1974 08fc 1900     		movs	r1, r3
 1975 08fe 2000     		movs	r0, r4
 1976 0900 FFF7FEFF 		bl	fix16_div
 1977 0904 0200     		movs	r2, r0
 1978 0906 374B     		ldr	r3, .L56+8
 1979 0908 1A60     		str	r2, [r3]
 314:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.y = fix16_div(fix16_from_int(-camera_y), fix16_from_int(1000));
 1980              		.loc 2 314 0
 1981 090a 374B     		ldr	r3, .L56+12
 1982 090c 1B68     		ldr	r3, [r3]
 1983 090e 5B42     		rsbs	r3, r3, #0
 1984 0910 1800     		movs	r0, r3
 1985 0912 FFF775FB 		bl	fix16_from_int
 1986 0916 0400     		movs	r4, r0
 1987 0918 FA23     		movs	r3, #250
 1988 091a 9B00     		lsls	r3, r3, #2
 1989 091c 1800     		movs	r0, r3
 1990 091e FFF76FFB 		bl	fix16_from_int
 1991 0922 0300     		movs	r3, r0
 1992 0924 1900     		movs	r1, r3
 1993 0926 2000     		movs	r0, r4
 1994 0928 FFF7FEFF 		bl	fix16_div
 1995 092c 0200     		movs	r2, r0
 1996 092e 2D4B     		ldr	r3, .L56+8
 1997 0930 5A60     		str	r2, [r3, #4]
 315:/Users/legge/Development/moppen-game/shared/game.c ****     v4d_tmp1.z = fix16_div(fix16_from_int(-camera_z), fix16_from_int(100));
 1998              		.loc 2 315 0
 1999 0932 2E4B     		ldr	r3, .L56+16
 2000 0934 1B68     		ldr	r3, [r3]
 2001 0936 5B42     		rsbs	r3, r3, #0
 2002 0938 1800     		movs	r0, r3
 2003 093a FFF761FB 		bl	fix16_from_int
 2004 093e 0400     		movs	r4, r0
 2005 0940 6420     		movs	r0, #100
 2006 0942 FFF75DFB 		bl	fix16_from_int
 2007 0946 0300     		movs	r3, r0
 2008 0948 1900     		movs	r1, r3
 2009 094a 2000     		movs	r0, r4
 2010 094c FFF7FEFF 		bl	fix16_div
 2011 0950 0200     		movs	r2, r0
 2012 0952 244B     		ldr	r3, .L56+8
 2013 0954 9A60     		str	r2, [r3, #8]
 316:/Users/legge/Development/moppen-game/shared/game.c **** 
 317:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t pitch = fix16_div(fix16_from_int(camera_rot_2), F16C(100, 0));
 2014              		.loc 2 317 0
 2015 0956 264B     		ldr	r3, .L56+20
 2016 0958 1B68     		ldr	r3, [r3]
 2017 095a 1800     		movs	r0, r3
 2018 095c FFF750FB 		bl	fix16_from_int
 2019 0960 0200     		movs	r2, r0
 2020 0962 C823     		movs	r3, #200
 2021 0964 DB03     		lsls	r3, r3, #15
 2022 0966 1900     		movs	r1, r3
 2023 0968 1000     		movs	r0, r2
 2024 096a FFF7FEFF 		bl	fix16_div
 2025 096e 0300     		movs	r3, r0
 2026 0970 3B61     		str	r3, [r7, #16]
 318:/Users/legge/Development/moppen-game/shared/game.c ****     fix16_t yaw = fix16_div(fix16_from_int(camera_rot), F16C(100, 0));
 2027              		.loc 2 318 0
 2028 0972 204B     		ldr	r3, .L56+24
 2029 0974 1B68     		ldr	r3, [r3]
 2030 0976 1800     		movs	r0, r3
 2031 0978 FFF742FB 		bl	fix16_from_int
 2032 097c 0200     		movs	r2, r0
 2033 097e C823     		movs	r3, #200
 2034 0980 DB03     		lsls	r3, r3, #15
 2035 0982 1900     		movs	r1, r3
 2036 0984 1000     		movs	r0, r2
 2037 0986 FFF7FEFF 		bl	fix16_div
 2038 098a 0300     		movs	r3, r0
 2039 098c FB60     		str	r3, [r7, #12]
 319:/Users/legge/Development/moppen-game/shared/game.c **** 
 320:/Users/legge/Development/moppen-game/shared/game.c ****     pitch = fix16_mod(pitch, PI_2);
 2040              		.loc 2 320 0
 2041 098e 7A69     		ldr	r2, [r7, #20]
 2042 0990 3B69     		ldr	r3, [r7, #16]
 2043 0992 1100     		movs	r1, r2
 2044 0994 1800     		movs	r0, r3
 2045 0996 FFF7FEFF 		bl	fix16_mod
 2046 099a 0300     		movs	r3, r0
 2047 099c 3B61     		str	r3, [r7, #16]
 321:/Users/legge/Development/moppen-game/shared/game.c ****     yaw = fix16_mod(yaw, PI_2);
 2048              		.loc 2 321 0
 2049 099e 7A69     		ldr	r2, [r7, #20]
 2050 09a0 FB68     		ldr	r3, [r7, #12]
 2051 09a2 1100     		movs	r1, r2
 2052 09a4 1800     		movs	r0, r3
 2053 09a6 FFF7FEFF 		bl	fix16_mod
 2054 09aa 0300     		movs	r3, r0
 2055 09ac FB60     		str	r3, [r7, #12]
 322:/Users/legge/Development/moppen-game/shared/game.c **** 
 323:/Users/legge/Development/moppen-game/shared/game.c ****     create_first_person_matrix(&v4d_tmp1, pitch, yaw, &tmp_matrix);
 2056              		.loc 2 323 0
 2057 09ae 124B     		ldr	r3, .L56+28
 2058 09b0 FA68     		ldr	r2, [r7, #12]
 2059 09b2 3969     		ldr	r1, [r7, #16]
 2060 09b4 0B48     		ldr	r0, .L56+8
 2061 09b6 FFF7FEFF 		bl	create_first_person_matrix
 324:/Users/legge/Development/moppen-game/shared/game.c **** 
 325:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_cholesky(&tmp_matrix1, &tmp_matrix);
 2062              		.loc 2 325 0
 2063 09ba 0F4A     		ldr	r2, .L56+28
 2064 09bc 0F4B     		ldr	r3, .L56+32
 2065 09be 1100     		movs	r1, r2
 2066 09c0 1800     		movs	r0, r3
 2067 09c2 FFF7FEFF 		bl	mf16_cholesky
 326:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_invert_lt(dest, &tmp_matrix1);
 2068              		.loc 2 326 0
 2069 09c6 0D4A     		ldr	r2, .L56+32
 2070 09c8 7B68     		ldr	r3, [r7, #4]
 2071 09ca 1100     		movs	r1, r2
 2072 09cc 1800     		movs	r0, r3
 2073 09ce FFF7FEFF 		bl	mf16_invert_lt
 327:/Users/legge/Development/moppen-game/shared/game.c **** }
 2074              		.loc 2 327 0
 2075 09d2 C046     		nop
 2076 09d4 BD46     		mov	sp, r7
 2077 09d6 07B0     		add	sp, sp, #28
 2078              		@ sp needed
 2079 09d8 90BD     		pop	{r4, r7, pc}
 2080              	.L57:
 2081 09da C046     		.align	2
 2082              	.L56:
 2083 09dc 3F240300 		.word	205887
 2084 09e0 00000000 		.word	camera_x
 2085 09e4 00000000 		.word	v4d_tmp1
 2086 09e8 00000000 		.word	camera_y
 2087 09ec 00000000 		.word	camera_z
 2088 09f0 00000000 		.word	camera_rot_2
 2089 09f4 00000000 		.word	camera_rot
 2090 09f8 00000000 		.word	tmp_matrix
 2091 09fc 00000000 		.word	tmp_matrix1
 2092              		.cfi_endproc
 2093              	.LFE28:
 2095              		.section	.rodata
 2096              		.align	2
 2097              	.LC0:
 2098 0034 06FFFFFF 		.word	-250
 2099 0038 06FFFFFF 		.word	-250
 2100 003c 32000000 		.word	50
 2101              		.align	2
 2102              	.LC1:
 2103 0040 FA000000 		.word	250
 2104 0044 06FFFFFF 		.word	-250
 2105 0048 32000000 		.word	50
 2106              		.align	2
 2107              	.LC2:
 2108 004c 06FFFFFF 		.word	-250
 2109 0050 FA000000 		.word	250
 2110 0054 32000000 		.word	50
 2111              		.align	2
 2112              	.LC3:
 2113 0058 FA000000 		.word	250
 2114 005c FA000000 		.word	250
 2115 0060 32000000 		.word	50
 2116              		.text
 2117              		.align	1
 2118              		.global	draw_scene
 2119              		.syntax unified
 2120              		.code	16
 2121              		.thumb_func
 2122              		.fpu softvfp
 2124              	draw_scene:
 2125              	.LFB29:
 328:/Users/legge/Development/moppen-game/shared/game.c **** 
 329:/Users/legge/Development/moppen-game/shared/game.c **** void draw_scene() {
 2126              		.loc 2 329 0
 2127              		.cfi_startproc
 2128              		@ args = 0, pretend = 0, frame = 48
 2129              		@ frame_needed = 1, uses_anonymous_args = 0
 2130 0a00 B0B5     		push	{r4, r5, r7, lr}
 2131              		.cfi_def_cfa_offset 16
 2132              		.cfi_offset 4, -16
 2133              		.cfi_offset 5, -12
 2134              		.cfi_offset 7, -8
 2135              		.cfi_offset 14, -4
 2136 0a02 90B0     		sub	sp, sp, #64
 2137              		.cfi_def_cfa_offset 80
 2138 0a04 04AF     		add	r7, sp, #16
 2139              		.cfi_def_cfa 7, 64
 330:/Users/legge/Development/moppen-game/shared/game.c ****     fps_camera(&view_matrix);
 2140              		.loc 2 330 0
 2141 0a06 364B     		ldr	r3, .L59
 2142 0a08 1800     		movs	r0, r3
 2143 0a0a FFF7FEFF 		bl	fps_camera
 331:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_mul(&tmp_matrix, &view_matrix, &projection_matrix);
 2144              		.loc 2 331 0
 2145 0a0e 354A     		ldr	r2, .L59+4
 2146 0a10 3349     		ldr	r1, .L59
 2147 0a12 354B     		ldr	r3, .L59+8
 2148 0a14 1800     		movs	r0, r3
 2149 0a16 FFF7FEFF 		bl	mf16_mul
 332:/Users/legge/Development/moppen-game/shared/game.c **** 
 333:/Users/legge/Development/moppen-game/shared/game.c ****     create_translation(&tmp_matrix1,
 2150              		.loc 2 333 0
 2151 0a1a 4020     		movs	r0, #64
 2152 0a1c FFF7F0FA 		bl	fix16_from_int
 2153 0a20 0400     		movs	r4, r0
 2154 0a22 2020     		movs	r0, #32
 2155 0a24 FFF7ECFA 		bl	fix16_from_int
 2156 0a28 0500     		movs	r5, r0
 2157 0a2a 0020     		movs	r0, #0
 2158 0a2c FFF7E8FA 		bl	fix16_from_int
 2159 0a30 0300     		movs	r3, r0
 2160 0a32 2E48     		ldr	r0, .L59+12
 2161 0a34 2A00     		movs	r2, r5
 2162 0a36 2100     		movs	r1, r4
 2163 0a38 FFF7FEFF 		bl	create_translation
 334:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(64),
 335:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(32),
 336:/Users/legge/Development/moppen-game/shared/game.c ****                        fix16_from_int(0));
 337:/Users/legge/Development/moppen-game/shared/game.c **** 
 338:/Users/legge/Development/moppen-game/shared/game.c ****     mf16_mul(&transform_matrix, &tmp_matrix1, &tmp_matrix);
 2164              		.loc 2 338 0
 2165 0a3c 2A4A     		ldr	r2, .L59+8
 2166 0a3e 2B49     		ldr	r1, .L59+12
 2167 0a40 2B4B     		ldr	r3, .L59+16
 2168 0a42 1800     		movs	r0, r3
 2169 0a44 FFF7FEFF 		bl	mf16_mul
 339:/Users/legge/Development/moppen-game/shared/game.c **** 
 340:/Users/legge/Development/moppen-game/shared/game.c ****     vector_draw_box((Point) {-250, -250, 50}, 100, 100, 25, &transform_matrix);
 2170              		.loc 2 340 0
 2171 0a48 3B00     		movs	r3, r7
 2172 0a4a 2A4A     		ldr	r2, .L59+20
 2173 0a4c 13CA     		ldmia	r2!, {r0, r1, r4}
 2174 0a4e 13C3     		stmia	r3!, {r0, r1, r4}
 2175 0a50 3A00     		movs	r2, r7
 2176 0a52 274B     		ldr	r3, .L59+16
 2177 0a54 0293     		str	r3, [sp, #8]
 2178 0a56 1923     		movs	r3, #25
 2179 0a58 0193     		str	r3, [sp, #4]
 2180 0a5a 6423     		movs	r3, #100
 2181 0a5c 0093     		str	r3, [sp]
 2182 0a5e 6423     		movs	r3, #100
 2183 0a60 1068     		ldr	r0, [r2]
 2184 0a62 5168     		ldr	r1, [r2, #4]
 2185 0a64 9268     		ldr	r2, [r2, #8]
 2186 0a66 FFF7FEFF 		bl	vector_draw_box
 341:/Users/legge/Development/moppen-game/shared/game.c ****     vector_draw_box((Point) {250, -250, 50}, 100, 100, 25, &transform_matrix);
 2187              		.loc 2 341 0
 2188 0a6a 0C21     		movs	r1, #12
 2189 0a6c 7B18     		adds	r3, r7, r1
 2190 0a6e 224A     		ldr	r2, .L59+24
 2191 0a70 31CA     		ldmia	r2!, {r0, r4, r5}
 2192 0a72 31C3     		stmia	r3!, {r0, r4, r5}
 2193 0a74 7A18     		adds	r2, r7, r1
 2194 0a76 1E4B     		ldr	r3, .L59+16
 2195 0a78 0293     		str	r3, [sp, #8]
 2196 0a7a 1923     		movs	r3, #25
 2197 0a7c 0193     		str	r3, [sp, #4]
 2198 0a7e 6423     		movs	r3, #100
 2199 0a80 0093     		str	r3, [sp]
 2200 0a82 6423     		movs	r3, #100
 2201 0a84 1068     		ldr	r0, [r2]
 2202 0a86 5168     		ldr	r1, [r2, #4]
 2203 0a88 9268     		ldr	r2, [r2, #8]
 2204 0a8a FFF7FEFF 		bl	vector_draw_box
 342:/Users/legge/Development/moppen-game/shared/game.c ****     vector_draw_box((Point) {-250, 250, 50}, 100, 100, 25, &transform_matrix);
 2205              		.loc 2 342 0
 2206 0a8e 1821     		movs	r1, #24
 2207 0a90 7B18     		adds	r3, r7, r1
 2208 0a92 1A4A     		ldr	r2, .L59+28
 2209 0a94 31CA     		ldmia	r2!, {r0, r4, r5}
 2210 0a96 31C3     		stmia	r3!, {r0, r4, r5}
 2211 0a98 7A18     		adds	r2, r7, r1
 2212 0a9a 154B     		ldr	r3, .L59+16
 2213 0a9c 0293     		str	r3, [sp, #8]
 2214 0a9e 1923     		movs	r3, #25
 2215 0aa0 0193     		str	r3, [sp, #4]
 2216 0aa2 6423     		movs	r3, #100
 2217 0aa4 0093     		str	r3, [sp]
 2218 0aa6 6423     		movs	r3, #100
 2219 0aa8 1068     		ldr	r0, [r2]
 2220 0aaa 5168     		ldr	r1, [r2, #4]
 2221 0aac 9268     		ldr	r2, [r2, #8]
 2222 0aae FFF7FEFF 		bl	vector_draw_box
 343:/Users/legge/Development/moppen-game/shared/game.c ****     vector_draw_box((Point) {250, 250, 50}, 100, 100, 25, &transform_matrix);
 2223              		.loc 2 343 0
 2224 0ab2 2421     		movs	r1, #36
 2225 0ab4 7B18     		adds	r3, r7, r1
 2226 0ab6 124A     		ldr	r2, .L59+32
 2227 0ab8 31CA     		ldmia	r2!, {r0, r4, r5}
 2228 0aba 31C3     		stmia	r3!, {r0, r4, r5}
 2229 0abc 7A18     		adds	r2, r7, r1
 2230 0abe 0C4B     		ldr	r3, .L59+16
 2231 0ac0 0293     		str	r3, [sp, #8]
 2232 0ac2 1923     		movs	r3, #25
 2233 0ac4 0193     		str	r3, [sp, #4]
 2234 0ac6 6423     		movs	r3, #100
 2235 0ac8 0093     		str	r3, [sp]
 2236 0aca 6423     		movs	r3, #100
 2237 0acc 1068     		ldr	r0, [r2]
 2238 0ace 5168     		ldr	r1, [r2, #4]
 2239 0ad0 9268     		ldr	r2, [r2, #8]
 2240 0ad2 FFF7FEFF 		bl	vector_draw_box
 344:/Users/legge/Development/moppen-game/shared/game.c **** }
 2241              		.loc 2 344 0
 2242 0ad6 C046     		nop
 2243 0ad8 BD46     		mov	sp, r7
 2244 0ada 0CB0     		add	sp, sp, #48
 2245              		@ sp needed
 2246 0adc B0BD     		pop	{r4, r5, r7, pc}
 2247              	.L60:
 2248 0ade C046     		.align	2
 2249              	.L59:
 2250 0ae0 00000000 		.word	view_matrix
 2251 0ae4 00000000 		.word	projection_matrix
 2252 0ae8 00000000 		.word	tmp_matrix
 2253 0aec 00000000 		.word	tmp_matrix1
 2254 0af0 00000000 		.word	transform_matrix
 2255 0af4 34000000 		.word	.LC0
 2256 0af8 40000000 		.word	.LC1
 2257 0afc 4C000000 		.word	.LC2
 2258 0b00 58000000 		.word	.LC3
 2259              		.cfi_endproc
 2260              	.LFE29:
 2262              		.align	1
 2263              		.global	game_loop
 2264              		.syntax unified
 2265              		.code	16
 2266              		.thumb_func
 2267              		.fpu softvfp
 2269              	game_loop:
 2270              	.LFB30:
 345:/Users/legge/Development/moppen-game/shared/game.c **** 
 346:/Users/legge/Development/moppen-game/shared/game.c **** void game_loop() {
 2271              		.loc 2 346 0
 2272              		.cfi_startproc
 2273              		@ args = 0, pretend = 0, frame = 0
 2274              		@ frame_needed = 1, uses_anonymous_args = 0
 2275 0b04 80B5     		push	{r7, lr}
 2276              		.cfi_def_cfa_offset 8
 2277              		.cfi_offset 7, -8
 2278              		.cfi_offset 14, -4
 2279 0b06 00AF     		add	r7, sp, #0
 2280              		.cfi_def_cfa_register 7
 347:/Users/legge/Development/moppen-game/shared/game.c ****     handle_input();
 2281              		.loc 2 347 0
 2282 0b08 FFF7FEFF 		bl	handle_input
 348:/Users/legge/Development/moppen-game/shared/game.c **** 
 349:/Users/legge/Development/moppen-game/shared/game.c ****     canvas_clear();
 2283              		.loc 2 349 0
 2284 0b0c FFF7FEFF 		bl	canvas_clear
 350:/Users/legge/Development/moppen-game/shared/game.c ****     draw_scene();
 2285              		.loc 2 350 0
 2286 0b10 FFF7FEFF 		bl	draw_scene
 351:/Users/legge/Development/moppen-game/shared/game.c **** 
 352:/Users/legge/Development/moppen-game/shared/game.c ****     canvas_flush();
 2287              		.loc 2 352 0
 2288 0b14 FFF7FEFF 		bl	canvas_flush
 353:/Users/legge/Development/moppen-game/shared/game.c **** }...
 2289              		.loc 2 353 0
 2290 0b18 C046     		nop
 2291 0b1a BD46     		mov	sp, r7
 2292              		@ sp needed
 2293 0b1c 80BD     		pop	{r7, pc}
 2294              		.cfi_endproc
 2295              	.LFE30:
 2297              	.Letext0:
 2298              		.file 3 "/Users/legge/Development/moppen-game/shared/util.h"
 2299              		.file 4 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 2300              		.file 5 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 2301              		.file 6 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixmatrix.h"
 2302              		.file 7 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixvector4d.h"
 2303              		.file 8 "/Users/legge/Development/moppen-game/shared/vector_drawing.h"
 2304              		.file 9 "/Users/legge/Development/moppen-game/shared/images/ball.xbm"
 2305              		.file 10 "/Users/legge/Development/moppen-game/shared/images/smily.xbm"

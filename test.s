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
  11              		.file	"fixquat.c"
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
  83              		.syntax unified
  84              		.code	16
  85              		.thumb_func
  86              		.fpu softvfp
  88              	fix16_sq:
  89              	.LFB14:
  90              		.file 1 "/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h"
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
  25:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  26:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** typedef int32_t fix16_t;
  27:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  28:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t FOUR_DIV_PI  = 0x145F3;            /*!< Fix16 value of 4/PI */
  29:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t _FOUR_DIV_PI2 = 0xFFFF9840;        /*!< Fix16 value of -4/PI² */
  30:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t X4_CORRECTION_COMPONENT = 0x399A; 	/*!< Fix16 value of 0.225 */
  31:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t PI_DIV_4 = 0x0000C90F;             /*!< Fix16 value of PI/4 */
  32:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t THREE_PI_DIV_4 = 0x00025B2F;       /*!< Fix16 value of 3PI/4 */
  33:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  34:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_maximum  = 0x7FFFFFFF; /*!< the maximum value of fix16_t */
  35:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_minimum  = 0x80000000; /*!< the minimum value of fix16_t */
  36:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_overflow = 0x80000000; /*!< the value used to indicate overflows when FI
  37:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  38:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_pi  = 205887;     /*!< fix16_t value of pi */
  39:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_e   = 178145;     /*!< fix16_t value of e */
  40:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_one = 0x00010000; /*!< fix16_t value of 1 */
  41:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  42:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* Conversion functions between fix16_t and float/integer.
  43:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  * These are inlined to allow compiler to optimize away constant numbers
  44:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****  */
  45:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_from_int(int a)     { return a * fix16_one; }
  46:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline float   fix16_to_float(fix16_t a) { return (float)a / fix16_one; }
  47:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline double  fix16_to_dbl(fix16_t a)   { return (double)a / fix16_one; }
  48:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  49:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline int fix16_to_int(fix16_t a)
  50:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
  51:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifdef FIXMATH_NO_ROUNDING
  52:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****     return (a >> 16);
  53:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #else
  54:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	if (a >= 0)
  55:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 		return (a + (fix16_one >> 1)) / fix16_one;
  56:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	return (a - (fix16_one >> 1)) / fix16_one;
  57:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  58:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** }
  59:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  60:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_from_float(float a)
  61:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
  62:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	float temp = a * fix16_one;
  63:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_NO_ROUNDING
  64:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	temp += (temp >= 0) ? 0.5f : -0.5f;
  65:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  66:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	return (fix16_t)temp;
  67:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** }
  68:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  69:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_from_dbl(double a)
  70:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** {
  71:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	double temp = a * fix16_one;
  72:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_NO_ROUNDING
  73:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	temp += (temp >= 0) ? 0.5f : -0.5f;
  74:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
  75:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	return (fix16_t)temp;
  76:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** }
  77:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  78:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* Macro for defining fix16_t constant values.
  79:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    The functions above can't be used from e.g. global variable initializers,
  80:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    and their names are quite long also. This macro is useful for constants
  81:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    springled alongside code, e.g. F16(1.234).
  82:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  83:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    Note that the argument is evaluated multiple times, and also otherwise
  84:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    you should only use this for constant values. For runtime-conversions,
  85:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h ****    use the functions above.
  86:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
  87:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #define F16(x) ((fix16_t)(((x) >= 0) ? ((x) * 65536.0 + 0.5) : ((x) * 65536.0 - 0.5)))
  88:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
  89:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_abs(fix16_t x)
  90:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return (x < 0 ? -x : x); }
  91:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_floor(fix16_t x)
  92:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return (x & 0xFFFF0000UL); }
  93:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_ceil(fix16_t x)
  94:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return (x & 0xFFFF0000UL) + (x & 0x0000FFFFUL ? fix16_one : 0); }
  95:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_min(fix16_t x, fix16_t y)
  96:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return (x < y ? x : y); }
  97:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_max(fix16_t x, fix16_t y)
  98:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return (x > y ? x : y); }
  99:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_clamp(fix16_t x, fix16_t lo, fix16_t hi)
 100:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return fix16_min(fix16_max(x, lo), hi); }
 101:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 102:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* Subtraction and addition with (optional) overflow detection. */
 103:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifdef FIXMATH_NO_OVERFLOW
 104:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 105:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_add(fix16_t inArg0, fix16_t inArg1) { return (inArg0 + inArg1); }
 106:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_sub(fix16_t inArg0, fix16_t inArg1) { return (inArg0 - inArg1); }
 107:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 108:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #else
 109:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 110:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_add(fix16_t a, fix16_t b) FIXMATH_FUNC_ATTRS;
 111:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sub(fix16_t a, fix16_t b) FIXMATH_FUNC_ATTRS;
 112:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 113:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /* Saturating arithmetic */
 114:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sadd(fix16_t a, fix16_t b) FIXMATH_FUNC_ATTRS;
 115:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_ssub(fix16_t a, fix16_t b) FIXMATH_FUNC_ATTRS;
 116:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 117:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
 118:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 119:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Multiplies the two given fix16_t's and returns the result.
 120:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 121:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_mul(fix16_t inArg0, fix16_t inArg1) FIXMATH_FUNC_ATTRS;
 122:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 123:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Divides the first given fix16_t by the second and returns the result.
 124:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 125:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_div(fix16_t inArg0, fix16_t inArg1) FIXMATH_FUNC_ATTRS;
 126:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 127:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_NO_OVERFLOW
 128:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Performs a saturated multiplication (overflow-protected) of the two given fix16_t's and returns
 129:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 130:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_smul(fix16_t inArg0, fix16_t inArg1) FIXMATH_FUNC_ATTRS;
 131:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 132:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Performs a saturated division (overflow-protected) of the first fix16_t by the second and retur
 133:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 134:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sdiv(fix16_t inArg0, fix16_t inArg1) FIXMATH_FUNC_ATTRS;
 135:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
 136:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 137:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Divides the first given fix16_t by the second and returns the result.
 138:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 139:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_mod(fix16_t x, fix16_t y) FIXMATH_FUNC_ATTRS;
 140:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 141:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 142:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 143:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the linear interpolation: (inArg0 * (1 - inFract)) + (inArg1 * inFract)
 144:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 145:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_lerp8(fix16_t inArg0, fix16_t inArg1, uint8_t inFract) FIXMATH_FUNC_ATTRS;
 146:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_lerp16(fix16_t inArg0, fix16_t inArg1, uint16_t inFract) FIXMATH_FUNC_ATTRS;
 147:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #ifndef FIXMATH_NO_64BIT
 148:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_lerp32(fix16_t inArg0, fix16_t inArg1, uint32_t inFract) FIXMATH_FUNC_ATTRS;
 149:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** #endif
 150:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 151:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 152:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 153:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the sine of the given fix16_t.
 154:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 155:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sin_parabola(fix16_t inAngle) FIXMATH_FUNC_ATTRS;
 156:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 157:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the sine of the given fix16_t.
 158:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 159:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sin(fix16_t inAngle) FIXMATH_FUNC_ATTRS;
 160:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 161:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the cosine of the given fix16_t.
 162:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 163:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_cos(fix16_t inAngle) FIXMATH_FUNC_ATTRS;
 164:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 165:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the tangent of the given fix16_t.
 166:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 167:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_tan(fix16_t inAngle) FIXMATH_FUNC_ATTRS;
 168:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 169:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the arcsine of the given fix16_t.
 170:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 171:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_asin(fix16_t inValue) FIXMATH_FUNC_ATTRS;
 172:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 173:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the arccosine of the given fix16_t.
 174:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 175:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_acos(fix16_t inValue) FIXMATH_FUNC_ATTRS;
 176:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 177:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the arctangent of the given fix16_t.
 178:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 179:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_atan(fix16_t inValue) FIXMATH_FUNC_ATTRS;
 180:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 181:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the arctangent of inY/inX.
 182:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 183:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_atan2(fix16_t inY, fix16_t inX) FIXMATH_FUNC_ATTRS;
 184:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 185:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_rad_to_deg_mult = 3754936;
 186:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_rad_to_deg(fix16_t radians)
 187:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return fix16_mul(radians, fix16_rad_to_deg_mult); }
 188:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 189:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static const fix16_t fix16_deg_to_rad_mult = 1144;
 190:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_deg_to_rad(fix16_t degrees)
 191:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return fix16_mul(degrees, fix16_deg_to_rad_mult); }
 192:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 193:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 194:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 195:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the square root of the given fix16_t.
 196:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 197:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** extern fix16_t fix16_sqrt(fix16_t inValue) FIXMATH_FUNC_ATTRS;
 198:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 
 199:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** /*! Returns the square of the given fix16_t.
 200:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** */
 201:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** static inline fix16_t fix16_sq(fix16_t x)
 202:/Users/legge/Development/moppen-game/shared/libfixmatrix/../libfixmath/fix16.h **** 	{ return fix16_mul(x, x); }
  91              		.loc 1 202 0
  92              		.cfi_startproc
  93              		@ args = 0, pretend = 0, frame = 8
  94              		@ frame_needed = 1, uses_anonymous_args = 0
  95 0000 80B5     		push	{r7, lr}
  96              		.cfi_def_cfa_offset 8
  97              		.cfi_offset 7, -8
  98              		.cfi_offset 14, -4
  99 0002 82B0     		sub	sp, sp, #8
 100              		.cfi_def_cfa_offset 16
 101 0004 00AF     		add	r7, sp, #0
 102              		.cfi_def_cfa_register 7
 103 0006 7860     		str	r0, [r7, #4]
 104              		.loc 1 202 0
 105 0008 7A68     		ldr	r2, [r7, #4]
 106 000a 7B68     		ldr	r3, [r7, #4]
 107 000c 1100     		movs	r1, r2
 108 000e 1800     		movs	r0, r3
 109 0010 FFF7FEFF 		bl	fix16_mul
 110 0014 0300     		movs	r3, r0
 111 0016 1800     		movs	r0, r3
 112 0018 BD46     		mov	sp, r7
 113 001a 02B0     		add	sp, sp, #8
 114              		@ sp needed
 115 001c 80BD     		pop	{r7, pc}
 116              		.cfi_endproc
 117              	.LFE14:
 119              		.align	1
 120              		.syntax unified
 121              		.code	16
 122              		.thumb_func
 123              		.fpu softvfp
 125              	qf16_from_v3d:
 126              	.LFB15:
 127              		.file 2 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h"
   1:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** /* Basic quaternion implementation based on libfixmath fix16_t datatype. */
   2:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
   3:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** #ifndef _FIXQUAT_H_
   4:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** #define _FIXQUAT_H_
   5:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
   6:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** #include "../libfixmath/fix16.h"
   7:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** #include "fixmatrix.h"
   8:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** #include "fixvector3d.h"
   9:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  10:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** typedef struct {
  11:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     fix16_t a; // Real part
  12:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     fix16_t b; // i
  13:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     fix16_t c; // j
  14:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     fix16_t d; // k
  15:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** } qf16;
  16:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  17:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Conjugate of quaternion
  18:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_conj(qf16 *dest, const qf16 *q);
  19:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  20:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Multiply two quaternions, dest = q * r.
  21:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_mul(qf16 *dest, const qf16 *q, const qf16 *r);
  22:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  23:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Add two quaternions, dest = q + r
  24:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_add(qf16 *dest, const qf16 *q, const qf16 *r);
  25:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  26:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Multiply quaternion by scalar
  27:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_mul_s(qf16 *dest, const qf16 *q, fix16_t s);
  28:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  29:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Divide quaternion by scalar
  30:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_div_s(qf16 *dest, const qf16 *q, fix16_t s);
  31:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  32:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Dot product of two quaternions
  33:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** fix16_t qf16_dot(const qf16 *q, const qf16 *r);
  34:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  35:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Quaternion norm
  36:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** fix16_t qf16_norm(const qf16 *q);
  37:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  38:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Normalize quaternion
  39:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_normalize(qf16 *dest, const qf16 *q);
  40:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  41:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Quaternion power (exponentation)
  42:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_pow(qf16 *dest, const qf16 *q, fix16_t power);
  43:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  44:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Weighted average of two quaternions
  45:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Think of it as q = w * q1 + (1 - w) * q2, but the internal algorithm considers attitudes.
  46:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_avg(qf16 *dest, const qf16 *q1, const qf16 *q2, fix16_t weight);
  47:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  48:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Unit quaternion from axis and angle.
  49:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Axis should have unit length and angle in radians.
  50:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_from_axis_angle(qf16 *dest, const v3d *axis, fix16_t angle);
  51:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  52:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Unit quaternion to rotation matrix
  53:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_to_matrix(mf16 *dest, const qf16 *q);
  54:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  55:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** // Rotate vector using quaternion
  56:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** void qf16_rotate(v3d *dest, const qf16 *q, const v3d *v);
  57:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  58:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** static inline void qf16_from_v3d(qf16 *q, const v3d *v, fix16_t a)
  59:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** {
 128              		.loc 2 59 0
 129              		.cfi_startproc
 130              		@ args = 0, pretend = 0, frame = 16
 131              		@ frame_needed = 1, uses_anonymous_args = 0
 132 001e 80B5     		push	{r7, lr}
 133              		.cfi_def_cfa_offset 8
 134              		.cfi_offset 7, -8
 135              		.cfi_offset 14, -4
 136 0020 84B0     		sub	sp, sp, #16
 137              		.cfi_def_cfa_offset 24
 138 0022 00AF     		add	r7, sp, #0
 139              		.cfi_def_cfa_register 7
 140 0024 F860     		str	r0, [r7, #12]
 141 0026 B960     		str	r1, [r7, #8]
 142 0028 7A60     		str	r2, [r7, #4]
  60:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     q->a = a;
 143              		.loc 2 60 0
 144 002a FB68     		ldr	r3, [r7, #12]
 145 002c 7A68     		ldr	r2, [r7, #4]
 146 002e 1A60     		str	r2, [r3]
  61:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     q->b = v->x;
 147              		.loc 2 61 0
 148 0030 BB68     		ldr	r3, [r7, #8]
 149 0032 1A68     		ldr	r2, [r3]
 150 0034 FB68     		ldr	r3, [r7, #12]
 151 0036 5A60     		str	r2, [r3, #4]
  62:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     q->c = v->y;
 152              		.loc 2 62 0
 153 0038 BB68     		ldr	r3, [r7, #8]
 154 003a 5A68     		ldr	r2, [r3, #4]
 155 003c FB68     		ldr	r3, [r7, #12]
 156 003e 9A60     		str	r2, [r3, #8]
  63:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     q->d = v->z;
 157              		.loc 2 63 0
 158 0040 BB68     		ldr	r3, [r7, #8]
 159 0042 9A68     		ldr	r2, [r3, #8]
 160 0044 FB68     		ldr	r3, [r7, #12]
 161 0046 DA60     		str	r2, [r3, #12]
  64:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** }
 162              		.loc 2 64 0
 163 0048 C046     		nop
 164 004a BD46     		mov	sp, r7
 165 004c 04B0     		add	sp, sp, #16
 166              		@ sp needed
 167 004e 80BD     		pop	{r7, pc}
 168              		.cfi_endproc
 169              	.LFE15:
 171              		.align	1
 172              		.syntax unified
 173              		.code	16
 174              		.thumb_func
 175              		.fpu softvfp
 177              	qf16_to_v3d:
 178              	.LFB16:
  65:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** 
  66:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** static inline void qf16_to_v3d(v3d *v, const qf16 *q)
  67:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** {
 179              		.loc 2 67 0
 180              		.cfi_startproc
 181              		@ args = 0, pretend = 0, frame = 8
 182              		@ frame_needed = 1, uses_anonymous_args = 0
 183 0050 80B5     		push	{r7, lr}
 184              		.cfi_def_cfa_offset 8
 185              		.cfi_offset 7, -8
 186              		.cfi_offset 14, -4
 187 0052 82B0     		sub	sp, sp, #8
 188              		.cfi_def_cfa_offset 16
 189 0054 00AF     		add	r7, sp, #0
 190              		.cfi_def_cfa_register 7
 191 0056 7860     		str	r0, [r7, #4]
 192 0058 3960     		str	r1, [r7]
  68:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     v->x = q->b;
 193              		.loc 2 68 0
 194 005a 3B68     		ldr	r3, [r7]
 195 005c 5A68     		ldr	r2, [r3, #4]
 196 005e 7B68     		ldr	r3, [r7, #4]
 197 0060 1A60     		str	r2, [r3]
  69:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     v->y = q->c;
 198              		.loc 2 69 0
 199 0062 3B68     		ldr	r3, [r7]
 200 0064 9A68     		ldr	r2, [r3, #8]
 201 0066 7B68     		ldr	r3, [r7, #4]
 202 0068 5A60     		str	r2, [r3, #4]
  70:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h ****     v->z = q->d;
 203              		.loc 2 70 0
 204 006a 3B68     		ldr	r3, [r7]
 205 006c DA68     		ldr	r2, [r3, #12]
 206 006e 7B68     		ldr	r3, [r7, #4]
 207 0070 9A60     		str	r2, [r3, #8]
  71:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.h **** }
 208              		.loc 2 71 0
 209 0072 C046     		nop
 210 0074 BD46     		mov	sp, r7
 211 0076 02B0     		add	sp, sp, #8
 212              		@ sp needed
 213 0078 80BD     		pop	{r7, pc}
 214              		.cfi_endproc
 215              	.LFE16:
 217              		.align	1
 218              		.global	qf16_conj
 219              		.syntax unified
 220              		.code	16
 221              		.thumb_func
 222              		.fpu softvfp
 224              	qf16_conj:
 225              	.LFB17:
 226              		.file 3 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c"
   1:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** #include "fixquat.h"
   2:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** #include "fixarray.h"
   3:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
   4:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Conjugate of quaternion
   5:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_conj(qf16 *dest, const qf16 *q)
   6:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 227              		.loc 3 6 0
 228              		.cfi_startproc
 229              		@ args = 0, pretend = 0, frame = 8
 230              		@ frame_needed = 1, uses_anonymous_args = 0
 231 007a 80B5     		push	{r7, lr}
 232              		.cfi_def_cfa_offset 8
 233              		.cfi_offset 7, -8
 234              		.cfi_offset 14, -4
 235 007c 82B0     		sub	sp, sp, #8
 236              		.cfi_def_cfa_offset 16
 237 007e 00AF     		add	r7, sp, #0
 238              		.cfi_def_cfa_register 7
 239 0080 7860     		str	r0, [r7, #4]
 240 0082 3960     		str	r1, [r7]
   7:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = q->a;
 241              		.loc 3 7 0
 242 0084 3B68     		ldr	r3, [r7]
 243 0086 1A68     		ldr	r2, [r3]
 244 0088 7B68     		ldr	r3, [r7, #4]
 245 008a 1A60     		str	r2, [r3]
   8:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = - q->b;
 246              		.loc 3 8 0
 247 008c 3B68     		ldr	r3, [r7]
 248 008e 5B68     		ldr	r3, [r3, #4]
 249 0090 5A42     		rsbs	r2, r3, #0
 250 0092 7B68     		ldr	r3, [r7, #4]
 251 0094 5A60     		str	r2, [r3, #4]
   9:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = - q->c;
 252              		.loc 3 9 0
 253 0096 3B68     		ldr	r3, [r7]
 254 0098 9B68     		ldr	r3, [r3, #8]
 255 009a 5A42     		rsbs	r2, r3, #0
 256 009c 7B68     		ldr	r3, [r7, #4]
 257 009e 9A60     		str	r2, [r3, #8]
  10:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = - q->d;
 258              		.loc 3 10 0
 259 00a0 3B68     		ldr	r3, [r7]
 260 00a2 DB68     		ldr	r3, [r3, #12]
 261 00a4 5A42     		rsbs	r2, r3, #0
 262 00a6 7B68     		ldr	r3, [r7, #4]
 263 00a8 DA60     		str	r2, [r3, #12]
  11:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 264              		.loc 3 11 0
 265 00aa C046     		nop
 266 00ac BD46     		mov	sp, r7
 267 00ae 02B0     		add	sp, sp, #8
 268              		@ sp needed
 269 00b0 80BD     		pop	{r7, pc}
 270              		.cfi_endproc
 271              	.LFE17:
 273              		.align	1
 274              		.global	qf16_mul
 275              		.syntax unified
 276              		.code	16
 277              		.thumb_func
 278              		.fpu softvfp
 280              	qf16_mul:
 281              	.LFB18:
  12:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  13:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Multiply two quaternions, dest = a * b.
  14:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_mul(qf16 *dest, const qf16 *q, const qf16 *r)
  15:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 282              		.loc 3 15 0
 283              		.cfi_startproc
 284              		@ args = 0, pretend = 0, frame = 32
 285              		@ frame_needed = 1, uses_anonymous_args = 0
 286 00b2 90B5     		push	{r4, r7, lr}
 287              		.cfi_def_cfa_offset 12
 288              		.cfi_offset 4, -12
 289              		.cfi_offset 7, -8
 290              		.cfi_offset 14, -4
 291 00b4 8BB0     		sub	sp, sp, #44
 292              		.cfi_def_cfa_offset 56
 293 00b6 02AF     		add	r7, sp, #8
 294              		.cfi_def_cfa 7, 48
 295 00b8 F860     		str	r0, [r7, #12]
 296 00ba B960     		str	r1, [r7, #8]
 297 00bc 7A60     		str	r2, [r7, #4]
  16:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16 tmp;
  17:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fa16_unalias(dest, (void**)&q, (void**)&r, &tmp, sizeof(tmp));
 298              		.loc 3 17 0
 299 00be 1023     		movs	r3, #16
 300 00c0 FC18     		adds	r4, r7, r3
 301 00c2 3A1D     		adds	r2, r7, #4
 302 00c4 0823     		movs	r3, #8
 303 00c6 F918     		adds	r1, r7, r3
 304 00c8 F868     		ldr	r0, [r7, #12]
 305 00ca 1023     		movs	r3, #16
 306 00cc 0093     		str	r3, [sp]
 307 00ce 2300     		movs	r3, r4
 308 00d0 FFF7FEFF 		bl	fa16_unalias
  18:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
  19:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = fix16_mul(q->a, r->a) - fix16_mul(q->b, r->b) - fix16_mul(q->c, r->c) - fix16_mul(q->
 309              		.loc 3 19 0
 310 00d4 BB68     		ldr	r3, [r7, #8]
 311 00d6 1A68     		ldr	r2, [r3]
 312 00d8 7B68     		ldr	r3, [r7, #4]
 313 00da 1B68     		ldr	r3, [r3]
 314 00dc 1900     		movs	r1, r3
 315 00de 1000     		movs	r0, r2
 316 00e0 FFF7FEFF 		bl	fix16_mul
 317 00e4 0400     		movs	r4, r0
 318 00e6 BB68     		ldr	r3, [r7, #8]
 319 00e8 5A68     		ldr	r2, [r3, #4]
 320 00ea 7B68     		ldr	r3, [r7, #4]
 321 00ec 5B68     		ldr	r3, [r3, #4]
 322 00ee 1900     		movs	r1, r3
 323 00f0 1000     		movs	r0, r2
 324 00f2 FFF7FEFF 		bl	fix16_mul
 325 00f6 0300     		movs	r3, r0
 326 00f8 E41A     		subs	r4, r4, r3
 327 00fa BB68     		ldr	r3, [r7, #8]
 328 00fc 9A68     		ldr	r2, [r3, #8]
 329 00fe 7B68     		ldr	r3, [r7, #4]
 330 0100 9B68     		ldr	r3, [r3, #8]
 331 0102 1900     		movs	r1, r3
 332 0104 1000     		movs	r0, r2
 333 0106 FFF7FEFF 		bl	fix16_mul
 334 010a 0300     		movs	r3, r0
 335 010c E41A     		subs	r4, r4, r3
 336 010e BB68     		ldr	r3, [r7, #8]
 337 0110 DA68     		ldr	r2, [r3, #12]
 338 0112 7B68     		ldr	r3, [r7, #4]
 339 0114 DB68     		ldr	r3, [r3, #12]
 340 0116 1900     		movs	r1, r3
 341 0118 1000     		movs	r0, r2
 342 011a FFF7FEFF 		bl	fix16_mul
 343 011e 0300     		movs	r3, r0
 344 0120 E21A     		subs	r2, r4, r3
 345 0122 FB68     		ldr	r3, [r7, #12]
 346 0124 1A60     		str	r2, [r3]
  20:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = fix16_mul(q->a, r->b) + fix16_mul(q->b, r->a) + fix16_mul(q->c, r->d) - fix16_mul(q->
 347              		.loc 3 20 0
 348 0126 BB68     		ldr	r3, [r7, #8]
 349 0128 1A68     		ldr	r2, [r3]
 350 012a 7B68     		ldr	r3, [r7, #4]
 351 012c 5B68     		ldr	r3, [r3, #4]
 352 012e 1900     		movs	r1, r3
 353 0130 1000     		movs	r0, r2
 354 0132 FFF7FEFF 		bl	fix16_mul
 355 0136 0400     		movs	r4, r0
 356 0138 BB68     		ldr	r3, [r7, #8]
 357 013a 5A68     		ldr	r2, [r3, #4]
 358 013c 7B68     		ldr	r3, [r7, #4]
 359 013e 1B68     		ldr	r3, [r3]
 360 0140 1900     		movs	r1, r3
 361 0142 1000     		movs	r0, r2
 362 0144 FFF7FEFF 		bl	fix16_mul
 363 0148 0300     		movs	r3, r0
 364 014a E418     		adds	r4, r4, r3
 365 014c BB68     		ldr	r3, [r7, #8]
 366 014e 9A68     		ldr	r2, [r3, #8]
 367 0150 7B68     		ldr	r3, [r7, #4]
 368 0152 DB68     		ldr	r3, [r3, #12]
 369 0154 1900     		movs	r1, r3
 370 0156 1000     		movs	r0, r2
 371 0158 FFF7FEFF 		bl	fix16_mul
 372 015c 0300     		movs	r3, r0
 373 015e E418     		adds	r4, r4, r3
 374 0160 BB68     		ldr	r3, [r7, #8]
 375 0162 DA68     		ldr	r2, [r3, #12]
 376 0164 7B68     		ldr	r3, [r7, #4]
 377 0166 9B68     		ldr	r3, [r3, #8]
 378 0168 1900     		movs	r1, r3
 379 016a 1000     		movs	r0, r2
 380 016c FFF7FEFF 		bl	fix16_mul
 381 0170 0300     		movs	r3, r0
 382 0172 E21A     		subs	r2, r4, r3
 383 0174 FB68     		ldr	r3, [r7, #12]
 384 0176 5A60     		str	r2, [r3, #4]
  21:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = fix16_mul(q->a, r->c) - fix16_mul(q->b, r->d) + fix16_mul(q->c, r->a) + fix16_mul(q->
 385              		.loc 3 21 0
 386 0178 BB68     		ldr	r3, [r7, #8]
 387 017a 1A68     		ldr	r2, [r3]
 388 017c 7B68     		ldr	r3, [r7, #4]
 389 017e 9B68     		ldr	r3, [r3, #8]
 390 0180 1900     		movs	r1, r3
 391 0182 1000     		movs	r0, r2
 392 0184 FFF7FEFF 		bl	fix16_mul
 393 0188 0400     		movs	r4, r0
 394 018a BB68     		ldr	r3, [r7, #8]
 395 018c 5A68     		ldr	r2, [r3, #4]
 396 018e 7B68     		ldr	r3, [r7, #4]
 397 0190 DB68     		ldr	r3, [r3, #12]
 398 0192 1900     		movs	r1, r3
 399 0194 1000     		movs	r0, r2
 400 0196 FFF7FEFF 		bl	fix16_mul
 401 019a 0300     		movs	r3, r0
 402 019c E41A     		subs	r4, r4, r3
 403 019e BB68     		ldr	r3, [r7, #8]
 404 01a0 9A68     		ldr	r2, [r3, #8]
 405 01a2 7B68     		ldr	r3, [r7, #4]
 406 01a4 1B68     		ldr	r3, [r3]
 407 01a6 1900     		movs	r1, r3
 408 01a8 1000     		movs	r0, r2
 409 01aa FFF7FEFF 		bl	fix16_mul
 410 01ae 0300     		movs	r3, r0
 411 01b0 E418     		adds	r4, r4, r3
 412 01b2 BB68     		ldr	r3, [r7, #8]
 413 01b4 DA68     		ldr	r2, [r3, #12]
 414 01b6 7B68     		ldr	r3, [r7, #4]
 415 01b8 5B68     		ldr	r3, [r3, #4]
 416 01ba 1900     		movs	r1, r3
 417 01bc 1000     		movs	r0, r2
 418 01be FFF7FEFF 		bl	fix16_mul
 419 01c2 0300     		movs	r3, r0
 420 01c4 E218     		adds	r2, r4, r3
 421 01c6 FB68     		ldr	r3, [r7, #12]
 422 01c8 9A60     		str	r2, [r3, #8]
  22:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = fix16_mul(q->a, r->d) + fix16_mul(q->b, r->c) - fix16_mul(q->c, r->b) + fix16_mul(q->
 423              		.loc 3 22 0
 424 01ca BB68     		ldr	r3, [r7, #8]
 425 01cc 1A68     		ldr	r2, [r3]
 426 01ce 7B68     		ldr	r3, [r7, #4]
 427 01d0 DB68     		ldr	r3, [r3, #12]
 428 01d2 1900     		movs	r1, r3
 429 01d4 1000     		movs	r0, r2
 430 01d6 FFF7FEFF 		bl	fix16_mul
 431 01da 0400     		movs	r4, r0
 432 01dc BB68     		ldr	r3, [r7, #8]
 433 01de 5A68     		ldr	r2, [r3, #4]
 434 01e0 7B68     		ldr	r3, [r7, #4]
 435 01e2 9B68     		ldr	r3, [r3, #8]
 436 01e4 1900     		movs	r1, r3
 437 01e6 1000     		movs	r0, r2
 438 01e8 FFF7FEFF 		bl	fix16_mul
 439 01ec 0300     		movs	r3, r0
 440 01ee E418     		adds	r4, r4, r3
 441 01f0 BB68     		ldr	r3, [r7, #8]
 442 01f2 9A68     		ldr	r2, [r3, #8]
 443 01f4 7B68     		ldr	r3, [r7, #4]
 444 01f6 5B68     		ldr	r3, [r3, #4]
 445 01f8 1900     		movs	r1, r3
 446 01fa 1000     		movs	r0, r2
 447 01fc FFF7FEFF 		bl	fix16_mul
 448 0200 0300     		movs	r3, r0
 449 0202 E41A     		subs	r4, r4, r3
 450 0204 BB68     		ldr	r3, [r7, #8]
 451 0206 DA68     		ldr	r2, [r3, #12]
 452 0208 7B68     		ldr	r3, [r7, #4]
 453 020a 1B68     		ldr	r3, [r3]
 454 020c 1900     		movs	r1, r3
 455 020e 1000     		movs	r0, r2
 456 0210 FFF7FEFF 		bl	fix16_mul
 457 0214 0300     		movs	r3, r0
 458 0216 E218     		adds	r2, r4, r3
 459 0218 FB68     		ldr	r3, [r7, #12]
 460 021a DA60     		str	r2, [r3, #12]
  23:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 461              		.loc 3 23 0
 462 021c C046     		nop
 463 021e BD46     		mov	sp, r7
 464 0220 09B0     		add	sp, sp, #36
 465              		@ sp needed
 466 0222 90BD     		pop	{r4, r7, pc}
 467              		.cfi_endproc
 468              	.LFE18:
 470              		.align	1
 471              		.global	qf16_add
 472              		.syntax unified
 473              		.code	16
 474              		.thumb_func
 475              		.fpu softvfp
 477              	qf16_add:
 478              	.LFB19:
  24:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  25:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_add(qf16 *dest, const qf16 *q, const qf16 *r)
  26:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 479              		.loc 3 26 0
 480              		.cfi_startproc
 481              		@ args = 0, pretend = 0, frame = 16
 482              		@ frame_needed = 1, uses_anonymous_args = 0
 483 0224 80B5     		push	{r7, lr}
 484              		.cfi_def_cfa_offset 8
 485              		.cfi_offset 7, -8
 486              		.cfi_offset 14, -4
 487 0226 84B0     		sub	sp, sp, #16
 488              		.cfi_def_cfa_offset 24
 489 0228 00AF     		add	r7, sp, #0
 490              		.cfi_def_cfa_register 7
 491 022a F860     		str	r0, [r7, #12]
 492 022c B960     		str	r1, [r7, #8]
 493 022e 7A60     		str	r2, [r7, #4]
  27:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = q->a + r->a;
 494              		.loc 3 27 0
 495 0230 BB68     		ldr	r3, [r7, #8]
 496 0232 1A68     		ldr	r2, [r3]
 497 0234 7B68     		ldr	r3, [r7, #4]
 498 0236 1B68     		ldr	r3, [r3]
 499 0238 D218     		adds	r2, r2, r3
 500 023a FB68     		ldr	r3, [r7, #12]
 501 023c 1A60     		str	r2, [r3]
  28:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = q->b + r->b;
 502              		.loc 3 28 0
 503 023e BB68     		ldr	r3, [r7, #8]
 504 0240 5A68     		ldr	r2, [r3, #4]
 505 0242 7B68     		ldr	r3, [r7, #4]
 506 0244 5B68     		ldr	r3, [r3, #4]
 507 0246 D218     		adds	r2, r2, r3
 508 0248 FB68     		ldr	r3, [r7, #12]
 509 024a 5A60     		str	r2, [r3, #4]
  29:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = q->c + r->c;
 510              		.loc 3 29 0
 511 024c BB68     		ldr	r3, [r7, #8]
 512 024e 9A68     		ldr	r2, [r3, #8]
 513 0250 7B68     		ldr	r3, [r7, #4]
 514 0252 9B68     		ldr	r3, [r3, #8]
 515 0254 D218     		adds	r2, r2, r3
 516 0256 FB68     		ldr	r3, [r7, #12]
 517 0258 9A60     		str	r2, [r3, #8]
  30:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = q->d + r->d;
 518              		.loc 3 30 0
 519 025a BB68     		ldr	r3, [r7, #8]
 520 025c DA68     		ldr	r2, [r3, #12]
 521 025e 7B68     		ldr	r3, [r7, #4]
 522 0260 DB68     		ldr	r3, [r3, #12]
 523 0262 D218     		adds	r2, r2, r3
 524 0264 FB68     		ldr	r3, [r7, #12]
 525 0266 DA60     		str	r2, [r3, #12]
  31:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 526              		.loc 3 31 0
 527 0268 C046     		nop
 528 026a BD46     		mov	sp, r7
 529 026c 04B0     		add	sp, sp, #16
 530              		@ sp needed
 531 026e 80BD     		pop	{r7, pc}
 532              		.cfi_endproc
 533              	.LFE19:
 535              		.align	1
 536              		.global	qf16_mul_s
 537              		.syntax unified
 538              		.code	16
 539              		.thumb_func
 540              		.fpu softvfp
 542              	qf16_mul_s:
 543              	.LFB20:
  32:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  33:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Multiply quaternion by scalar
  34:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_mul_s(qf16 *dest, const qf16 *q, fix16_t s)
  35:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 544              		.loc 3 35 0
 545              		.cfi_startproc
 546              		@ args = 0, pretend = 0, frame = 16
 547              		@ frame_needed = 1, uses_anonymous_args = 0
 548 0270 80B5     		push	{r7, lr}
 549              		.cfi_def_cfa_offset 8
 550              		.cfi_offset 7, -8
 551              		.cfi_offset 14, -4
 552 0272 84B0     		sub	sp, sp, #16
 553              		.cfi_def_cfa_offset 24
 554 0274 00AF     		add	r7, sp, #0
 555              		.cfi_def_cfa_register 7
 556 0276 F860     		str	r0, [r7, #12]
 557 0278 B960     		str	r1, [r7, #8]
 558 027a 7A60     		str	r2, [r7, #4]
  36:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = fix16_mul(q->a, s);
 559              		.loc 3 36 0
 560 027c BB68     		ldr	r3, [r7, #8]
 561 027e 1B68     		ldr	r3, [r3]
 562 0280 7A68     		ldr	r2, [r7, #4]
 563 0282 1100     		movs	r1, r2
 564 0284 1800     		movs	r0, r3
 565 0286 FFF7FEFF 		bl	fix16_mul
 566 028a 0200     		movs	r2, r0
 567 028c FB68     		ldr	r3, [r7, #12]
 568 028e 1A60     		str	r2, [r3]
  37:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = fix16_mul(q->b, s);
 569              		.loc 3 37 0
 570 0290 BB68     		ldr	r3, [r7, #8]
 571 0292 5B68     		ldr	r3, [r3, #4]
 572 0294 7A68     		ldr	r2, [r7, #4]
 573 0296 1100     		movs	r1, r2
 574 0298 1800     		movs	r0, r3
 575 029a FFF7FEFF 		bl	fix16_mul
 576 029e 0200     		movs	r2, r0
 577 02a0 FB68     		ldr	r3, [r7, #12]
 578 02a2 5A60     		str	r2, [r3, #4]
  38:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = fix16_mul(q->c, s);
 579              		.loc 3 38 0
 580 02a4 BB68     		ldr	r3, [r7, #8]
 581 02a6 9B68     		ldr	r3, [r3, #8]
 582 02a8 7A68     		ldr	r2, [r7, #4]
 583 02aa 1100     		movs	r1, r2
 584 02ac 1800     		movs	r0, r3
 585 02ae FFF7FEFF 		bl	fix16_mul
 586 02b2 0200     		movs	r2, r0
 587 02b4 FB68     		ldr	r3, [r7, #12]
 588 02b6 9A60     		str	r2, [r3, #8]
  39:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = fix16_mul(q->d, s);
 589              		.loc 3 39 0
 590 02b8 BB68     		ldr	r3, [r7, #8]
 591 02ba DB68     		ldr	r3, [r3, #12]
 592 02bc 7A68     		ldr	r2, [r7, #4]
 593 02be 1100     		movs	r1, r2
 594 02c0 1800     		movs	r0, r3
 595 02c2 FFF7FEFF 		bl	fix16_mul
 596 02c6 0200     		movs	r2, r0
 597 02c8 FB68     		ldr	r3, [r7, #12]
 598 02ca DA60     		str	r2, [r3, #12]
  40:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 599              		.loc 3 40 0
 600 02cc C046     		nop
 601 02ce BD46     		mov	sp, r7
 602 02d0 04B0     		add	sp, sp, #16
 603              		@ sp needed
 604 02d2 80BD     		pop	{r7, pc}
 605              		.cfi_endproc
 606              	.LFE20:
 608              		.align	1
 609              		.global	qf16_div_s
 610              		.syntax unified
 611              		.code	16
 612              		.thumb_func
 613              		.fpu softvfp
 615              	qf16_div_s:
 616              	.LFB21:
  41:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  42:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Divide quaternion by scalar
  43:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_div_s(qf16 *dest, const qf16 *q, fix16_t s)
  44:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 617              		.loc 3 44 0
 618              		.cfi_startproc
 619              		@ args = 0, pretend = 0, frame = 16
 620              		@ frame_needed = 1, uses_anonymous_args = 0
 621 02d4 80B5     		push	{r7, lr}
 622              		.cfi_def_cfa_offset 8
 623              		.cfi_offset 7, -8
 624              		.cfi_offset 14, -4
 625 02d6 84B0     		sub	sp, sp, #16
 626              		.cfi_def_cfa_offset 24
 627 02d8 00AF     		add	r7, sp, #0
 628              		.cfi_def_cfa_register 7
 629 02da F860     		str	r0, [r7, #12]
 630 02dc B960     		str	r1, [r7, #8]
 631 02de 7A60     		str	r2, [r7, #4]
  45:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = fix16_div(q->a, s);
 632              		.loc 3 45 0
 633 02e0 BB68     		ldr	r3, [r7, #8]
 634 02e2 1B68     		ldr	r3, [r3]
 635 02e4 7A68     		ldr	r2, [r7, #4]
 636 02e6 1100     		movs	r1, r2
 637 02e8 1800     		movs	r0, r3
 638 02ea FFF7FEFF 		bl	fix16_div
 639 02ee 0200     		movs	r2, r0
 640 02f0 FB68     		ldr	r3, [r7, #12]
 641 02f2 1A60     		str	r2, [r3]
  46:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = fix16_div(q->b, s);
 642              		.loc 3 46 0
 643 02f4 BB68     		ldr	r3, [r7, #8]
 644 02f6 5B68     		ldr	r3, [r3, #4]
 645 02f8 7A68     		ldr	r2, [r7, #4]
 646 02fa 1100     		movs	r1, r2
 647 02fc 1800     		movs	r0, r3
 648 02fe FFF7FEFF 		bl	fix16_div
 649 0302 0200     		movs	r2, r0
 650 0304 FB68     		ldr	r3, [r7, #12]
 651 0306 5A60     		str	r2, [r3, #4]
  47:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = fix16_div(q->c, s);
 652              		.loc 3 47 0
 653 0308 BB68     		ldr	r3, [r7, #8]
 654 030a 9B68     		ldr	r3, [r3, #8]
 655 030c 7A68     		ldr	r2, [r7, #4]
 656 030e 1100     		movs	r1, r2
 657 0310 1800     		movs	r0, r3
 658 0312 FFF7FEFF 		bl	fix16_div
 659 0316 0200     		movs	r2, r0
 660 0318 FB68     		ldr	r3, [r7, #12]
 661 031a 9A60     		str	r2, [r3, #8]
  48:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = fix16_div(q->d, s);
 662              		.loc 3 48 0
 663 031c BB68     		ldr	r3, [r7, #8]
 664 031e DB68     		ldr	r3, [r3, #12]
 665 0320 7A68     		ldr	r2, [r7, #4]
 666 0322 1100     		movs	r1, r2
 667 0324 1800     		movs	r0, r3
 668 0326 FFF7FEFF 		bl	fix16_div
 669 032a 0200     		movs	r2, r0
 670 032c FB68     		ldr	r3, [r7, #12]
 671 032e DA60     		str	r2, [r3, #12]
  49:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 672              		.loc 3 49 0
 673 0330 C046     		nop
 674 0332 BD46     		mov	sp, r7
 675 0334 04B0     		add	sp, sp, #16
 676              		@ sp needed
 677 0336 80BD     		pop	{r7, pc}
 678              		.cfi_endproc
 679              	.LFE21:
 681              		.align	1
 682              		.global	qf16_dot
 683              		.syntax unified
 684              		.code	16
 685              		.thumb_func
 686              		.fpu softvfp
 688              	qf16_dot:
 689              	.LFB22:
  50:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  51:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** fix16_t qf16_dot(const qf16 *q, const qf16 *r)
  52:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 690              		.loc 3 52 0
 691              		.cfi_startproc
 692              		@ args = 0, pretend = 0, frame = 8
 693              		@ frame_needed = 1, uses_anonymous_args = 0
 694 0338 80B5     		push	{r7, lr}
 695              		.cfi_def_cfa_offset 8
 696              		.cfi_offset 7, -8
 697              		.cfi_offset 14, -4
 698 033a 84B0     		sub	sp, sp, #16
 699              		.cfi_def_cfa_offset 24
 700 033c 02AF     		add	r7, sp, #8
 701              		.cfi_def_cfa 7, 16
 702 033e 7860     		str	r0, [r7, #4]
 703 0340 3960     		str	r1, [r7]
  53:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     return fa16_dot(&q->a, &q->b - &q->a, &r->a, &r->b - &r->a, 4);    
 704              		.loc 3 53 0
 705 0342 7868     		ldr	r0, [r7, #4]
 706 0344 3A68     		ldr	r2, [r7]
 707 0346 0423     		movs	r3, #4
 708 0348 0093     		str	r3, [sp]
 709 034a 0123     		movs	r3, #1
 710 034c 0121     		movs	r1, #1
 711 034e FFF7FEFF 		bl	fa16_dot
 712 0352 0300     		movs	r3, r0
  54:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 713              		.loc 3 54 0
 714 0354 1800     		movs	r0, r3
 715 0356 BD46     		mov	sp, r7
 716 0358 02B0     		add	sp, sp, #8
 717              		@ sp needed
 718 035a 80BD     		pop	{r7, pc}
 719              		.cfi_endproc
 720              	.LFE22:
 722              		.align	1
 723              		.global	qf16_norm
 724              		.syntax unified
 725              		.code	16
 726              		.thumb_func
 727              		.fpu softvfp
 729              	qf16_norm:
 730              	.LFB23:
  55:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  56:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Quaternion norm
  57:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** fix16_t qf16_norm(const qf16 *q)
  58:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 731              		.loc 3 58 0
 732              		.cfi_startproc
 733              		@ args = 0, pretend = 0, frame = 8
 734              		@ frame_needed = 1, uses_anonymous_args = 0
 735 035c 80B5     		push	{r7, lr}
 736              		.cfi_def_cfa_offset 8
 737              		.cfi_offset 7, -8
 738              		.cfi_offset 14, -4
 739 035e 82B0     		sub	sp, sp, #8
 740              		.cfi_def_cfa_offset 16
 741 0360 00AF     		add	r7, sp, #0
 742              		.cfi_def_cfa_register 7
 743 0362 7860     		str	r0, [r7, #4]
  59:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     return fa16_norm(&q->a, &q->b - &q->a, 4);
 744              		.loc 3 59 0
 745 0364 7B68     		ldr	r3, [r7, #4]
 746 0366 0422     		movs	r2, #4
 747 0368 0121     		movs	r1, #1
 748 036a 1800     		movs	r0, r3
 749 036c FFF7FEFF 		bl	fa16_norm
 750 0370 0300     		movs	r3, r0
  60:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 751              		.loc 3 60 0
 752 0372 1800     		movs	r0, r3
 753 0374 BD46     		mov	sp, r7
 754 0376 02B0     		add	sp, sp, #8
 755              		@ sp needed
 756 0378 80BD     		pop	{r7, pc}
 757              		.cfi_endproc
 758              	.LFE23:
 760              		.align	1
 761              		.global	qf16_normalize
 762              		.syntax unified
 763              		.code	16
 764              		.thumb_func
 765              		.fpu softvfp
 767              	qf16_normalize:
 768              	.LFB24:
  61:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  62:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Normalize quaternion
  63:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_normalize(qf16 *dest, const qf16 *q)
  64:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 769              		.loc 3 64 0
 770              		.cfi_startproc
 771              		@ args = 0, pretend = 0, frame = 8
 772              		@ frame_needed = 1, uses_anonymous_args = 0
 773 037a 80B5     		push	{r7, lr}
 774              		.cfi_def_cfa_offset 8
 775              		.cfi_offset 7, -8
 776              		.cfi_offset 14, -4
 777 037c 82B0     		sub	sp, sp, #8
 778              		.cfi_def_cfa_offset 16
 779 037e 00AF     		add	r7, sp, #0
 780              		.cfi_def_cfa_register 7
 781 0380 7860     		str	r0, [r7, #4]
 782 0382 3960     		str	r1, [r7]
  65:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_div_s(dest, q, qf16_norm(q));
 783              		.loc 3 65 0
 784 0384 3B68     		ldr	r3, [r7]
 785 0386 1800     		movs	r0, r3
 786 0388 FFF7FEFF 		bl	qf16_norm
 787 038c 0200     		movs	r2, r0
 788 038e 3968     		ldr	r1, [r7]
 789 0390 7B68     		ldr	r3, [r7, #4]
 790 0392 1800     		movs	r0, r3
 791 0394 FFF7FEFF 		bl	qf16_div_s
  66:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 792              		.loc 3 66 0
 793 0398 C046     		nop
 794 039a BD46     		mov	sp, r7
 795 039c 02B0     		add	sp, sp, #8
 796              		@ sp needed
 797 039e 80BD     		pop	{r7, pc}
 798              		.cfi_endproc
 799              	.LFE24:
 801              		.align	1
 802              		.global	qf16_pow
 803              		.syntax unified
 804              		.code	16
 805              		.thumb_func
 806              		.fpu softvfp
 808              	qf16_pow:
 809              	.LFB25:
  67:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  68:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Quaternion power
  69:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_pow(qf16 *dest, const qf16 *q, fix16_t power)
  70:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 810              		.loc 3 70 0
 811              		.cfi_startproc
 812              		@ args = 0, pretend = 0, frame = 32
 813              		@ frame_needed = 1, uses_anonymous_args = 0
 814 03a0 90B5     		push	{r4, r7, lr}
 815              		.cfi_def_cfa_offset 12
 816              		.cfi_offset 4, -12
 817              		.cfi_offset 7, -8
 818              		.cfi_offset 14, -4
 819 03a2 89B0     		sub	sp, sp, #36
 820              		.cfi_def_cfa_offset 48
 821 03a4 00AF     		add	r7, sp, #0
 822              		.cfi_def_cfa_register 7
 823 03a6 F860     		str	r0, [r7, #12]
 824 03a8 B960     		str	r1, [r7, #8]
 825 03aa 7A60     		str	r2, [r7, #4]
  71:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t old_half_angle = fix16_acos(q->a);
 826              		.loc 3 71 0
 827 03ac BB68     		ldr	r3, [r7, #8]
 828 03ae 1B68     		ldr	r3, [r3]
 829 03b0 1800     		movs	r0, r3
 830 03b2 FFF7FEFF 		bl	fix16_acos
 831 03b6 0300     		movs	r3, r0
 832 03b8 BB61     		str	r3, [r7, #24]
  72:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t new_half_angle = fix16_mul(old_half_angle, power);
 833              		.loc 3 72 0
 834 03ba 7A68     		ldr	r2, [r7, #4]
 835 03bc BB69     		ldr	r3, [r7, #24]
 836 03be 1100     		movs	r1, r2
 837 03c0 1800     		movs	r0, r3
 838 03c2 FFF7FEFF 		bl	fix16_mul
 839 03c6 0300     		movs	r3, r0
 840 03c8 7B61     		str	r3, [r7, #20]
  73:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t multiplier = 0;
 841              		.loc 3 73 0
 842 03ca 0023     		movs	r3, #0
 843 03cc FB61     		str	r3, [r7, #28]
  74:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
  75:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     if (old_half_angle > 10) // Guard against almost-zero divider
 844              		.loc 3 75 0
 845 03ce BB69     		ldr	r3, [r7, #24]
 846 03d0 0A2B     		cmp	r3, #10
 847 03d2 0FDD     		ble	.L16
  76:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     {
  77:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****         multiplier = fix16_div(fix16_sin(new_half_angle),
 848              		.loc 3 77 0
 849 03d4 7B69     		ldr	r3, [r7, #20]
 850 03d6 1800     		movs	r0, r3
 851 03d8 FFF7FEFF 		bl	fix16_sin
 852 03dc 0400     		movs	r4, r0
 853 03de BB69     		ldr	r3, [r7, #24]
 854 03e0 1800     		movs	r0, r3
 855 03e2 FFF7FEFF 		bl	fix16_sin
 856 03e6 0300     		movs	r3, r0
 857 03e8 1900     		movs	r1, r3
 858 03ea 2000     		movs	r0, r4
 859 03ec FFF7FEFF 		bl	fix16_div
 860 03f0 0300     		movs	r3, r0
 861 03f2 FB61     		str	r3, [r7, #28]
 862              	.L16:
  78:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****                                fix16_sin(old_half_angle));
  79:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     }
  80:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
  81:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = fix16_cos(new_half_angle);
 863              		.loc 3 81 0
 864 03f4 7B69     		ldr	r3, [r7, #20]
 865 03f6 1800     		movs	r0, r3
 866 03f8 FFF7FEFF 		bl	fix16_cos
 867 03fc 0200     		movs	r2, r0
 868 03fe FB68     		ldr	r3, [r7, #12]
 869 0400 1A60     		str	r2, [r3]
  82:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = fix16_mul(q->b, multiplier);
 870              		.loc 3 82 0
 871 0402 BB68     		ldr	r3, [r7, #8]
 872 0404 5B68     		ldr	r3, [r3, #4]
 873 0406 FA69     		ldr	r2, [r7, #28]
 874 0408 1100     		movs	r1, r2
 875 040a 1800     		movs	r0, r3
 876 040c FFF7FEFF 		bl	fix16_mul
 877 0410 0200     		movs	r2, r0
 878 0412 FB68     		ldr	r3, [r7, #12]
 879 0414 5A60     		str	r2, [r3, #4]
  83:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = fix16_mul(q->c, multiplier);
 880              		.loc 3 83 0
 881 0416 BB68     		ldr	r3, [r7, #8]
 882 0418 9B68     		ldr	r3, [r3, #8]
 883 041a FA69     		ldr	r2, [r7, #28]
 884 041c 1100     		movs	r1, r2
 885 041e 1800     		movs	r0, r3
 886 0420 FFF7FEFF 		bl	fix16_mul
 887 0424 0200     		movs	r2, r0
 888 0426 FB68     		ldr	r3, [r7, #12]
 889 0428 9A60     		str	r2, [r3, #8]
  84:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = fix16_mul(q->d, multiplier);
 890              		.loc 3 84 0
 891 042a BB68     		ldr	r3, [r7, #8]
 892 042c DB68     		ldr	r3, [r3, #12]
 893 042e FA69     		ldr	r2, [r7, #28]
 894 0430 1100     		movs	r1, r2
 895 0432 1800     		movs	r0, r3
 896 0434 FFF7FEFF 		bl	fix16_mul
 897 0438 0200     		movs	r2, r0
 898 043a FB68     		ldr	r3, [r7, #12]
 899 043c DA60     		str	r2, [r3, #12]
  85:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 900              		.loc 3 85 0
 901 043e C046     		nop
 902 0440 BD46     		mov	sp, r7
 903 0442 09B0     		add	sp, sp, #36
 904              		@ sp needed
 905 0444 90BD     		pop	{r4, r7, pc}
 906              		.cfi_endproc
 907              	.LFE25:
 909              		.align	1
 910              		.global	qf16_avg
 911              		.syntax unified
 912              		.code	16
 913              		.thumb_func
 914              		.fpu softvfp
 916              	qf16_avg:
 917              	.LFB26:
  86:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
  87:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Weighted average
  88:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // See http://www.acsu.buffalo.edu/~johnc/ave_sfm07.pdf
  89:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_avg(qf16 *dest, const qf16 *q1, const qf16 *q2, fix16_t weight)
  90:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 918              		.loc 3 90 0
 919              		.cfi_startproc
 920              		@ args = 0, pretend = 0, frame = 56
 921              		@ frame_needed = 1, uses_anonymous_args = 0
 922 0446 F0B5     		push	{r4, r5, r6, r7, lr}
 923              		.cfi_def_cfa_offset 20
 924              		.cfi_offset 4, -20
 925              		.cfi_offset 5, -16
 926              		.cfi_offset 6, -12
 927              		.cfi_offset 7, -8
 928              		.cfi_offset 14, -4
 929 0448 8FB0     		sub	sp, sp, #60
 930              		.cfi_def_cfa_offset 80
 931 044a 00AF     		add	r7, sp, #0
 932              		.cfi_def_cfa_register 7
 933 044c F860     		str	r0, [r7, #12]
 934 044e B960     		str	r1, [r7, #8]
 935 0450 7A60     		str	r2, [r7, #4]
 936 0452 3B60     		str	r3, [r7]
  91:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // z = sqrt((w1 - w2)^2 + 4 w1 w2 (q1' q2)^2
  92:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // <=>
  93:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // z = sqrt((2 w1 - 1)^2 + 4 w1 (1 - w1) (q1' q2)^2)
  94:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t dot = qf16_dot(q1, q2);
 937              		.loc 3 94 0
 938 0454 7A68     		ldr	r2, [r7, #4]
 939 0456 BB68     		ldr	r3, [r7, #8]
 940 0458 1100     		movs	r1, r2
 941 045a 1800     		movs	r0, r3
 942 045c FFF7FEFF 		bl	qf16_dot
 943 0460 0300     		movs	r3, r0
 944 0462 7B63     		str	r3, [r7, #52]
  95:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t z = fix16_sq(2 * weight - F16(1))
 945              		.loc 3 95 0
 946 0464 3B68     		ldr	r3, [r7]
 947 0466 284A     		ldr	r2, .L18
 948 0468 9446     		mov	ip, r2
 949 046a 6344     		add	r3, r3, ip
 950 046c 5B00     		lsls	r3, r3, #1
 951 046e 1800     		movs	r0, r3
 952 0470 FFF7C6FD 		bl	fix16_sq
 953 0474 0400     		movs	r4, r0
  96:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****             + fix16_mul(4 * weight, fix16_mul((F16(1) - weight), fix16_sq(dot)));
 954              		.loc 3 96 0
 955 0476 3B68     		ldr	r3, [r7]
 956 0478 9D00     		lsls	r5, r3, #2
 957 047a 3B68     		ldr	r3, [r7]
 958 047c 8022     		movs	r2, #128
 959 047e 5202     		lsls	r2, r2, #9
 960 0480 D61A     		subs	r6, r2, r3
 961 0482 7B6B     		ldr	r3, [r7, #52]
 962 0484 1800     		movs	r0, r3
 963 0486 FFF7BBFD 		bl	fix16_sq
 964 048a 0300     		movs	r3, r0
 965 048c 1900     		movs	r1, r3
 966 048e 3000     		movs	r0, r6
 967 0490 FFF7FEFF 		bl	fix16_mul
 968 0494 0300     		movs	r3, r0
 969 0496 1900     		movs	r1, r3
 970 0498 2800     		movs	r0, r5
 971 049a FFF7FEFF 		bl	fix16_mul
 972 049e 0300     		movs	r3, r0
  95:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t z = fix16_sq(2 * weight - F16(1))
 973              		.loc 3 95 0
 974 04a0 E318     		adds	r3, r4, r3
 975 04a2 3B63     		str	r3, [r7, #48]
  97:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     z = fix16_sqrt(z);
 976              		.loc 3 97 0
 977 04a4 3B6B     		ldr	r3, [r7, #48]
 978 04a6 1800     		movs	r0, r3
 979 04a8 FFF7FEFF 		bl	fix16_sqrt
 980 04ac 0300     		movs	r3, r0
 981 04ae 3B63     		str	r3, [r7, #48]
  98:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
  99:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // q = 2 * w1 * (q1' q2) q1 + (w2 - w1 + z) q2
 100:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // <=>
 101:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     // q = 2 * w1 * (q1' q2) q1 + (1 - 2 * w1 + z) q2
 102:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16 tmp1;
 103:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_mul_s(&tmp1, q1, fix16_mul(2 * weight, dot));
 982              		.loc 3 103 0
 983 04b0 3B68     		ldr	r3, [r7]
 984 04b2 5B00     		lsls	r3, r3, #1
 985 04b4 7A6B     		ldr	r2, [r7, #52]
 986 04b6 1100     		movs	r1, r2
 987 04b8 1800     		movs	r0, r3
 988 04ba FFF7FEFF 		bl	fix16_mul
 989 04be 0200     		movs	r2, r0
 990 04c0 B968     		ldr	r1, [r7, #8]
 991 04c2 2024     		movs	r4, #32
 992 04c4 3B19     		adds	r3, r7, r4
 993 04c6 1800     		movs	r0, r3
 994 04c8 FFF7FEFF 		bl	qf16_mul_s
 104:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 105:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16 tmp2;
 106:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_mul_s(&tmp2, q2, F16(1) - 2 * weight + z);
 995              		.loc 3 106 0
 996 04cc 3B68     		ldr	r3, [r7]
 997 04ce 8022     		movs	r2, #128
 998 04d0 1202     		lsls	r2, r2, #8
 999 04d2 D31A     		subs	r3, r2, r3
 1000 04d4 5A00     		lsls	r2, r3, #1
 1001 04d6 3B6B     		ldr	r3, [r7, #48]
 1002 04d8 D218     		adds	r2, r2, r3
 1003 04da 7968     		ldr	r1, [r7, #4]
 1004 04dc 1025     		movs	r5, #16
 1005 04de 7B19     		adds	r3, r7, r5
 1006 04e0 1800     		movs	r0, r3
 1007 04e2 FFF7FEFF 		bl	qf16_mul_s
 107:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 108:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_add(dest, &tmp1, &tmp2);
 1008              		.loc 3 108 0
 1009 04e6 7A19     		adds	r2, r7, r5
 1010 04e8 3919     		adds	r1, r7, r4
 1011 04ea FB68     		ldr	r3, [r7, #12]
 1012 04ec 1800     		movs	r0, r3
 1013 04ee FFF7FEFF 		bl	qf16_add
 109:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_normalize(dest, dest);
 1014              		.loc 3 109 0
 1015 04f2 FA68     		ldr	r2, [r7, #12]
 1016 04f4 FB68     		ldr	r3, [r7, #12]
 1017 04f6 1100     		movs	r1, r2
 1018 04f8 1800     		movs	r0, r3
 1019 04fa FFF7FEFF 		bl	qf16_normalize
 110:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 1020              		.loc 3 110 0
 1021 04fe C046     		nop
 1022 0500 BD46     		mov	sp, r7
 1023 0502 0FB0     		add	sp, sp, #60
 1024              		@ sp needed
 1025 0504 F0BD     		pop	{r4, r5, r6, r7, pc}
 1026              	.L19:
 1027 0506 C046     		.align	2
 1028              	.L18:
 1029 0508 0080FFFF 		.word	-32768
 1030              		.cfi_endproc
 1031              	.LFE26:
 1033              		.align	1
 1034              		.global	qf16_from_axis_angle
 1035              		.syntax unified
 1036              		.code	16
 1037              		.thumb_func
 1038              		.fpu softvfp
 1040              	qf16_from_axis_angle:
 1041              	.LFB27:
 111:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
 112:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_from_axis_angle(qf16 *dest, const v3d *axis, fix16_t angle)
 113:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 1042              		.loc 3 113 0
 1043              		.cfi_startproc
 1044              		@ args = 0, pretend = 0, frame = 24
 1045              		@ frame_needed = 1, uses_anonymous_args = 0
 1046 050c 80B5     		push	{r7, lr}
 1047              		.cfi_def_cfa_offset 8
 1048              		.cfi_offset 7, -8
 1049              		.cfi_offset 14, -4
 1050 050e 86B0     		sub	sp, sp, #24
 1051              		.cfi_def_cfa_offset 32
 1052 0510 00AF     		add	r7, sp, #0
 1053              		.cfi_def_cfa_register 7
 1054 0512 F860     		str	r0, [r7, #12]
 1055 0514 B960     		str	r1, [r7, #8]
 1056 0516 7A60     		str	r2, [r7, #4]
 114:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     angle /= 2;
 1057              		.loc 3 114 0
 1058 0518 7B68     		ldr	r3, [r7, #4]
 1059 051a 002B     		cmp	r3, #0
 1060 051c 00DA     		bge	.L21
 1061 051e 0133     		adds	r3, r3, #1
 1062              	.L21:
 1063 0520 5B10     		asrs	r3, r3, #1
 1064 0522 7B60     		str	r3, [r7, #4]
 115:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     fix16_t scale = fix16_sin(angle);
 1065              		.loc 3 115 0
 1066 0524 7B68     		ldr	r3, [r7, #4]
 1067 0526 1800     		movs	r0, r3
 1068 0528 FFF7FEFF 		bl	fix16_sin
 1069 052c 0300     		movs	r3, r0
 1070 052e 7B61     		str	r3, [r7, #20]
 116:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 117:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->a = fix16_cos(angle);
 1071              		.loc 3 117 0
 1072 0530 7B68     		ldr	r3, [r7, #4]
 1073 0532 1800     		movs	r0, r3
 1074 0534 FFF7FEFF 		bl	fix16_cos
 1075 0538 0200     		movs	r2, r0
 1076 053a FB68     		ldr	r3, [r7, #12]
 1077 053c 1A60     		str	r2, [r3]
 118:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->b = fix16_mul(axis->x, scale);
 1078              		.loc 3 118 0
 1079 053e BB68     		ldr	r3, [r7, #8]
 1080 0540 1B68     		ldr	r3, [r3]
 1081 0542 7A69     		ldr	r2, [r7, #20]
 1082 0544 1100     		movs	r1, r2
 1083 0546 1800     		movs	r0, r3
 1084 0548 FFF7FEFF 		bl	fix16_mul
 1085 054c 0200     		movs	r2, r0
 1086 054e FB68     		ldr	r3, [r7, #12]
 1087 0550 5A60     		str	r2, [r3, #4]
 119:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->c = fix16_mul(axis->y, scale);
 1088              		.loc 3 119 0
 1089 0552 BB68     		ldr	r3, [r7, #8]
 1090 0554 5B68     		ldr	r3, [r3, #4]
 1091 0556 7A69     		ldr	r2, [r7, #20]
 1092 0558 1100     		movs	r1, r2
 1093 055a 1800     		movs	r0, r3
 1094 055c FFF7FEFF 		bl	fix16_mul
 1095 0560 0200     		movs	r2, r0
 1096 0562 FB68     		ldr	r3, [r7, #12]
 1097 0564 9A60     		str	r2, [r3, #8]
 120:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->d = fix16_mul(axis->z, scale);
 1098              		.loc 3 120 0
 1099 0566 BB68     		ldr	r3, [r7, #8]
 1100 0568 9B68     		ldr	r3, [r3, #8]
 1101 056a 7A69     		ldr	r2, [r7, #20]
 1102 056c 1100     		movs	r1, r2
 1103 056e 1800     		movs	r0, r3
 1104 0570 FFF7FEFF 		bl	fix16_mul
 1105 0574 0200     		movs	r2, r0
 1106 0576 FB68     		ldr	r3, [r7, #12]
 1107 0578 DA60     		str	r2, [r3, #12]
 121:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 1108              		.loc 3 121 0
 1109 057a C046     		nop
 1110 057c BD46     		mov	sp, r7
 1111 057e 06B0     		add	sp, sp, #24
 1112              		@ sp needed
 1113 0580 80BD     		pop	{r7, pc}
 1114              		.cfi_endproc
 1115              	.LFE27:
 1117              		.align	1
 1118              		.global	qf16_to_matrix
 1119              		.syntax unified
 1120              		.code	16
 1121              		.thumb_func
 1122              		.fpu softvfp
 1124              	qf16_to_matrix:
 1125              	.LFB28:
 122:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
 123:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** // Unit quaternion to rotation matrix
 124:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_to_matrix(mf16 *dest, const qf16 *q)
 125:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 1126              		.loc 3 125 0
 1127              		.cfi_startproc
 1128              		@ args = 0, pretend = 0, frame = 8
 1129              		@ frame_needed = 1, uses_anonymous_args = 0
 1130 0582 B0B5     		push	{r4, r5, r7, lr}
 1131              		.cfi_def_cfa_offset 16
 1132              		.cfi_offset 4, -16
 1133              		.cfi_offset 5, -12
 1134              		.cfi_offset 7, -8
 1135              		.cfi_offset 14, -4
 1136 0584 82B0     		sub	sp, sp, #8
 1137              		.cfi_def_cfa_offset 24
 1138 0586 00AF     		add	r7, sp, #0
 1139              		.cfi_def_cfa_register 7
 1140 0588 7860     		str	r0, [r7, #4]
 1141 058a 3960     		str	r1, [r7]
 126:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->rows = dest->columns = 3;
 1142              		.loc 3 126 0
 1143 058c 7B68     		ldr	r3, [r7, #4]
 1144 058e 0322     		movs	r2, #3
 1145 0590 5A70     		strb	r2, [r3, #1]
 1146 0592 7B68     		ldr	r3, [r7, #4]
 1147 0594 5A78     		ldrb	r2, [r3, #1]
 1148 0596 7B68     		ldr	r3, [r7, #4]
 1149 0598 1A70     		strb	r2, [r3]
 127:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->errors = 0;
 1150              		.loc 3 127 0
 1151 059a 7B68     		ldr	r3, [r7, #4]
 1152 059c 0022     		movs	r2, #0
 1153 059e 9A70     		strb	r2, [r3, #2]
 128:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[0][0] = fix16_one - 2 * (fix16_sq(q->c) + fix16_sq(q->d));
 1154              		.loc 3 128 0
 1155 05a0 8023     		movs	r3, #128
 1156 05a2 5C02     		lsls	r4, r3, #9
 1157 05a4 3B68     		ldr	r3, [r7]
 1158 05a6 9B68     		ldr	r3, [r3, #8]
 1159 05a8 1800     		movs	r0, r3
 1160 05aa FFF729FD 		bl	fix16_sq
 1161 05ae 0500     		movs	r5, r0
 1162 05b0 3B68     		ldr	r3, [r7]
 1163 05b2 DB68     		ldr	r3, [r3, #12]
 1164 05b4 1800     		movs	r0, r3
 1165 05b6 FFF723FD 		bl	fix16_sq
 1166 05ba 0300     		movs	r3, r0
 1167 05bc EB18     		adds	r3, r5, r3
 1168 05be 5B00     		lsls	r3, r3, #1
 1169 05c0 E21A     		subs	r2, r4, r3
 1170 05c2 7B68     		ldr	r3, [r7, #4]
 1171 05c4 5A60     		str	r2, [r3, #4]
 129:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[1][1] = fix16_one - 2 * (fix16_sq(q->b) + fix16_sq(q->d));
 1172              		.loc 3 129 0
 1173 05c6 8023     		movs	r3, #128
 1174 05c8 5C02     		lsls	r4, r3, #9
 1175 05ca 3B68     		ldr	r3, [r7]
 1176 05cc 5B68     		ldr	r3, [r3, #4]
 1177 05ce 1800     		movs	r0, r3
 1178 05d0 FFF716FD 		bl	fix16_sq
 1179 05d4 0500     		movs	r5, r0
 1180 05d6 3B68     		ldr	r3, [r7]
 1181 05d8 DB68     		ldr	r3, [r3, #12]
 1182 05da 1800     		movs	r0, r3
 1183 05dc FFF710FD 		bl	fix16_sq
 1184 05e0 0300     		movs	r3, r0
 1185 05e2 EB18     		adds	r3, r5, r3
 1186 05e4 5B00     		lsls	r3, r3, #1
 1187 05e6 E21A     		subs	r2, r4, r3
 1188 05e8 7B68     		ldr	r3, [r7, #4]
 1189 05ea 9A62     		str	r2, [r3, #40]
 130:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[2][2] = fix16_one - 2 * (fix16_sq(q->b) + fix16_sq(q->c));
 1190              		.loc 3 130 0
 1191 05ec 8023     		movs	r3, #128
 1192 05ee 5C02     		lsls	r4, r3, #9
 1193 05f0 3B68     		ldr	r3, [r7]
 1194 05f2 5B68     		ldr	r3, [r3, #4]
 1195 05f4 1800     		movs	r0, r3
 1196 05f6 FFF703FD 		bl	fix16_sq
 1197 05fa 0500     		movs	r5, r0
 1198 05fc 3B68     		ldr	r3, [r7]
 1199 05fe 9B68     		ldr	r3, [r3, #8]
 1200 0600 1800     		movs	r0, r3
 1201 0602 FFF7FDFC 		bl	fix16_sq
 1202 0606 0300     		movs	r3, r0
 1203 0608 EB18     		adds	r3, r5, r3
 1204 060a 5B00     		lsls	r3, r3, #1
 1205 060c E21A     		subs	r2, r4, r3
 1206 060e 7B68     		ldr	r3, [r7, #4]
 1207 0610 DA64     		str	r2, [r3, #76]
 131:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 132:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[1][0] = 2 * (fix16_mul(q->b, q->c) + fix16_mul(q->a, q->d));
 1208              		.loc 3 132 0
 1209 0612 3B68     		ldr	r3, [r7]
 1210 0614 5A68     		ldr	r2, [r3, #4]
 1211 0616 3B68     		ldr	r3, [r7]
 1212 0618 9B68     		ldr	r3, [r3, #8]
 1213 061a 1900     		movs	r1, r3
 1214 061c 1000     		movs	r0, r2
 1215 061e FFF7FEFF 		bl	fix16_mul
 1216 0622 0400     		movs	r4, r0
 1217 0624 3B68     		ldr	r3, [r7]
 1218 0626 1A68     		ldr	r2, [r3]
 1219 0628 3B68     		ldr	r3, [r7]
 1220 062a DB68     		ldr	r3, [r3, #12]
 1221 062c 1900     		movs	r1, r3
 1222 062e 1000     		movs	r0, r2
 1223 0630 FFF7FEFF 		bl	fix16_mul
 1224 0634 0300     		movs	r3, r0
 1225 0636 E318     		adds	r3, r4, r3
 1226 0638 5A00     		lsls	r2, r3, #1
 1227 063a 7B68     		ldr	r3, [r7, #4]
 1228 063c 5A62     		str	r2, [r3, #36]
 133:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[0][1] = 2 * (fix16_mul(q->b, q->c) - fix16_mul(q->a, q->d));
 1229              		.loc 3 133 0
 1230 063e 3B68     		ldr	r3, [r7]
 1231 0640 5A68     		ldr	r2, [r3, #4]
 1232 0642 3B68     		ldr	r3, [r7]
 1233 0644 9B68     		ldr	r3, [r3, #8]
 1234 0646 1900     		movs	r1, r3
 1235 0648 1000     		movs	r0, r2
 1236 064a FFF7FEFF 		bl	fix16_mul
 1237 064e 0400     		movs	r4, r0
 1238 0650 3B68     		ldr	r3, [r7]
 1239 0652 1A68     		ldr	r2, [r3]
 1240 0654 3B68     		ldr	r3, [r7]
 1241 0656 DB68     		ldr	r3, [r3, #12]
 1242 0658 1900     		movs	r1, r3
 1243 065a 1000     		movs	r0, r2
 1244 065c FFF7FEFF 		bl	fix16_mul
 1245 0660 0300     		movs	r3, r0
 1246 0662 E31A     		subs	r3, r4, r3
 1247 0664 5A00     		lsls	r2, r3, #1
 1248 0666 7B68     		ldr	r3, [r7, #4]
 1249 0668 9A60     		str	r2, [r3, #8]
 134:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 135:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[2][0] = 2 * (fix16_mul(q->b, q->d) - fix16_mul(q->a, q->c));
 1250              		.loc 3 135 0
 1251 066a 3B68     		ldr	r3, [r7]
 1252 066c 5A68     		ldr	r2, [r3, #4]
 1253 066e 3B68     		ldr	r3, [r7]
 1254 0670 DB68     		ldr	r3, [r3, #12]
 1255 0672 1900     		movs	r1, r3
 1256 0674 1000     		movs	r0, r2
 1257 0676 FFF7FEFF 		bl	fix16_mul
 1258 067a 0400     		movs	r4, r0
 1259 067c 3B68     		ldr	r3, [r7]
 1260 067e 1A68     		ldr	r2, [r3]
 1261 0680 3B68     		ldr	r3, [r7]
 1262 0682 9B68     		ldr	r3, [r3, #8]
 1263 0684 1900     		movs	r1, r3
 1264 0686 1000     		movs	r0, r2
 1265 0688 FFF7FEFF 		bl	fix16_mul
 1266 068c 0300     		movs	r3, r0
 1267 068e E31A     		subs	r3, r4, r3
 1268 0690 5A00     		lsls	r2, r3, #1
 1269 0692 7B68     		ldr	r3, [r7, #4]
 1270 0694 5A64     		str	r2, [r3, #68]
 136:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[0][2] = 2 * (fix16_mul(q->b, q->d) + fix16_mul(q->a, q->c));
 1271              		.loc 3 136 0
 1272 0696 3B68     		ldr	r3, [r7]
 1273 0698 5A68     		ldr	r2, [r3, #4]
 1274 069a 3B68     		ldr	r3, [r7]
 1275 069c DB68     		ldr	r3, [r3, #12]
 1276 069e 1900     		movs	r1, r3
 1277 06a0 1000     		movs	r0, r2
 1278 06a2 FFF7FEFF 		bl	fix16_mul
 1279 06a6 0400     		movs	r4, r0
 1280 06a8 3B68     		ldr	r3, [r7]
 1281 06aa 1A68     		ldr	r2, [r3]
 1282 06ac 3B68     		ldr	r3, [r7]
 1283 06ae 9B68     		ldr	r3, [r3, #8]
 1284 06b0 1900     		movs	r1, r3
 1285 06b2 1000     		movs	r0, r2
 1286 06b4 FFF7FEFF 		bl	fix16_mul
 1287 06b8 0300     		movs	r3, r0
 1288 06ba E318     		adds	r3, r4, r3
 1289 06bc 5A00     		lsls	r2, r3, #1
 1290 06be 7B68     		ldr	r3, [r7, #4]
 1291 06c0 DA60     		str	r2, [r3, #12]
 137:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 138:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[2][1] = 2 * (fix16_mul(q->c, q->d) + fix16_mul(q->a, q->b));
 1292              		.loc 3 138 0
 1293 06c2 3B68     		ldr	r3, [r7]
 1294 06c4 9A68     		ldr	r2, [r3, #8]
 1295 06c6 3B68     		ldr	r3, [r7]
 1296 06c8 DB68     		ldr	r3, [r3, #12]
 1297 06ca 1900     		movs	r1, r3
 1298 06cc 1000     		movs	r0, r2
 1299 06ce FFF7FEFF 		bl	fix16_mul
 1300 06d2 0400     		movs	r4, r0
 1301 06d4 3B68     		ldr	r3, [r7]
 1302 06d6 1A68     		ldr	r2, [r3]
 1303 06d8 3B68     		ldr	r3, [r7]
 1304 06da 5B68     		ldr	r3, [r3, #4]
 1305 06dc 1900     		movs	r1, r3
 1306 06de 1000     		movs	r0, r2
 1307 06e0 FFF7FEFF 		bl	fix16_mul
 1308 06e4 0300     		movs	r3, r0
 1309 06e6 E318     		adds	r3, r4, r3
 1310 06e8 5A00     		lsls	r2, r3, #1
 1311 06ea 7B68     		ldr	r3, [r7, #4]
 1312 06ec 9A64     		str	r2, [r3, #72]
 139:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     dest->data[1][2] = 2 * (fix16_mul(q->c, q->d) - fix16_mul(q->a, q->b));
 1313              		.loc 3 139 0
 1314 06ee 3B68     		ldr	r3, [r7]
 1315 06f0 9A68     		ldr	r2, [r3, #8]
 1316 06f2 3B68     		ldr	r3, [r7]
 1317 06f4 DB68     		ldr	r3, [r3, #12]
 1318 06f6 1900     		movs	r1, r3
 1319 06f8 1000     		movs	r0, r2
 1320 06fa FFF7FEFF 		bl	fix16_mul
 1321 06fe 0400     		movs	r4, r0
 1322 0700 3B68     		ldr	r3, [r7]
 1323 0702 1A68     		ldr	r2, [r3]
 1324 0704 3B68     		ldr	r3, [r7]
 1325 0706 5B68     		ldr	r3, [r3, #4]
 1326 0708 1900     		movs	r1, r3
 1327 070a 1000     		movs	r0, r2
 1328 070c FFF7FEFF 		bl	fix16_mul
 1329 0710 0300     		movs	r3, r0
 1330 0712 E31A     		subs	r3, r4, r3
 1331 0714 5A00     		lsls	r2, r3, #1
 1332 0716 7B68     		ldr	r3, [r7, #4]
 1333 0718 DA62     		str	r2, [r3, #44]
 140:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 1334              		.loc 3 140 0
 1335 071a C046     		nop
 1336 071c BD46     		mov	sp, r7
 1337 071e 02B0     		add	sp, sp, #8
 1338              		@ sp needed
 1339 0720 B0BD     		pop	{r4, r5, r7, pc}
 1340              		.cfi_endproc
 1341              	.LFE28:
 1343              		.align	1
 1344              		.global	qf16_rotate
 1345              		.syntax unified
 1346              		.code	16
 1347              		.thumb_func
 1348              		.fpu softvfp
 1350              	qf16_rotate:
 1351              	.LFB29:
 141:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** 
 142:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** void qf16_rotate(v3d *dest, const qf16 *q, const v3d *v)
 143:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** {
 1352              		.loc 3 143 0
 1353              		.cfi_startproc
 1354              		@ args = 0, pretend = 0, frame = 48
 1355              		@ frame_needed = 1, uses_anonymous_args = 0
 1356 0722 B0B5     		push	{r4, r5, r7, lr}
 1357              		.cfi_def_cfa_offset 16
 1358              		.cfi_offset 4, -16
 1359              		.cfi_offset 5, -12
 1360              		.cfi_offset 7, -8
 1361              		.cfi_offset 14, -4
 1362 0724 8CB0     		sub	sp, sp, #48
 1363              		.cfi_def_cfa_offset 64
 1364 0726 00AF     		add	r7, sp, #0
 1365              		.cfi_def_cfa_register 7
 1366 0728 F860     		str	r0, [r7, #12]
 1367 072a B960     		str	r1, [r7, #8]
 1368 072c 7A60     		str	r2, [r7, #4]
 144:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16 vector, q_conj;
 145:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 146:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_from_v3d(&vector, v, 0);
 1369              		.loc 3 146 0
 1370 072e 7968     		ldr	r1, [r7, #4]
 1371 0730 2024     		movs	r4, #32
 1372 0732 3B19     		adds	r3, r7, r4
 1373 0734 0022     		movs	r2, #0
 1374 0736 1800     		movs	r0, r3
 1375 0738 FFF771FC 		bl	qf16_from_v3d
 147:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_conj(&q_conj, q);
 1376              		.loc 3 147 0
 1377 073c BA68     		ldr	r2, [r7, #8]
 1378 073e 1025     		movs	r5, #16
 1379 0740 7B19     		adds	r3, r7, r5
 1380 0742 1100     		movs	r1, r2
 1381 0744 1800     		movs	r0, r3
 1382 0746 FFF7FEFF 		bl	qf16_conj
 148:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 149:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_mul(&vector, q, &vector);
 1383              		.loc 3 149 0
 1384 074a 3A19     		adds	r2, r7, r4
 1385 074c B968     		ldr	r1, [r7, #8]
 1386 074e 3B19     		adds	r3, r7, r4
 1387 0750 1800     		movs	r0, r3
 1388 0752 FFF7FEFF 		bl	qf16_mul
 150:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_mul(&vector, &vector, &q_conj);
 1389              		.loc 3 150 0
 1390 0756 7A19     		adds	r2, r7, r5
 1391 0758 3919     		adds	r1, r7, r4
 1392 075a 3B19     		adds	r3, r7, r4
 1393 075c 1800     		movs	r0, r3
 1394 075e FFF7FEFF 		bl	qf16_mul
 151:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     
 152:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c ****     qf16_to_v3d(dest, &vector);
 1395              		.loc 3 152 0
 1396 0762 3A19     		adds	r2, r7, r4
 1397 0764 FB68     		ldr	r3, [r7, #12]
 1398 0766 1100     		movs	r1, r2
 1399 0768 1800     		movs	r0, r3
 1400 076a FFF771FC 		bl	qf16_to_v3d
 153:/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c **** }
 1401              		.loc 3 153 0
 1402 076e C046     		nop
 1403 0770 BD46     		mov	sp, r7
 1404 0772 0CB0     		add	sp, sp, #48
 1405              		@ sp needed
 1406 0774 B0BD     		pop	{r4, r5, r7, pc}
 1407              		.cfi_endproc
 1408              	.LFE29:
 1410              	.Letext0:
 1411              		.file 4 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 1412              		.file 5 "/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom/arm-none-eabi/incl
 1413              		.file 6 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixmatrix.h"
 1414              		.file 7 "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixvector3d.h"

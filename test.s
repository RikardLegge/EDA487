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
  11              		.file	"device_runtime.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	gpio_d
  16              		.data
  17              		.align	2
  20              	gpio_d:
  21 0000 000C0240 		.word	1073875968
  22              		.global	gpio_e
  23              		.align	2
  26              	gpio_e:
  27 0004 00100240 		.word	1073876992
  28              		.text
  29              		.align	1
  30              		.global	keyboard_activate_row
  31              		.syntax unified
  32              		.code	16
  33              		.thumb_func
  34              		.fpu softvfp
  36              	keyboard_activate_row:
  37              	.LFB0:
  38              		.file 1 "/Users/legge/Development/moppen-game/device/device_runtime.c"
   1:/Users/legge/Development/moppen-game/device/device_runtime.c **** #include "../shared/util.h"
   2:/Users/legge/Development/moppen-game/device/device_runtime.c **** #include "../shared/external.h"
   3:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
   4:/Users/legge/Development/moppen-game/device/device_runtime.c **** // GPIO
   5:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
   6:/Users/legge/Development/moppen-game/device/device_runtime.c **** typedef struct GPIO {
   7:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int mode;
   8:/Users/legge/Development/moppen-game/device/device_runtime.c ****     short type;
   9:/Users/legge/Development/moppen-game/device/device_runtime.c ****     short _reserved;
  10:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int speed;
  11:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int pupdr;
  12:/Users/legge/Development/moppen-game/device/device_runtime.c ****     union {
  13:/Users/legge/Development/moppen-game/device/device_runtime.c ****         short input;
  14:/Users/legge/Development/moppen-game/device/device_runtime.c ****         struct {
  15:/Users/legge/Development/moppen-game/device/device_runtime.c ****             char input_low;
  16:/Users/legge/Development/moppen-game/device/device_runtime.c ****             char input_high;
  17:/Users/legge/Development/moppen-game/device/device_runtime.c ****         };
  18:/Users/legge/Development/moppen-game/device/device_runtime.c ****     };
  19:/Users/legge/Development/moppen-game/device/device_runtime.c ****     short __reserved;
  20:/Users/legge/Development/moppen-game/device/device_runtime.c ****     union {
  21:/Users/legge/Development/moppen-game/device/device_runtime.c ****         short output;
  22:/Users/legge/Development/moppen-game/device/device_runtime.c ****         struct {
  23:/Users/legge/Development/moppen-game/device/device_runtime.c ****             char output_low;
  24:/Users/legge/Development/moppen-game/device/device_runtime.c ****             char output_high;
  25:/Users/legge/Development/moppen-game/device/device_runtime.c ****         };
  26:/Users/legge/Development/moppen-game/device/device_runtime.c ****     };
  27:/Users/legge/Development/moppen-game/device/device_runtime.c ****     short ___reserved;
  28:/Users/legge/Development/moppen-game/device/device_runtime.c **** } GPIO;
  29:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  30:/Users/legge/Development/moppen-game/device/device_runtime.c **** #define PORT_D 0x40020C00
  31:/Users/legge/Development/moppen-game/device/device_runtime.c **** #define PORT_E 0x40021000
  32:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  33:/Users/legge/Development/moppen-game/device/device_runtime.c **** GPIO* gpio_d = (GPIO*) PORT_D; 
  34:/Users/legge/Development/moppen-game/device/device_runtime.c **** GPIO* gpio_e = (GPIO*) PORT_E; 
  35:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  36:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  37:/Users/legge/Development/moppen-game/device/device_runtime.c **** // Keyboard
  38:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  39:/Users/legge/Development/moppen-game/device/device_runtime.c **** void keyboard_activate_row(int row) {
  39              		.loc 1 39 0
  40              		.cfi_startproc
  41              		@ args = 0, pretend = 0, frame = 16
  42              		@ frame_needed = 1, uses_anonymous_args = 0
  43 0000 80B5     		push	{r7, lr}
  44              		.cfi_def_cfa_offset 8
  45              		.cfi_offset 7, -8
  46              		.cfi_offset 14, -4
  47 0002 84B0     		sub	sp, sp, #16
  48              		.cfi_def_cfa_offset 24
  49 0004 00AF     		add	r7, sp, #0
  50              		.cfi_def_cfa_register 7
  51 0006 7860     		str	r0, [r7, #4]
  40:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char value = (0x10 << row);
  52              		.loc 1 40 0
  53 0008 1022     		movs	r2, #16
  54 000a 7B68     		ldr	r3, [r7, #4]
  55 000c 9A40     		lsls	r2, r2, r3
  56 000e 0F21     		movs	r1, #15
  57 0010 7B18     		adds	r3, r7, r1
  58 0012 1A70     		strb	r2, [r3]
  41:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_d->output_high = value;
  59              		.loc 1 41 0
  60 0014 044B     		ldr	r3, .L2
  61 0016 1B68     		ldr	r3, [r3]
  62 0018 7A18     		adds	r2, r7, r1
  63 001a 1278     		ldrb	r2, [r2]
  64 001c 5A75     		strb	r2, [r3, #21]
  42:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
  65              		.loc 1 42 0
  66 001e C046     		nop
  67 0020 BD46     		mov	sp, r7
  68 0022 04B0     		add	sp, sp, #16
  69              		@ sp needed
  70 0024 80BD     		pop	{r7, pc}
  71              	.L3:
  72 0026 C046     		.align	2
  73              	.L2:
  74 0028 00000000 		.word	gpio_d
  75              		.cfi_endproc
  76              	.LFE0:
  78              		.align	1
  79              		.global	keyboard_read_col
  80              		.syntax unified
  81              		.code	16
  82              		.thumb_func
  83              		.fpu softvfp
  85              	keyboard_read_col:
  86              	.LFB1:
  43:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  44:/Users/legge/Development/moppen-game/device/device_runtime.c **** char keyboard_read_col(int col) {
  87              		.loc 1 44 0
  88              		.cfi_startproc
  89              		@ args = 0, pretend = 0, frame = 16
  90              		@ frame_needed = 1, uses_anonymous_args = 0
  91 002c 80B5     		push	{r7, lr}
  92              		.cfi_def_cfa_offset 8
  93              		.cfi_offset 7, -8
  94              		.cfi_offset 14, -4
  95 002e 84B0     		sub	sp, sp, #16
  96              		.cfi_def_cfa_offset 24
  97 0030 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  99 0032 7860     		str	r0, [r7, #4]
  45:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char value = gpio_d->input_high;
 100              		.loc 1 45 0
 101 0034 0B4B     		ldr	r3, .L6
 102 0036 1A68     		ldr	r2, [r3]
 103 0038 0F21     		movs	r1, #15
 104 003a 7B18     		adds	r3, r7, r1
 105 003c 527C     		ldrb	r2, [r2, #17]
 106 003e 1A70     		strb	r2, [r3]
  46:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char bit_set = (value >> col) & 0x1;
 107              		.loc 1 46 0
 108 0040 7B18     		adds	r3, r7, r1
 109 0042 1A78     		ldrb	r2, [r3]
 110 0044 7B68     		ldr	r3, [r7, #4]
 111 0046 1A41     		asrs	r2, r2, r3
 112 0048 1300     		movs	r3, r2
 113 004a DAB2     		uxtb	r2, r3
 114 004c 0E20     		movs	r0, #14
 115 004e 3B18     		adds	r3, r7, r0
 116 0050 0121     		movs	r1, #1
 117 0052 0A40     		ands	r2, r1
 118 0054 1A70     		strb	r2, [r3]
  47:/Users/legge/Development/moppen-game/device/device_runtime.c ****     return bit_set;
 119              		.loc 1 47 0
 120 0056 3B18     		adds	r3, r7, r0
 121 0058 1B78     		ldrb	r3, [r3]
  48:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 122              		.loc 1 48 0
 123 005a 1800     		movs	r0, r3
 124 005c BD46     		mov	sp, r7
 125 005e 04B0     		add	sp, sp, #16
 126              		@ sp needed
 127 0060 80BD     		pop	{r7, pc}
 128              	.L7:
 129 0062 C046     		.align	2
 130              	.L6:
 131 0064 00000000 		.word	gpio_d
 132              		.cfi_endproc
 133              	.LFE1:
 135              		.align	1
 136              		.global	is_key_row_col_active
 137              		.syntax unified
 138              		.code	16
 139              		.thumb_func
 140              		.fpu softvfp
 142              	is_key_row_col_active:
 143              	.LFB2:
  49:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  50:/Users/legge/Development/moppen-game/device/device_runtime.c **** int is_key_row_col_active(int row, int col) {
 144              		.loc 1 50 0
 145              		.cfi_startproc
 146              		@ args = 0, pretend = 0, frame = 8
 147              		@ frame_needed = 1, uses_anonymous_args = 0
 148 0068 80B5     		push	{r7, lr}
 149              		.cfi_def_cfa_offset 8
 150              		.cfi_offset 7, -8
 151              		.cfi_offset 14, -4
 152 006a 82B0     		sub	sp, sp, #8
 153              		.cfi_def_cfa_offset 16
 154 006c 00AF     		add	r7, sp, #0
 155              		.cfi_def_cfa_register 7
 156 006e 7860     		str	r0, [r7, #4]
 157 0070 3960     		str	r1, [r7]
  51:/Users/legge/Development/moppen-game/device/device_runtime.c ****     keyboard_activate_row(row);
 158              		.loc 1 51 0
 159 0072 7B68     		ldr	r3, [r7, #4]
 160 0074 1800     		movs	r0, r3
 161 0076 FFF7FEFF 		bl	keyboard_activate_row
  52:/Users/legge/Development/moppen-game/device/device_runtime.c ****     return keyboard_read_col(col);
 162              		.loc 1 52 0
 163 007a 3B68     		ldr	r3, [r7]
 164 007c 1800     		movs	r0, r3
 165 007e FFF7FEFF 		bl	keyboard_read_col
 166 0082 0300     		movs	r3, r0
  53:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 167              		.loc 1 53 0
 168 0084 1800     		movs	r0, r3
 169 0086 BD46     		mov	sp, r7
 170 0088 02B0     		add	sp, sp, #8
 171              		@ sp needed
 172 008a 80BD     		pop	{r7, pc}
 173              		.cfi_endproc
 174              	.LFE2:
 176              		.align	1
 177              		.global	keyboard_index_active
 178              		.syntax unified
 179              		.code	16
 180              		.thumb_func
 181              		.fpu softvfp
 183              	keyboard_index_active:
 184              	.LFB3:
  54:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  55:/Users/legge/Development/moppen-game/device/device_runtime.c **** int keyboard_index_active(int index) {
 185              		.loc 1 55 0
 186              		.cfi_startproc
 187              		@ args = 0, pretend = 0, frame = 16
 188              		@ frame_needed = 1, uses_anonymous_args = 0
 189 008c 80B5     		push	{r7, lr}
 190              		.cfi_def_cfa_offset 8
 191              		.cfi_offset 7, -8
 192              		.cfi_offset 14, -4
 193 008e 84B0     		sub	sp, sp, #16
 194              		.cfi_def_cfa_offset 24
 195 0090 00AF     		add	r7, sp, #0
 196              		.cfi_def_cfa_register 7
 197 0092 7860     		str	r0, [r7, #4]
  56:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int row = index / 4;
 198              		.loc 1 56 0
 199 0094 7B68     		ldr	r3, [r7, #4]
 200 0096 002B     		cmp	r3, #0
 201 0098 00DA     		bge	.L11
 202 009a 0333     		adds	r3, r3, #3
 203              	.L11:
 204 009c 9B10     		asrs	r3, r3, #2
 205 009e FB60     		str	r3, [r7, #12]
  57:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int col = index % 4;
 206              		.loc 1 57 0
 207 00a0 7B68     		ldr	r3, [r7, #4]
 208 00a2 0A4A     		ldr	r2, .L14
 209 00a4 1340     		ands	r3, r2
 210 00a6 04D5     		bpl	.L12
 211 00a8 013B     		subs	r3, r3, #1
 212 00aa 0422     		movs	r2, #4
 213 00ac 5242     		rsbs	r2, r2, #0
 214 00ae 1343     		orrs	r3, r2
 215 00b0 0133     		adds	r3, r3, #1
 216              	.L12:
 217 00b2 BB60     		str	r3, [r7, #8]
  58:/Users/legge/Development/moppen-game/device/device_runtime.c ****     return is_key_row_col_active(row, col);
 218              		.loc 1 58 0
 219 00b4 BA68     		ldr	r2, [r7, #8]
 220 00b6 FB68     		ldr	r3, [r7, #12]
 221 00b8 1100     		movs	r1, r2
 222 00ba 1800     		movs	r0, r3
 223 00bc FFF7FEFF 		bl	is_key_row_col_active
 224 00c0 0300     		movs	r3, r0
  59:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 225              		.loc 1 59 0
 226 00c2 1800     		movs	r0, r3
 227 00c4 BD46     		mov	sp, r7
 228 00c6 04B0     		add	sp, sp, #16
 229              		@ sp needed
 230 00c8 80BD     		pop	{r7, pc}
 231              	.L15:
 232 00ca C046     		.align	2
 233              	.L14:
 234 00cc 03000080 		.word	-2147483645
 235              		.cfi_endproc
 236              	.LFE3:
 238              		.section	.rodata
 239              		.align	2
 240              	.LC0:
 241 0000 0D       		.byte	13
 242 0001 00       		.byte	0
 243 0002 01       		.byte	1
 244 0003 02       		.byte	2
 245 0004 04       		.byte	4
 246 0005 05       		.byte	5
 247 0006 06       		.byte	6
 248 0007 08       		.byte	8
 249 0008 09       		.byte	9
 250 0009 0A       		.byte	10
 251 000a 03       		.byte	3
 252 000b 07       		.byte	7
 253 000c 0B       		.byte	11
 254 000d 0F       		.byte	15
 255 000e 0C       		.byte	12
 256 000f 0E       		.byte	14
 257              		.text
 258              		.align	1
 259              		.global	key_is_active
 260              		.syntax unified
 261              		.code	16
 262              		.thumb_func
 263              		.fpu softvfp
 265              	key_is_active:
 266              	.LFB4:
  60:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  61:/Users/legge/Development/moppen-game/device/device_runtime.c **** int key_is_active(int hex) {
 267              		.loc 1 61 0
 268              		.cfi_startproc
 269              		@ args = 0, pretend = 0, frame = 32
 270              		@ frame_needed = 1, uses_anonymous_args = 0
 271 00d0 B0B5     		push	{r4, r5, r7, lr}
 272              		.cfi_def_cfa_offset 16
 273              		.cfi_offset 4, -16
 274              		.cfi_offset 5, -12
 275              		.cfi_offset 7, -8
 276              		.cfi_offset 14, -4
 277 00d2 88B0     		sub	sp, sp, #32
 278              		.cfi_def_cfa_offset 48
 279 00d4 00AF     		add	r7, sp, #0
 280              		.cfi_def_cfa_register 7
 281 00d6 7860     		str	r0, [r7, #4]
  62:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char hex_to_index[] = {
 282              		.loc 1 62 0
 283 00d8 0C21     		movs	r1, #12
 284 00da 7B18     		adds	r3, r7, r1
 285 00dc 094A     		ldr	r2, .L18
 286 00de 31CA     		ldmia	r2!, {r0, r4, r5}
 287 00e0 31C3     		stmia	r3!, {r0, r4, r5}
 288 00e2 1268     		ldr	r2, [r2]
 289 00e4 1A60     		str	r2, [r3]
  63:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0xD,
  64:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0x0, 0x1, 0x2, 
  65:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0x4, 0x5, 0x6, 
  66:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0x8, 0x9, 0xA, 
  67:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0x3, 0x7, 0xB, 0xF, 
  68:/Users/legge/Development/moppen-game/device/device_runtime.c ****         0xC, 0xE};
  69:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int index = hex_to_index[hex];
 290              		.loc 1 69 0
 291 00e6 7A18     		adds	r2, r7, r1
 292 00e8 7B68     		ldr	r3, [r7, #4]
 293 00ea D318     		adds	r3, r2, r3
 294 00ec 1B78     		ldrb	r3, [r3]
 295 00ee FB61     		str	r3, [r7, #28]
  70:/Users/legge/Development/moppen-game/device/device_runtime.c ****     return keyboard_index_active(index);
 296              		.loc 1 70 0
 297 00f0 FB69     		ldr	r3, [r7, #28]
 298 00f2 1800     		movs	r0, r3
 299 00f4 FFF7FEFF 		bl	keyboard_index_active
 300 00f8 0300     		movs	r3, r0
  71:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 301              		.loc 1 71 0
 302 00fa 1800     		movs	r0, r3
 303 00fc BD46     		mov	sp, r7
 304 00fe 08B0     		add	sp, sp, #32
 305              		@ sp needed
 306 0100 B0BD     		pop	{r4, r5, r7, pc}
 307              	.L19:
 308 0102 C046     		.align	2
 309              	.L18:
 310 0104 00000000 		.word	.LC0
 311              		.cfi_endproc
 312              	.LFE4:
 314              		.global	clock
 315              		.data
 316              		.align	2
 319              	clock:
 320 0008 10E000E0 		.word	-536813552
 321              		.text
 322              		.align	1
 323              		.global	delay_250ns
 324              		.syntax unified
 325              		.code	16
 326              		.thumb_func
 327              		.fpu softvfp
 329              	delay_250ns:
 330              	.LFB5:
  72:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  73:/Users/legge/Development/moppen-game/device/device_runtime.c **** // delay
  74:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  75:/Users/legge/Development/moppen-game/device/device_runtime.c **** typedef struct Clock {
  76:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int ctrl;
  77:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int load;
  78:/Users/legge/Development/moppen-game/device/device_runtime.c ****     int val;
  79:/Users/legge/Development/moppen-game/device/device_runtime.c **** } Clock;
  80:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  81:/Users/legge/Development/moppen-game/device/device_runtime.c **** #define CLOCK_ADDR 0xE000E010
  82:/Users/legge/Development/moppen-game/device/device_runtime.c **** Clock* clock = (Clock*) CLOCK_ADDR;
  83:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  84:/Users/legge/Development/moppen-game/device/device_runtime.c **** void delay_250ns(void) {
 331              		.loc 1 84 0
 332              		.cfi_startproc
 333              		@ args = 0, pretend = 0, frame = 0
 334              		@ frame_needed = 1, uses_anonymous_args = 0
 335 0108 80B5     		push	{r7, lr}
 336              		.cfi_def_cfa_offset 8
 337              		.cfi_offset 7, -8
 338              		.cfi_offset 14, -4
 339 010a 00AF     		add	r7, sp, #0
 340              		.cfi_def_cfa_register 7
  85:/Users/legge/Development/moppen-game/device/device_runtime.c ****     clock->ctrl = 0;
 341              		.loc 1 85 0
 342 010c 0F4B     		ldr	r3, .L22
 343 010e 1B68     		ldr	r3, [r3]
 344 0110 0022     		movs	r2, #0
 345 0112 1A60     		str	r2, [r3]
  86:/Users/legge/Development/moppen-game/device/device_runtime.c ****     clock->load = 168 - 1;
 346              		.loc 1 86 0
 347 0114 0D4B     		ldr	r3, .L22
 348 0116 1B68     		ldr	r3, [r3]
 349 0118 A722     		movs	r2, #167
 350 011a 5A60     		str	r2, [r3, #4]
  87:/Users/legge/Development/moppen-game/device/device_runtime.c ****     clock->ctrl = 5;
 351              		.loc 1 87 0
 352 011c 0B4B     		ldr	r3, .L22
 353 011e 1B68     		ldr	r3, [r3]
 354 0120 0522     		movs	r2, #5
 355 0122 1A60     		str	r2, [r3]
  88:/Users/legge/Development/moppen-game/device/device_runtime.c ****     clock->val = 0;
 356              		.loc 1 88 0
 357 0124 094B     		ldr	r3, .L22
 358 0126 1B68     		ldr	r3, [r3]
 359 0128 0022     		movs	r2, #0
 360 012a 9A60     		str	r2, [r3, #8]
  89:/Users/legge/Development/moppen-game/device/device_runtime.c ****     while(!(clock->ctrl & 0x10000)) {}
 361              		.loc 1 89 0
 362 012c C046     		nop
 363              	.L21:
 364              		.loc 1 89 0 is_stmt 0 discriminator 1
 365 012e 074B     		ldr	r3, .L22
 366 0130 1B68     		ldr	r3, [r3]
 367 0132 1A68     		ldr	r2, [r3]
 368 0134 8023     		movs	r3, #128
 369 0136 5B02     		lsls	r3, r3, #9
 370 0138 1340     		ands	r3, r2
 371 013a F8D0     		beq	.L21
  90:/Users/legge/Development/moppen-game/device/device_runtime.c ****     clock->ctrl = 0;
 372              		.loc 1 90 0 is_stmt 1
 373 013c 034B     		ldr	r3, .L22
 374 013e 1B68     		ldr	r3, [r3]
 375 0140 0022     		movs	r2, #0
 376 0142 1A60     		str	r2, [r3]
  91:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 377              		.loc 1 91 0
 378 0144 C046     		nop
 379 0146 BD46     		mov	sp, r7
 380              		@ sp needed
 381 0148 80BD     		pop	{r7, pc}
 382              	.L23:
 383 014a C046     		.align	2
 384              	.L22:
 385 014c 00000000 		.word	clock
 386              		.cfi_endproc
 387              	.LFE5:
 389              		.align	1
 390              		.global	delay_500ns
 391              		.syntax unified
 392              		.code	16
 393              		.thumb_func
 394              		.fpu softvfp
 396              	delay_500ns:
 397              	.LFB6:
  92:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  93:/Users/legge/Development/moppen-game/device/device_runtime.c **** void delay_500ns(void) {
 398              		.loc 1 93 0
 399              		.cfi_startproc
 400              		@ args = 0, pretend = 0, frame = 0
 401              		@ frame_needed = 1, uses_anonymous_args = 0
 402 0150 80B5     		push	{r7, lr}
 403              		.cfi_def_cfa_offset 8
 404              		.cfi_offset 7, -8
 405              		.cfi_offset 14, -4
 406 0152 00AF     		add	r7, sp, #0
 407              		.cfi_def_cfa_register 7
  94:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_250ns();
 408              		.loc 1 94 0
 409 0154 FFF7FEFF 		bl	delay_250ns
  95:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_250ns();
 410              		.loc 1 95 0
 411 0158 FFF7FEFF 		bl	delay_250ns
  96:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 412              		.loc 1 96 0
 413 015c C046     		nop
 414 015e BD46     		mov	sp, r7
 415              		@ sp needed
 416 0160 80BD     		pop	{r7, pc}
 417              		.cfi_endproc
 418              	.LFE6:
 420              		.align	1
 421              		.global	delay_micro
 422              		.syntax unified
 423              		.code	16
 424              		.thumb_func
 425              		.fpu softvfp
 427              	delay_micro:
 428              	.LFB7:
  97:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
  98:/Users/legge/Development/moppen-game/device/device_runtime.c **** void delay_micro(unsigned int us) {
 429              		.loc 1 98 0
 430              		.cfi_startproc
 431              		@ args = 0, pretend = 0, frame = 16
 432              		@ frame_needed = 1, uses_anonymous_args = 0
 433 0162 80B5     		push	{r7, lr}
 434              		.cfi_def_cfa_offset 8
 435              		.cfi_offset 7, -8
 436              		.cfi_offset 14, -4
 437 0164 84B0     		sub	sp, sp, #16
 438              		.cfi_def_cfa_offset 24
 439 0166 00AF     		add	r7, sp, #0
 440              		.cfi_def_cfa_register 7
 441 0168 7860     		str	r0, [r7, #4]
 442              	.LBB2:
  99:/Users/legge/Development/moppen-game/device/device_runtime.c ****     for(unsigned int i = 0; i < us; i++) {
 443              		.loc 1 99 0
 444 016a 0023     		movs	r3, #0
 445 016c FB60     		str	r3, [r7, #12]
 446 016e 0AE0     		b	.L26
 447              	.L27:
 100:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 448              		.loc 1 100 0 discriminator 3
 449 0170 FFF7FEFF 		bl	delay_250ns
 101:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 450              		.loc 1 101 0 discriminator 3
 451 0174 FFF7FEFF 		bl	delay_250ns
 102:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 452              		.loc 1 102 0 discriminator 3
 453 0178 FFF7FEFF 		bl	delay_250ns
 103:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 454              		.loc 1 103 0 discriminator 3
 455 017c FFF7FEFF 		bl	delay_250ns
  99:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 456              		.loc 1 99 0 discriminator 3
 457 0180 FB68     		ldr	r3, [r7, #12]
 458 0182 0133     		adds	r3, r3, #1
 459 0184 FB60     		str	r3, [r7, #12]
 460              	.L26:
  99:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_250ns();
 461              		.loc 1 99 0 is_stmt 0 discriminator 1
 462 0186 FA68     		ldr	r2, [r7, #12]
 463 0188 7B68     		ldr	r3, [r7, #4]
 464 018a 9A42     		cmp	r2, r3
 465 018c F0D3     		bcc	.L27
 466              	.LBE2:
 104:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 105:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 467              		.loc 1 105 0 is_stmt 1
 468 018e C046     		nop
 469 0190 BD46     		mov	sp, r7
 470 0192 04B0     		add	sp, sp, #16
 471              		@ sp needed
 472 0194 80BD     		pop	{r7, pc}
 473              		.cfi_endproc
 474              	.LFE7:
 476              		.align	1
 477              		.global	delay_milli
 478              		.syntax unified
 479              		.code	16
 480              		.thumb_func
 481              		.fpu softvfp
 483              	delay_milli:
 484              	.LFB8:
 106:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 107:/Users/legge/Development/moppen-game/device/device_runtime.c **** void delay_milli(unsigned int ms) {
 485              		.loc 1 107 0
 486              		.cfi_startproc
 487              		@ args = 0, pretend = 0, frame = 8
 488              		@ frame_needed = 1, uses_anonymous_args = 0
 489 0196 80B5     		push	{r7, lr}
 490              		.cfi_def_cfa_offset 8
 491              		.cfi_offset 7, -8
 492              		.cfi_offset 14, -4
 493 0198 82B0     		sub	sp, sp, #8
 494              		.cfi_def_cfa_offset 16
 495 019a 00AF     		add	r7, sp, #0
 496              		.cfi_def_cfa_register 7
 497 019c 7860     		str	r0, [r7, #4]
 108:/Users/legge/Development/moppen-game/device/device_runtime.c **** #ifdef USBDM
 109:/Users/legge/Development/moppen-game/device/device_runtime.c ****     ms *= 1000
 110:/Users/legge/Development/moppen-game/device/device_runtime.c **** #endif
 111:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_micro(ms);
 498              		.loc 1 111 0
 499 019e 7B68     		ldr	r3, [r7, #4]
 500 01a0 1800     		movs	r0, r3
 501 01a2 FFF7FEFF 		bl	delay_micro
 112:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 502              		.loc 1 112 0
 503 01a6 C046     		nop
 504 01a8 BD46     		mov	sp, r7
 505 01aa 02B0     		add	sp, sp, #8
 506              		@ sp needed
 507 01ac 80BD     		pop	{r7, pc}
 508              		.cfi_endproc
 509              	.LFE8:
 511              		.align	1
 512              		.syntax unified
 513              		.code	16
 514              		.thumb_func
 515              		.fpu softvfp
 517              	lcd_ctrl_bit_set:
 518              	.LFB9:
 113:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 114:/Users/legge/Development/moppen-game/device/device_runtime.c **** // LCD
 115:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 116:/Users/legge/Development/moppen-game/device/device_runtime.c **** static
 117:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_ctrl_bit_set(uint8_t bits) {
 519              		.loc 1 117 0
 520              		.cfi_startproc
 521              		@ args = 0, pretend = 0, frame = 16
 522              		@ frame_needed = 1, uses_anonymous_args = 0
 523 01ae 80B5     		push	{r7, lr}
 524              		.cfi_def_cfa_offset 8
 525              		.cfi_offset 7, -8
 526              		.cfi_offset 14, -4
 527 01b0 84B0     		sub	sp, sp, #16
 528              		.cfi_def_cfa_offset 24
 529 01b2 00AF     		add	r7, sp, #0
 530              		.cfi_def_cfa_register 7
 531 01b4 0200     		movs	r2, r0
 532 01b6 FB1D     		adds	r3, r7, #7
 533 01b8 1A70     		strb	r2, [r3]
 118:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char ctrl = gpio_e->output_low;
 534              		.loc 1 118 0
 535 01ba 0E4B     		ldr	r3, .L30
 536 01bc 1A68     		ldr	r2, [r3]
 537 01be 0F20     		movs	r0, #15
 538 01c0 3B18     		adds	r3, r7, r0
 539 01c2 127D     		ldrb	r2, [r2, #20]
 540 01c4 1A70     		strb	r2, [r3]
 119:/Users/legge/Development/moppen-game/device/device_runtime.c ****     ctrl |= bits;
 541              		.loc 1 119 0
 542 01c6 3B18     		adds	r3, r7, r0
 543 01c8 3918     		adds	r1, r7, r0
 544 01ca FA1D     		adds	r2, r7, #7
 545 01cc 0978     		ldrb	r1, [r1]
 546 01ce 1278     		ldrb	r2, [r2]
 547 01d0 0A43     		orrs	r2, r1
 548 01d2 1A70     		strb	r2, [r3]
 120:/Users/legge/Development/moppen-game/device/device_runtime.c ****     ctrl &= ~LCD_SELECT;
 549              		.loc 1 120 0
 550 01d4 3B18     		adds	r3, r7, r0
 551 01d6 3A18     		adds	r2, r7, r0
 552 01d8 1278     		ldrb	r2, [r2]
 553 01da 0421     		movs	r1, #4
 554 01dc 8A43     		bics	r2, r1
 555 01de 1A70     		strb	r2, [r3]
 121:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->output_low = ctrl;
 556              		.loc 1 121 0
 557 01e0 044B     		ldr	r3, .L30
 558 01e2 1B68     		ldr	r3, [r3]
 559 01e4 3A18     		adds	r2, r7, r0
 560 01e6 1278     		ldrb	r2, [r2]
 561 01e8 1A75     		strb	r2, [r3, #20]
 122:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 562              		.loc 1 122 0
 563 01ea C046     		nop
 564 01ec BD46     		mov	sp, r7
 565 01ee 04B0     		add	sp, sp, #16
 566              		@ sp needed
 567 01f0 80BD     		pop	{r7, pc}
 568              	.L31:
 569 01f2 C046     		.align	2
 570              	.L30:
 571 01f4 00000000 		.word	gpio_e
 572              		.cfi_endproc
 573              	.LFE9:
 575              		.align	1
 576              		.syntax unified
 577              		.code	16
 578              		.thumb_func
 579              		.fpu softvfp
 581              	lcd_ctrl_bit_clear:
 582              	.LFB10:
 123:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 124:/Users/legge/Development/moppen-game/device/device_runtime.c **** static
 125:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_ctrl_bit_clear(uint8_t bits) {
 583              		.loc 1 125 0
 584              		.cfi_startproc
 585              		@ args = 0, pretend = 0, frame = 16
 586              		@ frame_needed = 1, uses_anonymous_args = 0
 587 01f8 80B5     		push	{r7, lr}
 588              		.cfi_def_cfa_offset 8
 589              		.cfi_offset 7, -8
 590              		.cfi_offset 14, -4
 591 01fa 84B0     		sub	sp, sp, #16
 592              		.cfi_def_cfa_offset 24
 593 01fc 00AF     		add	r7, sp, #0
 594              		.cfi_def_cfa_register 7
 595 01fe 0200     		movs	r2, r0
 596 0200 FB1D     		adds	r3, r7, #7
 597 0202 1A70     		strb	r2, [r3]
 126:/Users/legge/Development/moppen-game/device/device_runtime.c ****     char ctrl = gpio_e->output_low;
 598              		.loc 1 126 0
 599 0204 104B     		ldr	r3, .L33
 600 0206 1A68     		ldr	r2, [r3]
 601 0208 0F21     		movs	r1, #15
 602 020a 7B18     		adds	r3, r7, r1
 603 020c 127D     		ldrb	r2, [r2, #20]
 604 020e 1A70     		strb	r2, [r3]
 127:/Users/legge/Development/moppen-game/device/device_runtime.c ****     ctrl &= ~bits;
 605              		.loc 1 127 0
 606 0210 FB1D     		adds	r3, r7, #7
 607 0212 1B78     		ldrb	r3, [r3]
 608 0214 5BB2     		sxtb	r3, r3
 609 0216 DB43     		mvns	r3, r3
 610 0218 5BB2     		sxtb	r3, r3
 611 021a 7A18     		adds	r2, r7, r1
 612 021c 1278     		ldrb	r2, [r2]
 613 021e 52B2     		sxtb	r2, r2
 614 0220 1340     		ands	r3, r2
 615 0222 5AB2     		sxtb	r2, r3
 616 0224 7B18     		adds	r3, r7, r1
 617 0226 1A70     		strb	r2, [r3]
 128:/Users/legge/Development/moppen-game/device/device_runtime.c ****     ctrl &= ~LCD_SELECT;
 618              		.loc 1 128 0
 619 0228 7B18     		adds	r3, r7, r1
 620 022a 0800     		movs	r0, r1
 621 022c 7A18     		adds	r2, r7, r1
 622 022e 1278     		ldrb	r2, [r2]
 623 0230 0421     		movs	r1, #4
 624 0232 8A43     		bics	r2, r1
 625 0234 1A70     		strb	r2, [r3]
 129:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->output_low = ctrl;
 626              		.loc 1 129 0
 627 0236 044B     		ldr	r3, .L33
 628 0238 1B68     		ldr	r3, [r3]
 629 023a 3A18     		adds	r2, r7, r0
 630 023c 1278     		ldrb	r2, [r2]
 631 023e 1A75     		strb	r2, [r3, #20]
 130:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 632              		.loc 1 130 0
 633 0240 C046     		nop
 634 0242 BD46     		mov	sp, r7
 635 0244 04B0     		add	sp, sp, #16
 636              		@ sp needed
 637 0246 80BD     		pop	{r7, pc}
 638              	.L34:
 639              		.align	2
 640              	.L33:
 641 0248 00000000 		.word	gpio_e
 642              		.cfi_endproc
 643              	.LFE10:
 645              		.align	1
 646              		.syntax unified
 647              		.code	16
 648              		.thumb_func
 649              		.fpu softvfp
 651              	lcd_select_controller:
 652              	.LFB11:
 131:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 132:/Users/legge/Development/moppen-game/device/device_runtime.c **** static
 133:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_select_controller(uint8_t controller) {
 653              		.loc 1 133 0
 654              		.cfi_startproc
 655              		@ args = 0, pretend = 0, frame = 8
 656              		@ frame_needed = 1, uses_anonymous_args = 0
 657 024c 80B5     		push	{r7, lr}
 658              		.cfi_def_cfa_offset 8
 659              		.cfi_offset 7, -8
 660              		.cfi_offset 14, -4
 661 024e 82B0     		sub	sp, sp, #8
 662              		.cfi_def_cfa_offset 16
 663 0250 00AF     		add	r7, sp, #0
 664              		.cfi_def_cfa_register 7
 665 0252 0200     		movs	r2, r0
 666 0254 FB1D     		adds	r3, r7, #7
 667 0256 1A70     		strb	r2, [r3]
 134:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller == 0) {
 668              		.loc 1 134 0
 669 0258 FB1D     		adds	r3, r7, #7
 670 025a 1B78     		ldrb	r3, [r3]
 671 025c 002B     		cmp	r3, #0
 672 025e 02D1     		bne	.L36
 135:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_clear(LCD_CS1|LCD_CS2);
 673              		.loc 1 135 0
 674 0260 1820     		movs	r0, #24
 675 0262 FFF7C9FF 		bl	lcd_ctrl_bit_clear
 676              	.L36:
 136:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 137:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller == LCD_CS1) {
 677              		.loc 1 137 0
 678 0266 FB1D     		adds	r3, r7, #7
 679 0268 1B78     		ldrb	r3, [r3]
 680 026a 082B     		cmp	r3, #8
 681 026c 05D1     		bne	.L37
 138:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_set(LCD_CS1);
 682              		.loc 1 138 0
 683 026e 0820     		movs	r0, #8
 684 0270 FFF79DFF 		bl	lcd_ctrl_bit_set
 139:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_clear(LCD_CS2);
 685              		.loc 1 139 0
 686 0274 1020     		movs	r0, #16
 687 0276 FFF7BFFF 		bl	lcd_ctrl_bit_clear
 688              	.L37:
 140:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 141:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller == LCD_CS2) {
 689              		.loc 1 141 0
 690 027a FB1D     		adds	r3, r7, #7
 691 027c 1B78     		ldrb	r3, [r3]
 692 027e 102B     		cmp	r3, #16
 693 0280 05D1     		bne	.L38
 142:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_clear(LCD_CS1);
 694              		.loc 1 142 0
 695 0282 0820     		movs	r0, #8
 696 0284 FFF7B8FF 		bl	lcd_ctrl_bit_clear
 143:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_set(LCD_CS2);
 697              		.loc 1 143 0
 698 0288 1020     		movs	r0, #16
 699 028a FFF790FF 		bl	lcd_ctrl_bit_set
 700              	.L38:
 144:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 145:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller == (LCD_CS1 | LCD_CS2)) {
 701              		.loc 1 145 0
 702 028e FB1D     		adds	r3, r7, #7
 703 0290 1B78     		ldrb	r3, [r3]
 704 0292 182B     		cmp	r3, #24
 705 0294 02D1     		bne	.L40
 146:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_set(LCD_CS1 | LCD_CS2);
 706              		.loc 1 146 0
 707 0296 1820     		movs	r0, #24
 708 0298 FFF789FF 		bl	lcd_ctrl_bit_set
 709              	.L40:
 147:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 148:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 710              		.loc 1 148 0
 711 029c C046     		nop
 712 029e BD46     		mov	sp, r7
 713 02a0 02B0     		add	sp, sp, #8
 714              		@ sp needed
 715 02a2 80BD     		pop	{r7, pc}
 716              		.cfi_endproc
 717              	.LFE11:
 719              		.align	1
 720              		.syntax unified
 721              		.code	16
 722              		.thumb_func
 723              		.fpu softvfp
 725              	lcd_wait_ready:
 726              	.LFB12:
 149:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 150:/Users/legge/Development/moppen-game/device/device_runtime.c **** static
 151:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_wait_ready(void) {
 727              		.loc 1 151 0
 728              		.cfi_startproc
 729              		@ args = 0, pretend = 0, frame = 0
 730              		@ frame_needed = 1, uses_anonymous_args = 0
 731 02a4 80B5     		push	{r7, lr}
 732              		.cfi_def_cfa_offset 8
 733              		.cfi_offset 7, -8
 734              		.cfi_offset 14, -4
 735 02a6 00AF     		add	r7, sp, #0
 736              		.cfi_def_cfa_register 7
 152:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_E);
 737              		.loc 1 152 0
 738 02a8 4020     		movs	r0, #64
 739 02aa FFF7A5FF 		bl	lcd_ctrl_bit_clear
 153:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->mode = 0x00005555;
 740              		.loc 1 153 0
 741 02ae 144B     		ldr	r3, .L47
 742 02b0 1B68     		ldr	r3, [r3]
 743 02b2 144A     		ldr	r2, .L47+4
 744 02b4 1A60     		str	r2, [r3]
 154:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_RS);
 745              		.loc 1 154 0
 746 02b6 0120     		movs	r0, #1
 747 02b8 FFF79EFF 		bl	lcd_ctrl_bit_clear
 155:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_RW);
 748              		.loc 1 155 0
 749 02bc 0220     		movs	r0, #2
 750 02be FFF776FF 		bl	lcd_ctrl_bit_set
 156:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_500ns();
 751              		.loc 1 156 0
 752 02c2 FFF7FEFF 		bl	delay_500ns
 753              	.L44:
 157:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 158:/Users/legge/Development/moppen-game/device/device_runtime.c ****     repeat_forever {
 159:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_set(LCD_E);
 754              		.loc 1 159 0
 755 02c6 4020     		movs	r0, #64
 756 02c8 FFF771FF 		bl	lcd_ctrl_bit_set
 160:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_500ns();
 757              		.loc 1 160 0
 758 02cc FFF7FEFF 		bl	delay_500ns
 161:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_ctrl_bit_clear(LCD_E);
 759              		.loc 1 161 0
 760 02d0 4020     		movs	r0, #64
 761 02d2 FFF791FF 		bl	lcd_ctrl_bit_clear
 162:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_500ns();
 762              		.loc 1 162 0
 763 02d6 FFF7FEFF 		bl	delay_500ns
 163:/Users/legge/Development/moppen-game/device/device_runtime.c ****         if(!(gpio_e->input_high & LCD_BUSY)) break;
 764              		.loc 1 163 0
 765 02da 094B     		ldr	r3, .L47
 766 02dc 1B68     		ldr	r3, [r3]
 767 02de 5B7C     		ldrb	r3, [r3, #17]
 768 02e0 5BB2     		sxtb	r3, r3
 769 02e2 002B     		cmp	r3, #0
 770 02e4 00DA     		bge	.L46
 159:/Users/legge/Development/moppen-game/device/device_runtime.c ****         delay_500ns();
 771              		.loc 1 159 0
 772 02e6 EEE7     		b	.L44
 773              	.L46:
 774              		.loc 1 163 0
 775 02e8 C046     		nop
 164:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 165:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 166:/Users/legge/Development/moppen-game/device/device_runtime.c **** //    while(gpio_e->input_high & LCD_BUSY) {
 167:/Users/legge/Development/moppen-game/device/device_runtime.c **** //        lcd_ctrl_bit_clear(LCD_E);
 168:/Users/legge/Development/moppen-game/device/device_runtime.c **** //        delay_500ns();
 169:/Users/legge/Development/moppen-game/device/device_runtime.c **** //        lcd_ctrl_bit_set(LCD_E);
 170:/Users/legge/Development/moppen-game/device/device_runtime.c **** //        delay_500ns();
 171:/Users/legge/Development/moppen-game/device/device_runtime.c **** //    }
 172:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 173:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_E);
 776              		.loc 1 173 0
 777 02ea 4020     		movs	r0, #64
 778 02ec FFF75FFF 		bl	lcd_ctrl_bit_set
 174:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->mode = 0x55555555;
 779              		.loc 1 174 0
 780 02f0 034B     		ldr	r3, .L47
 781 02f2 1B68     		ldr	r3, [r3]
 782 02f4 044A     		ldr	r2, .L47+8
 783 02f6 1A60     		str	r2, [r3]
 175:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 784              		.loc 1 175 0
 785 02f8 C046     		nop
 786 02fa BD46     		mov	sp, r7
 787              		@ sp needed
 788 02fc 80BD     		pop	{r7, pc}
 789              	.L48:
 790 02fe C046     		.align	2
 791              	.L47:
 792 0300 00000000 		.word	gpio_e
 793 0304 55550000 		.word	21845
 794 0308 55555555 		.word	1431655765
 795              		.cfi_endproc
 796              	.LFE12:
 798              		.align	1
 799              		.syntax unified
 800              		.code	16
 801              		.thumb_func
 802              		.fpu softvfp
 804              	lcd_write:
 805              	.LFB13:
 176:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 177:/Users/legge/Development/moppen-game/device/device_runtime.c **** static
 178:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_write(uint8_t value, uint8_t controller) {
 806              		.loc 1 178 0
 807              		.cfi_startproc
 808              		@ args = 0, pretend = 0, frame = 8
 809              		@ frame_needed = 1, uses_anonymous_args = 0
 810 030c 80B5     		push	{r7, lr}
 811              		.cfi_def_cfa_offset 8
 812              		.cfi_offset 7, -8
 813              		.cfi_offset 14, -4
 814 030e 82B0     		sub	sp, sp, #8
 815              		.cfi_def_cfa_offset 16
 816 0310 00AF     		add	r7, sp, #0
 817              		.cfi_def_cfa_register 7
 818 0312 0200     		movs	r2, r0
 819 0314 FB1D     		adds	r3, r7, #7
 820 0316 1A70     		strb	r2, [r3]
 821 0318 BB1D     		adds	r3, r7, #6
 822 031a 0A1C     		adds	r2, r1, #0
 823 031c 1A70     		strb	r2, [r3]
 179:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->output_high = value;
 824              		.loc 1 179 0
 825 031e 1B4B     		ldr	r3, .L52
 826 0320 1B68     		ldr	r3, [r3]
 827 0322 FA1D     		adds	r2, r7, #7
 828 0324 1278     		ldrb	r2, [r2]
 829 0326 5A75     		strb	r2, [r3, #21]
 180:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_select_controller(controller);
 830              		.loc 1 180 0
 831 0328 BB1D     		adds	r3, r7, #6
 832 032a 1B78     		ldrb	r3, [r3]
 833 032c 1800     		movs	r0, r3
 834 032e FFF78DFF 		bl	lcd_select_controller
 181:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_500ns();
 835              		.loc 1 181 0
 836 0332 FFF7FEFF 		bl	delay_500ns
 182:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 183:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_E);
 837              		.loc 1 183 0
 838 0336 4020     		movs	r0, #64
 839 0338 FFF739FF 		bl	lcd_ctrl_bit_set
 184:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_500ns();
 840              		.loc 1 184 0
 841 033c FFF7FEFF 		bl	delay_500ns
 185:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 186:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_E);
 842              		.loc 1 186 0
 843 0340 4020     		movs	r0, #64
 844 0342 FFF759FF 		bl	lcd_ctrl_bit_clear
 187:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 188:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller & LCD_CS1) {
 845              		.loc 1 188 0
 846 0346 BB1D     		adds	r3, r7, #6
 847 0348 1B78     		ldrb	r3, [r3]
 848 034a 0822     		movs	r2, #8
 849 034c 1340     		ands	r3, r2
 850 034e 04D0     		beq	.L50
 189:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_select_controller(LCD_CS1);
 851              		.loc 1 189 0
 852 0350 0820     		movs	r0, #8
 853 0352 FFF77BFF 		bl	lcd_select_controller
 190:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_wait_ready();
 854              		.loc 1 190 0
 855 0356 FFF7A5FF 		bl	lcd_wait_ready
 856              	.L50:
 191:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 192:/Users/legge/Development/moppen-game/device/device_runtime.c ****     if(controller & LCD_CS2) {
 857              		.loc 1 192 0
 858 035a BB1D     		adds	r3, r7, #6
 859 035c 1B78     		ldrb	r3, [r3]
 860 035e 1022     		movs	r2, #16
 861 0360 1340     		ands	r3, r2
 862 0362 04D0     		beq	.L51
 193:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_select_controller(LCD_CS2);
 863              		.loc 1 193 0
 864 0364 1020     		movs	r0, #16
 865 0366 FFF771FF 		bl	lcd_select_controller
 194:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_wait_ready();
 866              		.loc 1 194 0
 867 036a FFF79BFF 		bl	lcd_wait_ready
 868              	.L51:
 195:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 196:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 197:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->output_high = 0;
 869              		.loc 1 197 0
 870 036e 074B     		ldr	r3, .L52
 871 0370 1B68     		ldr	r3, [r3]
 872 0372 0022     		movs	r2, #0
 873 0374 5A75     		strb	r2, [r3, #21]
 198:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_E);
 874              		.loc 1 198 0
 875 0376 4020     		movs	r0, #64
 876 0378 FFF719FF 		bl	lcd_ctrl_bit_set
 199:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_select_controller(0);
 877              		.loc 1 199 0
 878 037c 0020     		movs	r0, #0
 879 037e FFF765FF 		bl	lcd_select_controller
 200:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 880              		.loc 1 200 0
 881 0382 C046     		nop
 882 0384 BD46     		mov	sp, r7
 883 0386 02B0     		add	sp, sp, #8
 884              		@ sp needed
 885 0388 80BD     		pop	{r7, pc}
 886              	.L53:
 887 038a C046     		.align	2
 888              	.L52:
 889 038c 00000000 		.word	gpio_e
 890              		.cfi_endproc
 891              	.LFE13:
 893              		.align	1
 894              		.global	lcd_write_command
 895              		.syntax unified
 896              		.code	16
 897              		.thumb_func
 898              		.fpu softvfp
 900              	lcd_write_command:
 901              	.LFB14:
 201:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 202:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 203:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_write_command(uint8_t command, uint8_t controller) {
 902              		.loc 1 203 0
 903              		.cfi_startproc
 904              		@ args = 0, pretend = 0, frame = 8
 905              		@ frame_needed = 1, uses_anonymous_args = 0
 906 0390 80B5     		push	{r7, lr}
 907              		.cfi_def_cfa_offset 8
 908              		.cfi_offset 7, -8
 909              		.cfi_offset 14, -4
 910 0392 82B0     		sub	sp, sp, #8
 911              		.cfi_def_cfa_offset 16
 912 0394 00AF     		add	r7, sp, #0
 913              		.cfi_def_cfa_register 7
 914 0396 0200     		movs	r2, r0
 915 0398 FB1D     		adds	r3, r7, #7
 916 039a 1A70     		strb	r2, [r3]
 917 039c BB1D     		adds	r3, r7, #6
 918 039e 0A1C     		adds	r2, r1, #0
 919 03a0 1A70     		strb	r2, [r3]
 204:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_E);
 920              		.loc 1 204 0
 921 03a2 4020     		movs	r0, #64
 922 03a4 FFF728FF 		bl	lcd_ctrl_bit_clear
 205:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_select_controller(controller);
 923              		.loc 1 205 0
 924 03a8 BB1D     		adds	r3, r7, #6
 925 03aa 1B78     		ldrb	r3, [r3]
 926 03ac 1800     		movs	r0, r3
 927 03ae FFF74DFF 		bl	lcd_select_controller
 206:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_RS|LCD_RW);
 928              		.loc 1 206 0
 929 03b2 0320     		movs	r0, #3
 930 03b4 FFF720FF 		bl	lcd_ctrl_bit_clear
 207:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 208:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write(command, controller);
 931              		.loc 1 208 0
 932 03b8 BB1D     		adds	r3, r7, #6
 933 03ba 1A78     		ldrb	r2, [r3]
 934 03bc FB1D     		adds	r3, r7, #7
 935 03be 1B78     		ldrb	r3, [r3]
 936 03c0 1100     		movs	r1, r2
 937 03c2 1800     		movs	r0, r3
 938 03c4 FFF7A2FF 		bl	lcd_write
 209:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 939              		.loc 1 209 0
 940 03c8 C046     		nop
 941 03ca BD46     		mov	sp, r7
 942 03cc 02B0     		add	sp, sp, #8
 943              		@ sp needed
 944 03ce 80BD     		pop	{r7, pc}
 945              		.cfi_endproc
 946              	.LFE14:
 948              		.align	1
 949              		.global	lcd_write_data
 950              		.syntax unified
 951              		.code	16
 952              		.thumb_func
 953              		.fpu softvfp
 955              	lcd_write_data:
 956              	.LFB15:
 210:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 211:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 212:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_write_data(uint8_t data, uint8_t controller) {
 957              		.loc 1 212 0
 958              		.cfi_startproc
 959              		@ args = 0, pretend = 0, frame = 8
 960              		@ frame_needed = 1, uses_anonymous_args = 0
 961 03d0 80B5     		push	{r7, lr}
 962              		.cfi_def_cfa_offset 8
 963              		.cfi_offset 7, -8
 964              		.cfi_offset 14, -4
 965 03d2 82B0     		sub	sp, sp, #8
 966              		.cfi_def_cfa_offset 16
 967 03d4 00AF     		add	r7, sp, #0
 968              		.cfi_def_cfa_register 7
 969 03d6 0200     		movs	r2, r0
 970 03d8 FB1D     		adds	r3, r7, #7
 971 03da 1A70     		strb	r2, [r3]
 972 03dc BB1D     		adds	r3, r7, #6
 973 03de 0A1C     		adds	r2, r1, #0
 974 03e0 1A70     		strb	r2, [r3]
 213:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_E);
 975              		.loc 1 213 0
 976 03e2 4020     		movs	r0, #64
 977 03e4 FFF708FF 		bl	lcd_ctrl_bit_clear
 214:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_select_controller(controller);
 978              		.loc 1 214 0
 979 03e8 BB1D     		adds	r3, r7, #6
 980 03ea 1B78     		ldrb	r3, [r3]
 981 03ec 1800     		movs	r0, r3
 982 03ee FFF72DFF 		bl	lcd_select_controller
 215:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_RW);
 983              		.loc 1 215 0
 984 03f2 0220     		movs	r0, #2
 985 03f4 FFF700FF 		bl	lcd_ctrl_bit_clear
 216:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_RS);
 986              		.loc 1 216 0
 987 03f8 0120     		movs	r0, #1
 988 03fa FFF7D8FE 		bl	lcd_ctrl_bit_set
 217:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 218:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write(data, controller);
 989              		.loc 1 218 0
 990 03fe BB1D     		adds	r3, r7, #6
 991 0400 1A78     		ldrb	r2, [r3]
 992 0402 FB1D     		adds	r3, r7, #7
 993 0404 1B78     		ldrb	r3, [r3]
 994 0406 1100     		movs	r1, r2
 995 0408 1800     		movs	r0, r3
 996 040a FFF77FFF 		bl	lcd_write
 219:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 997              		.loc 1 219 0
 998 040e C046     		nop
 999 0410 BD46     		mov	sp, r7
 1000 0412 02B0     		add	sp, sp, #8
 1001              		@ sp needed
 1002 0414 80BD     		pop	{r7, pc}
 1003              		.cfi_endproc
 1004              	.LFE15:
 1006              		.align	1
 1007              		.global	lcd_init
 1008              		.syntax unified
 1009              		.code	16
 1010              		.thumb_func
 1011              		.fpu softvfp
 1013              	lcd_init:
 1014              	.LFB16:
 220:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 221:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_init() {
 1015              		.loc 1 221 0
 1016              		.cfi_startproc
 1017              		@ args = 0, pretend = 0, frame = 0
 1018              		@ frame_needed = 1, uses_anonymous_args = 0
 1019 0416 80B5     		push	{r7, lr}
 1020              		.cfi_def_cfa_offset 8
 1021              		.cfi_offset 7, -8
 1022              		.cfi_offset 14, -4
 1023 0418 00AF     		add	r7, sp, #0
 1024              		.cfi_def_cfa_register 7
 222:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_E);
 1025              		.loc 1 222 0
 1026 041a 4020     		movs	r0, #64
 1027 041c FFF7C7FE 		bl	lcd_ctrl_bit_set
 223:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_micro(10);
 1028              		.loc 1 223 0
 1029 0420 0A20     		movs	r0, #10
 1030 0422 FFF7FEFF 		bl	delay_micro
 224:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 225:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_clear(LCD_CS1|LCD_CS2|LCD_RESET|LCD_E);
 1031              		.loc 1 225 0
 1032 0426 7820     		movs	r0, #120
 1033 0428 FFF7E6FE 		bl	lcd_ctrl_bit_clear
 226:/Users/legge/Development/moppen-game/device/device_runtime.c ****     delay_micro(30);
 1034              		.loc 1 226 0
 1035 042c 1E20     		movs	r0, #30
 1036 042e FFF7FEFF 		bl	delay_micro
 227:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 228:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_ctrl_bit_set(LCD_RESET);
 1037              		.loc 1 228 0
 1038 0432 2020     		movs	r0, #32
 1039 0434 FFF7BBFE 		bl	lcd_ctrl_bit_set
 229:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 230:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write_command(LCD_OFF, LCD_CS1|LCD_CS2);
 1040              		.loc 1 230 0
 1041 0438 1821     		movs	r1, #24
 1042 043a 3E20     		movs	r0, #62
 1043 043c FFF7FEFF 		bl	lcd_write_command
 231:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write_command(LCD_ON, LCD_CS1|LCD_CS2);
 1044              		.loc 1 231 0
 1045 0440 1821     		movs	r1, #24
 1046 0442 3F20     		movs	r0, #63
 1047 0444 FFF7FEFF 		bl	lcd_write_command
 232:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write_command(LCD_SET_LINE, LCD_CS1|LCD_CS2);
 1048              		.loc 1 232 0
 1049 0448 1821     		movs	r1, #24
 1050 044a C020     		movs	r0, #192
 1051 044c FFF7FEFF 		bl	lcd_write_command
 233:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write_command(LCD_SET_ADDRESS, LCD_CS1|LCD_CS2);
 1052              		.loc 1 233 0
 1053 0450 1821     		movs	r1, #24
 1054 0452 4020     		movs	r0, #64
 1055 0454 FFF7FEFF 		bl	lcd_write_command
 234:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_write_command(LCD_SET_PAGE, LCD_CS1|LCD_CS2);
 1056              		.loc 1 234 0
 1057 0458 1821     		movs	r1, #24
 1058 045a B820     		movs	r0, #184
 1059 045c FFF7FEFF 		bl	lcd_write_command
 235:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 236:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_select_controller(0);
 1060              		.loc 1 236 0
 1061 0460 0020     		movs	r0, #0
 1062 0462 FFF7F3FE 		bl	lcd_select_controller
 237:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 1063              		.loc 1 237 0
 1064 0466 C046     		nop
 1065 0468 BD46     		mov	sp, r7
 1066              		@ sp needed
 1067 046a 80BD     		pop	{r7, pc}
 1068              		.cfi_endproc
 1069              	.LFE16:
 1071              		.align	1
 1072              		.global	lcd_clear_screen
 1073              		.syntax unified
 1074              		.code	16
 1075              		.thumb_func
 1076              		.fpu softvfp
 1078              	lcd_clear_screen:
 1079              	.LFB17:
 238:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 239:/Users/legge/Development/moppen-game/device/device_runtime.c **** void lcd_clear_screen() {
 1080              		.loc 1 239 0
 1081              		.cfi_startproc
 1082              		@ args = 0, pretend = 0, frame = 8
 1083              		@ frame_needed = 1, uses_anonymous_args = 0
 1084 046c 80B5     		push	{r7, lr}
 1085              		.cfi_def_cfa_offset 8
 1086              		.cfi_offset 7, -8
 1087              		.cfi_offset 14, -4
 1088 046e 82B0     		sub	sp, sp, #8
 1089              		.cfi_def_cfa_offset 16
 1090 0470 00AF     		add	r7, sp, #0
 1091              		.cfi_def_cfa_register 7
 1092              	.LBB3:
 240:/Users/legge/Development/moppen-game/device/device_runtime.c ****     for(int page = 0; page < 8; page++) {
 1093              		.loc 1 240 0
 1094 0472 0023     		movs	r3, #0
 1095 0474 7B60     		str	r3, [r7, #4]
 1096 0476 1EE0     		b	.L58
 1097              	.L61:
 241:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_write_command(LCD_SET_PAGE | page, LCD_CS1 | LCD_CS2);
 1098              		.loc 1 241 0
 1099 0478 7B68     		ldr	r3, [r7, #4]
 1100 047a 5BB2     		sxtb	r3, r3
 1101 047c 4822     		movs	r2, #72
 1102 047e 5242     		rsbs	r2, r2, #0
 1103 0480 1343     		orrs	r3, r2
 1104 0482 5BB2     		sxtb	r3, r3
 1105 0484 DBB2     		uxtb	r3, r3
 1106 0486 1821     		movs	r1, #24
 1107 0488 1800     		movs	r0, r3
 1108 048a FFF7FEFF 		bl	lcd_write_command
 242:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_write_command(LCD_SET_ADDRESS | 0, LCD_CS1 | LCD_CS2);
 1109              		.loc 1 242 0
 1110 048e 1821     		movs	r1, #24
 1111 0490 4020     		movs	r0, #64
 1112 0492 FFF7FEFF 		bl	lcd_write_command
 1113              	.LBB4:
 243:/Users/legge/Development/moppen-game/device/device_runtime.c ****         for(int address = 0; address < 64; address++) {
 1114              		.loc 1 243 0
 1115 0496 0023     		movs	r3, #0
 1116 0498 3B60     		str	r3, [r7]
 1117 049a 06E0     		b	.L59
 1118              	.L60:
 244:/Users/legge/Development/moppen-game/device/device_runtime.c ****             lcd_write_data(0, LCD_CS1 | LCD_CS2);
 1119              		.loc 1 244 0 discriminator 3
 1120 049c 1821     		movs	r1, #24
 1121 049e 0020     		movs	r0, #0
 1122 04a0 FFF7FEFF 		bl	lcd_write_data
 243:/Users/legge/Development/moppen-game/device/device_runtime.c ****         for(int address = 0; address < 64; address++) {
 1123              		.loc 1 243 0 discriminator 3
 1124 04a4 3B68     		ldr	r3, [r7]
 1125 04a6 0133     		adds	r3, r3, #1
 1126 04a8 3B60     		str	r3, [r7]
 1127              	.L59:
 243:/Users/legge/Development/moppen-game/device/device_runtime.c ****         for(int address = 0; address < 64; address++) {
 1128              		.loc 1 243 0 is_stmt 0 discriminator 1
 1129 04aa 3B68     		ldr	r3, [r7]
 1130 04ac 3F2B     		cmp	r3, #63
 1131 04ae F5DD     		ble	.L60
 1132              	.LBE4:
 240:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_write_command(LCD_SET_PAGE | page, LCD_CS1 | LCD_CS2);
 1133              		.loc 1 240 0 is_stmt 1 discriminator 2
 1134 04b0 7B68     		ldr	r3, [r7, #4]
 1135 04b2 0133     		adds	r3, r3, #1
 1136 04b4 7B60     		str	r3, [r7, #4]
 1137              	.L58:
 240:/Users/legge/Development/moppen-game/device/device_runtime.c ****         lcd_write_command(LCD_SET_PAGE | page, LCD_CS1 | LCD_CS2);
 1138              		.loc 1 240 0 is_stmt 0 discriminator 1
 1139 04b6 7B68     		ldr	r3, [r7, #4]
 1140 04b8 072B     		cmp	r3, #7
 1141 04ba DDDD     		ble	.L61
 1142              	.LBE3:
 245:/Users/legge/Development/moppen-game/device/device_runtime.c ****         }
 246:/Users/legge/Development/moppen-game/device/device_runtime.c ****     }
 247:/Users/legge/Development/moppen-game/device/device_runtime.c **** }
 1143              		.loc 1 247 0 is_stmt 1
 1144 04bc C046     		nop
 1145 04be BD46     		mov	sp, r7
 1146 04c0 02B0     		add	sp, sp, #8
 1147              		@ sp needed
 1148 04c2 80BD     		pop	{r7, pc}
 1149              		.cfi_endproc
 1150              	.LFE17:
 1152              		.align	1
 1153              		.global	device_init
 1154              		.syntax unified
 1155              		.code	16
 1156              		.thumb_func
 1157              		.fpu softvfp
 1159              	device_init:
 1160              	.LFB18:
 248:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 249:/Users/legge/Development/moppen-game/device/device_runtime.c **** // main
 250:/Users/legge/Development/moppen-game/device/device_runtime.c **** 
 251:/Users/legge/Development/moppen-game/device/device_runtime.c **** void device_init() {
 1161              		.loc 1 251 0
 1162              		.cfi_startproc
 1163              		@ args = 0, pretend = 0, frame = 0
 1164              		@ frame_needed = 1, uses_anonymous_args = 0
 1165 04c4 80B5     		push	{r7, lr}
 1166              		.cfi_def_cfa_offset 8
 1167              		.cfi_offset 7, -8
 1168              		.cfi_offset 14, -4
 1169 04c6 00AF     		add	r7, sp, #0
 1170              		.cfi_def_cfa_register 7
 252:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_d->mode = 0x55005555;
 1171              		.loc 1 252 0
 1172 04c8 0F4B     		ldr	r3, .L63
 1173 04ca 1B68     		ldr	r3, [r3]
 1174 04cc 0F4A     		ldr	r2, .L63+4
 1175 04ce 1A60     		str	r2, [r3]
 253:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_d->type = 0x0F00;
 1176              		.loc 1 253 0
 1177 04d0 0D4B     		ldr	r3, .L63
 1178 04d2 1B68     		ldr	r3, [r3]
 1179 04d4 F022     		movs	r2, #240
 1180 04d6 1201     		lsls	r2, r2, #4
 1181 04d8 9A80     		strh	r2, [r3, #4]
 254:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_d->pupdr = 0x00AA0000;
 1182              		.loc 1 254 0
 1183 04da 0B4B     		ldr	r3, .L63
 1184 04dc 1B68     		ldr	r3, [r3]
 1185 04de AA22     		movs	r2, #170
 1186 04e0 1204     		lsls	r2, r2, #16
 1187 04e2 DA60     		str	r2, [r3, #12]
 255:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 256:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->type &= 0x0;
 1188              		.loc 1 256 0
 1189 04e4 0A4B     		ldr	r3, .L63+8
 1190 04e6 1B68     		ldr	r3, [r3]
 1191 04e8 0022     		movs	r2, #0
 1192 04ea 9A80     		strh	r2, [r3, #4]
 257:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->speed = 0x55555555;
 1193              		.loc 1 257 0
 1194 04ec 084B     		ldr	r3, .L63+8
 1195 04ee 1B68     		ldr	r3, [r3]
 1196 04f0 084A     		ldr	r2, .L63+12
 1197 04f2 9A60     		str	r2, [r3, #8]
 258:/Users/legge/Development/moppen-game/device/device_runtime.c ****     gpio_e->mode = 0x55555555;
 1198              		.loc 1 258 0
 1199 04f4 064B     		ldr	r3, .L63+8
 1200 04f6 1B68     		ldr	r3, [r3]
 1201 04f8 064A     		ldr	r2, .L63+12
 1202 04fa 1A60     		str	r2, [r3]
 259:/Users/legge/Development/moppen-game/device/device_runtime.c ****     
 260:/Users/legge/Development/moppen-game/device/device_runtime.c ****     lcd_init();
 1203              		.loc 1 260 0
 1204 04fc FFF7FEFF 		bl	lcd_init
 261:/Users/legge/Development/moppen-game/device/device_runtime.c **** }...
 1205              		.loc 1 261 0
 1206 0500 C046     		nop
 1207 0502 BD46     		mov	sp, r7
 1208              		@ sp needed
 1209 0504 80BD     		pop	{r7, pc}
 1210              	.L64:
 1211 0506 C046     		.align	2
 1212              	.L63:
 1213 0508 00000000 		.word	gpio_d
 1214 050c 55550055 		.word	1426085205
 1215 0510 00000000 		.word	gpio_e
 1216 0514 55555555 		.word	1431655765
 1217              		.cfi_endproc
 1218              	.LFE18:
 1220              	.Letext0:
 1221              		.file 2 "/Users/legge/Development/moppen-game/device/../shared/util.h"

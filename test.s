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
  11              		.file	"game.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	handle_input
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	handle_input:
  23              	.LFB0:
  24              		.file 1 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c"
   1:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "game.h"
   2:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
   3:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "util.h"
   4:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "external.h"
   5:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "canvas.h"
   6:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "sprite.h"
   7:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "vector_drawing.h"
   8:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
   9:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int camera_x = 0;
  10:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int camera_y = 0;
  11:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int camera_z = 0;
  12:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int camera_rot = 0;
  13:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int camera_rot_2 = 0;
  14:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  15:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void handle_input() {
  25              		.loc 1 15 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 0, uses_anonymous_args = 0
  29 0000 10B5     		push	{r4, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 4, -8
  32              		.cfi_offset 14, -4
  16:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x4)) {
  33              		.loc 1 16 0
  34 0002 0420     		movs	r0, #4
  35 0004 FFF7FEFF 		bl	key_is_active
  36              	.LVL0:
  37 0008 0028     		cmp	r0, #0
  38 000a 03D0     		beq	.L2
  17:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot -= 1;
  39              		.loc 1 17 0
  40 000c 304A     		ldr	r2, .L13
  41 000e 1368     		ldr	r3, [r2]
  42 0010 013B     		subs	r3, r3, #1
  43 0012 1360     		str	r3, [r2]
  44              	.L2:
  18:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  19:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x6)) {
  45              		.loc 1 19 0
  46 0014 0620     		movs	r0, #6
  47 0016 FFF7FEFF 		bl	key_is_active
  48              	.LVL1:
  49 001a 0028     		cmp	r0, #0
  50 001c 03D0     		beq	.L3
  20:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot += 1;
  51              		.loc 1 20 0
  52 001e 2C4A     		ldr	r2, .L13
  53 0020 1368     		ldr	r3, [r2]
  54 0022 0133     		adds	r3, r3, #1
  55 0024 1360     		str	r3, [r2]
  56              	.L3:
  21:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  22:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  23:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x3)) {
  57              		.loc 1 23 0
  58 0026 0320     		movs	r0, #3
  59 0028 FFF7FEFF 		bl	key_is_active
  60              	.LVL2:
  61 002c 0028     		cmp	r0, #0
  62 002e 03D0     		beq	.L4
  24:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot_2 -= 1;
  63              		.loc 1 24 0
  64 0030 274A     		ldr	r2, .L13
  65 0032 5368     		ldr	r3, [r2, #4]
  66 0034 013B     		subs	r3, r3, #1
  67 0036 5360     		str	r3, [r2, #4]
  68              	.L4:
  25:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  26:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0xF)) {
  69              		.loc 1 26 0
  70 0038 0F20     		movs	r0, #15
  71 003a FFF7FEFF 		bl	key_is_active
  72              	.LVL3:
  73 003e 0028     		cmp	r0, #0
  74 0040 03D0     		beq	.L5
  27:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot_2 += 1;
  75              		.loc 1 27 0
  76 0042 234A     		ldr	r2, .L13
  77 0044 5368     		ldr	r3, [r2, #4]
  78 0046 0133     		adds	r3, r3, #1
  79 0048 5360     		str	r3, [r2, #4]
  80              	.L5:
  28:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  29:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  30:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x7)) {
  81              		.loc 1 30 0
  82 004a 0720     		movs	r0, #7
  83 004c FFF7FEFF 		bl	key_is_active
  84              	.LVL4:
  85 0050 0028     		cmp	r0, #0
  86 0052 03D0     		beq	.L6
  31:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_x -= 1;
  87              		.loc 1 31 0
  88 0054 1E4A     		ldr	r2, .L13
  89 0056 9368     		ldr	r3, [r2, #8]
  90 0058 013B     		subs	r3, r3, #1
  91 005a 9360     		str	r3, [r2, #8]
  92              	.L6:
  32:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  33:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x9)) {
  93              		.loc 1 33 0
  94 005c 0920     		movs	r0, #9
  95 005e FFF7FEFF 		bl	key_is_active
  96              	.LVL5:
  97 0062 0028     		cmp	r0, #0
  98 0064 03D0     		beq	.L7
  34:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_x += 1;
  99              		.loc 1 34 0
 100 0066 1A4A     		ldr	r2, .L13
 101 0068 9368     		ldr	r3, [r2, #8]
 102 006a 0133     		adds	r3, r3, #1
 103 006c 9360     		str	r3, [r2, #8]
 104              	.L7:
  35:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  36:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  37:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x2)) {
 105              		.loc 1 37 0
 106 006e 0220     		movs	r0, #2
 107 0070 FFF7FEFF 		bl	key_is_active
 108              	.LVL6:
 109 0074 0028     		cmp	r0, #0
 110 0076 03D0     		beq	.L8
  38:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_y -= 1;
 111              		.loc 1 38 0
 112 0078 154A     		ldr	r2, .L13
 113 007a D368     		ldr	r3, [r2, #12]
 114 007c 013B     		subs	r3, r3, #1
 115 007e D360     		str	r3, [r2, #12]
 116              	.L8:
  39:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  40:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x0)) {
 117              		.loc 1 40 0
 118 0080 0020     		movs	r0, #0
 119 0082 FFF7FEFF 		bl	key_is_active
 120              	.LVL7:
 121 0086 0028     		cmp	r0, #0
 122 0088 03D0     		beq	.L9
  41:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_y += 1;
 123              		.loc 1 41 0
 124 008a 114A     		ldr	r2, .L13
 125 008c D368     		ldr	r3, [r2, #12]
 126 008e 0133     		adds	r3, r3, #1
 127 0090 D360     		str	r3, [r2, #12]
 128              	.L9:
  42:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  43:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  44:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x5)) {
 129              		.loc 1 44 0
 130 0092 0520     		movs	r0, #5
 131 0094 FFF7FEFF 		bl	key_is_active
 132              	.LVL8:
 133 0098 0028     		cmp	r0, #0
 134 009a 03D0     		beq	.L10
  45:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_z -= 1;
 135              		.loc 1 45 0
 136 009c 0C4A     		ldr	r2, .L13
 137 009e 1369     		ldr	r3, [r2, #16]
 138 00a0 013B     		subs	r3, r3, #1
 139 00a2 1361     		str	r3, [r2, #16]
 140              	.L10:
  46:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  47:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x8)) {
 141              		.loc 1 47 0
 142 00a4 0820     		movs	r0, #8
 143 00a6 FFF7FEFF 		bl	key_is_active
 144              	.LVL9:
 145 00aa 0028     		cmp	r0, #0
 146 00ac 03D0     		beq	.L11
  48:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_z += 1;
 147              		.loc 1 48 0
 148 00ae 084A     		ldr	r2, .L13
 149 00b0 1369     		ldr	r3, [r2, #16]
 150 00b2 0133     		adds	r3, r3, #1
 151 00b4 1361     		str	r3, [r2, #16]
 152              	.L11:
  49:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  50:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  51:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x1)) {
 153              		.loc 1 51 0
 154 00b6 0120     		movs	r0, #1
 155 00b8 FFF7FEFF 		bl	key_is_active
 156              	.LVL10:
 157 00bc 0028     		cmp	r0, #0
 158 00be 06D0     		beq	.L1
  52:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_x = 0;
 159              		.loc 1 52 0
 160 00c0 034B     		ldr	r3, .L13
 161 00c2 0022     		movs	r2, #0
 162 00c4 9A60     		str	r2, [r3, #8]
  53:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_y = 0;
 163              		.loc 1 53 0
 164 00c6 DA60     		str	r2, [r3, #12]
  54:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_z = 0;
 165              		.loc 1 54 0
 166 00c8 1A61     		str	r2, [r3, #16]
  55:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot = 0;
 167              		.loc 1 55 0
 168 00ca 1A60     		str	r2, [r3]
  56:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         camera_rot_2 = 0;
 169              		.loc 1 56 0
 170 00cc 5A60     		str	r2, [r3, #4]
 171              	.L1:
  57:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  58:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
 172              		.loc 1 58 0
 173              		@ sp needed
 174 00ce 10BD     		pop	{r4, pc}
 175              	.L14:
 176              		.align	2
 177              	.L13:
 178 00d0 00000000 		.word	.LANCHOR0
 179              		.cfi_endproc
 180              	.LFE0:
 182              		.align	1
 183              		.global	game_init
 184              		.syntax unified
 185              		.code	16
 186              		.thumb_func
 187              		.fpu softvfp
 189              	game_init:
 190              	.LFB1:
  59:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  60:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void game_init() {
 191              		.loc 1 60 0
 192              		.cfi_startproc
 193              		@ args = 0, pretend = 0, frame = 0
 194              		@ frame_needed = 0, uses_anonymous_args = 0
 195 00d4 10B5     		push	{r4, lr}
 196              		.cfi_def_cfa_offset 8
 197              		.cfi_offset 4, -8
 198              		.cfi_offset 14, -4
  61:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_clear();
 199              		.loc 1 61 0
 200 00d6 FFF7FEFF 		bl	canvas_clear
 201              	.LVL11:
  62:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
 202              		.loc 1 62 0
 203              		@ sp needed
 204 00da 10BD     		pop	{r4, pc}
 205              		.cfi_endproc
 206              	.LFE1:
 208              		.align	1
 209              		.global	game_loop
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	game_loop:
 216              	.LFB2:
  63:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  64:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void game_loop() {
 217              		.loc 1 64 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 0
 220              		@ frame_needed = 0, uses_anonymous_args = 0
 221 00dc 10B5     		push	{r4, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 4, -8
 224              		.cfi_offset 14, -4
  65:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     handle_input();
 225              		.loc 1 65 0
 226 00de FFF7FEFF 		bl	handle_input
 227              	.LVL12:
  66:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  67:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_clear();
 228              		.loc 1 67 0
 229 00e2 FFF7FEFF 		bl	canvas_clear
 230              	.LVL13:
  68:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     
  69:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_pixel(10,10,1);
 231              		.loc 1 69 0
 232 00e6 0122     		movs	r2, #1
 233 00e8 0A21     		movs	r1, #10
 234 00ea 0A20     		movs	r0, #10
 235 00ec FFF7FEFF 		bl	canvas_pixel
 236              	.LVL14:
  70:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     
  71:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_flush();
 237              		.loc 1 71 0
 238 00f0 FFF7FEFF 		bl	canvas_flush
 239              	.LVL15:
  72:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }...
 240              		.loc 1 72 0
 241              		@ sp needed
 242 00f4 10BD     		pop	{r4, pc}
 243              		.cfi_endproc
 244              	.LFE2:
 246              		.global	camera_rot_2
 247              		.global	camera_rot
 248              		.global	camera_z
 249              		.global	camera_y
 250              		.global	camera_x
 251              		.bss
 252              		.align	2
 253              		.set	.LANCHOR0,. + 0
 256              	camera_rot:
 257 0000 00000000 		.space	4
 260              	camera_rot_2:
 261 0004 00000000 		.space	4
 264              	camera_x:
 265 0008 00000000 		.space	4
 268              	camera_y:
 269 000c 00000000 		.space	4
 272              	camera_z:
 273 0010 00000000 		.space	4
 274              		.text
 275              	.Letext0:
 276              		.file 2 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/canvas.h"
 277              		.file 3 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/external.h"

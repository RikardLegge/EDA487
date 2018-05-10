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
<<<<<<< Updated upstream
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
=======
  24              		.file 1 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c"
   1:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "game.h"
   2:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
   3:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "util.h"
   4:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "external.h"
   5:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "canvas.h"
   6:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "sprite.h"
   7:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** #include "vector_drawing.h"
   8:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
   9:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int player_x = 0;
  10:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** int player_y = 0;
  11:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  12:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void handle_input() {
  25              		.loc 1 12 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 0, uses_anonymous_args = 0
  29 0000 10B5     		push	{r4, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 4, -8
  32              		.cfi_offset 14, -4
  13:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x7)) {
  33              		.loc 1 13 0
  34 0002 0720     		movs	r0, #7
  35 0004 FFF7FEFF 		bl	key_is_active
  36              	.LVL0:
  37 0008 0028     		cmp	r0, #0
  38 000a 03D0     		beq	.L2
  14:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_x -= 1;
  39              		.loc 1 14 0
  40 000c 144A     		ldr	r2, .L7
  41 000e 1368     		ldr	r3, [r2]
  42 0010 013B     		subs	r3, r3, #1
  43 0012 1360     		str	r3, [r2]
  44              	.L2:
  15:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  16:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x9)) {
  45              		.loc 1 16 0
  46 0014 0920     		movs	r0, #9
  47 0016 FFF7FEFF 		bl	key_is_active
  48              	.LVL1:
  49 001a 0028     		cmp	r0, #0
  50 001c 03D0     		beq	.L3
  17:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_x += 1;
  51              		.loc 1 17 0
  52 001e 104A     		ldr	r2, .L7
  53 0020 1368     		ldr	r3, [r2]
  54 0022 0133     		adds	r3, r3, #1
  55 0024 1360     		str	r3, [r2]
  56              	.L3:
  18:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  19:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  20:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x2)) {
  57              		.loc 1 20 0
  58 0026 0220     		movs	r0, #2
  59 0028 FFF7FEFF 		bl	key_is_active
  60              	.LVL2:
  61 002c 0028     		cmp	r0, #0
  62 002e 03D0     		beq	.L4
  21:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_y -= 1;
  63              		.loc 1 21 0
  64 0030 0B4A     		ldr	r2, .L7
  65 0032 5368     		ldr	r3, [r2, #4]
  66 0034 013B     		subs	r3, r3, #1
  67 0036 5360     		str	r3, [r2, #4]
  68              	.L4:
  22:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  23:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x0)) {
  69              		.loc 1 23 0
  70 0038 0020     		movs	r0, #0
  71 003a FFF7FEFF 		bl	key_is_active
  72              	.LVL3:
  73 003e 0028     		cmp	r0, #0
  74 0040 03D0     		beq	.L5
  24:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_y += 1;
  75              		.loc 1 24 0
  76 0042 074A     		ldr	r2, .L7
  77 0044 5368     		ldr	r3, [r2, #4]
  78 0046 0133     		adds	r3, r3, #1
  79 0048 5360     		str	r3, [r2, #4]
  80              	.L5:
  25:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  26:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  27:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     if (key_is_active(0x1)) {
  81              		.loc 1 27 0
  82 004a 0120     		movs	r0, #1
  83 004c FFF7FEFF 		bl	key_is_active
  84              	.LVL4:
  85 0050 0028     		cmp	r0, #0
  86 0052 03D0     		beq	.L1
  28:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_x = 0;
  87              		.loc 1 28 0
  88 0054 024B     		ldr	r3, .L7
  89 0056 0022     		movs	r2, #0
  90 0058 1A60     		str	r2, [r3]
  29:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****         player_y = 0;
  91              		.loc 1 29 0
  92 005a 5A60     		str	r2, [r3, #4]
  93              	.L1:
  30:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     }
  31:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
  94              		.loc 1 31 0
  95              		@ sp needed
  96 005c 10BD     		pop	{r4, pc}
  97              	.L8:
  98 005e C046     		.align	2
  99              	.L7:
 100 0060 00000000 		.word	.LANCHOR0
 101              		.cfi_endproc
 102              	.LFE0:
 104              		.align	1
 105              		.global	game_init
 106              		.syntax unified
 107              		.code	16
 108              		.thumb_func
 109              		.fpu softvfp
 111              	game_init:
 112              	.LFB1:
  32:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  33:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void game_init() {
 113              		.loc 1 33 0
 114              		.cfi_startproc
 115              		@ args = 0, pretend = 0, frame = 0
 116              		@ frame_needed = 0, uses_anonymous_args = 0
 117 0064 10B5     		push	{r4, lr}
 118              		.cfi_def_cfa_offset 8
 119              		.cfi_offset 4, -8
 120              		.cfi_offset 14, -4
  34:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_clear();
 121              		.loc 1 34 0
 122 0066 FFF7FEFF 		bl	canvas_clear
 123              	.LVL5:
  35:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
 124              		.loc 1 35 0
 125              		@ sp needed
 126 006a 10BD     		pop	{r4, pc}
 127              		.cfi_endproc
 128              	.LFE1:
 130              		.align	1
 131              		.global	move_player
 132              		.syntax unified
 133              		.code	16
 134              		.thumb_func
 135              		.fpu softvfp
 137              	move_player:
 138              	.LFB2:
  36:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  37:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void move_player(){
 139              		.loc 1 37 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 0
 142              		@ frame_needed = 0, uses_anonymous_args = 0
 143              		@ link register save eliminated.
  38:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     
  39:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
 144              		.loc 1 39 0
 145              		@ sp needed
 146 006c 7047     		bx	lr
 147              		.cfi_endproc
 148              	.LFE2:
 150              		.align	1
 151              		.global	game_loop
 152              		.syntax unified
 153              		.code	16
 154              		.thumb_func
 155              		.fpu softvfp
 157              	game_loop:
 158              	.LFB3:
  40:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  41:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** void game_loop() {
 159              		.loc 1 41 0
 160              		.cfi_startproc
 161              		@ args = 0, pretend = 0, frame = 0
 162              		@ frame_needed = 0, uses_anonymous_args = 0
 163 006e 10B5     		push	{r4, lr}
 164              		.cfi_def_cfa_offset 8
 165              		.cfi_offset 4, -8
 166              		.cfi_offset 14, -4
  42:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     handle_input();
 167              		.loc 1 42 0
 168 0070 FFF7FEFF 		bl	handle_input
 169              	.LVL6:
  43:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** 
  44:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_clear();
 170              		.loc 1 44 0
 171 0074 FFF7FEFF 		bl	canvas_clear
 172              	.LVL7:
  45:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     
  46:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_pixel(player_x,player_y,1);
 173              		.loc 1 46 0
 174 0078 044B     		ldr	r3, .L12
 175 007a 5968     		ldr	r1, [r3, #4]
 176 007c 1868     		ldr	r0, [r3]
 177 007e 0122     		movs	r2, #1
 178 0080 FFF7FEFF 		bl	canvas_pixel
 179              	.LVL8:
  47:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     
  48:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c ****     canvas_flush();
 180              		.loc 1 48 0
 181 0084 FFF7FEFF 		bl	canvas_flush
 182              	.LVL9:
  49:/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c **** }
 183              		.loc 1 49 0
 184              		@ sp needed
 185 0088 10BD     		pop	{r4, pc}
 186              	.L13:
 187 008a C046     		.align	2
 188              	.L12:
 189 008c 00000000 		.word	.LANCHOR0
 190              		.cfi_endproc
 191              	.LFE3:
 193              		.global	player_y
 194              		.global	player_x
 195              		.bss
 196              		.align	2
 197              		.set	.LANCHOR0,. + 0
 200              	player_x:
 201 0000 00000000 		.space	4
 204              	player_y:
 205 0004 00000000 		.space	4
 206              		.text
 207              	.Letext0:
 208              		.file 2 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/canvas.h"
 209              		.file 3 "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/external.h"
>>>>>>> Stashed changes

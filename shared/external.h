#ifndef ARM_DISPLAY_EMULATOR_LCD_H
#define ARM_DISPLAY_EMULATOR_LCD_H

#define LCD_E       0x40
#define LCD_RESET   0x20
#define LCD_CS2     0x10
#define LCD_CS1     0x08
#define LCD_SELECT  0x04
#define LCD_RW      0x02
#define LCD_RS      0x01

#define LCD_BUSY    0x80
#define LCD_OFF     0x3E
#define LCD_ON      0x3F
#define LCD_SET_LINE      0xC0
#define LCD_SET_ADDRESS   0x40
#define LCD_SET_PAGE      0xB8

#define Ascii_E 0x40
#define Ascii_SELECT 0x04
#define Ascii_RW 0x02
#define Ascii_RS 0x01

#include "util.h"

#endif //ARM_DISPLAY_EMULATOR_LCD_H

void lcd_write_command(uint8_t command, uint8_t controller);
void lcd_write_data(uint8_t command, uint8_t controller);

void ascii_write_text(char* string, int x, int y);

int key_is_active(int hex);
void delay_milli(unsigned int ms);

int rand();
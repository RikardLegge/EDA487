#include "canvas.h"
#include "external.h"

int lcd_change_count = 0;
uint8_t lcd_frame_buffer[1024];
uint8_t lcd_written_buffer[1024];

void canvas_flush_dirty() {
    for_range(0, 1024) {
        int is_dirty = lcd_frame_buffer[index] != lcd_written_buffer[index];
        if(is_dirty) {
            uint8_t address = index % 64;
            uint8_t page = index / 64;
            uint8_t value = lcd_frame_buffer[index];

            int controller = LCD_CS1;
            if(index >= 512) {
                controller = LCD_CS2;
                page -= 8;
            }

            lcd_write_command(LCD_SET_ADDRESS | address, controller);
            lcd_write_command(LCD_SET_PAGE | page, controller);

            lcd_write_data(value, controller);
            lcd_written_buffer[index] = value;
        }
    }
    lcd_change_count = 0;
}

void canvsa_flush_dirty_2() {
    for_range(0, 512) {
        int is_dirty_1 = lcd_frame_buffer[index] != lcd_written_buffer[index];
        int is_dirty_2 = lcd_frame_buffer[index+512] != lcd_written_buffer[index+512];

        uint8_t address = index % 64;
        uint8_t page = index / 64;

        if(is_dirty_1 && is_dirty_2 && (lcd_frame_buffer[index] == lcd_frame_buffer[index+512])) {
            uint8_t value = lcd_frame_buffer[index];

            lcd_write_command(LCD_SET_ADDRESS | address, LCD_CS1|LCD_CS2);
            lcd_write_command(LCD_SET_PAGE | page, LCD_CS1|LCD_CS2);
            lcd_write_data(value, LCD_CS1|LCD_CS2);

            lcd_written_buffer[index] = value;
            lcd_written_buffer[index+512] = value;
            continue;
        }

        if(is_dirty_1) {
            uint8_t value = lcd_frame_buffer[index];

            lcd_write_command(LCD_SET_ADDRESS | address, LCD_CS1);
            lcd_write_command(LCD_SET_PAGE | page, LCD_CS1);
            lcd_write_data(value, LCD_CS1);

            lcd_written_buffer[index] = value;
        }
        if(is_dirty_2) {
            uint8_t value = lcd_frame_buffer[index+512];

            lcd_write_command(LCD_SET_ADDRESS | address, LCD_CS2);
            lcd_write_command(LCD_SET_PAGE | page, LCD_CS2);
            lcd_write_data(value, LCD_CS2);

            lcd_written_buffer[index+512] = value;
        }
    }
    lcd_change_count = 0;
}

void canvas_flush_all() {
    int current_byte = 0;
    for(int page = 0; page < 8; page++) {
        lcd_write_command(LCD_SET_ADDRESS, LCD_CS1|LCD_CS2);
        lcd_write_command(LCD_SET_PAGE | page, LCD_CS1|LCD_CS2);
        for(int address = 0; address < 64; address++, current_byte++) {
            uint8_t value1 = lcd_frame_buffer[current_byte];
            uint8_t value2 = lcd_frame_buffer[current_byte+512];

            if(value1 == value2) {
                lcd_write_data(value1, LCD_CS1|LCD_CS2);
            } else {
                lcd_write_data(value1, LCD_CS1);
                lcd_write_data(value2, LCD_CS2);
            }

            lcd_written_buffer[current_byte] = value1;
            lcd_written_buffer[current_byte+512] = value2;
        }
    }
    lcd_change_count = 0;
}

void canvas_flush() {
    if(lcd_change_count < 512) {
        canvas_flush_dirty();
    } else {
        canvas_flush_all();
    }
}

void canvas_clear() {
    for_range(0, 1024) {
        lcd_frame_buffer[index] = 0;
    }
}

void canvas_pixel(int x, int y, uint8_t set) {
    if (0 > x || 0 >  y || x >= 128 || y >= 64)
        return;

    int index = 0;
    if (x >= 64) {
        x -= 64;
        index = 512;
    }

    uint8_t mask = 0x1 << (y % 8);
    index += x + (y / 8) * 64;

    if (set) {
        lcd_frame_buffer[index] |= mask;
    } else {
        lcd_frame_buffer[index] &= ~mask;
    }
    lcd_change_count++;
}

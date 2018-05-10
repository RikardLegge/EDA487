#include "../shared/util.h"
#include "../shared/external.h"

// GPIO

typedef struct GPIO {
    int mode;
    short type;
    short _reserved;
    int speed;
    int pupdr;
    union {
        short input;
        struct {
            char input_low;
            char input_high;
        };
    };
    short __reserved;
    union {
        short output;
        struct {
            char output_low;
            char output_high;
        };
    };
    short ___reserved;
} GPIO;

#define PORT_D 0x40020C00
#define PORT_E 0x40021000

GPIO* gpio_d = (GPIO*) PORT_D; 
GPIO* gpio_e = (GPIO*) PORT_E; 


// Keyboard

void keyboard_activate_row(int row) {
    char value = (0x10 << row);
    gpio_d->output_high = value;
}

char keyboard_read_col(int col) {
    char value = gpio_d->input_high;
    char bit_set = (value >> col) & 0x1;
    return bit_set;
}

int is_key_row_col_active(int row, int col) {
    keyboard_activate_row(row);
    return keyboard_read_col(col);
}

int keyboard_index_active(int index) {
    int row = index / 4;
    int col = index % 4;
    return is_key_row_col_active(row, col);
}

int key_is_active(int hex) {
    char hex_to_index[] = {
        0xD,
        0x0, 0x1, 0x2, 
        0x4, 0x5, 0x6, 
        0x8, 0x9, 0xA, 
        0x3, 0x7, 0xB, 0xF, 
        0xC, 0xE};
    int index = hex_to_index[hex];
    return keyboard_index_active(index);
}

// delay

typedef struct Clock {
    int ctrl;
    int load;
    int val;
} Clock;

#define CLOCK_ADDR 0xE000E010
Clock* clock = (Clock*) CLOCK_ADDR;

void delay_250ns(void) {
    clock->ctrl = 0;
    clock->load = 168 - 1;
    clock->ctrl = 5;
    clock->val = 0;
    while(!(clock->ctrl & 0x10000)) {}
    clock->ctrl = 0;
}

void delay_500ns(void) {
    delay_250ns();
    delay_250ns();
}

void delay_micro(unsigned int us) {
    for(unsigned int i = 0; i < us; i++) {
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
    }
}

void delay_milli(unsigned int ms) {
#ifdef USBDM
    ms *= 1000
#endif
    delay_micro(ms);
}

// LCD

static
void lcd_ctrl_bit_set(uint8_t bits) {
    char ctrl = gpio_e->output_low;
    ctrl |= bits;
    ctrl &= ~LCD_SELECT;
    gpio_e->output_low = ctrl;
}

static
void lcd_ctrl_bit_clear(uint8_t bits) {
    char ctrl = gpio_e->output_low;
    ctrl &= ~bits;
    ctrl &= ~LCD_SELECT;
    gpio_e->output_low = ctrl;
}

static
void lcd_select_controller(uint8_t controller) {
    if(controller == 0) {
        lcd_ctrl_bit_clear(LCD_CS1|LCD_CS2);
    }
    if(controller == LCD_CS1) {
        lcd_ctrl_bit_set(LCD_CS1);
        lcd_ctrl_bit_clear(LCD_CS2);
    }
    if(controller == LCD_CS2) {
        lcd_ctrl_bit_clear(LCD_CS1);
        lcd_ctrl_bit_set(LCD_CS2);
    }
    if(controller == (LCD_CS1 | LCD_CS2)) {
        lcd_ctrl_bit_set(LCD_CS1 | LCD_CS2);
    }
}

static
void lcd_wait_ready(void) {
    lcd_ctrl_bit_clear(LCD_E);
    gpio_e->mode = 0x00005555;
    lcd_ctrl_bit_clear(LCD_RS);
    lcd_ctrl_bit_set(LCD_RW);
    delay_500ns();
    
    repeat_forever {
        lcd_ctrl_bit_set(LCD_E);
        delay_500ns();
        lcd_ctrl_bit_clear(LCD_E);
        delay_500ns();
        if(!(gpio_e->input_high & LCD_BUSY)) break;
    }
    
//    while(gpio_e->input_high & LCD_BUSY) {
//        lcd_ctrl_bit_clear(LCD_E);
//        delay_500ns();
//        lcd_ctrl_bit_set(LCD_E);
//        delay_500ns();
//    }
    
    lcd_ctrl_bit_set(LCD_E);
    gpio_e->mode = 0x55555555;
}

static
void lcd_write(uint8_t value, uint8_t controller) {
    gpio_e->output_high = value;
    lcd_select_controller(controller);
    delay_500ns();
    
    lcd_ctrl_bit_set(LCD_E);
    delay_500ns();
    
    lcd_ctrl_bit_clear(LCD_E);
    
    if(controller & LCD_CS1) {
        lcd_select_controller(LCD_CS1);
        lcd_wait_ready();
    }
    if(controller & LCD_CS2) {
        lcd_select_controller(LCD_CS2);
        lcd_wait_ready();
    }
    
    gpio_e->output_high = 0;
    lcd_ctrl_bit_set(LCD_E);
    lcd_select_controller(0);
}


void lcd_write_command(uint8_t command, uint8_t controller) {
    lcd_ctrl_bit_clear(LCD_E);
    lcd_select_controller(controller);
    lcd_ctrl_bit_clear(LCD_RS|LCD_RW);
    
    lcd_write(command, controller);
}


void lcd_write_data(uint8_t data, uint8_t controller) {
    lcd_ctrl_bit_clear(LCD_E);
    lcd_select_controller(controller);
    lcd_ctrl_bit_clear(LCD_RW);
    lcd_ctrl_bit_set(LCD_RS);
    
    lcd_write(data, controller);
}

void lcd_init() {
    lcd_ctrl_bit_set(LCD_E);
    delay_micro(10);
    
    lcd_ctrl_bit_clear(LCD_CS1|LCD_CS2|LCD_RESET|LCD_E);
    delay_micro(30);
    
    lcd_ctrl_bit_set(LCD_RESET);
    
    lcd_write_command(LCD_OFF, LCD_CS1|LCD_CS2);
    lcd_write_command(LCD_ON, LCD_CS1|LCD_CS2);
    lcd_write_command(LCD_SET_LINE, LCD_CS1|LCD_CS2);
    lcd_write_command(LCD_SET_ADDRESS, LCD_CS1|LCD_CS2);
    lcd_write_command(LCD_SET_PAGE, LCD_CS1|LCD_CS2);
    
    lcd_select_controller(0);
}

void lcd_clear_screen() {
    for(int page = 0; page < 8; page++) {
        lcd_write_command(LCD_SET_PAGE | page, LCD_CS1 | LCD_CS2);
        lcd_write_command(LCD_SET_ADDRESS | 0, LCD_CS1 | LCD_CS2);
        for(int address = 0; address < 64; address++) {
            lcd_write_data(0, LCD_CS1 | LCD_CS2);
        }
    }
}

// ASCII

static
void ascii_ctrl_bit_set(unsigned char bits) {
    char ctrl = gpio_e->output_low;
    ctrl |= bits;
    ctrl |= Ascii_SELECT;
    gpio_e->output_low = ctrl;
}

static
void ascii_ctrl_bit_clear(unsigned char bits) {
    char ctrl = gpio_e->output_low;
    ctrl &= ~bits;
    ctrl |= Ascii_SELECT;
    gpio_e->output_low = ctrl;
}

void ascii_write_controller(unsigned char command) {
    ascii_ctrl_bit_set(Ascii_E);
    gpio_e->output_high = command;
    delay_250ns();

    ascii_ctrl_bit_clear(Ascii_E);
}

unsigned char ascii_read_controller(void) {
    ascii_ctrl_bit_set(Ascii_E);
    delay_250ns();
    delay_250ns();

    unsigned char value = gpio_e->input_high;
    ascii_ctrl_bit_clear(Ascii_E);

    return value;
}

void ascii_write_cmd(unsigned char command) {
    ascii_ctrl_bit_clear(Ascii_RS|Ascii_RW);
    ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
    ascii_ctrl_bit_set(Ascii_RS);
    ascii_ctrl_bit_clear(Ascii_RW);
    ascii_write_controller(data);
}

unsigned char ascii_read_status(void) {
    gpio_e->mode = 0x00005555;
    ascii_ctrl_bit_set(Ascii_RW);
    ascii_ctrl_bit_clear(Ascii_RS);

    unsigned char value = ascii_read_controller();

    gpio_e->mode = 0x55555555;
    return value;
}

unsigned char ascii_read_data(void) {
    gpio_e->mode = 0x00005555;
    ascii_ctrl_bit_set(Ascii_RW|Ascii_RS);

    unsigned char value = ascii_read_controller();

    gpio_e->mode = 0x55555555;
    return value;
}

void ascii_await_status_zero(void) {
    while((ascii_read_status() & 0x80) == 0x80) {}
    delay_micro(8);
}

void ascii_init(void) {
    // Function Set
    ascii_ctrl_bit_clear(Ascii_RW|Ascii_RS);
    ascii_write_cmd(0x38);

    // Display controll
    ascii_ctrl_bit_clear(Ascii_RW|Ascii_RS);
    ascii_write_cmd(0x0E);

    // Clear display
    ascii_await_status_zero();
    ascii_write_cmd(1);
    delay_milli(2);

    // Entry mode set
    ascii_ctrl_bit_clear(Ascii_RW|Ascii_RS);
    ascii_write_cmd(0x06);
}

void ascii_write_char(char c) {
    ascii_await_status_zero();
    ascii_write_data(c);
    delay_micro(45);
}

void ascii_cursor(int row, int col) {
    int address = row-1;
    if(col == 2) address += 0x40;
    ascii_write_cmd(0x80 | address);
}

void ascii_write_text(char* string, int x, int y) {
    ascii_cursor(x,y);
    while(*string)
        ascii_write_char(*string++);
}

// main

void device_init() {
    gpio_d->mode = 0x55005555;
    gpio_d->type = 0x0F00;
    gpio_d->pupdr = 0x00AA0000;
    
    gpio_e->type &= 0x0;
    gpio_e->speed = 0x55555555;
    gpio_e->mode = 0x55555555;
    
    lcd_init();
    ascii_init();
}
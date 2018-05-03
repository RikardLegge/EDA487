#include "sdl_emulator.h"
#include "../shared/external.h"
#include <SDL2/SDL.h>

static SDL_Window *window = NULL;
static SDL_Renderer* renderer;
static SDL_Texture* texture;
static SDL_GLContext gl_context;
static Uint32 emulator_buffer[128*64];

int emulator_address_1 = 0;
int emulator_page_1 = 0;
int emulator_address_2 = 0;
int emulator_page_2 = 0;

int emulator_should_exit = 0;
int keyboard_input_keys[322];

int emulator_exit() {
    return emulator_should_exit;
}

int SDLCALL watch(void *userdata, SDL_Event *event) {
    switch (event->type) {
        case SDL_APP_WILLENTERBACKGROUND:
            emulator_should_exit = 1;
            break;
    }
    return 1;
}

void emulator_init() {
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS) != 0) {
        SDL_Log("Failed to initialize SDL: %s", SDL_GetError());
        exit(1);
    }

    window = SDL_CreateWindow("LCD Emulator", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 1024, 512,
                              SDL_WINDOW_OPENGL);

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    texture = SDL_CreateTexture(renderer,
                                             SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, 128, 64);

    SDL_AddEventWatch(watch, NULL);
}

void emulator_dispose() {
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    SDL_DelEventWatch(watch, NULL);
}

void emulator_poll_keyboard() {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        int key_code = SDL_GetScancodeFromKey(event.key.keysym.sym);
        switch (event.type) {
            case SDL_KEYDOWN:
                if (event.key.repeat == 0) {
                    keyboard_input_keys[key_code] = 1;
                }
                break;
            case SDL_KEYUP:
                keyboard_input_keys[key_code] = 0;
                break;
            case SDL_QUIT:
                emulator_should_exit = 1;
        }
    }
}

void emulator_end_frame() {
    emulator_poll_keyboard();

    SDL_UpdateTexture(texture, NULL, emulator_buffer, 128 * sizeof(Uint32));
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, NULL, NULL);
    SDL_RenderPresent(renderer);
}

void lcd_write_command(uint8_t command, uint8_t controller) {
    int address = command & (63);
    int page = command & (7);

    if (controller & LCD_CS1) {
        if (command & LCD_SET_ADDRESS) {
            emulator_address_1 = address;
        } else if (command & LCD_SET_PAGE) {
            emulator_page_1 = page;
        }
    }
    if (controller & LCD_CS2) {
        if (command & LCD_SET_ADDRESS) {
            emulator_address_2 = address;
        } else if (command & LCD_SET_PAGE) {
            emulator_page_2 = page;
        }
    }
}

void lcd_write_data(uint8_t data, uint8_t controller) {
    float ds = (float)1/256;
    float dh = (float) 1 / 64 * 2;
    float dw = (float) 1 / 128 * 2;

    for_range(0, 8) {
        int set = data & (1 << index);
        unsigned int color = 0;
        if (set) {
            color = 0xFFFFFFFF;
        } else {
            color = 0xFF000000;
        }

        if (controller & LCD_CS1) {
            emulator_buffer[(emulator_page_1*8+index) * 128 + emulator_address_1] = color;
        }
        if (controller & LCD_CS2) {
            emulator_buffer[(emulator_page_2*8+index) * 128 + 64+emulator_address_2] = color;
        }

    }

    if (controller & LCD_CS1) {
        emulator_address_1++;
    }
    if (controller & LCD_CS2) {
        emulator_address_2++;
    }
}

void delay_milli(unsigned int time) {
    SDL_Delay(time);
}

int key_is_active(int hex) {
    short hex_to_sdl[] = {
            SDL_SCANCODE_1, SDL_SCANCODE_2, SDL_SCANCODE_3,
            SDL_SCANCODE_Q, SDL_SCANCODE_W, SDL_SCANCODE_E,
            SDL_SCANCODE_A, SDL_SCANCODE_S, SDL_SCANCODE_D,
            SDL_SCANCODE_Z, SDL_SCANCODE_X, SDL_SCANCODE_C,
    };

    short key = hex_to_sdl[hex];
    return keyboard_input_keys[key] != 0;
}

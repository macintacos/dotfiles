#include QMK_KEYBOARD_H
#ifdef AUDIO_ENABLE
#include "muse.h"
#endif
#include "eeprom.h"
#include "keymap_german.h"
#include "keymap_nordic.h"
#include "keymap_french.h"
#include "keymap_spanish.h"
#include "keymap_hungarian.h"
#include "keymap_swedish.h"
#include "keymap_br_abnt2.h"
#include "keymap_canadian_multilingual.h"
#include "keymap_german_ch.h"
#include "keymap_jp.h"
#include "keymap_bepo.h"

#define KC_MAC_UNDO LGUI(KC_Z)
#define KC_MAC_CUT LGUI(KC_X)
#define KC_MAC_COPY LGUI(KC_C)
#define KC_MAC_PASTE LGUI(KC_V)
#define KC_PC_UNDO LCTL(KC_Z)
#define KC_PC_CUT LCTL(KC_X)
#define KC_PC_COPY LCTL(KC_C)
#define KC_PC_PASTE LCTL(KC_V)
#define ES_LESS_MAC KC_GRAVE
#define ES_GRTR_MAC LSFT(KC_GRAVE)
#define ES_BSLS_MAC ALGR(KC_6)
#define NO_PIPE_ALT KC_GRAVE
#define NO_BSLS_ALT KC_EQUAL

enum planck_keycodes {
  RGB_SLD = EZ_SAFE_RANGE,
  DYNAMIC_MACRO_RANGE,
};

enum planck_layers {
  _BASE,
  _LOWER,
  _RAISE,
  _ADJUST,
  _LAYER4,
  _LAYER5,
  _LAYER6,
  _LAYER7,
  _LAYER8,
};

#include "dynamic_macro.h"

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_BASE] = LAYOUT_planck_grid(MT(MOD_MEH, KC_TAB),KC_Q,KC_W,KC_E,KC_R,KC_T,KC_Y,KC_U,KC_I,KC_O,KC_P,KC_BSPACE,LCTL_T(KC_ESCAPE),KC_A,KC_S,KC_D,KC_F,KC_G,KC_H,KC_J,KC_K,KC_L,KC_SCOLON,KC_QUOTE,KC_LSHIFT,KC_Z,KC_X,KC_C,KC_V,KC_B,KC_N,KC_M,KC_COMMA,KC_DOT,KC_SLASH,KC_ENTER,TG(4),KC_LCTRL,KC_LALT,OSM(MOD_LGUI),TT(1),KC_SPACE,KC_NO,TT(2),KC_LEFT,KC_DOWN,KC_UP,KC_RIGHT),

  [_LOWER] = LAYOUT_planck_grid(KC_GRAVE,KC_1,KC_2,KC_3,KC_4,KC_5,KC_6,KC_7,KC_8,KC_9,KC_0,KC_BSPACE,TO(0),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_MINUS,KC_EQUAL,KC_LBRACKET,KC_RBRACKET,KC_BSLASH,KC_LSHIFT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_ENTER,KC_TRANSPARENT,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_TRANSPARENT,LGUI(KC_SPACE),KC_NO,KC_TRANSPARENT,KC_MEDIA_PLAY_PAUSE,KC_AUDIO_VOL_DOWN,KC_AUDIO_VOL_UP,KC_AUDIO_MUTE),

  [_RAISE] = LAYOUT_planck_grid(KC_TILD,KC_EXLM,KC_AT,KC_HASH,KC_DLR,KC_PERC,KC_CIRC,KC_AMPR,KC_ASTR,KC_LPRN,KC_RPRN,KC_BSPACE,TO(0),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_UNDS,KC_PLUS,KC_LCBR,KC_RCBR,KC_PIPE,KC_LSHIFT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_ENTER,KC_TRANSPARENT,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_TRANSPARENT,RGUI(KC_SPACE),KC_NO,KC_TRANSPARENT,KC_MEDIA_PLAY_PAUSE,KC_AUDIO_VOL_DOWN,KC_AUDIO_VOL_UP,KC_AUDIO_MUTE),

  [_ADJUST] = LAYOUT_planck_grid(KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,TO(0),KC_TRANSPARENT,AU_ON,AU_OFF,AU_TOG,KC_TRANSPARENT,KC_TRANSPARENT,RGB_TOG,RGB_VAI,RGB_VAD,KC_TRANSPARENT,RESET,KC_TRANSPARENT,KC_TRANSPARENT,MU_ON,MU_OFF,MU_TOG,KC_TRANSPARENT,KC_TRANSPARENT,RGB_MOD,RGB_HUI,RGB_HUD,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_NO,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT),

  [_LAYER4] = LAYOUT_planck_grid(KC_TAB,KC_TRANSPARENT,LALT(KC_RIGHT),LALT(KC_RIGHT),LGUI(LSFT(KC_Z)),KC_TRANSPARENT,RGUI(KC_C),LGUI(KC_Z),TO(0),KC_TRANSPARENT,LGUI(KC_V),KC_LEFT,TO(0),TO(0),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_LEFT,KC_DOWN,KC_UP,KC_RIGHT,KC_TRANSPARENT,KC_TRANSPARENT,MO(6),KC_TRANSPARENT,KC_DELETE,TO(0),TG(5),LALT(KC_LEFT),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LGUI(KC_F),KC_DOWN,KC_TRANSPARENT,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),DYN_REC_START1,DYN_MACRO_PLAY1,KC_NO,DYN_REC_STOP,MO(8),KC_TRANSPARENT,KC_TRANSPARENT,TG(7)),

  [_LAYER5] = LAYOUT_planck_grid(KC_TRANSPARENT,KC_TRANSPARENT,LALT(LSFT(KC_RIGHT)),LALT(LSFT(KC_RIGHT)),KC_TRANSPARENT,KC_TRANSPARENT,LGUI(KC_C),KC_TRANSPARENT,TO(0),KC_TRANSPARENT,LGUI(KC_V),LSFT(KC_LEFT),TO(0),TO(0),KC_TRANSPARENT,LGUI(KC_X),KC_TRANSPARENT,KC_TRANSPARENT,LSFT(KC_LEFT),LSFT(KC_DOWN),LSFT(KC_UP),LSFT(KC_RIGHT),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,TO(0),KC_TRANSPARENT,LALT(LSFT(KC_LEFT)),KC_TRANSPARENT,KC_TRANSPARENT,LSFT(KC_TAB),KC_TAB,KC_TRANSPARENT,LSFT(KC_DOWN),TO(4),KC_LCTRL,KC_LALT,OSM(MOD_LGUI),DYN_REC_START1,DYN_MACRO_PLAY1,KC_NO,DYN_REC_START1,MO(8),KC_TRANSPARENT,KC_TRANSPARENT,TG(7)),

  [_LAYER6] = LAYOUT_planck_grid(KC_TRANSPARENT,KC_TRANSPARENT,LALT(KC_RIGHT),LALT(KC_RIGHT),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LGUI(KC_LEFT),KC_TRANSPARENT,LGUI(KC_P),KC_BSPACE,KC_TRANSPARENT,LGUI(KC_RIGHT),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LGUI(KC_DOWN),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_BSPACE,KC_TRANSPARENT,KC_TRANSPARENT,LALT(KC_LEFT),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_ENTER,KC_TRANSPARENT,KC_LCTRL,KC_LALT,OSM(MOD_LGUI),KC_TRANSPARENT,KC_TRANSPARENT,KC_NO,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT),

  [_LAYER7] = LAYOUT_planck_grid(KC_TRANSPARENT,LALT(LCTL(KC_Q)),LALT(LCTL(KC_W)),LALT(LCTL(KC_E)),KC_TRANSPARENT,LALT(LCTL(KC_T)),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LALT(LCTL(KC_P)),LALT(LCTL(KC_BSPACE)),TO(0),LALT(LCTL(KC_A)),LALT(LCTL(KC_S)),LALT(LCTL(KC_D)),LALT(LCTL(KC_F)),LALT(LCTL(KC_G)),LALT(LCTL(KC_H)),LALT(LCTL(KC_J)),LALT(LCTL(KC_K)),LALT(LCTL(KC_L)),KC_TRANSPARENT,LALT(LCTL(KC_QUOTE)),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LALT(LCTL(KC_C)),KC_TRANSPARENT,KC_TRANSPARENT,LALT(LCTL(KC_N)),KC_TRANSPARENT,LALT(LCTL(KC_COMMA)),LALT(LCTL(KC_DOT)),KC_TRANSPARENT,LALT(LCTL(KC_ENTER)),TO(4),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,DYN_REC_START1,DYN_MACRO_PLAY1,KC_NO,DYN_REC_STOP,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT),

  [_LAYER8] = LAYOUT_planck_grid(LGUI(KC_TAB),LGUI(KC_Q),RGUI(KC_W),RGUI(KC_E),RGUI(KC_R),RGUI(KC_T),RGUI(KC_Y),LGUI(KC_U),LGUI(KC_I),LGUI(KC_O),LGUI(KC_P),LGUI(KC_BSPACE),LGUI(KC_ESCAPE),LGUI(KC_A),LGUI(KC_S),LGUI(KC_D),LGUI(KC_F),LGUI(KC_G),LGUI(KC_H),LGUI(KC_J),LGUI(KC_K),LGUI(KC_L),LGUI(KC_SCOLON),RGUI(KC_QUOTE),KC_LSHIFT,LGUI(KC_Z),LGUI(KC_X),LGUI(KC_C),LGUI(KC_V),LGUI(KC_B),LGUI(KC_N),LGUI(KC_M),LGUI(KC_COMMA),LGUI(KC_DOT),RGUI(KC_SLASH),RGUI(KC_ENTER),KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,KC_TRANSPARENT,LGUI(KC_SPACE),KC_NO,KC_TRANSPARENT,KC_TRANSPARENT,KC_RALT,KC_RCTRL,KC_TRANSPARENT),

};

extern bool g_suspend_state;
extern rgb_config_t rgb_matrix_config;

void keyboard_post_init_user(void) {
  rgb_matrix_enable();
}

const uint8_t PROGMEM ledmap[][DRIVER_LED_TOTAL][3] = {
    [0] = { {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242}, {141,255,233}, {14,222,242}, {14,222,242}, {14,222,242}, {15,97,236}, {14,222,242}, {85,203,158}, {14,222,242}, {14,222,242}, {14,222,242}, {14,222,242} },

    [1] = { {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {14,222,242}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {15,97,236}, {0,0,0}, {15,97,236}, {15,97,236}, {15,97,236}, {14,222,242}, {15,97,236}, {233,218,217}, {15,97,236}, {15,97,236}, {15,97,236}, {15,97,236} },

    [2] = { {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {14,222,242}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {85,203,158}, {85,203,158}, {233,218,217}, {85,203,158}, {14,222,242}, {85,203,158}, {85,203,158}, {85,203,158}, {85,203,158} },

    [3] = { {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {14,222,242}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {249,228,255}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {233,218,217}, {233,218,217}, {233,218,217}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {233,218,217}, {0,0,0}, {233,218,217}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0} },

    [4] = { {141,255,233}, {0,0,0}, {141,255,233}, {141,255,233}, {141,255,233}, {0,0,0}, {141,255,233}, {141,255,233}, {14,222,242}, {0,0,0}, {141,255,233}, {141,255,233}, {14,222,242}, {14,222,242}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {141,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {141,255,233}, {14,222,242}, {169,120,255}, {141,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {141,255,233}, {141,255,233}, {14,222,242}, {141,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {141,255,233}, {243,222,234}, {0,0,0}, {0,0,0}, {180,255,233} },

    [5] = { {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {0,0,0}, {14,222,242}, {0,0,0}, {169,120,255}, {169,120,255}, {14,222,242}, {14,222,242}, {0,0,0}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {14,222,242}, {169,120,255}, {169,120,255}, {0,0,0}, {0,0,0}, {169,120,255}, {169,120,255}, {0,0,0}, {169,120,255}, {141,255,233}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {169,120,255}, {243,222,234}, {0,0,0}, {0,0,0}, {180,255,233} },

    [6] = { {0,0,0}, {0,0,0}, {85,203,158}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {85,203,158}, {0,0,0}, {85,203,158}, {85,203,158}, {85,203,158}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0} },

    [7] = { {0,0,0}, {180,255,233}, {180,255,233}, {180,255,233}, {0,0,0}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {180,255,233}, {180,255,233}, {14,222,242}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {180,255,233}, {0,0,0}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {180,255,233}, {0,0,0}, {0,0,0}, {180,255,233}, {0,0,0}, {180,255,233}, {180,255,233}, {0,0,0}, {180,255,233}, {141,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {180,255,233}, {180,255,233}, {180,255,233}, {0,0,0}, {0,0,0}, {0,0,0}, {180,255,233} },

    [8] = { {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {243,222,234}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {243,222,234}, {0,0,0}, {243,222,234}, {243,222,234}, {233,218,217}, {0,0,0} },

};

void set_layer_color(int layer) {
  for (int i = 0; i < DRIVER_LED_TOTAL; i++) {
    HSV hsv = {
      .h = pgm_read_byte(&ledmap[layer][i][0]),
      .s = pgm_read_byte(&ledmap[layer][i][1]),
      .v = pgm_read_byte(&ledmap[layer][i][2]),
    };
    if (!hsv.h && !hsv.s && !hsv.v) {
        rgb_matrix_set_color( i, 0, 0, 0 );
    } else {
        RGB rgb = hsv_to_rgb( hsv );
        float f = (float)rgb_matrix_config.hsv.v / UINT8_MAX;
        rgb_matrix_set_color( i, f * rgb.r, f * rgb.g, f * rgb.b );
    }
  }
}

void rgb_matrix_indicators_user(void) {
  if (g_suspend_state || keyboard_config.disable_layer_led) { return; }
  switch (biton32(layer_state)) {
    case 0:
      set_layer_color(0);
      break;
    case 1:
      set_layer_color(1);
      break;
    case 2:
      set_layer_color(2);
      break;
    case 3:
      set_layer_color(3);
      break;
    case 4:
      set_layer_color(4);
      break;
    case 5:
      set_layer_color(5);
      break;
    case 6:
      set_layer_color(6);
      break;
    case 7:
      set_layer_color(7);
      break;
    case 8:
      set_layer_color(8);
      break;
   default:
    if (rgb_matrix_get_flags() == LED_FLAG_NONE)
      rgb_matrix_set_color_all(0, 0, 0);
    break;
  }
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (!process_record_dynamic_macro(keycode, record)) {
    return false;
  }
  switch (keycode) {
    case RGB_SLD:
      if (record->event.pressed) {
        rgblight_mode(1);
      }
      return false;
  }
  return true;
}

#ifdef AUDIO_ENABLE
bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update(bool clockwise) {
    if (muse_mode) {
        if (IS_LAYER_ON(_RAISE)) {
            if (clockwise) {
                muse_offset++;
            } else {
                muse_offset--;
            }
        } else {
            if (clockwise) {
                muse_tempo+=1;
            } else {
                muse_tempo-=1;
            }
        }
    } else {
        if (clockwise) {
        #ifdef MOUSEKEY_ENABLE
            register_code(KC_MS_WH_DOWN);
            unregister_code(KC_MS_WH_DOWN);
        #else
            register_code(KC_PGDN);
            unregister_code(KC_PGDN);
        #endif
        } else {
        #ifdef MOUSEKEY_ENABLE
            register_code(KC_MS_WH_UP);
            unregister_code(KC_MS_WH_UP);
        #else
            register_code(KC_PGUP);
            unregister_code(KC_PGUP);
        #endif
        }
    }
}

void matrix_scan_user(void) {
#ifdef AUDIO_ENABLE
    if (muse_mode) {
        if (muse_counter == 0) {
            uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
            if (muse_note != last_muse_note) {
                stop_note(compute_freq_for_midi_note(last_muse_note));
                play_note(compute_freq_for_midi_note(muse_note), 0xF);
                last_muse_note = muse_note;
            }
        }
        muse_counter = (muse_counter + 1) % muse_tempo;
    }
#endif
}

bool music_mask_user(uint16_t keycode) {
    switch (keycode) {
    case RAISE:
    case LOWER:
        return false;
    default:
        return true;
    }
}
#endif

uint32_t layer_state_set_user(uint32_t state) {
    return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}

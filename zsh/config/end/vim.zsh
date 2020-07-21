#!/usr/local/bin/bash

# VIM STUFF {{{
# PLugin currently using: https://github.com/softmoth/zsh-vim-mode
VIM_MODE_VICMD_KEY='^X' # This jumps you to NORMAL faster than ESC

# Mode-sensitive Cursor Styling
MODE_CURSOR_VIINS="#000000 steady bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# }}}

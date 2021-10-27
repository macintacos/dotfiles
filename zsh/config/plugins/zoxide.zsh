# Description: A place for stuff related to zoxide's configuration
# Zoxide: https://github.com/ajeetdsouza/zoxide

export _ZO_EXCLUDE_DIRS="$HOME/Library/Containers/*"

# Dracula colors
local background="#0b0d0f"
local current_line="#131a20"
local selection="#131a20"
local foreground="#f8f8f2"
local comment="#6272a4"
local cyan="#8be9fd"
local green="#50fa7b"
local orange="#ffb86c"
local pink="#ff79c6"
local purple="#bd93f9"
local red="#ff5555"
local yellow="#f1fa8c"

export _ZO_FZF_OPTS="
  --height 60%
  --reverse
  --color=dark
  --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
  --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
  --bind=tab:down,btab:up
  --cycle
"

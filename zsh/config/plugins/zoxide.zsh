# Description: A place for stuff related to zoxide's configuration
# Zoxide: https://github.com/ajeetdsouza/zoxide

export _ZO_EXCLUDE_DIRS="$HOME/Library/Containers/*"

# Dracula colors
local background="#282a36"
local current_line="#44475a"
local selection="#44475a"
local foreground="#f8f8f2"
local comment="#6272a4"
local cyan="#8be9fd"
local green="#50fa7b"
local orange="#ffb86c"
local pink="#ff79c6"
local purple="#bd93f9"
local red="#ff5555"
local yellow="#f1fa8c"

# For Gruvbox
# export _ZO_FZF_OPTS="
#   --height 60%
#   --reverse
#   --color=light
#   --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
#   --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
#   --bind tab:down
#   --cycle
# "
# For Dracula
export _ZO_FZF_OPTS="
  --height 60%
  --reverse
  --color=dark
  --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
  --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
  --bind=tab:down,btab:up
  --cycle
"

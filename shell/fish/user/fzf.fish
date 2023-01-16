# Dracula colors
# set --local background "#0b0d0f"
# set --local current_line "#131a20"
# set --local selection "#131a20"
# set --local foreground "#f8f8f2"
# set --local foreground "#f8f8f2"
# set --local comment "#6272a4"
# set --local cyan "#8be9fd"
# set --local green "#50fa7b"
# set --local orange "#ffb86c"
# set --local pink "#ff79c6"
# set --local purple "#bd93f9"
# set --local red "#f5555"
# set --local yellow "#f1fa8c"

# Nightfox colors
set --local background "#192330"
set --local current_line "#2b3b51"
set --local selection "#2b3b51"
set --local foreground "#cdcecf"
set --local foreground "#cdcecf"
set --local comment "#738091"
set --local cyan "#63cdcf"
set --local green "#81b29a"
set --local orange "#f4a261"
set --local pink "#d67ad2"
set --local purple "#9d79d6"
set --local red "#c94f6d"
set --local yellow "#dbc074"

# FZF Default Settings
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --cycle
    --preview-window='right:60%'
    --ansi
    "

# `forgit` settings
set -x FORGIT_FZF_DEFAULT_OPTS "
    --ansi
    --height 60%
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --preview-window='right:60%'
    +1
"

# Zoxide FZF settings
set -gx _ZO_FZF_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --preview-window='right:60%'
    --cycle
    --ansi
    "

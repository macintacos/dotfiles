# Default colors
set --local background "#0b0d0f"
set --local current_line "#131a20"
set --local selection "#131a20"
set --local foreground "#f8f8f2"
set --local comment "#6272a4"
set --local cyan "#8be9fd"
set --local green "#50fa7b"
set --local orange "#ffb86c"
set --local pink "#ff79c6"
set --local purple "#bd93f9"
set --local red "#f5555"
set --local yellow "#f1fa8c"

# FZF Default Settings
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind tab:down
    --cycle
    "

# Zoxide FZF settings
set -gx _ZO_FZF_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --cycle
    "

# Forgit settings
set -gx FORGIT_FZF_DEFAULT_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --cycle
    "
##### OPTIONS #####

set fzf_preview_dir_cmd exa --all --color=always
fzf_configure_bindings \
    --directory=\cf \
    --processes=\cp \
    --history=\cr \
    --git_status=\ct \
    --git_log=\cl
##### COLORS #####

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
# set --local background "#192330"
# set --local current_line "#2b3b51"
# set --local selection "#2b3b51"
# set --local foreground "#cdcecf"
# set --local foreground "#cdcecf"
# set --local comment "#738091"
# set --local cyan "#63cdcf"
# set --local green "#81b29a"
# set --local orange "#f4a261"
# set --local pink "#d67ad2"
# set --local purple "#9d79d6"
# set --local red "#c94f6d"
# set --local yellow "#dbc074"

# FZF Default Settings
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Zoxide FZF settings
set -gx _ZO_FZF_OPTS "\
    --no-sort
    --keep-right
    --height=60%
    --info=inline
    --layout=reverse
    --exit-0
    --select-1
    --bind=ctrl-z:ignore
    --preview='exa {2..} --icons -a --group-directories-first --git -F'
    --preview-window='right:60%,<100(down,30%)'
    --color=dark
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='alt-w:toggle-preview-wrap'
    --bind='?:toggle-preview'
    --cycle
    --ansi
    "

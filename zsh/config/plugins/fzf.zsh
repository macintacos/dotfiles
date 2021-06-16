#!/usr/local/bin/bash

# FZF-related configuration options

# fzf: https://github.com/junegunn/fzf
# fzf-git: https://github.com/hschne/fzf-git
# fzf-tab: https://github.com/Aloxaf/fzf-tab
# fzf-z: https://github.com/andrewferrier/fzf-z

# INITIALIZING FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## command for listing path candidates.
## - The first argument to the function ($1) is the base path to start traversal
## - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

local background="#212336"
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

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# For Gruvbox
# export FZF_DEFAULT_OPTS="
#   --height 60%
#   --reverse
#   --color=light
#   --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
#   --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
#   --bind tab:down
#   --cycle
# "
# For Dracula
export FZF_DEFAULT_OPTS="
  --height 60%
  --reverse
  --color=dark
  --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
  --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
  --bind tab:down
  --cycle
"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# }}}

# FZF-Z {{{
export FZFZ_RECENT_DIRS_TOOL='zi'
export FZFZ_PREVIEW_COMMAND='exa --tree --git --icons {}'
# }}}

# FORGIT {{{
FORGIT_FZF_DEFAULT_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# }}}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in

  cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
  export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
  ssh) fzf "$@" --preview 'dig {}' ;;
  *) fzf "$@" ;;

  esac
}

# FZF-TAB {{{
FZF_TAB_COMMAND=(
  fzf
  --ansi                                      # Enable ANSI color support, necessary for showing groups<
  --expect='$continuous_trigger,$print_query' # For continuous completion
  --nth=2,3 --delimiter='\x00' # Don't search prefix
  --tiebreak=begin -m
  --bind=tab:down,btab:up --cycle
  '--query=$query'           # $query will be expanded to query string at runtime.
  '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
  --print-query
)
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --color-scale --tree -D $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# vscode previews for files
zstyle ':fzf-tab:complete:code:**' fzf-preview 'bat $realpath || exa --icons --color-scale --tree -D $realpath'

zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

# }}}

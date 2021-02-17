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
# }}}

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
--height 60%
--reverse
--border
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
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
  '--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f'
  '--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
  --nth=2,3 --delimiter='\x00' # Don't search prefix
  --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
  '--query=$query'           # $query will be expanded to query string at runtime.
  '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
  --print-query
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

# }}}

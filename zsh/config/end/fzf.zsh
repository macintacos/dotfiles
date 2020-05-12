#!/usr/lobal/bin/bash

# FZF-related configuration options

# fzf: https://github.com/junegunn/fzf
# fzf-git: https://github.com/hschne/fzf-git
# fzf-tab: https://github.com/Aloxaf/fzf-tab
# fzf-z: https://github.com/andrewferrier/fzf-z

# INITIALIZING FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
--height 40%
--reverse
--border
--preview '(bat --style=numbers --color=always {} || exa --tree --git --icons {}) 2> /dev/null | head -200'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
--bind tab:down
--cycle
"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZFZ_RECENT_DIRS_TOOL='z'
# }}}

# FORGIT {{{
FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--cycle
--reverse
--height '80%'
"
# }}}

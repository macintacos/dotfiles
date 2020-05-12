#!/usr/local/bin/bash

# VIM STUFF {{{
# vi mode
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q'; }

# Edit line in vim with ctrl-e
autoload edit-command-line
zle -N edit-command-line
# }}}

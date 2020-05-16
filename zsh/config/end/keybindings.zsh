#!/usr/local/bin/bash

# Keybindings set up for applications. Eventually will be organized.

# ..........eventually.

# we're going to add vim stuff here because it's needed for keybindings

source $ZDOTDIR/config/end/vim.zsh

bindkey '^e' edit-command-line # allows you to edit the current command line in vim
bindkey -s '^o' 'r\n'          # runs the 'r' command with 'ranger'
bindkey '^T' fzf-completion
bindkey '^R' fzf-history-widget
bindkey -s '^F' 'zshz \t'

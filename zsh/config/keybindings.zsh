#!/usr/local/bin/bash

# Keybindings set up for applications. Eventually will be organized.

# ..........eventually.

bindkey '^e' edit-command-line # allows you to edit the current command line in vim
bindkey -s '^o' 'r\n'          # runs the 'r' command with 'ranger'
bindkey '^T' fzf-completion
bindkey '^R' fzf-history-widget

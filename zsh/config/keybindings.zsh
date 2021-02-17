#!/usr/local/bin/bash

bindkey -s '^o' 'r\n'  # runs the 'r' command with 'ranger'
bindkey -s '^F' 'zi\n' # runs "zoxide" in interactive mode
bindkey -s '^G' 'cd **\t'
bindkey '^T' fzf-completion
bindkey '^R' fzf-history-widget
bindkey -M vicmd 's' vi-easy-motion

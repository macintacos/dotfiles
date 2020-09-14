#!/usr/local/bin/bash

# This file is just meant to house the files that execute a script before source-ing

## POWERLEVEL10K https://github.com/romkatv/powerlevel10k
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

## JABBA https://github.com/shyiko/jabba
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"
export N_PREFIX="$HOME/.n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).
## ZOXIDE https://github.com/ajeetdsouza/zoxide
unalias zi

eval "$(zoxide init zsh)"

#!/usr/local/bin/bash

# This file is just meant to house the files that execute a script before source-ing

## POWERLEVEL10K
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

## JABBA
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

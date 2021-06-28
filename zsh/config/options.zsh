#!/usr/local/bin/bash

# These are options that pertain to the overall functionality of the shell.
# P10K should also be managed here (if anything can be set outside of the .p10k.zsh file)

# POWERLEVEL9/10K {{{
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"
# }}}

# ZSH SETTINGS {{{
DEFAULT_USER="$(whoami)"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$ZDOTDIR/.zsh_history

setopt APPENDHISTORY          # Append to history instead of replacing it
setopt AUTO_CD                # `cd` to directories by just giving the directory by itself
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt INTERACTIVE_COMMENTS   # escape commands so i can use them later (allow comments after commands)
setopt LIST_TYPES             # Show types in completion
setopt NO_BEEP                # I hate beeps
setopt PROMPT_SUBST           # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt SHARE_HISTORY          # Share history between all sessions.

autoload colors
colors
# }}}

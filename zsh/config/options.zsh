#!/usr/local/bin/bash

# These are options that pertain to the overall functionality of the shell.
# P10K should also be managed here (if anything can be set outside of the .p10k.zsh file)

# POWERLEVEL9/10K {{{
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"
# }}}

# ZSH SETTINGS {{{
DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
DEFAULT_USER="$(whoami)"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt list_types             # show types in completion
setopt no_beep                # i hate beeps
setopt interactive_comments   # escape commands so i can use them later (allow comments after commands)
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt prompt_subst           # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt      # only show the rprompt on the current prompt
setopt AUTO_CD                # cd to directories by just giving the directory by itself
unsetopt RM_STAR_SILENT       # always ask before 'rm'-ing globs
autoload colors
colors
# }}}

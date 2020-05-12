#!/usr/local/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2034

# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# JABBA (for MMS) -> only turn on when you want to mess with MMS{{{
[ -s "/Users/juliant/.jabba/jabba.sh" ] && source "/Users/juliant/.jabba/jabba.sh"
export ANT_OPTS="-Xms64m -Xmx1500m"
export ANT_HOME=/usr/local/apache-ant-1.10.5
# }}}

# POWERLEVEL9/10K {{{
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"
# }}}

# ZSH SETTINGS {{{
DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
DEFAULT_USER="$(whoami)"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
BAT_THEME="base16"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
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

source "$DOTFILES_HOME/.zsh/util/cache_fixes.zsh"

# CHEAT CONFIG {{{
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=dark
# }}}

# SOURCE-ING {{{
## 'source'-ing oh-my-zsh.sh, so that things can work properly afterwards.
# shellcheck source=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"

## source everything in this directory that isn't tied down
for file in "$ZDOTDIR"/**/*.zsh; do
    source "$file"
done

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

export PATH="/usr/local/sbin:$PATH" # Because brew doctor complains

# sourcing iterm integration
source ~/.iterm2_shell_integration.zsh

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

ENHANCD_FILTER="fd -piHL -t d -d 2 | fzf"
ENHANCD_DISABLE_DOT=1
# }}}

# ZPLUG {{{
# let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# actual plugins
zplug "JamesKovacs/zsh_completions_mongodb"
zplug "Tarrasch/zsh-bd", use:bd.zsh
zplug "andrewferrier/fzf-z", use:fzf-z.plugin.zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair", defer:2
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "jackwish/bazel"
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug "zdharma/fast-syntax-highlighting", use:fast-syntax-highlighting.plugin.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-completions", use:src
zplug "Aloxaf/fzf-tab"
zplug "hschne/fzf-git"
zplug "laurenkt/zsh-vimto"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -rq; then
        echo
        zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# }}}

## Color needs to be set AFTER source-ing
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"
# }}}

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# KEYBINDINGS {{{
bindkey '^ ' autosuggest-accept # Binding `CTRL+SPACE` to auto-accept suggestions
bindkey '^e' edit-command-line  # allows you to edit the current command line in vim
bindkey -s '^o' 'r\n'           # runs the 'r' command with 'ranger'
bindkey '^T' fzf-completion
bindkey '^R' fzf-history-widget
# }}}

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
enable-fzf-tab

# FZF-tab stuff
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'

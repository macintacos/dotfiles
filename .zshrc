# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# LNAV {{{
# export LNAV_EXP="mouse"
# set LNAV_EXP="mouse"
# }}}

# JAVA MMS REQ {{{
[ -s "/Users/juliant/.jabba/jabba.sh" ] && source "/Users/juliant/.jabba/jabba.sh"
# }}}

# ZSH SETTINGS {{{

POWERLEVEL9K_MODE='nerdfont-complete'
DEFAULT_USER="$(whoami)"
ZSH_THEME="powerlevel9k/powerlevel9k"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
BAT_THEME="base16"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
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
autoload colors
colors
# }}}

# CACHE LOADING {{{
## make zsh know about hosts already accessed
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## for only occasional re-compilation
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi
# }}}

# SOURCE-ING {{{
## 'source'-ing oh-my-zsh.sh, so that things can work properly afterwards.
source $ZPLUG_HOME/init.zsh

## sourcing external files
source ~/.zshsecrets/secrets.zsh    # My secrets
source ~/.zsh/aliases.zsh           # aliases
source ~/.zsh/functions.zsh         # functions
export PATH="/usr/local/sbin:$PATH" # Because brew doctor complains

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

ENHANCD_FILTER="conditional_fd | proximity-sort $PWD | fzf --tiebreak=index"
# }}}

# INITIALIZING FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
--border
--preview '(bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -500'
--color dark,hl:33,hl+:#ef6e9c,fg+:235,bg+:#04a7fc,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
--bind tab:down --cycle
"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
# }}}

# POWERLINE SETTINGS {{{
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
# }}}

# ZPLUG {{{
zplug "b4b4r07/enhancd", use:init.sh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair", defer:2
zplug "JamesKovacs/zsh_completions_mongodb"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "Tarrasch/zsh-bd", use:bd.zsh
zplug "zdharma/fast-syntax-highlighting", use:fast-syntax-highlighting.plugin.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-completions", use:src

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## Color needs to be set AFTER source-ing
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"
bindkey '^ ' autosuggest-accept # Binding `CTRL+SPACE` to auto-accept suggestions
# }}}

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# JABBA (for MMS) -> only turn on when you want to mess with MMS{{{
[ -s "/Users/juliant/.jabba/jabba.sh" ] && source "/Users/juliant/.jabba/jabba.sh"
export ANT_OPTS="-Xms64m -Xmx1500m"
export ANT_HOME=/usr/local/apache-ant-1.10.5
# }}}

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

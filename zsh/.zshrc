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
# }}}

# SOURCE-ING {{{

## source everything in this directory that isn't tied down
for file in "$ZDOTDIR"/**/*.zsh; do
    source "$file"
done

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

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

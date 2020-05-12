#!/usr/local/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2034

# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# SOURCE-ING {{{

## source every .zsh file in this directory that isn't tied down
for file in "$ZDOTDIR"/**/*.zsh; do
    source "$file"
done

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
# }}}

# source-ing files at the end of the startup process
for file in "$ZDOTDIR"/**/*.end; do
    source "$file"
done

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

#!/usr/local/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2034

# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

## source every .zsh file in this directory that isn't tied down
for file in "$ZDOTDIR"/config/**/*.zsh; do
    source "$file"
done

### Added by Zinit's installer {{{
if [[ ! -f $ZDOTDIR/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$ZDOTDIR/.zinit" && command chmod g-rwX "$ZDOTDIR/.zinit"
    command git clone https://github.com/zdharma/zinit "$ZDOTDIR/.zinit/bin" &&
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZDOTDIR/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node
### End of Zinit's installer chunk
### }}}

# zinit configuration {{{
## "basic" installations
zinit for \
    light-mode JamesKovacs/zsh_completions_mongodb \
    djui/alias-tips \
    jackwish/bazel \
    zsh-users/zsh-completions \
    Aloxaf/fzf-tab \
    hschne/fzf-git \
    andrewferrier/fzf-z \
    laurenkt/zsh-vimto \
    ael-code/zsh-colored-man-pages \
    b4b4r07/enhancd \
    agkozak/zsh-z \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions

## Slightly more complicated installations
zinit ice wait lucid
zinit light hlissner/zsh-autopair

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice pick"h.sh"
zinit light paoloantinori/hhighlighter

zinit ice wait lucid
zinit load 'wfxr/forgit'

## oh-my-zsh plugins
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh'
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/node/node.plugin.zsh'
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/python/python.plugin.zsh'

## programs
zinit ice as"program" pick"yank" make
zinit light mptre/yank

zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile
zinit light tj/git-extras
# }}}

# source-ing files at the end of the startup process
for file in "$ZDOTDIR"/config/**/*.end; do
    source "$file"
done

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

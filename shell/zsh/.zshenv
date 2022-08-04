#!/bin/bash

eval "$(brew shellenv)"

# Setting PATHs
export PATH="$(brew --prefix)/sbin:$PATH" # Because brew doctor complains
export DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
export NVIM_HOME="$DOTFILES_HOME/nvim"
export PLUG_NVIM_HOME="$NVIM_HOME/viml/plug"
export ZDOTDIR="$DOTFILES_HOME/shell/zsh"
export QMK_HOME="$HOME/GitLocal/Play/qmk_firmware/"
export ZSH="$HOME/.oh-my-zsh"

export ANT_OPTS="-Xms64m -Xmx1500m"
# export ANT_HOME="$(brew --prefix)/apache-ant-1.10.5"
export BAT_THEME="Dracula"
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=dark
export COLORTERM="truecolor"
export CUSTOM_SCRIPTS="$ZDOTDIR/config/scripts"
export DROPBOX="$HOME/Dropbox"
export EDITOR='nvim'
export GNUBIN=$(brew --prefix)/opt/coreutils/libexec/gnubin
export GNUGETOPT=$(brew --prefix)/opt/gnu-getopt/bin
export GNUGREP=$(brew --prefix)/opt/grep/libexec/gnubin
export GNUMAKE="$(brew --prefix)/opt/make/libexec/gnubin"
export GNUMAKE="$(brew --prefix)/opt/gawk/bin"
export GOPATH=$HOME/GoWorkspace
export GO_BIN="$(brew --prefix)/go/bin"
export HELM_2="$(brew --prefix)/opt/helm@2/bin"
export HOME_LOCAL_BIN="$HOME/.local/bin"
export KEKA=/Applications/Keka.app/Contents/MacOS
export KUBECONFIG=~/.kube/config
export LDFLAGS="-L$(brew --prefix)/opt/libffi/lib"
export LOCAL_BIN=$(brew --prefix)/bin
export MANPAGER="sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
export MMS_HOME="$HOME/GitLocal/Work/mms"
export MYSQL=$(brew --prefix)/mysql-8.0.11-macos10.13-x86_64/bin/
export MY_ZSH_SCRIPTS=$ZDOTDIR/scripts
export MY_ZSH_SECRETS=$ZDOTDIR/secrets
export NODEMODULEPATH=$(brew --prefix)/lib/node_modules
export M_PREFIX=~
export OBSIDIAN_VAULT_PLUGIN_PATH="$HOME/Dropbox/Wiki"
export OPENSSL="$(brew --prefix)/opt/openssl@1.1/bin"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/libffi/lib/pkgconfig"
export POETRY_BIN="$HOME/.poetry/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_BIN="$PYENV_ROOT/bin"
export RUBY_BIN="$(brew --prefix)/lib/ruby/gems/2.6.0/bin:$(brew --prefix)/opt/ruby/bin"
export RUST=$HOME/.cargo/bin
export SCALA_HOME=$(brew --prefix)/share/scala
export SSH_KEY_PATH=~/.ssh/rsa_id
export TERM="xterm-256color"
export TILLER_NAMESPACE='cloud-ops'
export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$GNUBIN:$GNUGETOPT:$OPENSSL:$GNUGREP:$GNUMAKE:$LOCAL_BIN:$HOME_LOCAL_BIN:$PYENV_BIN:$POETRY_BIN:$CUSTOM_SCRIPTS:$BAT_THEME:$DOTFILES_HOME:$DROPBOX:$GO_BIN:$GOPATH/bin:$GOPATH/bin:$HELM_2:$HOME/bin:$KEKA:$MYSQL:$MY_ZSH_SCRIPTS:$MY_ZSH_SECRETS:$NODEMODULEPATH:$RUBY_BIN:$RUST:$SCALA_HOME/bin:$VSCODE:$PATH"
. "$HOME/.cargo/env"

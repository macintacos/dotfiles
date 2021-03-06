#!/bin/bash
# Setting PATHs
export PATH="/usr/local/sbin:$PATH" # Because brew doctor complains
export DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
export NVIM_HOME="$DOTFILES_HOME/nvim"
export PLUG_NVIM_HOME="$NVIM_HOME/viml/plug"
export ZDOTDIR="$DOTFILES_HOME/zsh"
export QMK_HOME="$HOME/GitLocal/Play/qmk_firmware/"

export ANT_OPTS="-Xms64m -Xmx1500m"
export ANT_HOME=/usr/local/apache-ant-1.10.5
export BAT_THEME="TwoDark"
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=dark
export COLORTERM="truecolor"
export CUSTOM_SCRIPTS="$DOTFILES_HOME/zsh/config/scripts"
export DROPBOX="$HOME/Dropbox"
export EDITOR='nvim'
export GNUBIN=/usr/local/opt/coreutils/libexec/gnubin
export GNUGETOPT=/usr/local/opt/gnu-getopt/bin
export GNUGREP=/usr/local/opt/grep/libexec/gnubin
export GNUMAKE="$(/usr/local/bin/brew --prefix)/opt/make/libexec/gnubin"
export GOPATH=$HOME/GoWorkspace
export GO_BIN="/usr/local/go/bin"
export HELM_2="/usr/local/opt/helm@2/bin"
export HOME_LOCAL_BIN="$HOME/.local/bin"
export KEKA=/Applications/Keka.app/Contents/MacOS
export KUBECONFIG=~/.kube/config.staging:~/.kube/config.prod
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export LOCAL_BIN=/usr/local/bin
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme=ansi --style=numbers,grid'"
export MMS_HOME="$HOME/GitLocal/Work/mms"
export MYSQL=/usr/local/mysql-8.0.11-macos10.13-x86_64/bin/
export MY_ZSH_SCRIPTS=$ZDOTDIR/scripts
export MY_ZSH_SECRETS=$ZDOTDIR/secrets
export NODEMODULEPATH=/usr/local/lib/node_modules
export M_PREFIX=~
export OBSIDIAN_VAULT_PLUGIN_PATH="$HOME/Dropbox/Wiki"
export OPENSSL="/usr/local/opt/openssl@1.1/bin"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export POETRY_BIN="$HOME/.poetry/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_BIN="$PYENV_ROOT/bin"
export RUBY_BIN="/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin"
export RUST=$HOME/.cargo/bin
export SCALA_HOME=/usr/local/share/scala
export SSH_KEY_PATH=~/.ssh/rsa_id
export TERM="xterm-256color"
export TILLER_NAMESPACE='cloud-ops'
export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$GNUBIN:$GNUGETOPT:$OPENSSL:$GNUGREP:$GNUMAKE:$LOCAL_BIN:$HOME_LOCAL_BIN:$PYENV_BIN:$POETRY_BIN:$CUSTOM_SCRIPTS:$BAT_THEME:$DOTFILES_HOME:$DROPBOX:$GO_BIN:$GOPATH/bin:$GOPATH/bin:$HELM_2:$HOME/bin:$KEKA:$MYSQL:$MY_ZSH_SCRIPTS:$MY_ZSH_SECRETS:$NODEMODULEPATH:$RUBY_BIN:$RUST:$SCALA_HOME/bin:$VSCODE:$PATH"

#!/bin/bash
# Setting PATHs
export PATH="/usr/local/sbin:$PATH" # Because brew doctor complains
export DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
export NVIM_HOME="$DOTFILES_HOME/nvim"
export PLUG_CONFIG_NVIM_HOME="$NVIM_HOME/plug-config"
export ZDOTDIR="$DOTFILES_HOME/zsh"

export ANT_OPTS="-Xms64m -Xmx1500m"
export ANT_HOME=/usr/local/apache-ant-1.10.5
export BAT_THEME="TwoDark"
export BOSUN_CONFIG_DIR=$HOME/GitLocal/Work/bosun
export BOSUN_ENV=julian
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=dark
export COLORTERM="truecolor"
export DROPBOX="$HOME/Dropbox"
export EDITOR='nvim'
export GNUGREP=/usr/local/opt/grep/libexec/gnubin
export GOPATH=$HOME/GoWorkspace
export GO_BIN="/usr/local/go/bin"
export HELM_2="/usr/local/opt/helm@2/bin"
export KEKA=/Applications/Keka.app/Contents/MacOS
export KUBECONFIG=~/.kube/config.staging:~/.kube/config.prod
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export LOCAL_BIN=/usr/local/bin
export MMS_HOME="$HOME/GitLocal/Work/mms"
export MYSQL=/usr/local/mysql-8.0.11-macos10.13-x86_64/bin/
export MY_ZSH_SCRIPTS=$ZDOTDIR/scripts
export MY_ZSH_SECRETS=$ZDOTDIR/secrets
export N_PREFIX="$HOME/.n"
export N_BIN="$N_PREFIX/bin"
export NODEMODULEPATH=/usr/local/lib/node_modules
export M_PREFIX=~
export PERLBREW=$HOME/perl5/perlbrew/bin
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export PYTHON2_PKGS="/usr/local/lib/python2.7/site-packages/"
export PY_37="/Users/juliant/Library/Python/3.7/bin"
export RUBY_BIN="/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin"
export RUST=$HOME/.cargo/bin
export SCALA_HOME=/usr/local/share/scala
export SPACEVIMBIN="$HOME/.SpaceVim/bin"
export SSH_KEY_PATH=~/.ssh/rsa_id
export TERM="xterm-256color"
export TILLER_NAMESPACE='cloud-ops'
export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$N_BIN:$BAT_THEME:$BOSUN_CONFIG_DIR:$BOSUN_ENV:$DOTFILES_HOME:$DROPBOX:$EMACSPATHVAR:$GNUGREP:$GO_BIN:$GOPATH/bin:$GOPATH/bin:$HELM_2:$HOME/bin:$KEKA:$LOCAL_BIN:$MYSQL:$MY_ZSH_SCRIPTS:$MY_ZSH_SECRETS:$NODEMODULEPATH:$PERLBREW:$PYTHON2_PKGS:$PY_37:$RUBY_BIN:$RUST:$SCALA_HOME/bin:$SPACEVIMBIN:$VSCODE:$ZPLUG_HOME:$PATH"

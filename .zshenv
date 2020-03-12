#!/usr/local/bin/bash
# Setting PATHs
export DROPBOX="$HOME/Dropbox"
export DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
export LOCAL_BIN=/usr/local/bin
export KEKA=/Applications/Keka.app/Contents/MacOS
export MY_ZSH_SCRIPTS=$HOME/.zsh/scripts
export MY_ZSH_SECRETS=$HOME/.zshsecrets
export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export SSH_KEY_PATH=~/.ssh/rsa_id
export SCALA_HOME=/usr/local/share/scala
export GOPATH=$HOME/GoWorkspace
export NODEMODULEPATH=/usr/local/lib/node_modules
export PERLBREW=$HOME/perl5/perlbrew/bin
export RUST=$HOME/.cargo/bin
export MYSQL=/usr/local/mysql-8.0.11-macos10.13-x86_64/bin/
export TERM="xterm-256color"
export EDITOR='nvim'
export BAT_THEME="ansi-dark"
export ZPLUG_HOME=/usr/local/opt/zplug
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export PYTHON2_PKGS="/usr/local/lib/python2.7/site-packages/"
export PY_37="/Users/juliant/Library/Python/3.7/bin"
export RUBY_BIN="/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin"
export GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"
export SPACEVIMBIN="$HOME/.SpaceVim/bin"
export HELM_2="/usr/local/opt/helm@2/bin"
export TILLER_NAMESPACE='cloud-ops'
export KUBECONFIG=~/.kube/config.staging:~/.kube/config.prod
export BOSUN_CONFIG_DIR=$HOME/GitLocal/Work/bosun

export PATH="$HELM_2:$SPACEVIMBIN:$GNUBIN:$DOTFILES_HOME:$DROPBOX:$RUBY_BIN:$ZPLUG_HOME:$PY_37:$KEKA:$MY_ZSH_SECRETS:$MY_ZSH_SCRIPTS:$PYTHON2_PKGS:$NODEMODULEPATH:$GOPATH/bin:$EMACSPATHVAR:$HOME/bin:$LOCAL_BIN:$PERLBREW:$GOPATH/bin:$SCALA_HOME/bin:$MYSQL:$RUST:$VSCODE:$PATH"

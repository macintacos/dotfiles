#!/bin/bash

###
# requires for install.sh
###

function require_cask() {
    running "brew cask $1"
    brew cask list "$1" >/dev/null 2>&1 || true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew cask install $1 $2"
        if ! brew cask install "$1"; then
            error "failed to install $1! aborting..."
            exit 1
        fi
    fi
    ok "Done"
}

function require_brew() {
    running "checking if $1 is installed..."
    check=$(brew ls --versions "$1" >tmp_brew_check | wc -l | sed -e 's/^[ \t]*//')
    if [[ $check = 0 ]]; then
        # action "brew install $1 $2"
        action "doesn't appear to be installed already, installing"
        if ! brew install "$1" "$2"; then
            error "failed to install $1! aborting..."
            exit 1
        fi
    fi
    ok "Done"
}

function require_node() {
    running "node -v"
    if ! node -v; then
        action "node not found, installing via homebrew"
        brew install node
    fi
    ok "Done"
}

function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep "$1" | head -1 | cut -d' ' -f1) != "$1" ]]; then
        action "gem install $1"
        gem install "$1"
    fi
    ok "Done"
}

function require_npm() {
    sourceNVM
    nvm use stable
    running "npm $*"

    if ! npm list -g --depth 0 | grep "$1"@ >/dev/null; then
        action "npm install -g $*"
        npm install -g "$@"
    fi
    ok "Done"
}

function require_apm() {
    running "checking atom plugin: $1"
    if apm list --installed --bare | grep "$1"@ >/dev/null; then
        action "apm install $1"
        apm install "$1"
    fi
    ok "Done"
}

function sourceNVM() {
    export NVM_DIR=~/.nvm
    source "$(brew --prefix nvm)"/nvm.sh
}

function require_nvm() {
    mkdir -p ~/.nvm
    cp "$(brew --prefix nvm)"/nvm-exec ~/.nvm/
    sourceNVM
    if nvm install "$1"; then
        action "installing nvm"
        require_brew nvm
        . $HOME/.bashrc
        nvm install "$1"
    fi
    ok "Done"
}

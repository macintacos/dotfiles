#!/bin/bash

export PATH="$DOTFILES_HOME/setup:$PATH"

SUBLIME_MERGE_USER_DIR="/Applications/Sublime Merge.app/Contents/MacOS/Packages/User/"

bash_link() {
    log info "Linking BASH..."
    rm -rf ~/.bashrc
    ln -sF "${DOTFILES_HOME}/.bashrc" ~/.bashrc
    log ok "BASH linked."
}

zsh_link() {
    log info "Linking ZSH..."
    rm -rf ~/.zshenv
    rm -rf ~/.zsh_history
    ln -sF "${DOTFILES_HOME}/zsh/.zshenv" ~/.zshenv
    ln -sF "${DOTFILES_HOME}/zsh/.zsh_history" ~/.zsh_history
    log ok "ZSH linked"
}

nvim_link() {
    log info "Linking neovim..."
    rm -f ~/.config/nvim
    ln -sF "${DOTFILES_HOME}/nvim" ~/.config/nvim
    log ok "neovim linked."
}

eslint_link() {
    log info "Linking eslint..."
    rm -rf ~/.eslintrc.js
    ln -sF "${DOTFILES_HOME}/.eslintrc.js" ~/.eslintrc.js
    log ok "ESLINT linked."
}

karabiner_link() {
    log info "Linking Karabiner..."
    rm -rf .config/karabiner
    mkdir -p ~/.config/
    ln -sF "${DOTFILES_HOME}/karabiner" ~/.config
    log ok "Karabiner linked."
}

smerge_link() {
    log info "Linking Sublime Merge keymap..."
    rm -rf "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
    mkdir -p "${SUBLIME_MERGE_USER_DIR}"
    ln -sF "${DOTFILES_HOME}/sublime/merge/Default.sublime-keymap" "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
    log ok "Sublime Merge keymap linked."
}


lnav_link() {
    log info "Linking lnav..."
    log info "Clearing target files..."
    rm -rf "$HOME/.lnav/formats/installed/a-proxy.json"
    rm -rf "$HOME/.lnav/formats/installed/mongod-post44.json"
    rm -rf "$HOME/.lnav/formats/installed/mongod-pre44.json"

    log info "Creating directories in case they don't exist..."
    mkdir -p "$HOME/.lnav/formats/installed"

    log info "Linking a-proxy.json, mongod-post44.json, and mongod-pre44.json..."
    ln -sF "${DOTFILES_HOME}/lnav/a-proxy.json" "$HOME/.lnav/formats/installed/a-proxy.json"
    ln -sF "${DOTFILES_HOME}/lnav/mongod-post44.json" "$HOME/.lnav/formats/installed/mongod-post44.json"
    ln -sF "${DOTFILES_HOME}/lnav/mongod-pre44.json" "$HOME/.lnav/formats/installed/mongod-pre44.json"

    log ok "lnav formats linked."
}

gitignore_global_link() {
    log info "Linking .gitignore global config..."
    log info "Clearing target files..."
    rm -rf "$HOME/.gitignore_global"

    log info "Linking .gitignore_global..."
    ln -sF "${DOTFILES_HOME}/.gitignore_global" "$HOME/.gitignore_global"

    log info "Going to sync up global gitignore automagically..."
    git config --global core.excludesfile "$HOME"/.gitignore_global

    log ok ".gitignore_global linked."
}

ideavimrc_link() {
    log info "Linking .ideavimrc..."
    log info "Clearing target files..."
    rm -f "$HOME/.ideavimrc"

    log info "Linking .ideavimrc..."
    ln -sF "${DOTFILES_HOME}/.ideavimrc" "$HOME/.ideavimrc"

    log ok ".ideavimrc linked."
}

kitty_link() {
    log info "Linking kitty config..."
    log info "Clearing target files..."
    rm -f "$HOME/.config/kitty/kitty.conf"

    log info "Linging kitty config..."
    ln -sF "${DOTFILES_HOME}/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

    log ok "kitty config linked."
}

## ALL {{{
link_all() {
    log info "Creating all symlinks..."
    bash_link
    zsh_link
    nvim_link
    eslint_link
    karabiner_link
    smerge_link
    lnav_link
    gitignore_global_link
    ideavimrc_link
    kitty_link
    log ok "All symlinks created."
}

#!/bin/bash

export PATH="$PWD:$PATH"

SUBLIME_MERGE_USER_DIR="/Applications/Sublime Merge.app/Contents/MacOS/Packages/User/"

bash_link() {
    plzlog info "Linking BASH..."
    rm -rf .bashrc
    ln -sF "${DOTFILES_HOME}/.bashrc" ~/.bashrc
    plzlog ok "BASH linked."
}

zsh_link() {

    plzlog info "Linking ZSH..."
    rm -rf .zshenv
    ln -sF "${DOTFILES_HOME}/zsh/.zshenv" ~/.zshenv
    plzlog ok "ZSH linked"
}

spacemacs_link() {
    plzlog info "Linking Spacemacs..."
    rm -rf .spacemacs
    ln -sF "${DOTFILES_HOME}/.spacemacs" ~/.spacemacs
    plzlog ok "SPACEMACS linked."
}

nvim_link() {
    plzlog info "Linking neovim..."
    rm -rf .vimrc
    ln -sF "${DOTFILES_HOME}/.vimrc" ~/.vimrc
    plzlog ok "neovim linked."
}

ack_link() {
    plzlog info "Linking ACK..."
    rm -rf .ackrc
    ln -sF "${DOTFILES_HOME}/.ackrc" ~/.ackrc
    plzlog ok "ACK linked."
}

eslint_link() {
    plzlog info "Linking eslint..."
    rm -rf .eslintrc.js
    ln -sF "${DOTFILES_HOME}/.eslintrc.js" ~/.eslintrc.js
    plzlog ok "ESLINT linked."
}

karabiner_link() {
    plzlog info "Linking Karabiner..."
    rm -rf .config/karabiner
    mkdir -p .config/
    ln -sF "${DOTFILES_HOME}/karabiner" ~/.config
    plzlog ok "Karabiner linked."
}

smerge_link() {
    plzlog info "Linking Sublime Merge keymap..."
    rm -rf "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
    mkdir -p "${SUBLIME_MERGE_USER_DIR}"
    ln -sF "${DOTFILES_HOME}/sublime/merge/Default.sublime-keymap" "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
    plzlog ok "Sublime Merge keymap linked."
}

secrets_link() {
    plzlog info "Linking secrets..."
    rm -rf .zshsecrets/
    mkdir .zshsecrets
    ln -sF "${DOTFILES_HOME}/.zsh/secrets/sshnds" ~/.zshsecrets/sshnds
    plzlog ok "Secrets linked."
}

## ALL {{{
link_all() {
    plzlog info "Creating all symlinks..."
    bash_link
    zsh_link
    spacemacs_link
    nvim_link
    ack_link
    eslint_link
    karabiner_link
    smerge_link
    secrets_link
    plzlog ok "All symlinks created."
}

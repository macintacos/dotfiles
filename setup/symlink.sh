#!/bin/bash

export PATH="$PWD/setup:$PATH"

SUBLIME_MERGE_USER_DIR="/Applications/Sublime Merge.app/Contents/MacOS/Packages/User/"

bash_link() {
    plzlog info "Linking BASH..."
    rm -rf ~/.bashrc
    ln -sF "${DOTFILES_HOME}/.bashrc" ~/.bashrc
    plzlog ok "BASH linked."
}

zsh_link() {
    plzlog info "Linking ZSH..."
    rm -rf ~/.zshenv
    ln -sF "${DOTFILES_HOME}/zsh/.zshenv" ~/.zshenv
    plzlog ok "ZSH linked"
}

spacemacs_link() {
    plzlog info "Linking Spacemacs..."
    rm -rf ~/.spacemacs
    ln -sF "${DOTFILES_HOME}/rcrc/.spacemacs" ~/.spacemacs
    plzlog ok "SPACEMACS linked."
}

nvim_link() {
    plzlog info "Linking neovim..."
    rm -f ~/.config/nvim
    ln -sF "${DOTFILES_HOME}/nvim" ~/.config/nvim
    plzlog ok "neovim linked."
}

ack_link() {
    plzlog info "Linking ACK..."
    rm -rf ~/.ackrc
    ln -sF "${DOTFILES_HOME}/rcrc/.ackrc" ~/.ackrc
    plzlog ok "ACK linked."
}

eslint_link() {
    plzlog info "Linking eslint..."
    rm -rf ~/.eslintrc.js
    ln -sF "${DOTFILES_HOME}/.eslintrc.js" ~/.eslintrc.js
    plzlog ok "ESLINT linked."
}

karabiner_link() {
    plzlog info "Linking Karabiner..."
    rm -rf .config/karabiner
    mkdir -p ~/.config/
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

tig_link() {
    plzlog info "Linking tigrc..."
    rm -rf ~/.tigrc
    ln -sF "${DOTFILES_HOME}/rcrc/.tigrc" ~/.tigrc
    plzlog ok "tigrc linked."
}

vscode_link() {
    plzlog info "Linking VSCode..."
    plzlog info "Clearing target files..."
    rm -rf "$HOME/Library/Application Support/Code/User/settings.json"
    rm -rf "$HOME/Library/Application Support/Code/User/keybindings.json"
    plzlog ok "Done."
    plzlog info "Creating directories if they don't exist..."
    mkdir -p "$HOME/Library/Application Support/Code/User"
    plzlog ok "Done."
    plzlog info "Linking settings.json..."
    ln -sF "${DOTFILES_HOME}/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    plzlog ok "settings.json linked."
    plzlog info "Linking keybindings.json..."
    ln -sF "${DOTFILES_HOME}/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
    plzlog ok "keybindings.json linked. VSCode linking done."
}

## ALL {{{
link_all() {
    plzlog info "Creating all symlinks..."
    bash_link
    zsh_link
    spacemacs_link
    nvim_link
    ack_link
    tig_link
    eslint_link
    karabiner_link
    smerge_link
    vscode_link
    plzlog ok "All symlinks created."
}

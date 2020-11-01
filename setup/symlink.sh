#!/bin/bash

export PATH="$DOTFILES_HOME/setup:$PATH"

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

lnav_link() {
    plzlog info "Linking lnav..."
    plzlog info "Clearing target files..."
    rm -rf "$HOME/.lnav/formats/installed/a-proxy.json"
    rm -rf "$HOME/.lnav/formats/installed/mongod-post44.json"
    rm -rf "$HOME/.lnav/formats/installed/mongod-pre44.json"
    plzlog ok "Done."
    plzlog info "Creating directories in case they don't exist..."
    mkdir -p "$HOME/.lnav/formats/installed"
    plzlog ok "Done."
    plzlog info "Linking a-proxy.json..."
    ln -sF "${DOTFILES_HOME}/lnav/a-proxy.json" "$HOME/.lnav/formats/installed/a-proxy.json"
    plzlog ok "Done."
    plzlog info "Linking mongod-post44.json..."
    ln -sF "${DOTFILES_HOME}/lnav/mongod-post44.json" "$HOME/.lnav/formats/installed/mongod-post44.json"
    plzlog ok "Done."
    plzlog info "Linking mongod-pre44.json..."
    ln -sF "${DOTFILES_HOME}/lnav/mongod-pre44.json" "$HOME/.lnav/formats/installed/mongod-pre44.json"
    plzlog ok "Done."
    plzlog ok "lnav formats linked."
}

starship_link() {
    plzlog info "Linking starship config..."
    plzlog info "Clearing target files..."
    rm -rf "$HOME/.config/starship.toml"
    plzlog ok "Done."
    plzlog info "Making directory in case it doesn't exist..."
    mkdir -p "$HOME/.config"
    plzlog ok "Done."
    plzlog info "Linking starship.toml..."
    ln -sF "$DOTFILES_HOME/rcrc/starship.toml" "$HOME/.config/starship.toml"
    plzlog ok "Done."
}

lazygit_link() {
    plzlog info "Linking lazygit config..."
    plzlog info "Clearing target files..."
    rm -rf "$HOME/Library/Application Support/jesseduffield/lazygit/config.yml"
    plzlog ok "Done."
    plzlog info "Making directory if it doesn't exist..."
    mkdir -p "$HOME/Library/Application Support/jesseduffield/lazygit"
    plzlog ok "Done."
    plzlog info "Linking lazygit config file..."
    ln -sF "$DOTFILES_HOME/rcrc/lazygit/config.yml" "$HOME/Library/Application Support/jesseduffield/lazygit/config.yml"
    plzlog ok "Done."
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
    lnav_link
    starship_link
    lazygit_link
    plzlog ok "All symlinks created."
}

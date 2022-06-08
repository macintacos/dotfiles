#!/bin/bash

export PATH="$HOME/GitLocal/Play/dotfiles/setup:$PATH"
DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"

bash_link() {
	log info "Linking BASH..."
	rm -rf ~/.bashrc
	ln -sF "${DOTFILES_HOME}/rc/.bashrc" ~/.bashrc
	log ok "BASH linked."
}

karabiner_link() {
	log info "Linking Karabiner..."
	rm -rf ~/.config/karabiner
	mkdir -p ~/.config
	ln -sF "${DOTFILES_HOME}/karabiner" ~/.config/karabiner
	log ok "Karabiner linked."
}

nvim_link() {
	log info "Linking neovim..."
	rm -f ~/.config/nvim
	ln -sF "${HOME}/GitLocal/Play/nvim" ~/.config/nvim
	log ok "neovim linked."
}

lnav_link() {
	log info "Linking lnav..."
	rm -rf "$HOME/.lnav/formats/installed"
	mkdir -p "$HOME/.lnav/formats/installed"
	ln -sF "${DOTFILES_HOME}/lnav/formats/installed" "$HOME/.lnav/formats/installed"
	log ok "lnav formats linked."
}

gitconfig_link() {
	log info "Linking gitconfig..."
	rm -rf "$HOME/.gitconfig"
	ln -sF "${DOTFILES_HOME}/.gitconfig" "$HOME/.gitconfig"
	log ok ".gitconfig linked."
}

gitignore_global_link() {
	log info "Linking .gitignore global config..."
	rm -rf "$HOME/.gitignore_global"
	ln -sF "${DOTFILES_HOME}/.gitignore_global" "$HOME/.gitignore_global"
	log ok ".gitignore_global linked."
}

fish_link() {
	log info "Linking fish stuff..."
	rm -rf "$HOME/.config/fish"
	ln -sF "${DOTFILES_HOME}/shell/fish" "$HOME/.config/fish"
	log ok "fish linked."
}

ideavimrc_link() {
	log info "Linking .ideavimrc..."
	rm -f "$HOME/.ideavimrc"
	ln -sF "${DOTFILES_HOME}/rc/.ideavimrc" "$HOME/.ideavimrc"
	log ok ".ideavimrc linked."
}

zsh_link() {
	log info "Linking ZSH..."
	rm -rf ~/.zshrc
	rm -rf ~/.zshenv
	rm -rf ~/.zsh_history
	ln -sF "${DOTFILES_HOME}/shell/zsh/.zshenv" ~/.zshenv
	ln -sF "${DOTFILES_HOME}/shell/zsh/.zshrc" ~/.zshrc
	ln -sF "${DOTFILES_HOME}/shell/zsh/.zsh_history" ~/.zsh_history
	log ok "ZSH linked"
}

lazygit_link() {
	log info "Linking lazygit config..."
	rm -rf "${HOME}/Library/Application Support/lazygit/config.yml"
	mkdir -p "${HOME}/Library/Application Support/lazygit"
	ln -sF "${DOTFILES_HOME}/rc/.lazygitrc" "${HOME}/Library/Application Support/lazygit/config.yml"
	log ok "lazygit linked."
}

vscode_link() {
	log info "Linking vscode settings..."

	code_path="${HOME}/Library/Application Support/Code/User"
	rm -rf "${code_path}/settings.json"
	rm -rf "${code_path}/keybindings.json"
	ln -sF "${DOTFILES_HOME}/vscode/settings.json" "${code_path}/settings.json"
	ln -sF "${DOTFILES_HOME}/vscode/keybindings.json" "${code_path}/keybindings.json"
	log ok "vscode linked."
}

espanso_link() {
	log info "Linking espanso..."

	espanso_path="${HOME}/Library/Application Support/espanso"
	rm -rf "${espanso_path}"
	ln -sf "${DOTFILES_HOME}/espanso" "${espanso_path}"
	log ok "espanso linked."
}

tmux_link() {
	log info "Linking tmux config..."

	rm -rf "${HOME}/.tmux.conf"
	rm -rf "${HOME}/.tmux.theme.sh"
	rm -rf "${HOME}/.tmux-powerlinerc"
	ln -sf "${DOTFILES_HOME}/rc/.tmux.conf" "${HOME}/.tmux.conf"
	ln -sf "${DOTFILES_HOME}/rc/.tmux.theme.sh" "${HOME}/.tmux/powerline/themes/.tmux.theme.sh"
	ln -sf "${DOTFILES_HOME}/rc/.tmux-powerlinerc" "${HOME}/.tmux-powerlinerc"
	log ok "tmux linked."
}

## ALL {{{
link_all() {
	log info "Creating all symlinks..."
	bash_link
	gitignore_global_link
	gitconfig_link
	ideavimrc_link
	karabiner_link
	lazygit_link
	lnav_link
	fish_link
	nvim_link
	zsh_link
	log ok "All symlinks created."
}

link_all

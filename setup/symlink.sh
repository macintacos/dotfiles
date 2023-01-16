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

lnav_link() {
	log info "Linking lnav..."
	rm -rf "$HOME/.lnav/formats/installed"
	mkdir -p "$HOME/.lnav/formats"
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

helix_link() {
    log info "Linking helix configuration..."
    rm -f ~/.config/helix
    ln -sF "${DOTFILES_HOME}/helix" "$HOME/.config/helix"
    log ok "helix linked."
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
	rm -rf "${HOME}/.gitmux.conf"
	mkdir -p "${HOME}/.tmux/powerline/themes"
	ln -sf "${DOTFILES_HOME}/rc/.tmux.conf" "${HOME}/.tmux.conf"
	ln -sf "${DOTFILES_HOME}/rc/.tmux.theme.sh" "${HOME}/.tmux/powerline/themes/.tmux.theme.sh"
	ln -sf "${DOTFILES_HOME}/rc/.tmux-powerlinerc" "${HOME}/.tmux-powerlinerc"
	ln -sf "${DOTFILES_HOME}/rc/.gitmux.conf" "${HOME}/.gitmux.conf"
	log ok "tmux linked."
}

ghdash_link() {
	log info "Linking gh-dash config..."
	rm -rf "${HOME}/Library/Application Support/gh-dash"
	mkdir -p "${HOME}/Library/Application Support/gh-dash"
	ln -sf "${DOTFILES_HOME}/rc/gh-dash.yml" "${HOME}/Library/Application Support/gh-dash/config.yml"
}

xbar_plugin_link() {
	log info "Linking xbar plugins..."
	mkdir -p "${HOME}/Library/Application Support/xbar/plugins"
	xbar_plugin_dir="${DOTFILES_HOME}/xbar/plugins"

	for plugin_path in "$xbar_plugin_dir"/*; do
		plugin_name=$(basename "$plugin_path")
		ln -sf "$plugin_path" "$HOME/Library/Application Support/xbar/plugins/${plugin_name}"

		log ok "Plugin $plugin_name linked."
	done
}

cz_link() {
	log info "Linking commitizen settings..."
	rm -f ~/.czrc
	ln -sf "${DOTFILES_HOME}/rc/.czrc" "$HOME/.czrc"
	log ok "committizen config linked."
}

skhd_link() {
	log info "Linking skhd configuration..."
	rm -f ~/.skhdrc
	ln -sf "${DOTFILES_HOME}/rc/.skhdrc" "$HOME/.config/skhd/skhdrc"
	log ok "skhd config linked."
}

yabai_link() {
	log info "Linking yabai configuration..."
	rm -f ~/.yabairc
	ln -sf "${DOTFILES_HOME}/rc/.yabairc" "$HOME/.config/yabai/yabairc"
	log ok "yabai config linked."
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
    helix_link
	zsh_link
	tmux_link
	ghdash_link
	xbar_plugin_link
	log ok "All symlinks created."
}

link_all

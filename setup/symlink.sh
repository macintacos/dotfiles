#!/bin/bash
# TODO: Refactor to just make a generic function that can handle all of these cases, and call that instead.

export PATH="$HOME/GitLocal/Play/dotfiles/setup:$PATH"
DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
MACOS_LIB_HOME="$HOME/Library/Application Support"

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
    rm -rf ~/.config/helix
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
	rm -rf "$MACOS_LIB_HOME/lazygit/config.yml"
	mkdir -p "$MACOS_LIB_HOME/lazygit"
	ln -sF "${DOTFILES_HOME}/rc/.lazygitrc" "$MACOS_LIB_HOME/lazygit/config.yml"
	log ok "lazygit linked."
}

vscode_link() {
	log info "Linking vscode settings..."

	code_path="$MACOS_LIB_HOME/Code/User"
	rm -rf "${code_path}/settings.json"
	rm -rf "${code_path}/keybindings.json"
	ln -sF "${DOTFILES_HOME}/vscode/settings.json" "${code_path}/settings.json"
	ln -sF "${DOTFILES_HOME}/vscode/keybindings.json" "${code_path}/keybindings.json"
	log ok "vscode linked."
}

espanso_link() {
	log info "Linking espanso..."

	espanso_path="$MACOS_LIB_HOME/espanso"
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
	rm -rf "$MACOS_LIB_HOME/gh-dash"
	mkdir -p "$MACOS_LIB_HOME/gh-dash"
	ln -sf "${DOTFILES_HOME}/rc/gh-dash.yml" "$MACOS_LIB_HOME/gh-dash/config.yml"
}

xbar_plugin_link() {
	log info "Linking xbar plugins..."
	mkdir -p "$MACOS_LIB_HOME/xbar/plugins"
	xbar_plugin_dir="${DOTFILES_HOME}/xbar/plugins"

	for plugin_path in "$xbar_plugin_dir"/*; do
		plugin_name=$(basename "$plugin_path")
		ln -sf "$plugin_path" "$MACOS_LIB_HOME/xbar/plugins/${plugin_name}"

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

jj_link() {
    log info "Linking jj configuration..."
    rm -f ~/.jjconfig.toml
    ln -sf "${DOTFILES_HOME}/rc/.jjconfig.toml" "$HOME/.jjconfig.toml"
    log ok "jj config linked."
}

wezterm_link() {
    log info "Linking wezterm configuration..."
    rm -f ~/.wezterm.lua
    ln -sf "${DOTFILES_HOME}/rc/.wezterm.lua" "$HOME/.wezterm.lua"
    log ok "wezterm config linked."
}

k9s_link() {
    log info "Linking k9s configuration..."
    rm -rf "$MACOS_LIB_HOME/k9s"
	ln -sf "${DOTFILES_HOME}/k9s" "$MACOS_LIB_HOME/k9s"
    log ok "k9s config linked."
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
    jj_link
    wezterm_link
    k9s_link
	log ok "All symlinks created."
}

link_all

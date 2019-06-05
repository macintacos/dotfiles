#!/bin/bash

###############################################################################
# symlink
#
# A shell script to setup symlinks for your local config files.
###############################################################################

source ./lib_sh/echos.sh

DOTFILES_DIR=$PWD

cd ~

bot "Linking local config to remote dotfiles..."

# Base ZSH {{{
running "linking ZSH"
rm -rf .zshrc
rm -rf .zshenv
touch .zshrc
touch .zshenv
ln -sF "${DOTFILES_DIR}/.zshrc" ~/.zshrc
ln -sF "${DOTFILES_DIR}/.zshenv" ~/.zshenv

## Aliases and Functions
rm -rf .zsh/
mkdir -p .zsh/scripts
touch .zsh/aliases.zsh
touch .zsh/functions.zsh
touch .zsh/scripts/git-clean-local.zsh
ln -sF "${DOTFILES_DIR}/.zsh/aliases.zsh" ~/.zsh/aliases.zsh
ln -sF "${DOTFILES_DIR}/.zsh/functions.zsh" ~/.zsh/functions.zsh
ln -sF "${DOTFILES_DIR}/.zsh/scripts/git-clean-local" ~/.zsh/scripts/git-clean-local
ok "ZSH linked."
# }}}

# VIM
running "linking Vim"
rm -rf .vimrc
touch .vimrc
ln -sF "${DOTFILES_DIR}/.vimrc" ~/.vimrc
ok "VIM linked."

# ACK
running "linking ACK"
rm -rf .ackrc
touch .ackrc
ln -sF "${DOTFILES_DIR}/.ackrc" ~/.ackrc
ok "ACK linked."

# ESLINT
running "linking eslint"
rm -rf .eslintrc.js
touch .eslintrc.js
ln -sF "${DOTFILES_DIR}/.eslintrc.js" ~/.eslintrc.js
ok "ESLINT linked."

# Karabiner
running "linking Karabiner"
rm -rf .config/karabiner
mkdir -p .config/karabiner
ln -sF "${DOTFILES_DIR}/karabiner" ~/.config/karabiner
ok "Karabiner linked."

bot "All dotfiles linked. Remember to add your ~/.zshsecrets/secrets.zsh file!"
ok

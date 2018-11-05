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
bot "First need to create directories if they don't exist..."

# Configuring Directories
# if [ ! -d "$HOME/.zsh" ]; then 
#     action "Creating ~/.zsh"
#     mkdir -p -- ".zsh/"
#     ok "Done." 
# fi



# Touching some files so that they exist when linking

# Base ZSH {{{
running "linking ZSH"
rm -rf .zshrc
rm -rf .zshenv
sudo ln -sF ${DOTFILES_DIR}/.zshrc ~/.zshrc
sudo ln -sF ${DOTFILES_DIR}/.zshenv ~/.zshenv

## Aliases and Functions
rm -rf .zsh/
sudo ln -sF ${DOTFILES_DIR}/.zsh/aliases.zsh ~/.zsh/aliases.zsh
sudo ln -sF ${DOTFILES_DIR}/.zsh/functions.zsh ~/.zsh/functions.zsh
ok "ZSH linked."
# }}}

# VIM
running "linking Vim"
rm -rf .vimrc
sudo ln -sF ${DOTFILES_DIR}/.vimrc ~/.vimrc
ok "VIM linked."

# ACK
running "linking ACK"
rm -rf .ackrc
sudo ln -sF ${DOTFILES_DIR}/.ackrc ~/.ackrc
ok "ACK linked."

# ESLINT
running "linking eslint"
rm -rf .eslintrc.js
sudo ln -sF ${DOTFILES_DIR}/.eslintrc.js ~/.eslintrc.js
ok "ESLINT linked."

bot "All dotfiles linked."
ok
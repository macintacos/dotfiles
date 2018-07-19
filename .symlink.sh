#!/bin/bash

###############################################################################
# symlink
#
# A shell script to setup symlinks for your local config files.
###############################################################################

CONFIG_DIR=~/Dropbox/Developer/_config

cd ~

echo "Linking local config to ~/Dropbox/_config dotfiles..."

# Base ZSH
rm -rf .zshenv
rm -rf .zshrc
ln -s ${CONFIG_DIR}/.zshrc .zshrc
ln -s ${CONFIG_DIR}/.zshenv .zshenv

# Aliases and Functions
rm -rf .zsh/aliases.zsh
rm -rf .zsh/functions.zsh
ln -s ${CONFIG_DIR}/.zsh/aliases.zsh .zsh/aliases.zsh
ln -s ${CONFIG_DIR}/.zsh/functions.zsh .zsh/functions.zsh
echo "ZSH linked"

# VIM
rm -rf .vimrc
ln -s ${CONFIG_DIR}/.vimrc .vimrc
echo "VIM linked"

echo "All dotfiles linked."
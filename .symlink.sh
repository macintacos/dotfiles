#!/bin/bash

###############################################################################
# symlink
#
# A shell script to setup symlinks for your local config files.
###############################################################################

source ./lib_sh/echos.sh

CONFIG_DIR=$PWD

cd ~

bot "Linking local config to remote dotfiles..."

# Base ZSH {{{
running "linking ZSH"
rm -rf .zshenv
rm -rf .zshrc
ln -s ${CONFIG_DIR}/.zshrc .zshrc
ln -s ${CONFIG_DIR}/.zshenv .zshenv

## Aliases and Functions
rm -rf .zsh/
ln -s ${CONFIG_DIR}/.zsh/aliases.zsh .zsh/aliases.zsh
ln -s ${CONFIG_DIR}/.zsh/functions.zsh .zsh/functions.zsh
ok "ZSH linked."
# }}}

# VIM
running "linking Vim"
rm -rf .vimrc
ln -s ${CONFIG_DIR}/.vimrc .vimrc
ok "VIM linked."

# ACK
running "linking ACK"
rm -rf .ackrc
ln -s ${CONFIG_DIR}/.ackrc .ackrc
ok "ACK linked."

bot "All dotfiles linked."
ok
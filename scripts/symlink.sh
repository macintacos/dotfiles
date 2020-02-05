#!/bin/bash

###############################################################################
# symlink
#
# A shell script to setup symlinks for your local config files.
###############################################################################

source ../lib_sh/echos.sh

DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
SUBLIME_MERGE_USER_DIR="/Applications/Sublime Merge.app/Contents/MacOS/Packages/User/"

cd ~

bot "Linking local config to remote dotfiles..."

# Base BASH {{{
running "linking BASH"
rm -rf .bashrc
touch .bashrc
ln -sF "${DOTFILES_HOME}/.bashrc" ~/.bashrc
ok "BASH linked."
# }}}

# Base ZSH {{{
## ZSH Basic Directories
running "linking ZSH"
rm -rf .zshrc
rm -rf .zshenv
rm -rf .zlogin
touch .zshrc
touch .zshenv
touch .zlogin
ln -sF "${DOTFILES_HOME}/.zshrc" ~/.zshrc
ln -sF "${DOTFILES_HOME}/.zshenv" ~/.zshenv
ln -sF "${DOTFILES_HOME}/.zlogin" ~/.zlogin

## Aliases and Functions
rm -rf .zsh/
mkdir -p .zsh/scripts
touch .p10k.zsh # stays at the top level, despite being in the folder in dotfiles
touch .zsh/aliases.zsh
touch .zsh/functions.zsh
touch .zsh/scripts/git-clean-local.zsh
ln -sF "${DOTFILES_HOME}/.zsh/.p10k.zsh" ~/.p10k.zsh
ln -sF "${DOTFILES_HOME}/.zsh/aliases.zsh" ~/.zsh/aliases.zsh
ln -sF "${DOTFILES_HOME}/.zsh/functions.zsh" ~/.zsh/functions.zsh
ln -sF "${DOTFILES_HOME}/.zsh/scripts/git-clean-local" ~/.zsh/scripts/git-clean-local
ln -sF "${DOTFILES_HOME}/.zsh/scripts/magit" ~/.zsh/scripts/magit
ok "ZSH linked."
# }}}

# SPACEMACS {{{
running "linking Spacemacs"
rm -rf .spacemacs
touch .spacemacs
ln -sF "${DOTFILES_HOME}/.spacemacs" ~/.spacemacs
ok "SPACEMACS linked."
# }}}

# VIM {{{
running "linking Vim"
rm -rf .vimrc
touch .vimrc
ln -sF "${DOTFILES_HOME}/.vimrc" ~/.vimrc
ok "VIM linked."
# }}}

# ACK {{{
running "linking ACK"
rm -rf .ackrc
touch .ackrc
ln -sF "${DOTFILES_HOME}/.ackrc" ~/.ackrc
ok "ACK linked."
# }}}

# ESLINT {{{
running "linking eslint"
rm -rf .eslintrc.js
touch .eslintrc.js
ln -sF "${DOTFILES_HOME}/.eslintrc.js" ~/.eslintrc.js
ok "ESLINT linked."
# }}}

# Karabiner {{{
running "linking Karabiner"
rm -rf .config/karabiner
mkdir -p .config/
ln -sF "${DOTFILES_HOME}/karabiner" ~/.config
ok "Karabiner linked."
# }}}

# Sublime Merge {{{
running "linking Sublime Merge keymap"
rm -rf "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
mkdir -p "${SUBLIME_MERGE_USER_DIR}"
touch "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
ln -sF "${DOTFILES_HOME}/sublime/merge/Default.sublime-keymap" "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
ok "Sublime Merge keymap linked."
# }}}

## SECRETS {{{
running "linking secrets"
rm -rf .zshsecrets/
mkdir .zshsecrets
touch sshnds
touch secrets.zsh
ln -sF "${DOTFILES_HOME}/.zsh/secrets/sshnds" ~/.zshsecrets/sshnds
ln -sF "${DOTFILES_HOME}/.zsh/secrets/secrets.zsh" sshnds~/.zshsecrets/secrets.zsh
ok "Secrets linked."
# }}}

bot "All dotfiles linked."
ok

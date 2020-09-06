#!/bin/bash

###############################################################################
# symlink
#
# A shell script to setup symlinks for your local config files.
###############################################################################

source ../lib_sh/echos.sh

DOTFILES_HOME="$HOME/GitLocal/Play/dotfiles"
SUBLIME_MERGE_USER_DIR="/Applications/Sublime Merge.app/Contents/MacOS/Packages/User/"

cd "$HOME" || exit

bot "Linking local config to remote dotfiles..."

# Base BASH {{{
running "linking BASH"
rm -rf .bashrc
ln -sF "${DOTFILES_HOME}/.bashrc" ~/.bashrc
ok "BASH linked."
# }}}

# Base ZSH {{{
## ZSH Basic Directories
running "linking ZSH"
rm -rf .zshenv
ln -sF "${DOTFILES_HOME}/zsh/.zshenv" ~/.zshenv
ok "ZSH linked"

# SPACEMACS {{{
running "linking Spacemacs"
rm -rf .spacemacs
ln -sF "${DOTFILES_HOME}/.spacemacs" ~/.spacemacs
ok "SPACEMACS linked."
# }}}

# VIM {{{
running "linking Vim"
rm -rf .vimrc
ln -sF "${DOTFILES_HOME}/.vimrc" ~/.vimrc
ok "VIM linked."
# }}}

# ACK {{{
running "linking ACK"
rm -rf .ackrc
ln -sF "${DOTFILES_HOME}/.ackrc" ~/.ackrc
ok "ACK linked."
# }}}

# ESLINT {{{
running "linking eslint"
rm -rf .eslintrc.js
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
ln -sF "${DOTFILES_HOME}/sublime/merge/Default.sublime-keymap" "${SUBLIME_MERGE_USER_DIR}/Default.sublime-keymap"
ok "Sublime Merge keymap linked."
# }}}

## SECRETS {{{
running "linking secrets"
rm -rf .zshsecrets/
mkdir .zshsecrets
ln -sF "${DOTFILES_HOME}/.zsh/secrets/sshnds" ~/.zshsecrets/sshnds
ok "Secrets linked."
# }}}

bot "All dotfiles linked."
ok

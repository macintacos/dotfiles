#!/usr/bin/env bash

cd "${DOTFILES_HOME}"/setup || exit

./log info "Backing up files to: $DOTFILES_HOME/backup (run the command again if it fails!)"
(
    cd "${DOTFILES_HOME}"/backup || exit

    (cd "${DOTFILES_HOME}"/setup && ./log info "Backing up Homebrew packages...")
    rm Brew*
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump

    (cd "${DOTFILES_HOME}"/setup && ./log ok "Brewfile successfully regenerated." && ./log info "Backing up global NPM packages...")
    backup-global backup -o npm.global.backup.txt

    (cd "${DOTFILES_HOME}"/setup && ./log ok "NPM Backup successfully regenerated." && ./log info "Backing up VSCode extension list...")
    code --list-extensions >vscode-extensions-backup.txt

    (cd "${DOTFILES_HOME}"/setup && ./log ok "VSCode extension list successfully regenerated.")
)

./log ok "Backup complete!"
./log info "The following files were backed up:
    $DOTFILES_HOME/backup/Brewfile
    $DOTFILES_HOME/backup/npm.global.backup.txt
    $DOTFILES_HOME/backup/vscode-extensions-backup.txt"

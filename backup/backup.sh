#!/usr/bin/env bash

export PATH="$PWD/setup:$PATH"

# cd "${DOTFILES_HOME}"/setup || exit

log info "Backing up files to: $DOTFILES_HOME/backup (run the command again if it fails!)"
(
    cd "${DOTFILES_HOME}"/backup || exit

    log info "Backing up Homebrew packages..."
    rm Brew*
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump
    log ok "Brewfile successfully regenerated."

    log info "Backing up global NPM packages..."
    backup-global backup -o npm.global.backup.txt
    log ok "NPM Backup successfully regenerated."

    log info "Backing up VSCode extension list..."
    code --list-extensions >vscode-extensions-backup.txt
    log ok "VSCode extension list successfully regenerated."

    log info "backing up list of globally-installed Python tools..."
    pipx list --json | jq -r '.venvs[].metadata.main_package.package_or_url' > pipx-deps.txt
    log ok "List of Python global packages successfully installed."
)

log ok "Backup complete!"
log info "The following files were backed up:
    $DOTFILES_HOME/backup/Brewfile
    $DOTFILES_HOME/backup/npm.global.backup.txt
    $DOTFILES_HOME/backup/vscode-extensions-backup.txt
    $DOTFILES_HOME/backup/pipx-deps.txt"

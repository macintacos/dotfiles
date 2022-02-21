#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

_default:
    @just --list --unsorted

setup: hooks symlink
	@setup/install.sh

# Install everything
install: hooks
	@setup/install.sh install-normal

install-ci:
	@setup/install.sh install-ci

# Symlink files
symlink:
	@setup/symlink.sh

# Set up git hooks so that things are committed the way we want
hooks:
	@echo "==> Setting up hooks..."
	find .git/hooks -type l -exec rm {} \;
	find .githooks -type f -exec  ln -sf ../../{} .git/hooks \;
	@echo "==> Done."


# Backup packages, casks, and plugins
backup:
	@backup/backup.sh

# Sort keybindings (and eventually other things)
sort:
	@echo "==> Sorting things..."
	node vscode/sort-keybindings.js
	prettier -w vscode/settings.json
	@echo "==> Things have been sorted."

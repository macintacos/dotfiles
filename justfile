#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

_default:
    @just --list --unsorted

setup:
	@setup/install.sh

# Symlink files
symlink:
	@setup/symlink.sh

# Backup packages, casks, and plugins
backup:
	@backup/backup.sh

# Sort keybindings (and eventually other things)
sort:
	@echo "==> Sorting things..."
	node vscode/sort-keybindings.js
	prettier -w vscode/settings.json
	@echo "==> Things have been sorted."

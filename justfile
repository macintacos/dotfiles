#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.# Install everything

_default:
    @just --list --unsorted

install: hooks
	@setup/install.sh install-normal

install-ci:
	@setup/install.sh install-ci

# Set up git hooks so that things are committed the way we want
hooks:
	@echo "==> Setting up hooks..."
	find .git/hooks -type l -exec rm {} \;
	find .githooks -type f -exec  ln -sf ../../{} .git/hooks \;
	@echo "==> Done."

# Symlink files
symlink:
	@zsh -i -c link_all

# Backup packages, casks, and plugins
backup:
	@zsh -i -c backup-now

#!/bin/bash

# Assume we're running from the root of the project
export PATH="$PWD/setup:$PATH"

## Force an exit if script tries to use an unset variable:
set -o nounset
## Force an exit if any commands exit with non-zero status:
set -o errexit
## Catch mid-pipe non-zero exit statuses:
set -euo pipefail
IFS=$'\n\t'
## Print the command trace before executing the command:
# set -o xtrace

setup_directory="$PWD"
plzlog info "You're currently here: $setup_directory"

# include my library helpers for colorized echo and require_brew, etc
plzlog info "Sourcing things that we need to source..."
source "./zsh/.zshenv"
source "./setup/symlink.sh"
plzlog ok "Files sourced successfully (not that I thought they wouldn't)"

# Setup Homebrew
plzlog info "Installing Homebrew packages and casks..."

(
	cd ./backup

	brew bundle install | while read -r line; do
		plzlog info "${line}"
	done
)

plzlog info "Homebrew setup complete (if there were errors, fix them, and re-run the script)"

# Setup ZSH
plzlog info "Setting up zsh..."
(
	cd "$HOME"
	zsh_link
)

# Setup Nvim
# neovim is already installed via homebrew
plzlog info "Setting up neovim (note that it was already installed during the Homebrew step)..."
(
	cd "$HOME"
	nvim_link
)

# Setup global NPM packages
# npm version management and backup script
plzlog info "Setting up node/npm..."
plzlog info "Installing 'n' to manage our node dependencies..."
(curl -L https://git.io/n-install | bash) || true
plzlog ok "'n' installed."

plzlog info "Installing the latest node/npm LTS..."
bash n lts

plzlog info "Installing backup-global script so that we can reinstall global packages from backup..."
npm install -g backup-global
plzlog info "Installing global npm packages..."
backup-global install --input ./backup/npm.global.backup.txt
plzlog ok "Done installing global npm packages."

# Setup asdf plugins/shims
# we're assuming that 'asdf' is installed already by this point
plzlog info "Installing 'asdf' plugins/shims..."

plzlog info "Installing 'kubectl' plugin..."
(asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git) || true # continue even if we already have it
asdf install kubectl latest

# Setup MongoDB "m"
# we're assuming that 'm' is installed already by this point
plzlog info "Installing latest stable version of MongoDB..."
m stable
plzlog ok "Done installing MongoDB."

# Setup a bunch of OS settings via plist entries

plzlog info "Wrap things up by symlinking again for good measure..."
(
	cd "$HOME"
	link_all
)
plzlog ok "Done!"

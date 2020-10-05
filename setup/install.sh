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

case $1 in
install-ci)
	plzlog info "Skipping homebrew installation because homebrew takes forever"
	;;
install-normal)
	(
		cd ./backup

		brew bundle install | while read -r line; do
			plzlog info "${line}"
		done
	)
	;;
*)
	echo 'Bad option passed in for homebrew installation - aborting'
	exit 1
	;;
esac

plzlog info "Homebrew setup complete (if there were errors, fix them, and re-run the script)"

# Setup ZSH
plzlog info "Setting up zsh..."
zsh_link

# Setup Nvim
plzlog info "Setting up neovim..."
case $1 in
install-ci)
	plzlog info "Installing neovim because we're in CI..."
	brew install neovim
	;;
install-normal) ;;
esac
nvim_link

# Setup global NPM packages
# npm version management and backup script
plzlog info "Setting up node/npm..."
plzlog info "Installing 'n' to manage our node dependencies..."
case $1 in
install-ci)
	# need to get rid of cached dependencies: https://github.com/actions/virtual-environments/blob/macos-10.15/20200918.1/images/macos/macos-10.15-Readme.md
	rm -rf /usr/local/bin/node
	rm -rf /usr/local/bin/npm
	;;
install-normal) ;;
esac
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
plzlog info "Installing 'asdf' plugins/shims..."

case $1 in
install-ci)
	plzlog info "Installing asdf because we're in CI..."
	brew install asdf
	shift
	;;
install-normal) shift ;;
esac
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
link_all
plzlog ok "Done!"

"$@"

#!/usr/bin/env bash

# TODO: Make this install Fish instead.
# TODO: Remove anything that we don't care about anymore.
# TODO: Break installation into a bunch of scripts to make sure it's compartmentalized?
# TODO: Make a "proper" exit trap for this script.
# TODO: Switch this to zx? fish?
# TODO: Make sure that pyenv is installed with homebrew method, and make sure that the repo is in an apporpriate location.
# TODO: Make sure that there is a "Community" folder in GitLocal that you can dump community projects
# TODO: Make it so that the backup method suggests making a backup - maybe we diff what has changed and ask if we really want that to be backed up?

echo "Look at the TODOs in this file, it's not ready for prime time."
exit 0

# Assume we're running from the root of the project
export PATH="$PWD/setup:$PATH"

set -o nounset ## Force an exit if script tries to use an unset variable
set -o errexit ## Force an exit if any commands exit with non-zero status
set -euo pipefail ## Catch mid-pipe non-zero exit statuses
IFS=$'\n\t'

## Print the command trace before executing the command:
# set -o xtrace

setup_directory="$PWD"
log info "You're currently here: $setup_directory"

# include my library helpers for colorized echo and require_brew, etc
log info "Sourcing things that we need to source..."
# shellcheck source=../setup/symlink.sh
source "./setup/symlink.sh"
log ok "Files sourced successfully (not that I thought they wouldn't)"

# Setup Homebrew
log info "Installing Homebrew packages and casks..."

case $1 in
install-ci)
	log info "Skipping homebrew installation because homebrew takes forever"
	;;
install-normal)
	(
		cd ./backup

		brew bundle install | while read -r line; do
			log info "${line}"
		done
	)
	;;
*)
	echo 'Bad option passed in for homebrew installation - aborting'
	exit 1
	;;
esac

log info "Homebrew setup complete (if there were errors, fix them, and re-run the script)"

# Setup ZSH
log info "Setting up zsh..."
zsh_link

log info "Updating all zsh plugins..."
(zsh -i -c "zinit update --all --parallel") || true

# Setup Nvim
log info "Setting up neovim..."
case $1 in
install-ci)
	log info "Installing neovim because we're in CI..."
	brew install neovim
	;;
install-normal) ;;
esac
nvim_link

# Setup global NPM packages
# npm version management and backup script
case $1 in
install-ci)
	log info "Installing node/nodenv because we're in CI..."
	# brew install node # TODO: Make sure that we just install `n`, and  don't use `brew` to install it.
	# brew install nodenv
	;;
install-normal) ;;
esac
# nodenv install "$(node --version | sed -e 's/v//g')" # TODO: Switch to `n`
# nodenv global "$(node --version | sed -e 's/v//g')"
npm install -g backup-global
log info "Installing global npm packages..."
backup-global install --input ./backup/npm.global.backup.txt
log ok "Done installing global npm packages."

# Setup asdf plugins/shims
log info "Installing 'asdf' plugins/shims..."

case $1 in
install-ci)
	log info "Installing asdf because we're in CI..."
	brew install asdf
	;;
install-normal) ;;
esac
log info "Installing 'kubectl' plugin..."
(asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git) || true # continue even if we already have it
asdf install kubectl latest

# Setup pyenv
case $1 in
install-ci)
	log info "Installing pyenv because we're in CI..."
	brew install pyenv
	;;
install-normal)
	pyenv install 3.9.4
	;;
esac

# Setup MongoDB "m"
# we're assuming that 'm' is installed already by this point
log info "Installing latest stable version of MongoDB..."
mkdir -p ~/bin
m stable
log ok "Done installing MongoDB."

# Setup VSCode Extensions from existing backup
case $1 in
install-ci)
	log info "Skipping vscode setup on CI"
	shift
	;;
install-normal)
	log info "Installing VSCode extensions"
	(cat ./backup/vscode-extensions-backup.txt | grep -v '^#' | xargs -L1 code --install-extension) || true # continue even if we already have it
	shift
	;;
esac

# symlink everything to wrap it up
log info "Wrap things up by symlinking again for good measure..."
link_all
log ok "Done!"

# now do the macos stuff
./macos

"$@"

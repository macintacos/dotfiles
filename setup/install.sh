#!/usr/bin/env bash

# Assume we're running from the root of the project
export PATH="$PWD/setup:$PATH"

set -o nounset    ## Force an exit if script tries to use an unset variable
set -o errexit    ## Force an exit if any commands exit with non-zero status
set -euo pipefail ## Catch mid-pipe non-zero exit statuses
IFS=$'\n\t'

# Exiting the script properly - use "err_exit <message>" to properly exit.
trap "exit 1" SIGUSR1
PROC=$$
err_exit() {
	echo -e "$@" >&2
	kill -10 $PROC
}

setup_directory="${PWD##*/}"
log info "You're currently here: $setup_directory"

if [[ "${setup_directory}" != "dotfiles" ]]; then
	err_exit "You need to run this from the dotfiles root with the 'just' program. Once 'just' is installed, run 'just setup'"
fi

# Ask for the administrator password upfront
log info "We need your password in order to setup things properly."
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

./setup/tools/node   # Setup node with 'n' and some global packages
./setup/tools/python # Setup pyenv with some global requirements
./setup/tools/kube   # Setup asdf-managed CLI tools
./setup/tools/brew   # Setup Homebrew - needs to be done first
./setup/tools/java   # Setup Java-related things
./setup/tools/neovim # Setup Neovim environment
./setup/tools/mongo  # Setup things for MongoDB
./setup/tools/vscode # Setup VSCode - maybe not?
./setup/tools/tmux   # Setup tmux

./setup/symlink.sh  # Symlink things
./setup/macos/_main # Setting up macOS system settings...

log info "Pulling down a bunch of repositories we care about..."
(
	cd "$HOME/GitLocal/Play"
	gh repo clone macintacos/jmt.dev
	gh repo clone macintacos/site
)
(
	cd "$HOME/GitLocal/Work"
	gh repo clone mongodb/mongo
	gh repo clone mongodb/mongocli
)
(
	cd "$HOME/GitLocal/Community"
	gh repo clone python-poetry/poetry
	gh repo clone LunarVim/LunarVim
	gh repo clone VSpaceCode/VSpaceCode
)
(
	cd "$HOME/GitLocal/Learning"
	gh repo clone macintacos/advent-of-code
)

log ok "Done!"
log info "You'll probably want to do the following:"
log info ""
log info "- Set 'fish' as your login shell in iTerm."
log info "- Download other repos (check Craft!)"
log info "- Make sure Fig is configured properly (might just want to re-install)"
log info "- Check to make sure all of your tooling is in your PATH - this script is still in 'alpha' state so expect things to be all over the place."

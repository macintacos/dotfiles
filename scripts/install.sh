#!/bin/bash

# TODO: As a general rule, I need to parameterize this and load this in separately.

## TODO: A lot of this is only important to run in CI; if it's not in CI, we should probably skip setting these variables.
## Force an exit if script tries to use an unset variable:
set -o nounset
## Force an exit if any commands exit with non-zero status:
set -o errexit
## Catch mid-pipe non-zero exit statuses:
set -euo pipefail
IFS=$'\n\t'
## Print the command trace before executing the command:
set -o xtrace

# include my library helpers for colorized echo and require_brew, etc

source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh
source "./.zshenv"

GITHUB_PROJECT_INSTALL_DIR="$HOME/GitLocal/Play"

bot "None of this is actually tested yet, so use at your own risk!"

bot "Let's get this machine set up!"
bot "First, we symlink."
sudo ls -r
sudo cat /etc/sudoers
bash "./symlink.sh"

###############################################################################
bot "Setting up some git stuff..."
###############################################################################

git config --global core.excludesfile "$GITHUB_PROJECT_INSTALL_DIR/git-config/gitignore_global"

# cat ~/.vimrc
# vim --version

# Ask for the administrator password upfront
if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL #macintacos/dotfiles" "/etc/sudoers"; then

	# Ask for the administrator password upfront
	# TODO: Use `expect` for these prompts, to determine if we're in CI?
	bot "Next, I need you to enter your sudo password so I can install some things:"
	sudo -v

	# Keep-alive: update existing sudo time stamp until the script has finished
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &

	# TODO: Use `expect` for these prompts, to determine if we're in CI?
	bot "Do you want me to setup this machine to allow you to run sudo without a password?\nPlease read here to see what I am doing:\nhttp://wiki.summercode.com/sudo_without_a_password_in_mac_os_x \n"
	read -r -p "Make sudo passwordless? [y|N] " response

	if [[ $response =~ (yes|y|Y) ]]; then
		sudo cp /etc/sudoers /etc/sudoers.back
		echo '%wheel		ALL=(ALL) NOPASSWD: ALL #macintacos/dotfiles' | sudo tee -a /etc/sudoers >/dev/null
		sudo dscl . append /Groups/wheel GroupMembership "$(whoami)"
		bot "You can now run sudo commands without password!"
	fi
fi

###############################################################################
bot "Making ZSH/perlbrew/vim/mongo configuration changes..."
###############################################################################

CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
	bot "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
	# sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
	# chsh -s /usr/local/bin/zsh
	sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh >/dev/null 2>&1
	ok "Done"
fi

# Installing oh-my-zsh
running "getting oh-my-zsh installed..."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | grep -v 'env zsh -l')"
ok "Done"

## zsh plugins
## TODO: Consider changing these to zplugs?
running "installing zsh plugins..."
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/zsh-autosuggestions
ok "Done"
sudo git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/zsh-completions
ok "Done"
sudo git clone https://github.com/JamesKovacs/zsh_completions_mongodb.git ${ZSH_CUSTOM:-~/.dotfiles/.h-my-zsh/custom}/plugins/mongodb
ok "Done"
sudo git clone https://github.com/arzzen/calc.plugin.zsh.git ~/.dotfiles/.oh-my-zsh/plugins/calc/calc.plugin.zsh
ok "Done"
sudo git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/custom/plugins/alias-tips
ok "Done"
sudo git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/fast-syntax-highlighting
ok "Done"
sudo git clone https://github.com/hlissner/zsh-autopair.git ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/zsh-autopair
ok "Done"
sudo git clone https://github.com/Tarrasch/zsh-bd.git ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/zsh-bd
ok "Done"
sudo git clone https://github.com/b4b4r07/enhancd ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/plugins/enhancd
ok "Done"

running "installing zsh themes..."
sudo git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.dotfiles/oh-my-zsh/custom}/themes/powerlevel9k
ok "Done"

# Installing perlbrew
running "installing perlbrew..."
\curl -L https://install.perlbrew.pl | bash
ok "Done"

# mongodb-specific tools
running "installing m..."
mkdir -p $GITHUB_PROJECT_INSTALL_DIR && cd $GITHUB_PROJECT_INSTALL_DIR && git clone git://github.com/aheckmann/m.git && cd m && make install
ok "Done"

###############################################################################
bot "Homebrew installation begin..."
###############################################################################

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 >/dev/null
if [[ $? != 0 ]]; then
	action "installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [[ $? != 0 ]]; then
		error "unable to install homebrew, script $0 abort!"
		exit 2
	fi
else
	ok "Done"
	# Make sure we’re using the latest Homebrew
	running "updating homebrew"
	brew update
	ok "Done"

	# TODO: Use `expect` for these prompts, to determine if we're in CI?
	bot "Before installing brew packages, we can upgrade any outdated packages."
	read -r -p "run brew upgrade? [y|N] " response

	if [[ $response =~ ^(y|yes|Y) ]]; then
		# Upgrade any already-installed formulae
		action "upgrade brew packages..."
		brew upgrade
		ok "brews updated..."
	else
		ok "skipped brew package upgrades."
	fi
fi

###############################################################################
bot "Configuring brew & cask-installing things..."
###############################################################################

running "checking brew-cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
	action "installing brew-cask"
	require_brew caskroom/cask/brew-cask
fi
brew tap caskroom/versions >/dev/null 2>&1
ok "Done"

running "installing homebrew stuff"
# skip those GUI clients, git command-line all the way
require_brew git -v

# installing fzf
require_brew fzf -v
$(brew --prefix)/opt/fzf/install

# vim settings

# cmake is required to compile vim bundle YouCompleteMe
require_brew cmake -v
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
bot "Installing vim plugins...press 'enter' to accept."
# TODO: Figure out why this gets hung
vim +PlugInstall +qall >/dev/null 2>&1
ok "Done"
# fi

# install packages in brewfile
running "installing casks and apps..."
brew bundle check
ok "Done"
brew bundle
ok "Done"

# node version manager
require_brew nvm
require_nvm stable
# always pin versions (no surprises, consistent dev/build machines)
npm config set save-exact true

# TODO: Should figure out a way to manually back this up; consider making a `backup.sh` script?
running "installing settings-sync for vscode..."
code --install-extension Shan.code-settings-sync

###############################################################################
bot "Installing NPM global modules..."
###############################################################################

# TODO: now that we have an NPM backup script, we should probably use that file to install these all at once instead of manually updating this list here.
running "installing NPM modules..."
npm install -g jira2md
ok "Done"
npm install -g mgeneratejs
ok "Done"
npm install -g mongo-hacker
ok "Done"
npm install -g prettier
ok "Done"
npm install -g yo
ok "Done"
npm install -g bash-language-server
ok "Done"
npm install -g @vue/cli
ok "Done"
npm install -f eslint
ok "Done"

running "cleanup homebrew"
brew cleanup >/dev/null 2>&1
ok "Done"

###############################################################################
bot "Configuring iTerm2..."
###############################################################################

# TODO: Need to make a script that parses the current iTerm config and substitutes the current $HOME
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${GITHUB_PROJECT_INSTALL_DIR}/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

###############################################################################
bot "Configuring General System UI/UX..."
###############################################################################
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok "Done"

################################################
bot "Standard System Changes..."
################################################

running "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
ok "Done"

###############################################################################
bot "Finder Configs..."
###############################################################################

running "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true
ok "Done"

running "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true
ok "Done"

running "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
ok "Done"

running "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true
ok "Done"

running "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true
ok "Done"

running "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true
ok "Done"

running "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
ok "Done"

running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
ok "Done"

running "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
ok "Done"

running "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
ok "Done"

running "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0
ok "Done"

running "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
ok "Done"

running "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
ok "Done"

running "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
ok "Done"

running "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false
ok "Done"

running "Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true
ok "Done"

running "Show the ~/Library folder"
chflags nohidden ~/Library
ok "Done"

running "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
ok "Done"

running "Setting some default values for QLColorCode"
defaults write org.n8gray.QLColorCode font "IBM Plex Mono"
defaults write org.n8gray.QLColorCode fontSizePoints 11
defaults write org.n8gray.QLColorCode hlTheme Zellner
defaults write org.n8gray.QLColorCode extraHLFlags '-l'
ok "Done"

###############################################################################
bot "You're all set! Some reminders:\n\t* You'll need to manually tun Settings Sync in VSCode. Follow the steps here: https://github.com/shanalikhan/code-settings-sync/wiki/Setup-Guide"
###############################################################################

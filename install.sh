#!/bin/bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh
source "./.zshenv"

GITHUB_PROJECT_INSTALL_DIR="$HOME/Developer/Github"

bot "None of this is actually tested yet, so use at your own risk!"

bot "Let's get this machine set up!"
bot "First, we symlink."
bash "./.symlink.sh"

cat ~/.vimrc

# Ask for the administrator password upfront
if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL #atomantic/dotfiles" "/etc/sudoers"; then

  # Ask for the administrator password upfront
  bot "Next, I need you to enter your sudo password so I can install some things:"
  if [[ "$TESTING_INSTALL" = 1 ]]; then
    bot "Because this is Travis, we'll skip prompting for the password."
  else
    sudo -v
  fi

  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  bot "Do you want me to setup this machine to allow you to run sudo without a password?\nPlease read here to see what I am doing:\nhttp://wiki.summercode.com/sudo_without_a_password_in_mac_os_x \n"
  
  if [[ "$TESTING_INSTALL" = 1 ]]; then
    bot "Because this is Travis, we'll assume we want to make it passwordless."
    response="y"
  else
    read -r -p "Make sudo passwordless? [y|N] " response
  fi
  

  if [[ $response =~ (yes|y|Y) ]];then
      sudo cp /etc/sudoers /etc/sudoers.back
      echo '%wheel		ALL=(ALL) NOPASSWD: ALL #atomantic/dotfiles' | sudo tee -a /etc/sudoers > /dev/null
      sudo dscl . append /Groups/wheel GroupMembership $(whoami)
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
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
  ok
fi

# Installing oh-my-zsh
running "getting oh-my-zsh installed..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; ok

## zsh plugins
running "installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; ok
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions; ok
git clone https://github.com/JamesKovacs/zsh_completions_mongodb.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/mongodb; ok
git clone https://github.com/arzzen/calc.plugin.zsh.git ~/.oh-my-zsh/plugins/calc/calc.plugin.zsh; ok
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/custom/plugins/alias-tips; ok
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting; ok
git clone https://github.com/hlissner/zsh-autopair.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair; ok
git clone https://github.com/Tarrasch/zsh-bd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bd; ok
git clone https://github.com/b4b4r07/enhancd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/enhancd; ok

# Installing perlbrew
running "installing perlbrew..."
\curl -L https://install.perlbrew.pl | bash; ok

# mongodb-specific tools
running "installing m..."
mkdir -p $GITHUB_PROJECT_INSTALL_DIR && cd $GITHUB_PROJECT_INSTALL_DIR && git clone git://github.com/aheckmann/m.git && cd m && make install; ok


# instlaling travis cli
running "installing travis cli..."
ruby -v
gem install travis -v 1.8.9 --no-rdoc --no-ri; ok

###############################################################################
bot "Homebrew installation begin..."
###############################################################################

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
      error "unable to install homebrew, script $0 abort!"
      exit 2
  fi
else
  ok
  # Make sure we’re using the latest Homebrew
  running "updating homebrew"
  brew update
  ok
  bot "before installing brew packages, we can upgrade any outdated packages."
  
  if [[ "$TESTING_INSTALL" = 1 ]]; then
    bot "Because this is Travis, we'll assume we want to upgrade."
    response="y"
  else
    read -r -p "run brew upgrade? [y|N] " response
  fi

  if [[ $response =~ ^(y|yes|Y) ]];then
      # Upgrade any already-installed formulae
      action "upgrade brew packages..."
      brew upgrade
      ok "brews updated..."
  else
      ok "skipped brew package upgrades.";
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
brew tap caskroom/versions > /dev/null 2>&1
ok

running "installing homebrew stuff"
# skip those GUI clients, git command-line all the way
require_brew git
# update zsh to latest
require_brew zsh
# installing special 
require_brew fzf
$(brew --prefix)/opt/fzf/install
# vim settings
bot "Installing vim plugins..."
# cmake is required to compile vim bundle YouCompleteMe
require_brew cmake
vim +PluginInstall +qall > /dev/null 2>&1
# install packages in brewfile
brew bundle --file=./.brewfile
ok

# node version manager
require_brew nvm
require_nvm stable
# always pin versions (no surprises, consistent dev/build machines)
npm config set save-exact true

running "installing settings-sync for vscode..."
code --install-extension Shan.code-settings-sync

###############################################################################
bot "Installing NPM global modules..."
###############################################################################

npm install -g vtop; ok
npm install -g jira2md; ok
npm install -g mgeneratejs; ok
npm install -g mongo-hacker; ok
npm install -g prettier; ok
npm install -g slap; ok
npm install -g yo; ok

running "cleanup homebrew"
brew cleanup > /dev/null 2>&1; ok

###############################################################################
bot "Configuring iTerm2..."
###############################################################################

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "./iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

###############################################################################
bot "Configuring General System UI/UX..."
###############################################################################
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

################################################
bot "Standard System Changes..."
################################################

running "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1;ok

###############################################################################
bot "Finder Configs..."
###############################################################################

running "Keep folders on top when sorting by name (Sierra only)"
defaults write com.apple.finder _FXSortFoldersFirst -bool true;ok

running "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true;ok

running "Disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true;ok

running "Set Desktop as the default location for new Finder windows"
# For other paths, use 'PfLo' and 'file:///full/path/here/'
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/";ok

running "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true;ok

running "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;ok

running "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true;ok

running "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true;ok

running "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true;ok

running "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;ok

running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf";ok

running "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false;ok

running "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true;ok

running "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0;ok

running "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;ok

running "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true;ok

running "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true;ok

running "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false;ok

running "Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true;ok

running "Show the ~/Library folder"
chflags nohidden ~/Library;ok

running "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true;ok

###############################################################################
bot "You're all set! Some reminders:"
bot "\tYou'll need to manually tun Settings Sync in VSCode. Follow the steps here: https://github.com/shanalikhan/code-settings-sync/wiki/Setup-Guide"
###############################################################################

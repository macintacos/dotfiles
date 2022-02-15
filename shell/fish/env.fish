# Global Environment Variables
# These get set before anything else in the interactive shell, from a user configuration perspective.

# M1-specific
if test (uname -m) = 'arm64'
    set -gx N_PREFIX $HOME/.n
    fish_add_path -a /opt/homebrew/bin # Make sure Homebrew is sourced first
end

fish_add_path -a /usr/local/bin # Make sure Homebrew is sourced first

# Homes
set -gx DOTFILES_HOME $HOME/GitLocal/Play/dotfiles
set -gx NVIM_HOME $HOME/GitLocal/Play/nvim
set -gx FISH_HOME $DOTFILES_HOME/shell/fish

set -gx EDITOR nvim
set -gx BAT_THEME Dracula
set -gx CHEAT_COLORS true
set -gx CHEAT_COLORSCHEME dark
set -gx COLORTERM truecolor

set -gx GOPATH $HOME/GoWorkspace
set -gx HOME_LOCAL_BIN $HOME/.local/bin
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
set -gx M_PREFIX $HOME/MongoDB
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PIPX_DEFAULT_PYTHON (pyenv prefix)/bin/python
set -gx RUST $HOME/.cargo/bin
set -gx TERM xterm-256color
set -gx PLUG_NVIM_HOME $NVIM_HOME/viml/plug
set -gx VASA_HOME $HOME/.vasa

# fisher
set -gx fisher_path $FISH_HOME

# Adding stuff to PATH
fish_add_path -a $PYENV_ROOT/bin
fish_add_path -a $HOME_LOCAL_BIN
fish_add_path -a $GOPATH/bin
fish_add_path -a (brew --prefix)/opt/gnu-sed/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/coreutils/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/grep/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/make/libexec/gnubin
fish_add_path -a $ZSH_DIR/secrets
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/MongoDB/bin # where mongodb binaries get stored
fish_add_path -a $HOME/.nimble/bin # where nim binaries get stored

# Custom scripts
fish_add_path -a $DOTFILES_HOME/shell/scripts/python

# Need to do this to get pyenv working correctly
eval ""(pyenv init --path)""
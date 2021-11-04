# Global Environment Variables
# These get set before anything else in the interactive shell, from a user configuration perspective.

fish_add_path -a /opt/homebrew/bin # Make sure Homebrew is sourced first
fish_add_path -a /usr/local/bin # Make sure Homebrew is sourced first

set -gx DOTFILES_HOME $HOME/GitLocal/Play/dotfiles
set -gx NVIM_HOME $DOTFILES_HOME/nvim
set -gx EDITOR 'nvim'
set -gx STARSHIP_CONFIG $DOTFILES_HOME/starship.toml # If for some reason I try starship again
set -gx ZSH_DIR $DOTFILES_HOME/zsh

set -gx BAT_THEME "Dracula"
set -gx CHEAT_COLORS true
set -gx CHEAT_COLORSCHEME dark
set -gx COLORTERM "truecolor"
set -gx GOPATH $HOME/GoWorkspace
set -gx HOME_LOCAL_BIN $HOME/.local/bin
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
set -gx M_PREFIX $HOME/MongoDB
set -gx KUBECONFIG ~/.kube/config.staging:~/.kube/config.prod
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PIPX_DEFAULT_PYTHON $HOME/.pyenv/shims/python
set -gx RUST $HOME/.cargo/bin
set -gx TERM "xterm-256color"

# Adding stuff to PATH
fish_add_path -a $PYENV_BIN
fish_add_path -a $HOME_LOCAL_BIN
fish_add_path -a (brew --prefix)/opt/coreutils/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/grep/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/make/libexec/gnubin
fish_add_path -a $ZSH_DIR/secrets

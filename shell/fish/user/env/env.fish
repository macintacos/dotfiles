# Global Environment Variables
# These get set before anything else in the interactive shell, from a user configuration perspective.

# M1-specific
# TODO: This is where you should do the shellenv thing
eval (/opt/homebrew/bin/brew shellenv)

# Homes
set -gx GITLOCAL_HOME $HOME/GitLocal
set -gx DOTFILES_HOME $GITLOCAL_HOME/Play/dotfiles
set -gx NVIM_HOME $GITLOCAL_HOME/Play/nvim
set -gx FISH_HOME $DOTFILES_HOME/shell/fish

# Other Things
set -gx BAT_THEME Dracula
set -gx CHEAT_COLORS true
set -gx CHEAT_COLORSCHEME dark
set -gx COLORTERM truecolor
set -gx EDITOR nvim
set -gx GOPATH $HOME/GoWorkspace
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOME_LOCAL_BIN $HOME/.local/bin
set -gx KUBECONFIG "$HOME/.kube/config"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
set -gx MMS_HOME $GITLOCAL_HOME/Work/mms
set -gx M_PREFIX $HOME/MongoDB
set -gx PIPX_DEFAULT_PYTHON (pyenv prefix)/bin/python
set -gx PLUG_NVIM_HOME $NVIM_HOME/viml/plug
set -gx PYENV_ROOT $HOME/.pyenv
set -gx RUST $HOME/.cargo/bin
set -gx TERM xterm-256color
set -gx VASA_HOME $HOME/.vasa

# fisher
set -gx fisher_path $FISH_HOME

# Adding stuff to PATH
fish_add_path -a $PYENV_ROOT/bin
fish_add_path -a $HOME_LOCAL_BIN
fish_add_path -a $GOPATH/bin
fish_add_path -a $ZSH_DIR/secrets
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/MongoDB/bin # where mongodb binaries get stored
fish_add_path -a $HOME/.nimble/bin # where nim binaries get stored
fish_add_path -a $HOME/.krew/bin
fish_add_path -a /Applications/CMake.app/Contents/bin
fish_add_path -a (brew --prefix)/opt/gnu-sed/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/coreutils/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/grep/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/make/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/findutils/libexec/gnubin
fish_add_path -a (brew --prefix)/opt/openssl@3/bin

# Custom scripts
fish_add_path -a $DOTFILES_HOME/shell/tools/python
fish_add_path -a $GITLOCAL_HOME/Work/ops-tools/scripts/python/sshnds/bin
fish_add_path -a $HOME/MongoDB/coe-tooling

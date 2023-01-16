#!/usr/bin/env fish
# set fish_trace 1 # uncomment to debug your shell, see https://fishshell.com/docs/current/language.html#debugging

# TODO: Add the if-interactive check for homebrew from https://github.com/Homebrew/brew/issues/10114#issuecomment-750397711

if status --is-interactive
    for config in $__fish_config_dir/user/**/*.fish # User settings
        source $config
    end
end

# Add theme directly
source $__fish_config_dir/themes/nightfox.fish

# Need to do this at the end because reasons (otherwise homebrew's node/npm takes precedence)
set -x N_PREFIX "$HOME/.n"
fish_add_path -m $N_PREFIX/bin

# Misc.
[ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Created by `pipx` on 2022-06-13 04:23:52
set PATH $PATH /Users/macinburrito/.local/bin

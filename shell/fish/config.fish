#!/usr/bin/env fish
# set fish_trace 1 # uncomment to debug your shell, see https://fishshell.com/docs/current/language.html#debugging

# TODO: Add the if-interactive check for homebrew from https://github.com/Homebrew/brew/issues/10114#issuecomment-750397711

if status is-interactive
    source $__fish_config_dir/env.fish # Environment variables

    for lang in $__fish_config_dir/langs/**/*.fish; source $lang; end # Language-specific settings
    for config in $__fish_config_dir/user/**/*.fish; source $config; end # User settings
end
set -x N_PREFIX "$HOME/.n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

[ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"

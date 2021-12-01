#!/opt/homebrew/bin/fish
# set fish_trace 1 # uncomment to debug your shell, see https://fishshell.com/docs/current/language.html#debugging

if status is-interactive
    source $__fish_config_dir/env.fish # Environment variables

    for lang in $__fish_config_dir/langs/**/*.fish; source $lang; end # Language-specific settings
    for config in $__fish_config_dir/user/**/*.fish; source $config; end # User settings
end
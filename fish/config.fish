#!/opt/homebrew/bin/fish

if status is-interactive
    source $__fish_config_dir/env.fish # Environment variables

    for lang in $__fish_config_dir/langs/**/*.fish; source $lang; end # Language-specific settings
    for config in $__fish_config_dir/user/**/*.fish; source $config; end # User settings

    # Other plugins
    zoxide init fish | source
end
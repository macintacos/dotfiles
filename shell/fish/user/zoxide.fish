# Anything FZF related goes to './fzf.fish'
set -gx _ZO_EXCLUDE_DIRS "$HOME/Library/Containers/*:$HOME/.cache/*:$HOME/Library/Caches/*"

zoxide init fish | source
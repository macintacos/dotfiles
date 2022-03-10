# Anything FZF related goes to './fzf.fish'
set -gx _ZO_EXCLUDE_DIRS "$HOME/Library/Containers/*:$HOME/.cache/*:$HOME/Library/Caches/*:/var/*"

zoxide init fish | source

function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result

    if git rev-parse &>/dev/null
        clear
        echo "Querying repository details...."
        onefetch
    end
end

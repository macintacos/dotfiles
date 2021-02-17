# Description: A place for stuff related to zoxide's configuration
# Zoxide: https://github.com/ajeetdsouza/zoxide

export _ZO_EXCLUDE_DIRS="$HOME/Library/Containers/*"

export _ZO_FZF_OPTS="
  --height 60%
  --reverse
  --border
  --color=dark
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
  --bind tab:down
  --cycle
"

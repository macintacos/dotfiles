# Abbreviations

abbr -a c 'clear && ll' # clear terminal display, show directory
abbr -a cat 'bat --pager="less -XRF"' # because bat is just insanely better than cat
abbr -a cls clear # clear sisplay, just like `mongo` shell
abbr -a cp 'cp -iv' # preferred 'cp' implementation
abbr -a diff delta # use delta as your differ of choice
abbr -a f 'open -a Forklift .' # opens current directory in Forklift
abbr -a j jless
abbr -a py python # .... python
abbr -a rg 'rg -ziN' # always ignore line numbers, search compressed files, case-insensitivity
abbr -a rm trash # a better rm
abbr -a s 's --provider "google"' # 's' with a default provider of Google
abbr -a t tmux
abbr -a v nvim # shortening usage of nvim
abbr -a vs code # shortening vscode's code
abbr -a x "xplr --config $DOTFILES_HOME/xplr/init.lua" # open 'xplr'
abbr -a ydl youtube-dl # because duh?
abbr -a zj zellij --config $DOTFILES_HOME/shell/zellij/config.yaml # Run zellij
abbr -a zr zrun # making zrun a bit more easy to run

# git-related aliases - check ./functions/git.fish for functions
abbr -a g git
abbr -a gl "git pull"
abbr -a gf "git fetch"
abbr -a gfp "git fetch --prune"
abbr -a gp "git push"
abbr -a sm smerge
abbr -a gt gittower
abbr -a git_prune_deleted_remotes "git branch -vv | grep ': gone' | grep -v '\*' | awk '{ print \$1; }' | xargs -r git branch -D"

# kubernetes
abbr -a k kubectl
abbr -a kx kubectl ctx
abbr -a kn kubectl ns
abbr -a kk kubectl krew

# one-liner helpers
abbr -a flatten 'find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'

# Abbreviations

abbr c 'clear && ll' # clear terminal display, show directory
abbr cat 'bat --pager="less -XRF"' # because bat is just insanely better than cat
abbr cls clear # clear sisplay, just like `mongo` shell
abbr cp 'cp -iv' # preferred 'cp' implementation
abbr diff delta # use delta as your differ of choice
abbr f 'open -a Forklift .' # opens current directory in Forklift
abbr h hx # slight convenience for the helix editor
abbr j just # runs the `just` tool: https://github.com/casey/just
abbr jl jless # runs the `jless` tool: https://jless.io/
abbr py python # .... python
abbr rg 'rg -ziN' # always ignore line numbers, search compressed files, case-insensitivity
abbr rm trash # a better rm
abbr s 's --provider "google"' # 's' with a default provider of Google
abbr t tmux
abbr v nvim # shortening usage of nvim
abbr vs code # shortening vscode's code
abbr x "xplr --config $DOTFILES_HOME/xplr/init.lua" # open 'xplr'
abbr ydl youtube-dl # because duh?
abbr zj zellij --config $DOTFILES_HOME/shell/zellij/config.yaml # Run zellij
abbr zr zrun # making zrun a bit more easy to run

# git-related aliases - check ./functions/git.fish for functions
abbr g git
abbr gl "git pull"
abbr gf "git fetch"
abbr gfp "git fetch --prune"
abbr gp "git push"
abbr sm smerge
abbr gt gittower
abbr git_prune_deleted_remotes "git branch -vv | grep ': gone' | grep -v '\*' | awk '{ print \$1; }' | xargs -r git branch -D"

# kubernetes
abbr k kubectl
abbr kx kubectl ctx
abbr kn kubectl ns
abbr kk kubectl krew

# one-liner helpers
abbr flatten 'find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'

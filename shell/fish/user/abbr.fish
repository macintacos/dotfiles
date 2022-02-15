# Abbreviations

abbr -a c 'clear && ll' # clear terminal display, show directory
abbr -a cat bat # because bat is just insanely better than cat
abbr -a cls clear # clear sisplay, just like `mongo` shell
abbr -a cp 'cp -iv' # preferred 'cp' implementation
abbr -a diff delta # use delta as your differ of choice
abbr -a f 'open -a Forklift .' # opens current directory in Forklift
abbr -a py python # .... python
abbr -a rg 'rg -ziN' # always ignore line numbers, search compressed files, case-insensitivity
abbr -a rm trash # a better rm
abbr -a s 's --provider "google"' # 's' with a default provider of Google
abbr -a t 'tail -f' # shorten tail, and always continue to tail unless cancelled
abbr -a v nvim # shortening usage of nvim
abbr -a vs code # shortening vscode's code
abbr -a x "xplr --config $DOTFILES_HOME/xplr/init.lua" # open 'xplr'
abbr -a ydl youtube-dl # because duh?
abbr -a zr zrun # making zrun a bit more easy to run

# git-related aliases
abbr -a g git
abbr -a gl "git pull"
abbr -a gf "git fetch"
abbr -a gp "git push"
abbr -a gst lazygit # better way to view git status
abbr -a sm smerge
abbr -a cdg "cd (git rev-parse --show-toplevel)"

# cd
abbr -a cdd 'cd ..' # cd back 1 directory
abbr -a cddd 'cd ../..' # cd back 2 directories
abbr -a cdddd 'cd ../../..' # cd back 3 directories
abbr -a cddddd 'cd ../../../..' # cd back 4 directories
abbr -a cdddddd 'cd ../../../../..' # cd back 5 directories

# kubernetes
abbr -a k kubectl
abbr -a kx kubectx

# one-liner helpers
abbr -a flatten 'find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'


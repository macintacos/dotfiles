# Aliases

abbr -a cat 'bat'                                # because bat is just insanely better than cat
abbr -a c 'clear && ll'                          # clear terminal display, show directory
abbr -a cls 'clear'                              # clear sisplay, just like `mongo` shell
abbr -a cp 'cp -iv'                              # preferred 'cp' implementation
abbr -a diff 'delta'                             # use delta as your differ of choice
abbr -a f 'open -a Forklift .'                   # opens current directory in Forklift
abbr -a x "xplr"                                 # open 'xplr'
abbr -a rg 'rg -ziN'                             # always ignore line numbers, search compressed files, case-insensitivity
abbr -a rm 'trash'                               # a better rm
abbr -a s 's --provider "google"'                # 's' with a default provider of Google
abbr -a t 'tail -f'                              # shorten tail, and always continue to tail unless cancelled
abbr -a v 'nvim'                                 # shortening usage of nvim
abbr -a vs 'code'                                # shortening vscode's code
abbr -a ydl 'youtube-dl'                         # because duh?
abbr -a zr 'zrun'                                # making zrun a bit more easy to run

# git-related aliases
abbr -a gst 'lazygit' # better way to view git status
abbr -a sm "smerge"

# exa-related aliases
abbr -a ls 'exa -F --group-directories-first --icons --color-scale'
abbr -a l 'exa -lF --group-directories-first --icons --color-scale'
abbr -a ll 'exa -laF --group-directories-first --icons --color-scale --git --time-style long-iso'
abbr -a tree 'exa -F --group-directories-first --icons --color-scale --tree -L 2'

# cd
abbr -a cdd 'cd ..'                 # cd back 1 directory
abbr -a cddd 'cd ../..'             # cd back 2 directories
abbr -a cdddd 'cd ../../..'         # cd back 3 directories
abbr -a cddddd 'cd ../../../..'     # cd back 4 directories
abbr -a cdddddd 'cd ../../../../..' # cd back 5 directories

# one-liner helpers
abbr -a flatten 'find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'
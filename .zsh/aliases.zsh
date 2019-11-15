# ALIASES

# UTILITIES; SHORTENED {{{
alias zz='_z -c 2>&1'
alias zr='zrun'                     # making zrun a bit more easy to run
alias things='things.sh'            # shortening things script
alias c='clear && ll'               # clear terminal display, show directory
alias cls='clear'                   # clear sisplay, just like `mongo` shell
alias cp='cp -iv'                   # preferred 'cp' implementation
alias mv='mv -iv'                   # preferred 'mv' implementation
alias rm='rm -i'                    # makes sure 'rm' always requires confirmation
alias f='open -a Forklift .'        # opens current directory in Forklift
alias edit='vim'                    # default editor if i don't want to leave the terminal
alias grep='grep --color'           # always colorize output
alias rg='rg -ziN'                  # always ignore line numbers, search compressed files, case-insensitivity
alias ff='fzf'                      # shortening fzf
alias t='tail -f'                   # shorten tail, and always continue to tail unless cancelled
alias dud='du -d 1 -h'              # get size of all directories in current directory, including self
alias duf='du -sh *'                # get size of all files in currect directory, exclusing self, including directories
alias ydl='youtube-dl'              # because it's annoying as hell to type this out everytime
alias cat='bat --theme="ansi-dark"' # because bat is just insanely better than cat
alias vs='code'                     # shortening vscode's code
alias keka='Keka'                   # unzip utility on mac
alias touch='ad'                    # advance_touch, a better newfile implementation. See: https://github.com/tanrax/terminal-AdvancedNewFile#-advanced-new-file-
alias top='glances'                 # better resource visualizer
alias rm='trash -v'                 # a better rm
alias kill='fkill'                  # a better process killer
alias j='autojump'                  # autojump alias
alias v='nvim'                      # shortening usage of nvim
alias nv='nvim'
alias tldr='tldr -t base16'
alias r='ranger-cd'
alias du='du -hs * | sort -hr | less'
# alias idea='open -a "`ls -dt /Applications/IntelliJ\ IDEA*|head -1`"'
# }}}

# GIT ALIASES {{{
eval "$(hub alias -s)"         # hub = git; hub is a superset of git, so everything should work
alias gst='tig status'         # better way to view git status
alias gclean='git-clean-local' # cleans out any branches from local that have been deleted on remote
# }}}

# LS/TREE IMPROVEMENTS (aka -> lsd) {{{
# alias ls='lsd --group-dirs first'                    # substituting regular ls with exa
# alias l='ls -l'                                      # preferred use of l
# alias ll='ls -la --blocks permission,size,date,name' # preferred use of ll
# alias lr='ls -laR'                                   # recursive preferred use
# alias tree='ls --tree'
# }}}

# EXA/TREE IMPROVEMENTS (aka -> exa) {{{
alias ls='exa -F --group-directories-first'
alias l='ls -l'
alias ll='ls -la --git --color-scale'
alias tree='ls --tree'
# }}}

# CD ALIASES {{{
alias cdlogs="cd $HOME/Downloads/logs"
alias cdtyp="cd $HOME/GitLocal/Work/Typinator"
alias cdatlas="cd $HOME/MongoDB/_AtlasPlayground"
alias cddot="cd $HOME/GitLocal/Play/dotfiles"
alias cdwork="cd $HOME/GitLocal/Work"
alias cdplay="cd $HOME/GitLocal/Play"
alias cdgit="cd $HOME/GitLocal && cd"
# }}}

# VS CODE ALIASES {{{
alias zshrc='code ~/.zshrc' # Quick access to the ~/.zshrc file
alias dotfiles="code $HOME/GitLocal/Play/dotfiles"
# }}}

# MONITORING {{{
#   memHogsTop, memHogsPs:  find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  find CPU hogs
#   -----------------------------------------------------
alias cpuhogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'
# }}}

# FIND ALIASES {{{
alias flatten='find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'
# }}}

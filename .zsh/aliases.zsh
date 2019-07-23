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
alias v='nvim'                      # shortening usage of nvim
alias nv='nvim'
# }}}

# GIT ALIASES {{{
eval "$(hub alias -s)"            # hub = git; hub is a superset of git, so everything should work
alias gst='tig status'            # better way to view git status
alias gclean='git-clean-local'    # cleans out any branches from local that have been deleted on remote
# }}}

# LS IMPROVEMENTS (aka -> exa) {{{
alias ls='exa --icons'            # substituting regular ls with exa
alias l='exa -la --git --icons'   # preferred use of ll/exa
alias ll='exa -lah --git --icons' # preferred use of ll/exa
alias lr='exa -laR --git --icons' # recursive preferred use
# }}}

# CD ALIASES {{{
alias cdlogs="cd $HOME/Downloads/logs"
alias cddev="cd $HOME/Drive\ -\ Personal/Developer"
alias cdtyp="cd $HOME/Drive\ -\ Personal/Developer/MongoDB/_Typinator"
alias cdatlas="cd $HOME/Drive\ -\ Personal/Developer/MongoDB/_AtlasPlayground"
alias cddot="cd $HOME/Drive\ -\ Personal/Developer/GitHub\ -\ Personal/dotfiles"
# }}}

# VS CODE ALIASES {{{
alias zshrc='code ~/.zshrc' # Quick access to the ~/.zshrc file
alias dotfiles="code $HOME/Drive\ -\ Personal/Developer/GitHub\ -\ Personal/dotfiles"
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

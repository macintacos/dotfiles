# ALIASES

# UTILITIES; SHORTENED {{{
alias z='zrun'               # making zrun a bit more easy to run
alias things='things.sh'     # shortening things script
alias c='clear && l'         # clear terminal display, show directory
alias cls='clear'            # clear sisplay, just like `mongo` shell
alias cp='cp -iv'            # preferred 'cp' implementation
alias mv='mv -iv'            # preferred 'mv' implementation
alias rm='rm -i'             # makes sure 'rm' always requires confirmation
alias f='open -a Forklift .' # opens current directory in Forklift
alias edit='vim'             # default editor if i don't want to leave the terminal
alias grep='grep --color'    # always colorize output
alias rg='rg -N'             # always don't show lines (isn't necessary most of the time)
alias ff='fzf'               # shortening fzf
alias t='tail -f'            # shorten tail, and always continue to tail unless cancelled
alias dud='du -d 1 -h'       # get size of all directories in current directory, including self
alias duf='du -sh *'         # get size of all files in currect directory, exclusing self, including directories
alias ydl='youtube-dl'       # because it's annoying as hell to type this out everytime
alias cat='bat'              # because bat is just insanely better than cat

#   ls improvements/variations
#   -----------------------------------------------------
# alias l='ls -lFGh'    # size,show type,human readable
# alias ls='ls -G'      # colorized output
# alias la='ls -lAFGh'  # long list,show almost all,show type,human readable
# alias lt='ls -ltFGh'  # long list,sorted by date,show type,human readable
# alias ll='ls -FGlAhp' # preferred 'ls' implementation

#   ls-exa improvements/variations (using exa as the backing for ls)
#   -----------------------------------------------------
alias ls='exa'             # substituting regular ls with exa
alias ll='exa -laG --git'  # preferred use of ll/exa
alias lr='exa -laRG --git' # recursive preferred use
# }}}

# CD ALIASES {{{
alias cdlogs="cd $HOME/Downloads/logs"
alias cddev="cd $HOME/Google\ Drive/Developer"
alias cdtyp="cd $HOME/Google\ Drive/Developer/MongoDB/_Typinator"
alias cdatlas="cd $HOME/Google\ Drive/Developer/MongoDB/_AtlasPlayground"
# }}}

# VS CODE ALIASES {{{
alias zshrc='code ~/.zshrc' # Quick access to the ~/.zshrc file
alias dotfiles='code "$HOME/Google Drive/Developer/GitHub - Personal/dotfiles"'
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

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"
# }}}

# ZSH-SPECIFIC {{{
if is-at-least 4.2.0; then
    # open browser on urls
    if [[ -n "$BROWSER" ]]; then
        _browser_fts=(htm html de org net com at cx nl se dk)
        for ft in $_browexitser_fts; do alias -s $ft=$BROWSER; done
    fi

    _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex md js css json scpt)
    for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

    if [[ -n "$XIVIEWER" ]]; then
        _image_fts=(jpg jpeg png gif mng tiff tif xpm)
        for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
    fi

    _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
    for ft in $_media_fts; do alias -s $ft=mplayer; done

    # read documents
    alias -s pdf=acroread
    alias -s ps=gv
    alias -s dvi=xdvi
    alias -s chm=xchm
    alias -s djvu=djview

    # list whats inside packed file
    alias -s zip="unzip -l"
    alias -s rar="unrar l"
    alias -s tar="tar tf"
    alias -s tar.gz="echo "
    alias -s ace="unace l"
fi
# }}}

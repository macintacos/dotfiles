# ALIASES

# UTILITIES; SHORTENED {{{
alias bazel="$HOME/GitLocal/Work/mms/bazelisk" # can just keep this to the local bazelisk script
alias c='clear && ll'                          # clear terminal display, show directory
alias cat='bat --theme="ansi-dark"'            # because bat is just insanely better than cat
alias cls='clear'                              # clear sisplay, just like `mongo` shell
alias count='tokei'                            # use this to count the amount of files in a given directory
alias cp='cp -iv'                              # preferred 'cp' implementation
alias diff='delta'                             # use delta as your differ of choice
alias du='du -hs * | sort -hr | less'          # preferred way of using the "du" command, mostly for reference
alias dud='du -d 1 -h'                         # get size of all directories in current directory, including self
alias duf='du -sh *'                           # get size of all files in currect directory, exclusing self, including directories
alias edit='vim'                               # default editor if i don't want to leave the terminal
alias f='open -a Forklift .'                   # opens current directory in Forklift
alias ff='fzf'                                 # shortening fzf
alias grep='grep --color'                      # always colorize output
alias kill='fkill'                             # a better process killer
alias mv='mv -iv'                              # preferred 'mv' implementation
alias r='ranger-cd'                            # mapped to the ranger function that cd's the appropriate directory when you quit
alias rg='rg -ziN'                             # always ignore line numbers, search compressed files, case-insensitivity
alias rm='rm -i'                               # makes sure 'rm' always requires confirmation
alias rm='trash'                               # a better rm
alias t='tail -f'                              # shorten tail, and always continue to tail unless cancelled
alias things='things.sh'                       # shortening things script
alias tldr='tldr -t base16'                    # preferred tldr theme
alias top='glances'                            # better resource visualizer
alias touch='ad'                               # advance_touch, a better newfile implementation. See: https://github.com/tanrax/terminal-AdvancedNewFile#-advanced-new-file-
alias v='nvim'                                 # shortening usage of nvim
alias vs='code'                                # shortening vscode's code
alias vl='vercel'                              # vercel/zeit/now
alias zr='zrun'                                # making zrun a bit more easy to run
alias hdi='howdoi -c -n 3'                     # howdoi plugin to search for code completion stuff
# }}}

# GIT ALIASES {{{
alias gst='lazygit' # better way to view git status
alias sm="smerge"
# }}}

# EXA/TREE IMPROVEMENTS (aka -> exa) {{{
alias ls='exa -F --group-directories-first --icons --color automatic'
alias l='ls -l'
alias ll='ls -la --git'
alias tree='broot'
# }}}

# CD ALIASES {{{
GITLOCAL="$HOME/GitLocal"
alias cdh="cd $HOME && cd"
alias cdgit="cd $GITLOCAL && cd"
alias cdwork="cd $GITLOCAL/Work && cd"
alias cdplay="cd $GITLOCAL/Play && cd"
alias cddown="cd $HOME/Downloads && cd"
alias cddot="cd $GITLOCAL/Play/dotfiles"
alias cdlogs="cd $HOME/Downloads/logs && cd"
alias cdtyp="cd $GITLOCAL/Work/Typinator && cd"
alias cdatlas="cd $HOME/MongoDB/_AtlasPlayground"
alias cdmms="cd /Users/juliant/GitLocal/Work/mms && cd"

# cd up directories
alias cdd='cd ..'                 # cd back 1 directory
alias cddd='cd ../..'             # cd back 2 directories
alias cdddd='cd ../../..'         # cd back 3 directories
alias cddddd='cd ../../../..'     # cd back 4 directories
alias cdddddd='cd ../../../../..' # cd back 5 directories
# }}}

# VS CODE ALIASES {{{
alias dotfiles="code $HOME/GitLocal/Play/dotfiles"
# }}}

# FIND ALIASES {{{
alias flatten='find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'
# }}}

# Making git a function to get around completion issues: https://github.com/tj/git-extras/issues/797
git() {
  # https://unix.stackexchange.com/a/257208
  case "$PWD" in
  "$HOME"/GitLocal/Website/* | "$HOME"/GitLocal/Learning/* | "$HOME"/GitLocal/Play/*)
    hub "$@"
    hub config user.email julian.m.tor@gmail.com
    hub config user.signingkey "$PERSONAL_SECRET_GPG_KEY"
    ;;
  *)
    hub "$@"
    ;;
  esac
}

# compdef git="hub"

# ALIASES

alias z='zrun'
alias things='things.sh'

alias ohmyzsh="code ~/.oh-my-zsh"
alias editalias='cd ~/.oh-my-zsh/plugins/common-aliases && micro common-aliases.plugin.zsh'
alias numFiles='echo $(gls -1 | wc -l)' # numFiles:     Count of non-hidden files in current dir
alias lr='gls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias c='clear && l'         # c:   Clear terminal display, show directory
alias cls='clear'            # cls: Clear Display, just like `mongo` shell
alias cp='cp -iv'            # Preferred 'cp' implementation
alias mv='mv -iv'            # Preferred 'mv' implementation
alias f='open -a Forklift .' # f:            Opens current directory in MacOS Finder

#   memHogsTop, memHogsPs:  find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls -G'
alias l='ls -lFh'     # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -FGlAhp' # preferred 'ls' implementation
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias edit='micro'
alias grep='grep --color'
alias ff='fzf'
alias t='tail -f'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fdd='find . -type d -name'
alias fff='find . -type f -name'
alias h='history'
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias whereami=display_info

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
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

# alias node='unalias node ; unalias npm ; nvm use default ; node $@'
# alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
alias vtop='vtop --theme wizard'

alias zshconfig="code ~/.zshrc"
alias zshrc='code ~/.zshrc' # Quick access to the ~/.zshrc file
alias cdlogs="cd $HOME/Downloads/logs"
alias cddev="cd $HOME/Google\ Drive/Developer"
alias cdtyp="cd $HOME/Google\ Drive/Developer/MongoDB/_Typinator"
alias cdatlas="cd $HOME/Google\ Drive/Developer/MongoDB/_AtlasPlayground"

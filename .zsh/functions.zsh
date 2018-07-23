# FUNCTIONS

# CUSTOM {{{
mcd () { mkdir -p "$1" && cd "$1"; }  # mcd: Makes new Dir and jumps inside
myip() { echo "My WAN/Public IP address: $(dig +short myip.opendns.com @resolver1.opendns.com)" } # myip: prints out your current IP
pretty_csv() { column -t -s "$@" | less -F -S -X -K } # pretty_csv: prettify CSV files
co() { code "$@" --disable-gpu --ignore-gpu-blacklist } # run vs code without the dumb ass flickering

cd() { # Always list directory contents upon 'cd
    builtin cd "$@"; 
    echo "Current directory: $PWD"; 
    l; 
}

grepip() {      # grep unique IPs from within a log file
    \grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$@" | sort | uniq
}

my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command ; } # my_ps: List processes owned by my user:

ii() { #   ii:  display useful host related informaton
    echo -e "\nYou are logged on $HOST"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date :$NC " ; date
    echo -e "\nMachine stats :$NC " ; uptime
    echo -e "\nCurrent network location :$NC " ; scselect
    echo -e "\n" ; myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}
# }}}

# FZF {{{
## Use fd (https://github.com/sharkdp/fd) instead of the default find
## command for listing path candidates.
## - The first argument to the function ($1) is the base path to start traversal
## - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() { fd . "$1" }
# }}}

# directory color rendering
eval $(gdircolors $HOME/.dircolors/dircolors.ansi-universal)
# FUNCTIONS

# CUSTOM {{{
mcd() { # mcd: Makes new Dir and jumps inside
  mkdir -p "$1" && cd "$1"
}
myip() { # myip: prints out your current IP
  echo "My WAN/Public IP address: $(dig +short myip.opendns.com @resolver1.opendns.com)"
}

pretty_csv() { # pretty_csv: prettify CSV files
  column -t -s "$@" | less -F -S -X -K
}

co() { # run vs code without the dumb ass flickering
  code "$@" --disable-gpu --ignore-gpu-blacklist
}

cd() { # Always list directory contents upon 'cd
  builtin cd "$@"
  echo "Current directory: $PWD"
  l
}

grepip() { # grep unique IPs from within a log file
  \grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$@" | sort | uniq
}

psgrep() { # grep for running processes
  local pids
  pids=$(pgrep -f $@)
  if ! [[ $pids ]]; then
    echo "No processes found." >&2
    return 1
  fi
  ps up $(pgrep -f $@)
}

my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command; } # my_ps: List processes owned by my user:

ii() { #   ii:  display useful host related informaton
  echo -e "\nYou are logged on $HOST"
  echo -e "\nAdditionnal information: "
  uname -a
  echo -e "\nUsers logged on: "
  w -h
  echo -e "\nCurrent date :$NC "
  date
  echo -e "\nMachine stats :$NC "
  uptime
  echo -e "\nCurrent network location :$NC "
  scselect
  echo -e "\n"
  myip
  #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

git-clean-local() { # Cleans any local branches that are no longer on remote. Pass in "-D" to delete them (by default, running this will just print out existing branches).
  gone_local=$(git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}')

  if ! [[ $gone_local ]]; then
    echo "No local branch has been deleted on remote." >&2
    return 1
  fi

  if [[ -z "$1" ]]; then
    echo "Fetching remotes..."
    git fetch --all
    echo "___________________________________________________________________________"
    echo "The following local branches have been deleted on the remote repositories:"
    echo $gone_local
    echo "To delete them all, run the following command:"
    echo "git-clean-local -D"
    echo "---------------------------------------------------------------------------"
  fi

  # if there
  for arg in "$@"; do
    if [ "$arg" == "-D" ]; then
      echo "Fetching remotes before deleting..."
      git fetch --all >/dev/null 2>&1
      git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
    fi
  done
}
# }}}

# FZF {{{
## Use fd (https://github.com/sharkdp/fd) instead of the default find
## command for listing path candidates.
## - The first argument to the function ($1) is the base path to start traversal
## - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd . "$1"
}
# }}}

# directory color rendering
eval $(gdircolors $HOME/.dircolors/dircolors.ansi-universal)

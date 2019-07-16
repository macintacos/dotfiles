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

npm-backup() {
  usage() {
    cat <<EOF >&2
Command used export the current machine's npm global packages.

Usage: npm-backup [-eih]

-e, --export : Exports current global npm global packages to 'npm-backup-current.txt'. If file exists, it is backed up.
-i, --import : Imports packages read from the current directory's 'npm-backup-current.txt'
  -h, --help : Display this help text

EOF
  }

  npm_list=$(npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}')
  logfile="npm-backup-current.txt"

  POSITIONAL=()

  while [[ $# > 0 ]]; do
    case "$1" in
    -e | --export)
      echo "Exporting these packages to ${logfile}"
      echo "${npm_list}"

      if [ -f "$logfile" ]; then
        backup_logfile="$logfile.$(date +%H%M%S)"
        echo "Existing ${logfile} found, backing up..."
        mv "$logfile" "$backup_logfile"
        echo "Backed up to ${backup_logfile}"
      else
        touch $logfile
      fi

      echo $npm_list >$logfile
      echo "Latest global npm packages have been exported to: ${logfile}"
      echo "To import, using the command \`npm-backup --import\`"
      shift # shift once since flags have no values
      ;;
    -i | --import)
      if [ -f "$logfile" ]; then
        echo "Importing the following packages found in $logfile:"
        cat $logfile
        xargs npm install --global <$logfile
      else
        echo "${logfile} not found in the current directory."
      fi
      shift
      ;;
    -h | --help)
      usage
      shift
      ;;
    *) # unknown flag/switch
      usage
      POSITIONAL+=("$1")
      shift
      ;;
    esac
  done

  set -- "${POSITIONAL[@]}" # restore positional params
}

# }
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

# FUNCTIONS

ranger-cd() {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
      cd -- "$(cat "$tempfile")"
    fi
  rm -f -- "$tempfile"
}

gevg() {
  printf "%s - %s (%s commit(s))" \
    "$(git branch --show-current)" \
    "$(git log -1 --pretty=%B)" \
    "$(git rev-list --count trunk..)"
}

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

grepip() { # grep unique IPs from within a log file
  \grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$@" | sort | uniq
}

conditional_fd() {
  if [[ $PWD == $HOME ]]; then
    fd -paiHL -t d -d 2
  else
    fd -paiHL -t d
  fi
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

backup-now() { # backup things
  cd $DOTFILES_HOME/setup
  ./plzlog info "Backing up files to: $DOTFILES_HOME/backup (run the command again if it fails!)"
  (
    cd $DOTFILES_HOME/backup
    rm Brew*
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump
    backup-global backup -o npm.global.backup.txt
    code --list-extensions >vscode-extensions-backup.txt
  )
  ./plzlog ok "Backup complete!"
}

# Making git a function to get around completion issues: https://github.com/tj/git-extras/issues/797
# git() {
#   # https://unix.stackexchange.com/a/257208
#   case "$PWD" in
#   "$HOME"/GitLocal/Website/* | "$HOME"/GitLocal/Learning/* | "$HOME"/GitLocal/Play/*)
#     hub "$@"
#     hub config user.email julian.m.tor@gmail.com
#     hub config user.signingkey "$PERSONAL_SECRET_GPG_KEY"
#     ;;
#   *)
#     hub "$@"
#     ;;
#   esac
# }

# directory color rendering
eval $(gdircolors $HOME/.dircolors/dircolors.ansi-universal)

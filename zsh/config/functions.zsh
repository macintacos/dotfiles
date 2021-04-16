#!/bin/bash

export PATH="$DOTFILES_HOME/setup:$PATH" # to get 'log'

function ranger-cd() {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
      cd -- "$(cat "$tempfile")"
    fi
  rm -f -- "$tempfile"
}

function gevg() {
  printf "%s - %s (%s commit(s))" \
    "$(git branch --show-current)" \
    "$(git log -1 --pretty=%B)" \
    "$(git rev-list --count trunk..)"
}

function mcd() { # mcd: Makes new Dir and jumps inside
  mkdir -p "$1" && cd "$1"
}
function myip() { # myip: prints out your current IP
  echo "My WAN/Public IP address: $(dig +short myip.opendns.com @resolver1.opendns.com)"
}

function pretty_csv() { # pretty_csv: prettify CSV files
  column -t -s "$@" | less -F -S -X -K
}

function co() { # run vs code without the dumb ass flickering
  code "$@" --disable-gpu --ignore-gpu-blacklist
}

function grepip() { # grep unique IPs from within a log file
  \grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$@" | sort | uniq
}

function conditional_fd() {
  if [[ $PWD == $HOME ]]; then
    fd -paiHL -t d -d 2
  else
    fd -paiHL -t d
  fi
}

function my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command; } # my_ps: List processes owned by my user:

function ii() { #   ii:  display useful host related informaton
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

function backup-now() { # backup things
  cd $DOTFILES_HOME/setup
  ./plzlog info "Backing up files to: $DOTFILES_HOME/backup (run the command again if it fails!)"
  (
    cd $DOTFILES_HOME/backup

    (cd $DOTFILES_HOME/setup && ./plzlog info "Backing up Homebrew packages...")
    rm Brew*
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump

    (cd $DOTFILES_HOME/setup && ./plzlog ok "Brewfile successfully regenerated." && ./plzlog info "Backing up global NPM packages...")
    backup-global backup -o npm.global.backup.txt

    (cd $DOTFILES_HOME/setup && ./plzlog ok "NPM Backup successfully regenerated." && ./plzlog info "Backing up VSCode extension list...")
    code --list-extensions >vscode-extensions-backup.txt

    (cd $DOTFILES_HOME/setup && ./plzlog ok "VSCode extension list successfully regenerated.")
  )
  ./plzlog ok "Backup complete!"
  ./plzlog info "The following files were backed up:
    $DOTFILES_HOME/backup/Brewfile
    $DOTFILES_HOME/backup/npm.global.backup.txt
    $DOTFILES_HOME/backup/vscode-extensions-backup.txt"
}

# directory color rendering
eval $(gdircolors $HOME/.dircolors/dircolors.ansi-universal)

function jbr() { # open current branch in jira
  open "https://jira.mongodb.com/browse/$(git branch --show-current)"
}

function ch() { # pipe cht.sh output to "bat"
  cht.sh "$@" | bat --theme=ansi --style=numbers,grid
}

function cdf() { # Change working directory to the top-most Finder window location
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

function git-delete-lingering-branches() {
  # Deletes branches locally that have already been deleted from remote.
  # ref: https://stackoverflow.com/a/33548037/5029451

  log info "Checking to see if there are any branches locally that are deleted on remote..."

  # getting branches that are elligible for deletion
  local branches_to_delete=()
  git fetch -p &&
    for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads |
      awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do
      branches_to_delete+=("$branch")
    done

  # figure out what we want to do with the branches we found
  if [ "${#branches_to_delete[@]}" -eq 0 ]; then
    log info "No branches found to delete. Not doing anything."
  else
    log warn "We will be deleting the following branches: ${YELLOW}${branches_to_delete[*]}${RESET}"

    echo "Are you sure you want to delete these local branches?"
    select input in "Yes" "No"; do
      case $input in
      Yes)
        echo "ok"
        log info "Deleting branches ${YELLOW}${branches_to_delete[*]}${RESET}"
        for branch in $branches_to_delete; do
          git branch -D "$branch"
        done
        log ok "Branches deleted."
        exit 0
        ;;
      No)
        printf "\n\n"
        log ok "Aborted the branch deletion operation."
        exit 1
        ;;
      esac
    done
  fi
}

function connect-vpn() {
  # Connects to the VPN
  networksetup -connectpppoeservice "VPN New York"
}

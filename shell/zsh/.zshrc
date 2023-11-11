#!/usr/local/bin/bash
# shellcheck disable=SC1090

# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# ┌─────────────────────────────────────────────────┐
# │                      P10k                       │
# └─────────────────────────────────────────────────┘
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/GitLocal/Play/dotfiles/shell/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ┌─────────────────────────────────────────────────┐
# │                   ZSH OPTIONS                   │
# └─────────────────────────────────────────────────┘
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER="$(whoami)"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$ZDOTDIR/.zsh_history

setopt APPENDHISTORY          # Append to history instead of replacing it
setopt AUTO_CD                # `cd` to directories by just giving the directory by itself
setopt EXTENDED_HISTORY       # Extended history format
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt INTERACTIVE_COMMENTS   # escape commands so i can use them later (allow comments after commands)
setopt LIST_TYPES             # Show types in completion
setopt NO_BEEP                # I hate beeps
setopt PROMPT_SUBST           # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt SHARE_HISTORY          # Share history between all sessions.

autoload colors
colors
# }}}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode zsh-autopair fzf fzf-tab)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/GitLocal/Play/dotfiles/shell/zsh/.p10k.zsh.
[[ ! -f ~/GitLocal/Play/dotfiles/shell/zsh/.p10k.zsh ]] || source ~/GitLocal/Play/dotfiles/shell/zsh/.p10k.zsh

autopair-init # start the zsh-autopair plugin

fpath[1,0]=$HOME/.zsh/completion

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/macinburrito/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ┌─────────────────────────────────────────────────┐
# │                   FZF CONFIG                    │
# └─────────────────────────────────────────────────┘
# Needs to be done this way to not clash with zsh-vi-mode
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

## command for listing path candidates.
## - The first argument to the function ($1) is the base path to start traversal
## - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

local background="#0b0d0f"
local current_line="#131a20"
local selection="#131a20"
local foreground="#f8f8f2"
local comment="#6272a4"
local cyan="#8be9fd"
local green="#50fa7b"
local orange="#ffb86c"
local pink="#ff79c6"
local purple="#bd93f9"
local red="#ff5555"
local yellow="#f1fa8c"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Colors For Dracula
export FZF_DEFAULT_OPTS="
  --height 60%
  --reverse
  --color=dark
  --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
  --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
  --bind tab:down
  --cycle
"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# }}}

# FZF-Z {{{
export FZFZ_RECENT_DIRS_TOOL='zi'
export FZFZ_PREVIEW_COMMAND='exa --tree --git --icons {}'
# }}}

# FORGIT {{{
FORGIT_FZF_DEFAULT_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# }}}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in

  cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
  export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
  ssh) fzf "$@" --preview 'dig {}' ;;
  *) fzf "$@" ;;

  esac
}

# FZF-TAB {{{
FZF_TAB_COMMAND=(
  fzf
  --ansi                                      # Enable ANSI color support, necessary for showing groups<
  --expect='$continuous_trigger,$print_query' # For continuous completion
  --nth=2,3 --delimiter='\x00' # Don't search prefix
  --tiebreak=begin -m
  --bind=tab:down,btab:up --cycle
  '--query=$query'           # $query will be expanded to query string at runtime.
  '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
  --print-query
)
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --color-scale --tree -D $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# vscode previews for files
zstyle ':fzf-tab:complete:code:**' fzf-preview 'bat $realpath || exa --icons --color-scale --tree -D $realpath'

zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

# ┌─────────────────────────────────────────────────┐
# │                      ASDF                       │
# └─────────────────────────────────────────────────┘
. $HOME/.asdf/asdf.sh

# ┌─────────────────────────────────────────────────┐
# │                     ZOXIDE                      │
# └─────────────────────────────────────────────────┘
eval "$(zoxide init zsh)"

# ┌─────────────────────────────────────────────────┐
# │                   KEYBINDINGS                   │
# └─────────────────────────────────────────────────┘
bindkey -s '^F' 'ff | xargs code\n' # runs "zoxide" in interactive mode
bindkey -M vicmd 's' vi-easy-motion


# ┌─────────────────────────────────────────────────┐
# │                iTerm Integration                │
# └─────────────────────────────────────────────────┘
test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

source /Users/macinburrito/.config/broot/launcher/bash/br

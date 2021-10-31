# jeffreytse/zsh-vi-mode

export ZVM_VI_SURROUND_BINDKEY="s-prefix"

function after_init() {
    bindkey -s '^o' 'zi\n'  # runs the 'r' command with 'ranger'
    bindkey -s '^F' 'ff | xargs code\n' # runs "zoxide" in interactive mode
    bindkey '^r' fzf-history-widget
    bindkey -s '^G' 'cd **\t'
    bindkey -M vicmd 's' vi-easy-motion
}

zvm_after_init_commands+=(after_init)
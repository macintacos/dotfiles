# jeffreytse/zsh-vi-mode

export ZVM_VI_SURROUND_BINDKEY="s-prefix"

function after_init() {
    bindkey -s '^o' 'zi\n'  # runs the 'r' command with 'ranger'
    bindkey -s '^F' 'ff | xargs vs\n' # runs "zoxide" in interactive mode
    bindkey -s '^R' 'hstr\n'
    bindkey -s '^G' 'cd **\t'
    bindkey '^T' fzf-completion
    bindkey '\t' fzf-completion
    bindkey -M vicmd 's' vi-easy-motion
}

zvm_after_init_commands+=(after_init)
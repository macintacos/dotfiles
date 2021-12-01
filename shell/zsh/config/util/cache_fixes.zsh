#!/usr/local/bin/zsh
## CACHE LOADING/COMPLETION {{{
## for only occasional re-compilation (ref: https://htr3n.github.io/2018/07/faster-zsh/)
autoload -Uz compinit
# shellcheck disable=2086
if [ "$(date +'%j')" != "$(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump)" ]; then
    compinit
else
    compinit -C
fi

{
    # Compile zcompdump, if modified, to increase startup speed.
    zstyle -s ':zim:completion' dumpfile 'zdumpfile' || zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc" ) ]]; then
        zcompile "$zcompdump"
    fi
} &! 
# }}}
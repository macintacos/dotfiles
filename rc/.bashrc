
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#!/usr/bin/env bash

if [[ "$(uname -m)" != "arm64" ]]; then
    # We aren't on M1
    # shellcheck disable=SC1091
    [ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"
fi
#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

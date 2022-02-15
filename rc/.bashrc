#!/usr/bin/env bash

if [[ "$(uname -m)" != "arm64" ]]; then
    # We aren't on M1
    # shellcheck disable=SC1091
    [ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"
fi
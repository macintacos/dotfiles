#!/usr/local/bin/bash
# shellcheck disable=SC1090

# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# Zinit Loading
source "$ZDOTDIR"/config/plugins/zinit/init.zinit
source "$ZDOTDIR"/config/plugins/zinit/plugin_load.zinit

# Plugin Settings
for file in "$ZDOTDIR"/config/plugins/other/**/*.zsh; do source "$file"; done

# Wrap-up
source "$ZDOTDIR"/secrets/sekret_source
for file in "$ZDOTDIR"/config/util/**/*.zsh; do source "$file"; done
for file in "$ZDOTDIR"/config/definitions/**/*.zsh; do source "$file"; done
for file in "$ZDOTDIR"/completions/**/*; do source "$file"; done
for file in "$ZDOTDIR"/config/end/**/*.zsh; do source "$file"; done

source "$ZDOTDIR"/config/load_at.end

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}

source /Users/juliant/.config/broot/launcher/bash/br
source $(brew --prefix asdf)/asdf.sh

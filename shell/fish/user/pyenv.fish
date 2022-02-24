# TODO: Check to see if this is appropriate or if there's a better way to do it.
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

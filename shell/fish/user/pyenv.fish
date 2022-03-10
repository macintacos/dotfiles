# TODO: Check to see if this is appropriate or if there's a better way to do it.
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# TODO: Maybe I should just give up and just assume I need to use 3.9. If I need to use something else, I'll have to use Homebrew python or something
# function ipyenv --description "Run this when you want to use intel homebrew to install python versions (only needed for versions before 3.9.1)"
#     eval (/usr/local/bin/brew shellenv)
# end
# Custom Keybindings

# Ctrl+f to find a file in current directory, open it in VSCode
bind \cf "fzf | xargs code; commandline -f repaint"
bind -M insert \cf "fzf | xargs code; commandline -f repaint"

# Ctrl+g to navigate to a common directory using zoxide
bind \cg "__zoxide_zi; commandline -f repaint"
bind -M insert \cg "__zoxide_zi; commandline -f repaint"


# Custom Keybindings

# Ctrl+f to find a file in current directory, open it in VSCode
bind \cf "fzf | xargs code; commandline -f repaint"
bind -M insert \cf "fzf | xargs code; commandline -f repaint"

# Ctrl+g to navigate to a common directory using zoxide
bind \cg "__zoxide_zi; commandline -f repaint"
bind -M insert \cg "__zoxide_zi; commandline -f repaint"

# Unbind tab/btab, since we are trying out Fig
bind \t true
bind -M insert \t true
bind -M visual \t true
bind -k btab true
bind -M insert -k btab true
bind -M visual -k btab true

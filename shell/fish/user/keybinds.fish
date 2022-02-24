# Custom Keybindings

# Ctrl+f to find a file in current directory, open it in VSCode
bind \cf "fzf | xargs code; commandline -f repaint"
bind -M insert \cf "fzf | xargs code; commandline -f repaint"

# Ctrl+o to navigate to a directory using zoxide
bind \co "__zoxide_zi; commandline -f repaint"
bind -M insert \co "__zoxide_zi; commandline -f repaint"

# Remap tab to shift+tab when in insert mode
bind -M insert -k nul complete-and-search

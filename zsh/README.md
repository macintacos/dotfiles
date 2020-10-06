# My ZSH Configuration

There are many like it, but this one is mine. Here's what you get:

- Helpful [default options](./config/options.zsh)
- Handy [functions](./config/functions.zsh)
- [Zinit](https://github.com/zdharma/zinit) for plugin management
- A nice, responsive shell with [`powerlevel10k`](https://github.com/romkatv/powerlevel10k) (essentially no re-render time)
- "Vim" mode (`ESC` has a slight delay but most things work as expected)
- A bunch of handy [aliases](./config/aliases.zsh) and replacements of built-in commands with [plugins](https://github.com/sharkdp/fd) [probably](https://github.com/dandavison/delta) [built](https://github.com/sharkdp/bat) [with](https://github.com/ogham/exa) [Rust](https://github.com/BurntSushi/ripgrep) [or](https://github.com/junegunn/fzf) [Go](https://github.com/gokcehan/lf)
- Nifty keybindings, like:
    - <kbd>ctrl+f</kbd> for [`zoxide`'s](https://github.com/ajeetdsouza/zoxide) `zi` invocation to navigate quickly with `fzf`
    - <kbd>ctrl+r</kbd> to navigate through history of commands
    - <kbd>tab</kbd> will attempt to expand "most things", and it will use `fzf` to find what you want instead of ZSH's normal tab completion (through the magic of [`fzf-tab`](https://github.com/Aloxaf/fzf-tab))
- Probably a bunch of other things that have become so second nature that I forget that they're not built-in ZSH features at this point
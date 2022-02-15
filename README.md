# dotfiles

[![Actions Status](https://github.com/macintacos/dotfiles/workflows/CI/badge.svg)](https://github.com/macintacos/dotfiles/actions)

As is the trend, I am joining [many others](https://dotfiles.github.io/) in the programmer's natural fascination with dotfiles; how they're set up, what new toys are hidden in their obscure references, and how much time we can waste putting them all together. My dotfiles are shameful, but they're mine.

All PRs will be considered, but ultimately ignored. If you decide to use them, I'm not responsible for what they do to your productivity.

## Setup

Run `just` to see available recipes:

```bash
$ just
Available recipes:
    install
    install-ci
    hooks      # Set up git hooks so that things are committed the way we want
    symlink    # Symlink files
    backup     # Backup packages, casks, and plugins
    sort       # Sort keybindings (and eventually other things)
```

## Whatcha got?

Installing this stuff will get you the following:

- A [Fish configuration](./shell/fish/README.md) that I'm pretty fond of (and am currently using).
- A [ZSH configuration](./shell/zsh/README.md) that I'm pretty fond of (and am not currently using).
- All of the tools/casks that I use on the daily (check out the [Brewfile](./backup/Brewfile), there's a lot of them)

I used to keep my neovim configuration here, but I decided to just keep it to its own repo: https://github.com/macintacos/nvim

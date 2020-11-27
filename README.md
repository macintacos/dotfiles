# dotfiles

[![Actions Status](https://github.com/macintacos/dotfiles/workflows/CI/badge.svg)](https://github.com/macintacos/dotfiles/actions)

As is the trend, I am joining [many others](https://dotfiles.github.io/) in the programmer's natural fascination with dotfiles; how they're set up, what new toys are hidden in their obscure references, and how much time we can waste putting them all together. My dotfiles are shameful, but they're mine.

All PRs will be considered, but ultimately ignored. If you decide to use them, I'm not responsible for what they do to your productivity.

## Setup

Clone the repository and run `make` to see available targets (run `make install` if you want to get setup properly):

```bash
$ make
Makefile targets:
install    Install everything
symlink    Symlink files
backup     Backup packages, casks, and plugins
```

## Whatcha got?

Installing this stuff will get you the following:

- A pretty sweet neovim configuration with Spacemacs-esque mappings (even though it's still not perfect at all). See [`nvim`](https://github.com/macintacos/dotfiles/tree/trunk/nvim)
- A [ZSH configuration](https://github.com/macintacos/dotfiles/tree/trunk/zsh) that I'm pretty fond of.
- All of the tools/casks that I use on the daily (check out the Brewfile, there's a lot of them)
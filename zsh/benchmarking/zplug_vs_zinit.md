# `zplug` vs `zinit`

- `zplug` (my current plugin manager): https://github.com/zplug/zplug
- `zinit` (potential new guy): https://github.com/zdharma/zinit

Below are benchmarks for the above plugins, which were run by using [`hyperfine`](https://github.com/sharkdp/hyperfine). The plugins I have installed as of this testing are:

```
Aloxaf/fzf-tab
JamesKovacs/zsh_completions_mongodb
ael-code/zsh-colored-man-pages
andrewferrier/fzf-z
b4b4r07/enhancd
djui/alias-tips
hlissner/zsh-autopair
hschne/fzf-git
jackwish/bazel
laurenkt/zsh-vimto
ohmyzsh/plugins/git
ohmyzsh/plugins/httpie
ohmyzsh/plugins/node
ohmyzsh/plugins/npm
ohmyzsh/plugins/python
ohmyzsh/plugins/ripgrep
ohmyzsh/plugins/z
romkatv/powerlevel10k
zdharma/fast-syntax-highlighting
zplug/zplug
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
```

I will run three benchmarks of each plugin manager, effectively only switching them out in my `.zshrc` and running `hyperfine --warmup 3 'zsh -i -c exit'`. All plugins will be installed before the benchmarks are run.

They're all being run with the same applications running on my machine in the background; I'm a bit too lazy to turn off my music and everything else, but I have CPU/memory to spare so I don't think it should affect the numbers too much. Onwards!

## `zplug` Benchmarks

```bash
# Runs with zplug
$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.857 s ±  0.017 s    [User: 798.1 ms, System: 1111.2 ms]
  Range (min … max):    1.838 s …  1.895 s    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.860 s ±  0.018 s    [User: 800.6 ms, System: 1114.3 ms]
  Range (min … max):    1.843 s …  1.905 s    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.873 s ±  0.014 s    [User: 802.9 ms, System: 1124.2 ms]
  Range (min … max):    1.856 s …  1.896 s    10 runs
```

## `zinit` Benchmarks

```bash
# Runs with zinit
$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.011 s ±  0.017 s    [User: 504.0 ms, System: 493.2 ms]
  Range (min … max):    0.974 s …  1.028 s    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.019 s ±  0.018 s    [User: 508.5 ms, System: 496.6 ms]
  Range (min … max):    0.986 s …  1.039 s    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):      1.022 s ±  0.013 s    [User: 512.7 ms, System: 496.8 ms]
  Range (min … max):    1.001 s …  1.045 s    10 runs
```

A savings of about 0.8 seconds at startup; that's pretty great! I've since added _more_ plugins to `zinit` and the startup time has barely gone up. I'm really happy with these results!

## UPDATE - May 12, 2020 (12:48 EDT)

I realized that I was still loading `zplug` when performing my test runs on `zinit` since I had extracted its instantiation to another file that I had forgotten about; once I removed that, I lopped off an addition 0.2 seconds on my shell start time:

```bash
$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):     834.1 ms ±  24.9 ms    [User: 448.7 ms, System: 389.2 ms]
  Range (min … max):   805.7 ms … 884.0 ms    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):     813.0 ms ±  12.5 ms    [User: 442.7 ms, System: 378.2 ms]
  Range (min … max):   786.2 ms … 827.4 ms    10 runs

$ hyperfine --warmup 3 'zsh -i -c exit'
Benchmark #1: zsh -i -c exit
  Time (mean ± σ):     844.0 ms ±   7.7 ms    [User: 456.5 ms, System: 395.1 ms]
  Range (min … max):   830.5 ms … 851.7 ms    10 runs
```

Total savings: roughly 1 second on startup. This benchmark was _after_ I had already installed additional plugins. Neat!
" Plug 'liuchengxu/vim-clap'
" Description: possible replacement for FZF? Lets me search all over a given
" project with ease. 

let g:clap_layout = { 'relative': 'editor' }

let g:clap_provider_quick_open = {
      \ 'source': ['~/GitLocal/Play/dotfiles/', '~/.vimrc', '~/.spacevim', '~/.bashrc', '~/.tmux.conf'],
      \ 'sink': 'FloatermNew lf',
      \ }

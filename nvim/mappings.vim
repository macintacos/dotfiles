" Description: for mappings NOT related to plugins.
" *** Mapping related to plugins go IN the plugin file itself, to be consistent. ***

" LEGEND -> Run ':help key-notation' for vim
" REMINDER: must enable "Esc+" on iTerm for meta keys to function properly

let g:mapleader = " "
let g:maplocalleader = ','

" get me out
inoremap jj <ESC>
inoremap kk <ESC>

" saves the current buffer
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" make 'Y' yank for current character to end of line
map Y y$
vmap y ygv<ESC>

" navigate splits
nnoremap <silent> <Tab>   <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

" increase/decrease window size
nnoremap <silent> <M-w> :resize +5<CR>
nnoremap <silent> <M-s> :resize -5<CR>
nnoremap <silent> <M-d> :vertical resize +5<CR>
nnoremap <silent> <M-a> :vertical resize -5<CR>

" so that vim-sandwich works
map <silent> s <nop>
map <silent> S <nop>

" better indentation selection stuff
vnoremap < <gv
vnoremap > >gv
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" horizontal scrolling when wrapped
nnoremap <C-l> 20zl
nnoremap <C-h> 20zh

" better movements (centering by default)
nmap G Gzz

" smartclose q mapping
nnoremap <silent> q :call SmartClose()<CR>


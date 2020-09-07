" Plug "itchyny/lightline.vim"
" Description: alternative to airline, modeline for vim

" actual configuration
let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'active': {
    \   'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \   ],
    \   'right': [
    \       [ 'lineinfo' ],
    \       [ 'percent' ],
    \   ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'mode_map': {
    \   'n' : 'N',
    \   'i' : 'I',
    \   'R' : 'R',
    \   'v' : 'V',
    \   'V' : 'VL',
    \   "\<C-v>": 'VB',
    \   'c' : 'C',
    \   's' : 'S',
    \   'S' : 'SL',
    \   "\<C-s>": 'SB',
    \   't': 'T',
    \ },
\ }
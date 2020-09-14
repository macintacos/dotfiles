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
    \ 'enable': {
    \   'tabline': 0
    \ },
\ }


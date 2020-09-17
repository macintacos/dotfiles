" Plug 'bagrat/vim-buffet'
" Description: Creating a tab-line experience that I'm a bit more familiar
" with

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf488"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_show_index = 1

" Dracula colors
function! g:BuffetSetCustomColors()
    " Challenger Deep Colors
    hi! BuffetCurrentBuffer    gui=NONE guibg=#95ffa4 guifg=#1e1c31
    hi! BuffetActiveBuffer     gui=NONE guibg=#c991e1 guifg=#1e1c31
    hi! BuffetBuffer           gui=NONE guibg=#1e1c31 guifg=#6559d4
    hi! BuffetModCurrentBuffer gui=NONE guibg=#91ddff guifg=#1e1c31
    hi! BuffetModActiveBuffer  gui=NONE guibg=#aaffe4 guifg=#1e1c31
    hi! BuffetModBuffer        gui=NONE guibg=#ff8080 guifg=#1e1c31
    hi! BuffetTrunc            gui=NONE guibg=#c991e1 guifg=#1e1c31
    hi! BuffetTab              gui=NONE guibg=#c991e1 guifg=#1e1c31

    " Dracula Colors
    " hi! BuffetCurrentBuffer    gui=NONE guibg=#50fa7b guifg=#282a36
    " hi! BuffetActiveBuffer     gui=NONE guibg=#bd93f9 guifg=#282a36
    " hi! BuffetBuffer           gui=NONE guibg=#282a36 guifg=#6272a4
    " hi! BuffetModCurrentBuffer gui=NONE guibg=#8be9fd guifg=#282a36
    " hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#282a36
    " hi! BuffetModBuffer        gui=NONE guibg=#ff5555 guifg=#282a36
    " hi! BuffetTrunc            gui=NONE guibg=#bd93f9 guifg=#282a36
    " hi! BuffetTab              gui=NONE guibg=#bd93f9 guifg=#282a36
endfunction

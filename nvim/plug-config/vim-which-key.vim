" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" initial mapping
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"" theming
" autocmd FileType which_key highlight WhichKey ctermbg=0 ctermfg=blue
" autocmd FileType which_key highlight WhichKeySeperator ctermbg=0 ctermfg=blue
" autocmd FileType which_key highlight WhichKeyGroup cterm=bold ctermbg=0 ctermfg=blue
" autocmd FileType which_key highlight WhichKeyDesc ctermbg=0 ctermfg=blue
" autocmd FileType which_key highlight WhichKeyFloating ctermbg=0 ctermfg=blue

" configuration (initially stealing from space-vim: https://github.com/liuchengxu/space-vim/blob/master/core/autoload/spacevim/map/leader.vim)
let g:which_key_map = {}

"" 'f' keybindings
let g:which_key_map.f = { 'name': '+file' }

nnoremap <silent> <leader>fs :update<CR>
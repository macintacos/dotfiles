" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" initial mapping
" call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" beginning configuration {{{
let g:which_key_map = {}

"" 'f' menu {{{
nnoremap <silent> <leader>fs :update<CR>

let g:which_key_map.f = {
    \ 'name': '+file',
    \ 's': 'save-file',
\ }

""" 'f.e' menu {{{
nnoremap <silent> <leader>fed :e $DOTFILES_HOME
nnoremap <silent> <leader>fek :e $DOTFILES_HOME/nvim/mappings.vim

let g:which_key_map.f.e = {
    \ 'name': '+edit',
    \ 'd': 'edit-dotfiles',
    \ 'k': 'edit-keybindings',
\ }

""" end 'f.e' menu }}}
"" end 'f' menu}}}
" end configuration }}}
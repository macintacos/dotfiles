" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" which-key invocation {{{
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" end which-key invocation }}}

" begin mapping {{{
let g:which_key_map = {}

"" 'f' menu {{{
nnoremap <silent> <leader>fs :update<CR>
nnoremap <silent> <leader>ff :Files<CR>

let g:which_key_map.f = {
    \ 'name': '+file',
    \ 's': 'save-file',
    \ 'f': 'open-file',
\ }

""" 'f.e' menu {{{
nnoremap <silent> <leader>fed :e $DOTFILES_HOME<CR>
nnoremap <silent> <leader>fek :e $DOTFILES_HOME/nvim/mappings.vim<CR>

let g:which_key_map.f.e = {
    \ 'name': '+edit',
    \ 'd': 'edit-dotfiles',
    \ 'k': 'edit-keybindings',
\ }

""" end 'f.e' menu }}}
"" end 'f' menu}}}

"" 'q' menu {{{
nnoremap <silent> <leader>qq :qa<CR>

let g:which_key_map.q = {
    \ 'name': '+quit',
    \ 'q': 'quit-all',
\ }

"" end 'q' menu }}}
" end mapping }}}
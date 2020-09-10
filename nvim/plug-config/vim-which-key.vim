" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" which-key invocation --- {{{
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

"" custom
nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
nnoremap <silent> g :<c-u>WhichKeyVisual 'g'<CR>
nnoremap <silent> s :<c-u>WhichKey 's'<CR>
nnoremap <silent> s :<c-u>WhichKeyVisual 's'<CR>
" end }}}

" begin <leader> mapping --- {{{
let g:which_key_map = {}

"" 'b' menu --- {{{
nnoremap <silent> <leader>bb :Clap buffers<CR>
nnoremap <silent> <leader>bc :Clap bcommits<CR>
nnoremap <silent> <leader>bd :bd<CR>

let g:which_key_map.b = {
    \ 'name': '+buffer',
    \ 'b': 'List buffers',
    \ 'c': 'Commits for this buffer',
    \ 'd': 'Delete buffer',
\ }
"" 'b' menu end }}}

"" 'f' menu ============>
nnoremap <silent> <leader>fs :w<CR>
nnoremap <silent> <leader>ff :Clap gfiles<CR>
nnoremap <silent> <leader>ft :FloatermNew lf<CR>
nnoremap <silent> <leader>fn :Clap filer<CR>

let g:which_key_map.f = {
    \ 'name': '+file',
    \ 'f': 'Open file in PWD',
    \ 'n': 'Open/create new file',
    \ 's': 'Save file',
    \ 't': 'nnn tree navigation'
\ }

""" 'f.e' menu ============>
nnoremap <silent> <leader>fed :e $DOTFILES_HOME<CR>
nnoremap <silent> <leader>fek :e $DOTFILES_HOME/nvim/mappings.vim<CR>
nnoremap <silent> <leader>few :e $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim<CR>

let g:which_key_map.f.e = {
    \ 'name': '+edit',
    \ 'd': 'Edit dotfiles',
    \ 'k': 'Edit keybindings (mappings.vim)',
    \ 'w': 'Edit which-key bindings',
\ }

""" 'f.e' menu end }}}
"" 'f' menu end }}}

"" 'g' menu --- {{{
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>

let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'a': 'Stage all files',
    \ 'b': 'Blame file',
    \ 'c': 'Commit staged changes',
    \ 's': 'Status',
\ }
"" 'g' menu end}}}

"" 'h' menu --- {{{ Ignoring until we find a use for it
let g:which_key_map.h = {'name' : 'which_key_ignore'}
let g:which_key_map.h.p = 'which_key_ignore'
let g:which_key_map.h.s = 'which_key_ignore'
let g:which_key_map.h.u = 'which_key_ignore'
"" 'h' menu end }}}

"" 'j' menu --- {{{
nnoremap <silent> <leader>ji :Clap tags<CR>
nnoremap <silent> <leader>jI :Clap proj_tags<CR>

let g:which_key_map.j = {
    \ 'name': '+jump',
    \ 'i': 'Jump to symbol in buffer',
    \ 'I': 'Jump to symbol in project',
\ }
"" 'j' menu end }}}

"" 'q' menu --- {{{
nnoremap <silent> <leader>qq :qa<CR>

let g:which_key_map.q = {
    \ 'name': '+quit',
    \ 'q': 'Quit all',
\ }

"" 'q' menu end }}}

"" 's' menu --- {{{
nnoremap <silent> <leader>ss :Clap blines<CR>
nnoremap <silent> <leader>sp :Clap grep ++opt=--hidden -g "!.git/"<CR>

let g:which_key_map.s = {
    \ 'name': '+search/symbol',
    \ 's': 'Search this buffer (swoop)',
    \ 'p': 'Search this project',
\ }
"" 's' menu end }}}

"" 'w' menu --- {{{
nnoremap <silent> <leader>wd :close<CR>
nnoremap <silent> <leader>wm <C-w>_<C-w><Bar>
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>w= <C-w>=
nnoremap <silent> <leader>w- <C-w>n
nnoremap <silent> <leader>w/ <C-w>v
nnoremap <silent> <leader>ww :Clap windows<CR>

let g:which_key_map.w = {
    \ 'name': '+window',
    \ '=': 'Reset windows',
    \ '-': 'Split window horizontal',
    \ '/': 'Split window vertical',
    \ 'd': 'Close window',
    \ 'h': 'Focus split to left',
    \ 'l': 'Focus split to right',
    \ 'j': 'Focus split below',
    \ 'k': 'Focus split above',
    \ 'm': 'Maximize buffer',
    \ 'w': 'List windows',
\ }

""" 'w.f' menu --- {{{
nnoremap <silent> <leader>wfl <C-w>v<C-w>w:Clap gfiles<CR>
nnoremap <silent> <leader>wfh <C-w>v:Clap gfiles<CR>
nnoremap <silent> <leader>wfj <C-w>n<C-w>w:Clap gfiles<CR>
nnoremap <silent> <leader>wfk <C-w>n:Clap gfiles<CR>

let g:which_key_map.w.f = {
    \ 'name': '+file-in-window',
    \ 'l': 'New file split right',
    \ 'h': 'New file split left',
    \ 'j': 'New file split below',
    \ 'k': 'New file split above',
\ }
""" 'w.f' menu end }}}
"" 'w' menu end }}}
" end <leader> mapping }}}

" begin misc. mapping --- {{{
let g:which_key_map_g = {
    \ 'c': 'Comment lines',
    \ 'g': [':1,1', 'Got to top'],
    \ 'j': [':normal! gj', 'Line down'],
    \ 'k': [':normal! gk', 'Line up'],
\ }

let g:which_key_map_s = {
    \ 'a': 'Sandwich ADD',
    \ 'd': 'Sandwich DELETE',
    \ 'r': 'Sandwich REPLACE',
\ }
" end misc mapping}}}


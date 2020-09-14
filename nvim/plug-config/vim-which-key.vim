" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" which-key invocation --- {{{
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" end }}}

" begin <leader> mapping --- {{{
nnoremap <silent> <leader><Tab> :bn<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
nnoremap <leader>/ :Clap grep ++opt=--hidden -g "!.git/"<CR>

let g:which_key_map = {
    \ '[1-0]': 'Switch to buffer 1-10',
    \ '<Tab>': 'Next buffer',
    \ '/': 'Project Search',
\ }

"" hide these
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map.0 = 'which_key_ignore'

"" 'a' menu --- {{{
"" coc actions (do I even need these)
nmap <leader>ab  <Plug>(coc-codeaction)
nnoremap <silent><nowait> <leader>ac  :<C-u>CocList commands<cr>
nmap <leader>af  <Plug>(coc-fix-current)
nnoremap <silent><nowait> <leader>ao  :<C-u>CocList outline<cr>
xmap <leader>as  <Plug>(coc-codeaction-selected)
nmap <leader>as  <Plug>(coc-codeaction-selected)
nnoremap <silent><nowait> <leader>aS  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>ax  :<C-u>CocList extensions<cr>

let g:which_key_map.a = {
    \ 'name': '+actions/coc',
    \ 'b': 'CoC action on buffer',
    \ 'c': 'CoC commands',
    \ 'f': 'Auto-fix line',
    \ 'o': 'CoC outline',
    \ 's': 'Action on selected',
    \ 'S': 'CoC symbols',
    \ 'x': 'Show CoC extensions',
\ }
"" 'a' menu end }}}

"" 'b' menu --- {{{
nnoremap <silent> <leader>bd :Kwbd<CR>
nnoremap <silent> <leader>bb :Clap buffers<CR>
nnoremap <silent> <leader>bc :Clap bcommits<CR>

let g:which_key_map.b = {
    \ 'name': '+buffer',
    \ 'b': 'List buffers',
    \ 'c': 'Commits for this buffer',
    \ 'd': 'Delete buffer',
\ }
"" 'b' menu end }}}

"" 'c' menu --- {{{
nmap <silent> <leader>cr <Plug>(coc-rename)
xmap <leader>c= <Plug>(coc-format-selected)
nmap <leader>c= <Plug>(coc-format-selected)

let g:which_key_map.c = {
    \ 'name': '+code/change',
    \ 'r': 'Rename symbol',
    \ '=': 'Format selected',
\ }
"" 'c' menu end }}}

"" 'e' menu --- {{{
nnoremap <silent> <leader>el :<C-u>CocList diagnostics<CR>

let g:which_key_map.e = {
    \ 'name': '+errors/diagnostics',
    \ 'l': 'List diagnostics',
    \ }
"" 'e' menu end }}}

"" 'f' menu ============>
nnoremap <silent> <leader>f= :Format<CR>
nnoremap <silent> <leader>ff :Clap gfiles<CR>
nnoremap <silent> <leader>fF :NERDTreeFind<CR>
nnoremap <silent> <leader>fn :Clap filer<CR>
nnoremap <silent> <leader>fo :Vista!!<CR>
nnoremap <silent> <leader>fs :w<CR>
nnoremap <silent> <leader>ft :CocCommand explorer --toggle<CR>

let g:which_key_map.f = {
    \ 'name': '+file',
    \ '=': 'Format file',
    \ 'f': 'Open file in PWD',
    \ 'F': 'Show file in tree',
    \ 'n': 'Open/create new file',
    \ 'o': 'Focus outline',
    \ 's': 'Save file',
    \ 't': 'File tree',
\ }

""" 'f.e' menu ============>
nnoremap <silent> <leader>fec :CocConfig<CR>
nnoremap <silent> <leader>fed :Clap files $DOTFILES_HOME<CR>
nnoremap <silent> <leader>fek :e $DOTFILES_HOME/nvim/mappings.vim<CR>
nnoremap <silent> <leader>fev :Clap files $NVIM_HOME<CR>
nnoremap <silent> <leader>few :e $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim<CR>

let g:which_key_map.f.e = {
    \ 'name': '+edit',
    \ 'c': 'Edit CoC',
    \ 'd': 'Edit all dotfiles',
    \ 'k': 'Edit keybindings (mappings.vim)',
    \ 'v': 'Edit nvim dotfiles',
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
nnoremap <silent> <leader>ji :Vista finder<CR>
nnoremap <silent> <leader>jI :Clap proj_tags<CR>

let g:which_key_map.j = {
    \ 'name': '+jump',
    \ 'i': 'Jump to symbol in buffer',
    \ 'I': 'Jump to symbol in project',
\ }
"" 'j' menu end }}}

"" MAJOR menu --- {{{
"" MAJOR menu end }}}

"" 'p' menu --- {{{
nnoremap <silent> <leader>pp :Clap zoxide<CR>

let g:which_key_map.p = {
    \ 'name': '+projects',
    \ 'p': 'Switch projects',
\ }
"" 'p' menu end }}}

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
nnoremap <silent> <leader>wfl :vertical rightbelow sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfh :vertical sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfj :rightbelow sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfk :split<CR>:Clap gfiles<CR>

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


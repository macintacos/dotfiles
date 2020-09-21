" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" which-key invocation --- {{{
nnoremap <silent> <leader>      :<c-u>WhichKey ' '<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ' '<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>
nnoremap <silent> <Bslash> :<c-u>WhichKey '<Bslash>'<CR>
nnoremap <silent> <Bslash> :<c-u>WhichKeyVisual '<Bslash>'<CR>
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
nnoremap <silent> <leader>! :FloatermNew<CR>
nnoremap <silent> <leader>; :Commentary<CR>
nnoremap <silent> <leader>* :Clap grep ++query=<cword><CR>
vnoremap <silent> <leader>* :Clap grep ++query=@visual<CR>
nnoremap <silent> <leader>` :edit #<CR>

let g:which_key_map = {
            \ 'name': 'Top-level',
            \ '[1-0]': 'Switch to buffer 1-10',
            \ '<Tab>': 'Switch to last buffer',
            \ '/': 'Project search',
            \ '*': 'Project search w/ selection',
            \ '!': 'New terminal (ctrl+/ for toggle)',
            \ ';': 'Toggle comment',
            \ '`': 'Previous buffer',
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
nnoremap <silent> <leader>b* :Clap blines ++query=<cword><CR>
vnoremap <silent> <leader>b* :Clap blines ++query=@visual<CR>
nnoremap <silent> <leader>bd :Kwbd<CR>
nnoremap <silent> <leader>bD :Bonly!<CR>
nnoremap <silent> <leader>bb :Clap buffers<CR>
nnoremap <silent> <leader>bc :Clap bcommits<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bo :TagbarToggle<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bs :Scratch<CR>
nnoremap <silent> <leader>bu :UndotreeToggle<CR>
nnoremap <silent> <leader>bw :call KillVisibleBufferChooseWin()<CR>
nnoremap <silent> <leader>by :%y<CR>

let g:which_key_map.b = {
            \ 'name': '+buffer',
            \ '*': 'Search word/selection in buffer',
            \ 'b': 'List buffers',
            \ 'c': 'Commits for this buffer',
            \ 'd': 'Close this buffer',
            \ 'D': 'Close all other buffers',
            \ 'n': 'Next buffer',
            \ 'o': 'Show outline',
            \ 'p': 'Prev buffer',
            \ 's': 'Open scratch buffer',
            \ 'u': 'Show undo tree',
            \ 'w': 'Choose buffer to kill',
            \ 'y': 'Copy whole buffer',
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
nnoremap <silent> <leader>en :call CocAction('diagnosticNext')<CR>zz
nnoremap <silent> <leader>ep :call CocAction('diagnosticPrevious')<CR>zz

let g:which_key_map.e = {
            \ 'name': '+errors/diagnostics',
            \ 'l': 'List diagnostics',
            \ }
"" 'e' menu end }}}

"" 'f' menu --- {{{
nnoremap <silent> <leader>f~ :Clap files ~<CR>
nnoremap <silent> <leader>f= :Format<CR>
nnoremap <silent> <leader>fd :Clap filer %:p:h<CR>
nnoremap <silent> <leader>ff :Clap gfiles<CR>
nnoremap <silent> <leader>fF :NERDTreeFind<CR>
nnoremap <silent> <leader>fn :Clap filer<CR>
nnoremap <silent> <leader>fR :Move %<Tab>
nnoremap <silent> <leader>fs :w<CR>
nnoremap <silent> <leader>fS :wa<CR>
nnoremap <silent> <leader>ft :execute 'CocCommand explorer '.getcwd().' --toggle --sources file+'<CR>

let g:which_key_map.f = {
            \ 'name': '+file',
            \ '~': 'Search files in home',
            \ '=': 'Format file',
            \ 'D': 'Delete current file',
            \ 'd': 'Find file in current dir',
            \ 'f': 'Open file in PWD',
            \ 'F': 'Show file in tree',
            \ 'n': 'Open/create new file',
            \ 'R': 'Rename/move current file',
            \ 'S': 'Save all files',
            \ 's': 'Save file',
            \ 't': 'File tree',
            \ }

""" 'f.e' menu ============>
nnoremap <silent> <leader>fec :CocConfig<CR>
nnoremap <silent> <leader>fed :Clap files $DOTFILES_HOME<CR>
nnoremap <silent> <leader>fek :e $DOTFILES_HOME/nvim/mappings.vim<CR>
nnoremap <silent> <leader>feR :so $DOTFILES_HOME/nvim/init.vim<CR>:PlugInstall<CR>
nnoremap <silent> <leader>feu :so $DOTFILES_HOME/nvim/init.vim<CR>:PlugUpdate<CR>
nnoremap <silent> <leader>fev :Clap files $NVIM_HOME<CR>
nnoremap <silent> <leader>few :e $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim<CR>

let g:which_key_map.f.e = {
            \ 'name': '+edit',
            \ 'c': 'Edit CoC',
            \ 'd': 'Edit all dotfiles',
            \ 'k': 'Edit keybindings (mappings.vim)',
            \ 'u': 'Source/update plugins',
            \ 'v': 'Edit nvim dotfiles',
            \ 'w': 'Edit which-key bindings',
            \ 'R': 'Source/install plugins',
            \ }

""" 'f.e' menu end }}}
"" 'f' menu end }}}

"" 'g' menu --- {{{
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gB :!smerge blame %<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gs :!smerge .<CR>
" the space at the end is intentional
nnoremap <silent> <leader>gS :!smerge search 

let g:which_key_map.g = {
            \ 'name': '+git',
            \ 'a': 'Stage all files',
            \ 'b': 'Open line blame for buffer',
            \ 'B': 'Blame file in Smerge',
            \ 'c': 'Commit staged changes',
            \ 's': 'Status',
            \ 'S': 'Search git history',
            \ }
"" 'g' menu end}}}

"" 'h' menu --- {{{ Ignoring until we find a use for it
nnoremap <silent> <leader>hh :Clap help_tags<CR>
nnoremap <silent> <leader>hm :Clap maps<CR>
nnoremap <silent> <leader>h* :Clap help_tags ++query=<cword><CR>

let g:which_key_map.h = {
            \ 'name' : '+help',
            \ '*': 'Help for word under cursor',
            \ 'h': 'Search help commands',
            \ }
let g:which_key_map.h.p = 'which_key_ignore'
let g:which_key_map.h.s = 'which_key_ignore'
let g:which_key_map.h.u = 'which_key_ignore'
"" 'h' menu end }}}

"" 'j' menu --- {{{
nnoremap <silent> <leader>ji :Vista finder<CR>
nnoremap <silent> <leader>jI :Clap proj_tags<CR>
nnoremap <silent> <leader>jJ :SplitjoinSplit<CR>
nnoremap <silent> <leader>jK :SplitjoinJoin<CR>

let g:which_key_map.j = {
            \ 'name': '+jump',
            \ 'i': 'Jump to symbol in buffer',
            \ 'I': 'Jump to symbol in project',
            \ 'j': 'Split code below',
            \ 'k': 'Join code above',
            \ }
"" 'j' menu end }}}

"" 'o' menu --- {{{
nmap <silent> <leader>of gof
nmap <silent> <leader>oF goF
nmap <silent> <leader>ot got
nmap <silent> <leader>oT goT

let g:which_key_map.o = {
            \ 'name': '+open',
            \ 'f': 'Open file in Finder',
            \ 'F': 'Open PWD in Finder',
            \ 't': 'Open file in terminal',
            \ 'T': 'open PWD in terminal'
            \ }
"" 'o' menu end }}}

"" 'p' menu --- {{{
nnoremap <silent> <leader>pp :Clap zoxide<CR>
nnoremap <silent> <leader>pt :OpenTodo<CR>

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
nnoremap <silent> <leader>sb :Clap lines<CR>
nnoremap <silent> <leader>ss :Clap blines<CR>
nnoremap <silent> <leader>sp :Clap grep ++opt=--hidden -g "!.git/"<CR>
nnoremap <silent> <leader>st :Clap floaterm<CR>

let g:which_key_map.s = {
            \ 'name': '+search/symbol',
            \ 'b': 'Search in all buffers',
            \ 's': 'Search this buffer (swoop)',
            \ 'p': 'Search this project',
            \ 't': 'Search terminals',
            \ }
"" 's' menu end }}}

"" 't' menu --- {{{
nnoremap <silent> <leader>tc :Clap colors<CR>
nnoremap <silent> <leader>tg :Goyo<CR>
nnoremap <silent> <leader>tm :OpenTodo<CR>
nnoremap <silent> <leader>tn :<C-u>setlocal nonumber! norelativenumber!<CR>

let g:which_key_map.t = {
            \ 'name': '+UI toggles/themes',
            \ 'c': 'Choose a theme',
            \ 'g': 'Goyo',
            \ 'm': 'Open TODOs',
            \ 'n': 'Toggle line numbers',
            \ }
"" 't' menu end }}}

"" 'w' menu --- {{{
nnoremap <silent> <leader>w= <C-w>=
nnoremap <silent> <leader>w- :rightbelow sb<CR>
nnoremap <silent> <leader>w/ :vertical rightbelow sb<CR>
nnoremap <silent> <leader>wd :call CloseWindowChooseWin()<CR>
nnoremap <silent> <leader>wD :Kwbd<CR>:close<CR>
nmap <silent> <leader>wm <Plug>(zoom-toggle)
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>ws :rightbelow sb<CR>
nnoremap <silent> <leader>wv :vertical rightbelow sb<CR>
nnoremap <silent> <leader>ww :ChooseWin<CR>

let g:which_key_map.w = {
            \ 'name': '+window',
            \ '=': 'Reset windows',
            \ '-': 'Split window horizontal',
            \ '/': 'Split window vertical',
            \ 'd': 'Choose window to close',
            \ 'D': 'Close buffer and window',
            \ 'h': 'Focus window to left',
            \ 'l': 'Focus window to right',
            \ 'j': 'Focus window below',
            \ 'k': 'Focus window above',
            \ 'H': 'Move window to left',
            \ 'L': 'Move window to right',
            \ 'J': 'Move window to bottom',
            \ 'K': 'Move window to top',
            \ 'm': 'Maximize buffer',
            \ 's': 'Split window horizontal',
            \ 'v': 'Split window vertical',
            \ 'w': 'Choose windows',
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

"" 'x' menu --- {{{
let g:which_key_map.x = {
            \ 'name': '+text',
            \ }
"" 'x' menu end }}}
" end <leader> mapping }}}

" <localleader> mapping --- {{{
" mappings in this menu should be filetype specific
let g:which_key_map_local = {}

"" BOOKMARKS
nnoremap <silent> <localleader>bm :<C-u>BookmarkToggle<Cr>
nnoremap <silent> <localleader>bi :<C-u>BookmarkAnnotate<Cr>
nnoremap <silent> <localleader>ba :<C-u>BookmarkShowAll<Cr>
nnoremap <silent> <localleader>bn :<C-u>BookmarkNext<Cr>
nnoremap <silent> <localleader>bp :<C-u>BookmarkPrev<Cr>
let g:which_key_map_local.b = {
            \ 'name': '+bookmarks',
            \ 'm': 'Toggle bookmark',
            \ 'i': 'Annotate line(s)',
            \ 'a': 'Show all bookmarks',
            \ 'n': 'Next bookmark',
            \ 'p': 'Prev bookmark',
            \ }

"" MARKDOWN
autocmd FileType markdown nmap <buffer> <leader>mv <Plug>MarkdownPreview
autocmd FileType markdown let g:which_key_map_local.m = {
            \ 'name': '+markdown',
            \ 'v': 'Markdown preview start',
            \ }

"" SPLITS/JOINS
nmap <silent> <localleader>sj :SplitjoinSplit<CR>
nmap <silent> <localleader>sk :SplitjoinJoin<CR>
let g:which_key_map_local.s = {
            \ 'name': '+split',
            \ 'j': 'Split code below',
            \ 'k': 'Join code above',
            \ }

" end <localleader> mapping

" mkdx-mapping --- {{{
let g:which_key_map_mkdx = {
            \ 'name': 'mkdx',
            \ "'": 'Toggle quotes',
            \ '/': 'Italicize',
            \ }
" }}}

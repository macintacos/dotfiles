
" Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key'
" Description: gives which-key-like functionality to vim; something that I sorely need in order to do things the way that I want to do them in Vim

" which-key invocation --- {{{
nnoremap <silent> <leader>      <Cmd>WhichKey ' '<CR>
vnoremap <silent> <leader>      <Cmd>WhichKeyVisual ' '<CR>
nnoremap <silent> <localleader> <Cmd>WhichKey ','<CR>
vnoremap <silent> <localleader> <Cmd>WhichKeyVisual ','<CR>
vnoremap <silent> <localleader> <Cmd>WhichKeyVisual ','<CR>
" end }}}

" begin <leader> mapping --- {{{
nnoremap <silent> <leader><Tab> <Cmd>bn<CR>
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
nnoremap <leader>/ <Cmd>Clap grep ++opt=--hidden -g "!.git/"<CR>
nnoremap <silent> <leader>! <Cmd>FloatermNew<CR>
nnoremap <silent> <leader>; <Cmd>Commentary<CR>
nnoremap <silent> <leader>* <Cmd>Clap grep ++query=<cword><CR>
vnoremap <silent> <leader>* <Cmd>Clap grep ++query=@visual<CR>
nnoremap <silent> <leader>` <Cmd>edit #<CR>

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

"" 'b' menu --- {{{
nnoremap <silent> <leader>b* <Cmd>Clap blines ++query=<cword><CR>
nnoremap <silent> <leader>bb <Cmd>Clap buffers<CR>
nnoremap <silent> <leader>bc <Cmd>Clap bcommits<CR>
nnoremap <silent> <leader>bD <Cmd>call KillVisibleBufferChooseWin()<CR>
nnoremap <silent> <leader>bm <Cmd>messages<CR>
nnoremap <silent> <leader>bn <Cmd>bn<CR>
nnoremap <silent> <leader>bN <Cmd>enew<CR>
nnoremap <silent> <leader>bo <Cmd>TagbarToggle<CR>
nnoremap <silent> <leader>bp <Cmd>bp<CR>
nnoremap <silent> <leader>bs <Cmd>Scratch<CR>
nnoremap <silent> <leader>bu <Cmd>UndotreeToggle<CR>
nnoremap <silent> <leader>by <Cmd>%y<CR>
vnoremap <silent> <leader>b* <Cmd>Clap blines ++query=@visual<CR>

let g:which_key_map.b = {
            \ 'name': '+buffer',
            \ '*': 'Search word/selection in buffer',
            \ 'b': 'List buffers',
            \ 'c': 'Commits for this buffer',
            \ 'D': 'Choose visible buffer to kill',
            \ 'm': 'Show messages buffer',
            \ 'n': 'Next buffer',
            \ 'N': 'New empty buffer',
            \ 'o': 'Show outline',
            \ 'p': 'Prev buffer',
            \ 's': 'Open scratch buffer',
            \ 'u': 'Show undo tree',
            \ 'y': 'Copy whole buffer',
            \ }

""" 'b.d' menu --- {{{
nnoremap <silent> <leader>bdo <Cmd>Bonly!<CR>
nnoremap <silent> <leader>bdd <Cmd>BD<CR>
nnoremap <silent> <leader>bdh <Cmd>Bdelete hidden<CR>
nnoremap <silent> <leader>bdw <Cmd>bufdo Bw<CR>
nnoremap <silent> <leader>bda <Cmd>Bdelete all<CR>

let g:which_key_map.b.d = {
            \ 'name': '+delete',
            \ 'a': 'All buffers',
            \ 'o': 'Buffers other than current',
            \ 'h': 'Hidden buffers',
            \ 'd': 'Current buffer',
            \ 'w': 'All buffers, keep windows',
            \ }
""" 'b.d' menu end }}}


"" 'b' menu end }}}

"" 'c' menu --- {{{
nmap <silent> <leader>cr <Plug>(coc-rename)
xmap <leader>c= <Plug>(coc-format-selected)
nmap <leader>c= <Plug>(coc-format-selected)

let g:which_key_map.c = {
            \ 'name': '+code/change',
            \ '=': 'Format selected',
            \ 'r': 'Rename symbol',
            \ }
"" 'c' menu end }}}

"" 'e' menu --- {{{
nnoremap <silent> <leader>el <Cmd>CocList diagnostics<CR>
nnoremap <silent> <leader>en <Cmd>call CocAction('diagnosticNext')<CR>zz
nnoremap <silent> <leader>ep <Cmd>call CocAction('diagnosticPrevious')<CR>zz

let g:which_key_map.e = {
            \ 'name': '+errors/diagnostics',
            \ 'l': 'List diagnostics',
            \ }
"" 'e' menu end }}}

"" 'f' menu --- {{{
nnoremap <silent> <leader>f= <Cmd>Format<CR>
nnoremap <silent> <leader>f% <Cmd>so %<CR>
nnoremap <silent> <leader>fd <Cmd>Clap filer %:p:h<CR>
nnoremap <silent> <leader>ff <Cmd>Clap gfiles<CR>
nnoremap <silent> <leader>fn <Cmd>Clap filer<CR>
nnoremap <silent> <leader>fR <Cmd>Move %<Tab>
nnoremap <silent> <leader>fs <Cmd>w<CR>
nnoremap <silent> <leader>fS <Cmd>wa<CR>
nnoremap <silent> <leader>ft <Cmd>execute 'CocCommand explorer '.getcwd().' --toggle --position right --sources file+'<CR>
nnoremap <silent> <leader>f~ <Cmd>Clap files ~<CR>

let g:which_key_map.f = {
            \ 'name': '+file',
            \ '%': 'Source file',
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
            \ '~': 'Search files in home',
            \ }

""" 'f.e' menu ============>
nnoremap <silent> <leader>fec <Cmd>CocConfig<CR>
nnoremap <silent> <leader>fed <Cmd>Clap files $DOTFILES_HOME<CR>
nnoremap <silent> <leader>fek <Cmd>e $DOTFILES_HOME/nvim/mappings.vim<CR>
nnoremap <silent> <leader>feR <Cmd>so $DOTFILES_HOME/nvim/init.vim<CR>:PlugInstall<CR>
nnoremap <silent> <leader>feu <Cmd>so $DOTFILES_HOME/nvim/init.vim<CR>:PlugUpdate<CR>
nnoremap <silent> <leader>fev <Cmd>Clap files $NVIM_HOME<CR>
nnoremap <silent> <leader>few <Cmd>e $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim<CR>

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
nnoremap <silent> <leader>ga <Cmd>Git add .<CR>
nnoremap <silent> <leader>gB <Cmd>!smerge blame %<CR>
nnoremap <silent> <leader>gb <Cmd>Git blame<CR>
nnoremap <silent> <leader>gc <Cmd>Git commit<CR>
nnoremap <silent> <leader>gd <Cmd>Gdiffsplit<CR>
nnoremap <silent> <leader>gs <Cmd>!smerge .<CR>
nnoremap <silent> <leader>gS <Cmd>Clap commits<CR>

let g:which_key_map.g = {
            \ 'name': '+git',
            \ 'a': 'Stage all files',
            \ 'B': 'Blame file in Smerge',
            \ 'b': 'Open line blame for buffer',
            \ 'c': 'Commit staged changes',
            \ 'd': 'Diff current file in split',
            \ 'S': 'Search git history',
            \ 's': 'Status',
            \ }
"" 'g' menu end}}}

"" 'h' menu --- {{{ Ignoring until we find a use for it
nnoremap <silent> <leader>h* <Cmd>Clap help_tags ++query=<cword><CR>
nnoremap <silent> <leader>hh <Cmd>Clap help_tags<CR>
nnoremap <silent> <leader>hm <Cmd>Clap maps<CR>

let g:which_key_map.h = {
            \ 'name': '+help',
            \ '*': 'Help for word under cursor',
            \ 'h': 'Search help commands',
            \ }
let g:which_key_map.h.p = 'which_key_ignore'
let g:which_key_map.h.s = 'which_key_ignore'
let g:which_key_map.h.u = 'which_key_ignore'
"" 'h' menu end }}}

"" 'j' menu --- {{{
nnoremap <silent> <leader>jI <Cmd>Clap proj_tags<CR>
nnoremap <silent> <leader>ji <Cmd>Vista finder<CR>
nnoremap <silent> <leader>jJ <Cmd>SplitjoinSplit<CR>
nnoremap <silent> <leader>jK <Cmd>SplitjoinJoin<CR>

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
nmap <silent> <leader>ox <Cmd>CocList marketplace<CR>

let g:which_key_map.o = {
            \ 'name': '+open',
            \ 'f': 'Open file in Finder',
            \ 'F': 'Open PWD in Finder',
            \ 't': 'Open file in terminal',
            \ 'T': 'Open PWD in terminal',
            \ 'x': 'Open CoC marketplace',
            \ }
"" 'o' menu end }}}

"" 'p' menu --- {{{
nnoremap <silent> <leader>pp <Cmd>Clap zoxide<CR>
nnoremap <silent> <leader>pt <Cmd>OpenTodo<CR>

let g:which_key_map.p = {
            \ 'name': '+projects',
            \ 'p': 'Switch projects',
            \ }
"" 'p' menu end }}}

"" 'q' menu --- {{{
nnoremap <silent> <leader>qq <Cmd>qa<CR>

let g:which_key_map.q = {
            \ 'name': '+quit',
            \ 'q': 'Quit all',
            \ }

"" 'q' menu end }}}

"" 's' menu --- {{{
nnoremap <silent> <leader>sb <Cmd>Clap lines<CR>
nnoremap <silent> <leader>ss <Cmd>Clap blines<CR>
nnoremap <silent> <leader>sp <Cmd>Clap grep ++opt=--hidden -g "!.git/"<CR>
nnoremap <silent> <leader>st <Cmd>Clap floaterm<CR>

let g:which_key_map.s = {
            \ 'name': '+search/symbol',
            \ 'b': 'Search in all buffers',
            \ 's': 'Search this buffer (swoop)',
            \ 'p': 'Search this project',
            \ 't': 'Search terminals',
            \ }
"" 's' menu end }}}

"" 't' menu --- {{{
nnoremap <silent> <leader>tc <Cmd>Clap colors<CR>
nnoremap <silent> <leader>tg <Cmd>Goyo<CR>
nnoremap <silent> <leader>tm <Cmd>OpenTodo<CR>
nnoremap <silent> <leader>tn <Cmd>setlocal nonumber! norelativenumber!<CR>
nnoremap <silent> <leader>tW <Cmd>setlocal nowrap!<CR>

let g:which_key_map.t = {
            \ 'name': '+UI toggles/themes',
            \ 'c': 'Choose a theme',
            \ 'g': 'Goyo',
            \ 'm': 'Open TODOs',
            \ 'n': 'Toggle line numbers',
            \ 'W': 'Toggle word wrap',
            \ }
"" 't' menu end }}}

"" 'w' menu --- {{{
nnoremap <silent> <leader>w= <C-w>=
nnoremap <silent> <leader>w- <Cmd>rightbelow sb<CR>
nnoremap <silent> <leader>w/ <Cmd>vertical rightbelow sb<CR>
nnoremap <silent> <leader>wd <Cmd>close<CR>
nnoremap <silent> <leader>wD <Cmd>call CloseWindowChooseWin()<CR>
nmap <silent> <leader>wm <Plug>(zoom-toggle)
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wH <Cmd>wincmd H<CR>
nnoremap <silent> <leader>wL <Cmd>wincmd L<CR>
nnoremap <silent> <leader>wJ <Cmd>wincmd J<CR>
nnoremap <silent> <leader>wK <Cmd>wincmd K<CR>
nnoremap <silent> <leader>ws <Cmd>rightbelow sb<CR>
nnoremap <silent> <leader>wt <Cmd>enew<CR>
nnoremap <silent> <leader>wv <Cmd>vertical rightbelow sb<CR>
nnoremap <silent> <leader>ww <Cmd>ChooseWin<CR>

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
            \ 't': 'New empty buffer',
            \ 'v': 'Split window vertical',
            \ 'w': 'Choose windows',
            \ }
""" 'w.N' menu --- {{{
nnoremap <silent> <leader>wNc <Cmd>enew<CR>
nnoremap <silent> <leader>wNh <Cmd>vnew<CR>
nnoremap <silent> <leader>wNk <Cmd>new<CR>
nnoremap <silent> <leader>wNl <Cmd>vertical rightbelow new<CR>
nnoremap <silent> <leader>wNj <Cmd>rightbelow new<CR>

let g:which_key_map.w.N = {
            \ 'name': '+new_empty_buffer',
            \ 'c': 'Current window',
            \ 'h': 'Split left',
            \ 'j': 'Split below',
            \ 'k': 'Split above',
            \ 'l': 'Split right',
            \ }
""" 'w.N' menu end}}}


""" 'w.f' menu --- {{{
nnoremap <silent> <leader>wfl <Cmd>vertical rightbelow sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfh <Cmd>vertical sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfj <Cmd>rightbelow sb<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>wfk <Cmd>split<CR>:Clap gfiles<CR>

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
" @todo Need to go through and see what keybindings I can put here; possibly re-map from elsewhere?
" @todo uppercase, lowercase, kebab-case, snake_case, uppercase, sort lines, etc.
nnoremap <silent> <leader>x- <Cmd>call KebabCase()<CR>
nnoremap <silent> <leader>x_ <Cmd>call Snake_Case()<CR>
nnoremap <silent> <leader>xc <Cmd>call LowerCamelCase()<CR>
nnoremap <silent> <leader>xC <Cmd>call UpperCamelCase()<CR>

let g:which_key_map.x = {
            \ 'name': '+text',
            \ '-': 'To kebab-case',
            \ '_': 'To snake_case',
            \ 'c': 'To lowerCamelCase',
            \ 'C': 'To UpperCamelCase',
            \ }
"" 'x' menu end }}}
" end <leader> mapping }}}

" <localleader> mapping --- {{{

"" MACRO RECORDING
nnoremap <localleader>q <Cmd>normal! qq<CR>
nmap <localleader><tab> <Plug>(fzf-maps-n)
xmap <localleader><tab> <Plug>(fzf-maps-x)
omap <localleader><tab> <Plug>(fzf-maps-o)

let g:which_key_map_local = {
            \ 'name': 'localleader',
            \ '<Tab>': 'Maps for current mode',
            \ 'q': 'Record macro',
            \ }

"" BOOKMARKS
nnoremap <silent> <localleader>bm <Cmd>BookmarkToggle<Cr>
nnoremap <silent> <localleader>bi <Cmd>BookmarkAnnotate<Cr>
nnoremap <silent> <localleader>ba <Cmd>BookmarkShowAll<Cr>
nnoremap <silent> <localleader>bn <Cmd>BookmarkNext<Cr>
nnoremap <silent> <localleader>bp <Cmd>BookmarkPrev<Cr>
let g:which_key_map_local.b = {
            \ 'name': '+bookmarks',
            \ 'm': 'Toggle bookmark',
            \ 'i': 'Annotate line(s)',
            \ 'a': 'Show all bookmarks',
            \ 'n': 'Next bookmark',
            \ 'p': 'Prev bookmark',
            \ }

"" MARKDOWN
autocmd FileType markdown nmap <buffer> <localleader>mv <Plug>MarkdownPreview
autocmd FileType markdown nmap <buffer> <localleader>m-  <Cmd>call mkdx#ToggleCheckboxState(1)<CR>
autocmd FileType markdown nmap <buffer> <localleader>m=  <Cmd>call mkdx#ToggleCheckboxState()<CR>
autocmd FileType markdown vmap <buffer> <localleader>m-  <Cmd>call mkdx#ToggleCheckboxState()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown vmap <buffer> <localleader>m=  <Cmd>call mkdx#ToggleCheckboxState(1)<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>m[  <Cmd><C-U>call mkdx#ToggleHeader(1)<CR>
autocmd FileType markdown nmap <buffer> <localleader>m]  <Cmd><C-U>call mkdx#ToggleHeader()<CR>
autocmd FileType markdown nmap <buffer> <localleader>m'  <Cmd>call mkdx#ToggleQuote()<CR>
autocmd FileType markdown vmap <buffer> <localleader>m'  <Cmd>call mkdx#ToggleQuote()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mt  <Cmd>call mkdx#ToggleCheckboxTask()<CR>
autocmd FileType markdown vmap <buffer> <localleader>mt  <Cmd>call mkdx#ToggleCheckboxTask()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mlt <Cmd>call mkdx#ToggleChecklist()<CR>
autocmd FileType markdown vmap <buffer> <localleader>mlt <Cmd>call mkdx#ToggleChecklist()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mll <Cmd>call mkdx#ToggleList()<CR>
autocmd FileType markdown vmap <buffer> <localleader>mll <Cmd>call mkdx#ToggleList()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mk <Cmd><C-U>call mkdx#WrapLink()<CR>
autocmd FileType markdown vmap <buffer> <localleader>mk <Cmd><C-U>call mkdx#WrapLink("v")<CR>
autocmd FileType markdown nmap <buffer> <localleader>mi <Cmd><C-U>call mkdx#WrapText("n", g:mkdx#settings.tokens.italic, g:mkdx#settings.tokens.italic, "mkdx-text-italic-n")<CR>
autocmd FileType markdown vmap <buffer> <localleader>mi <Cmd><C-U>call mkdx#WrapText("v", g:mkdx#settings.tokens.italic, g:mkdx#settings.tokens.italic)<CR>
autocmd FileType markdown nmap <buffer> <localleader>mb <Cmd><C-U>call mkdx#WrapText("n", g:mkdx#settings.tokens.bold, g:mkdx#settings.tokens.bold, "mkdx-text-bold-n")<CR>
autocmd FileType markdown vmap <buffer> <localleader>mb <Cmd><C-U>call mkdx#WrapText("v", g:mkdx#settings.tokens.bold, g:mkdx#settings.tokens.bold)<CR>
autocmd FileType markdown nmap <buffer> <localleader>m` <Cmd><C-U>call mkdx#WrapText("n", "`", "`", "mkdx-text-inline-code-n")<CR>
autocmd FileType markdown vmap <buffer> <localleader>m` <Cmd>call      mkdx#WrapSelectionInCode()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>ms <Cmd><C-U>call mkdx#WrapText("n", "<strike>", "</strike>", "mkdx-text-strike-n")<CR>
autocmd FileType markdown vmap <buffer> <localleader>ms <Cmd><C-U>call mkdx#WrapText("v", "<strike>", "</strike>")<CR>
autocmd FileType markdown vmap <buffer> <localleader>m, <Cmd>call mkdx#Tableize()<CR>:call mkdx#MaybeRestoreVisual()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mI <Cmd>call mkdx#QuickfixHeaders()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mL <Cmd>call mkdx#QuickfixDeadLinks()<CR>
autocmd FileType markdown nmap <buffer> <localleader>mj <Cmd>call mkdx#JumpToHeader()<CR>

autocmd FileType markdown let g:which_key_map_local.m = {
            \ 'name': '+markdown',
            \ 'v': 'Markdown preview start',
            \ ']': "Promote header",
            \ '\': 'which_key_ignore',
            \ '[': "Demote header",
            \ 'k': 'Make link',
            \ 't': 'Toggle checkbox item',
            \ 'b': 'Bold',
            \ 's': 'Strikethrough',
            \ '`': 'Inline code',
            \ "'": 'Toggle quotes',
            \ 'i': 'Italicize',
            \ '-': 'Prev checkbox state',
            \ '=': 'Next checkbox state',
            \ ',': 'CSV to table',
            \ 'j': 'Jump to header',
            \ 'I': 'Quickfix TOC',
            \ 'L': 'Quickfix dead links',
            \ }

autocmd FileType markdown let g:which_key_map_local.m.l = {
            \ 'name': '+lists',
            \ 't': 'Toggle checklist item',
            \ 'l': 'Toggle list item',
            \ }

"" SPLITS/JOINS
nmap <silent> <localleader>sj <Cmd>SplitjoinSplit<CR>
nmap <silent> <localleader>sk <Cmd>SplitjoinJoin<CR>
let g:which_key_map_local.s = {
            \ 'name': '+split',
            \ 'j': 'Split code below',
            \ 'k': 'Join code above',
            \ }

" end <localleader> mapping

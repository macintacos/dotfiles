function! myspacevim#after() abort
  " "REGULAR" SETTINGS {{{
  filetype plugin on
  set clipboard+=unnamedplus
  set confirm     " instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files
  set hidden
  set encoding=UTF-8
  set hlsearch    " highlight searces (use <C-L> to temporarily turn off highliting)
  set ignorecase  " setting case-insensitive search

  set laststatus  " always display the status line, even if only one window is displayed
  set linebreak
  set nobackup
  set nocompatible
  set nowritebackup
  set ruler       " display the cursor position on the last line of the screen, or in the status line of a window
  set shortmess+=c
  set showcmd     " show partial commands in the last line of the screen
  set signcolumn=yes " always show the signcolumn so that it doesn't become all shifty when you resolve errors and such
  set smartcase   " setting it so that we don't use case-sensitivity until a capital letter is used
  set spelllang=en
  set timeoutlen=300
  set updatetime=300
  set wildmenu    " better command-line completion
  set wrap
  syntax on
  " "REGULAR" SETTINGS END }}}

  " FILE-SPECIFIC SETTINGS {{{
  augroup lexical
    autocmd!
    autocmd FileType markdown,mkd,md call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text,txt call lexical#init()
  augroup END
  " FILE-SPECIFIC SETTINGS END }}}

  " CTRLSPACE CONFIG {{{
  let g:CtrlSpaceGlobCommand = 'ag -lu --nocolor -g --hidden ""'
  " CTRLSPACE CONFIG END}}}

  " COLORS/THEMING {{{
  set gcr=a:block

  " mode aware cursors
  set gcr+=o:hor50-Cursor
  set gcr+=n:Cursor
  set gcr+=i-ci-sm:InsertCursor
  set gcr+=r-cr:ReplaceCursor-hor20
  set gcr+=c:CommandCursor
  set gcr+=v-ve:VisualCursor

  set gcr+=a:blinkon0

  hi Cursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
  hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
  hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
  hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
  hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
  " COLORS/THEMING END }}}

  " REMAPS {{{
  " Various ways of getting out of insert mode
  inoremap jj <ESC>
  inoremap kj <ESC>
  inoremap jk <ESC>
  inoremap kk <ESC>

  map Y y$ " make 'Y' yank for current character to end of line

  "" this it to make sure that vim-highlightedyank is actually working
  if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
  endif

  let g:highlightedyank_highlight_duration = 250
  " REMAPS END }}}

  " LAYER-SPECIFIC {{{
  let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1
    \ }
  let g:neoformat_enabled_python = ['black']
  " LAYER-SPECIFIC END }}}

  " DEFX CONFIG {{{
  let g:defx_icons_enable_syntax_highlight = 1
  let g:defx_icons_column_length = 2
  let g:defx_icons_directory_icon = ''
  let g:defx_icons_mark_icon = '*'
  let g:defx_icons_copy_icon = ''
  let g:defx_icons_move_icon = ''
  let g:defx_icons_parent_icon = ''
  let g:defx_icons_default_icon = ''
  let g:defx_icons_directory_symlink_icon = ''
  " Options below are applicable only when using "tree" feature
  let g:defx_icons_root_opened_tree_icon = ''
  let g:defx_icons_nested_opened_tree_icon = ''
  let g:defx_icons_nested_closed_tree_icon = ''
  " DEFX CONFIG END }}}
endfunction

function! myspacevim#before() abort
endfunction

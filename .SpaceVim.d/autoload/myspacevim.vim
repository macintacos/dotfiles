function! myspacevim#after() abort
  " COC.NVIM Settings
  set hidden
  set nobackup
  set nowritebackup
  set cmdheight=2
  set updatetime=300
  set shortmess+=c

  " "Regular" Settings
  set clipboard+=unnamedplus
  set timeoutlen=300
  set nocompatible
  set ignorecase  " setting case-insensitive search
  set smartcase   " setting it so that we don't use case-sensitivity until a capital letter is used
  set wrap
  set linebreak
  set spelllang=en
  filetype plugin on

  " File-specific Settings
  augroup lexical
    autocmd!
    autocmd FileType markdown,mkd,md call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text,txt call lexical#init()
  augroup END

  " CTRLSPACE CONFIG
  let g:CtrlSpaceGlobCommand = 'ag -lu --nocolor -g --hidden ""'

  " COLORS/THEMING
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

  " REMAPS

  " COC.NVIM CONFIGURATION! {{{

  " COC.NVIM SETTINGS END }}}

endfunction

function! myspacevim#before() abort
endfunction

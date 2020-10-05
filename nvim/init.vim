source $NVIM_HOME/options.vim
source $NVIM_HOME/functions.vim
source $NVIM_HOME/mappings.vim

" PLUGINZ {{{
call plug#begin('~/.config/vim-plug')

" Notable Plugin Authors {{{
"" all hail tpope
Plug 'tpope/vim-commentary' " 'gc' prefix for commenting things
Plug 'tpope/vim-fugitive'   " git plugin for vim
Plug 'tpope/vim-sensible'   " sensible default options for vim
Plug 'tpope/vim-obsession'  " cool session handling
Plug 'tpope/vim-eunuch'     " better linux command aliases for vim
Plug 'tpope/vim-unimpaired' " pairings
Plug 'tpope/vim-endwise'    " better understanding of syntax 'endings'

"" all hail junegunn
Plug 'junegunn/goyo.vim' " a zen-like editor view
Plug 'junegunn/gv.vim'   " a git commit browser
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
    \ Plug 'junegunn/fzf.vim' | source $PLUG_CONFIG_NVIM_HOME/fzf.vim
    " \ Plug 'benwainwright/fzf-project' -> check back in on this
    " periodically, it seems to do most of what you want but your `zoxide`
    " Clap provider is _pretty_ great
Plug 'junegunn/vim-easy-align'   | source $PLUG_CONFIG_NVIM_HOME/vim-easy-align.vim
Plug 'junegunn/vim-slash'        | source $PLUG_CONFIG_NVIM_HOME/vim-slash.vim
Plug 'junegunn/vim-after-object' | source $PLUG_CONFIG_NVIM_HOME/vim-after-object.vim
" }}}

" utilities with sources
Plug 'airblade/vim-gitgutter'        | source $PLUG_CONFIG_NVIM_HOME/vim-gitgutter.vim
Plug 'airblade/vim-rooter'           | source $PLUG_CONFIG_NVIM_HOME/vim-rooter.vim
Plug 'chrisbra/Colorizer'            | source $PLUG_CONFIG_NVIM_HOME/Colorizer.vim
Plug 'easymotion/vim-easymotion'     | source $PLUG_CONFIG_NVIM_HOME/vim-easymotion.vim
Plug 'liuchengxu/vista.vim'          | source $PLUG_CONFIG_NVIM_HOME/vista.vim
Plug 'luochen1990/rainbow'           | source $PLUG_CONFIG_NVIM_HOME/rainbow.vim
Plug 'machakann/vim-highlightedyank' | source $PLUG_CONFIG_NVIM_HOME/vim-highlightedyank.vim
Plug 'rhysd/clever-f.vim'            | source $PLUG_CONFIG_NVIM_HOME/clever-f.vim
Plug 'svermeulen/vim-cutlass'        | source $PLUG_CONFIG_NVIM_HOME/vim-cutlass.vim
Plug 'svermeulen/vim-yoink'          | source $PLUG_CONFIG_NVIM_HOME/vim-yoink.vim
Plug 'voldikss/vim-floaterm'         | source $PLUG_CONFIG_NVIM_HOME/vim-floaterm.vim
Plug 'Yggdroot/indentLine'           | source $PLUG_CONFIG_NVIM_HOME/indentLine.vim
Plug 'AndrewRadev/splitjoin.vim'     | source $PLUG_CONFIG_NVIM_HOME/splitjoin.vim
Plug 'Asheq/close-buffers.vim'       | source $PLUG_CONFIG_NVIM_HOME/close-buffers.vim
Plug 'APZelos/blamer.nvim'           | source $PLUG_CONFIG_NVIM_HOME/blamer.vim
Plug 'qpkorr/vim-bufkill'            | source $PLUG_CONFIG_NVIM_HOME/vim-bufkill.vim
Plug 't9md/vim-choosewin'            | source $PLUG_CONFIG_NVIM_HOME/vim-choosewin.vim
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }        | source $PLUG_CONFIG_NVIM_HOME/vim-visual-multi.vim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } | source $PLUG_CONFIG_NVIM_HOME/vim-clap.vim

" utilities with nothing else
Plug 'MTDL9/vim-log-highlighting'     " highlighting for log files
Plug 'dhruvasagar/vim-prosession'     " pro session handling
Plug 'dhruvasagar/vim-zoom'           " zooming in/out of windows (mapped to SPC w m)
Plug 'itchyny/vim-cursorword'         " underline word under cursor
Plug 'justinmk/vim-gtfo'              " open current file/project in finder/terminal
Plug 'machakann/vim-sandwich'         " alternative to vim-surround
Plug 'mtth/scratch.vim'               " scratch buffer for...scratch
Plug 'ntpeters/vim-better-whitespace' " show extra whitespace
Plug 'wellle/targets.vim'             " moar text objects for doing fun things
Plug 'mbbill/undotree'                " show an undo tree for the current buffer
Plug 'wsdjeg/vim-todo'                " extract todo messages and stuff from project

" languages-specific and/or adjacent
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } | source $PLUG_CONFIG_NVIM_HOME/vim-go.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}    | source $PLUG_CONFIG_NVIM_HOME/coc.vim
Plug 'elzr/vim-json'                               | source $PLUG_CONFIG_NVIM_HOME/vim-json.vim
Plug 'rizzatti/dash.vim'                           | source $PLUG_CONFIG_NVIM_HOME/dash.vim
Plug 'MattesGroeger/vim-bookmarks'                 | source $PLUG_CONFIG_NVIM_HOME/vim-bookmarks.vim
Plug 'sirver/ultisnips'                            | source $PLUG_CONFIG_NVIM_HOME/ultisnips.vim
Plug 'honza/vim-snippets' " snippets for many languages
Plug 'preservim/tagbar'   " function signatures and stuff
Plug 'iamcco/markdown-preview.nvim', {
    \ 'do': { -> mkdp#util#install() },
    \ 'for': ['markdown', 'vim-plug']
    \ } | source $PLUG_CONFIG_NVIM_HOME/markdown-preview.vim
Plug 'SidOfc/mkdx'             | source $PLUG_CONFIG_NVIM_HOME/mkdx.vim
Plug 'reedes/vim-lexical'      | source $PLUG_CONFIG_NVIM_HOME/vim-lexical.vim
Plug 'reedes/vim-pencil'       | source $PLUG_CONFIG_NVIM_HOME/vim-pencil.vim
Plug 'reedes/vim-litecorrect'  | source $PLUG_CONFIG_NVIM_HOME/vim-litecorrect.vim
Plug 'kana/vim-textobj-user'   | source $PLUG_CONFIG_NVIM_HOME/vim-textobj-user.vim
Plug 'reedes/vim-textobj-quote'    " use curly quotes in prose
Plug 'reedes/vim-textobj-sentence' " improving text-object motions

" themes
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'challenger-deep-theme/vim',     { 'as': 'challenger-deep' }
Plug 'edersonferreira/dalton-vim',    { 'as': 'dalton' }
Plug 'NLKNguyen/papercolor-theme',    { 'as': 'papercolor' }
Plug 'arzg/vim-colors-xcode',         { 'as': 'xcode'}
Plug 'bluz71/vim-moonfly-colors',     { 'as': 'moonfly'}
Plug 'bluz71/vim-nightfly-guicolors', { 'as': 'nightfly'}
Plug 'vim-airline/vim-airline' | source $PLUG_CONFIG_NVIM_HOME/vim-airline.vim
Plug 'ryanoasis/vim-devicons' " plug after everything else

" need to source after vim-devicons. also need to load functions in
" vim-buffet.vim for colors
source $PLUG_CONFIG_NVIM_HOME/vim-buffet.vim | Plug 'bagrat/vim-buffet'

" putting this here to make sure it comes after everything
Plug 'liuchengxu/vim-which-key' | source $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim
call plug#end()
call which_key#register(' ', "g:which_key_map")       " this makes sure which-key is properly loaded
call which_key#register(',', "g:which_key_map_local") " this makes sure which-key is properly loaded
" }}}

" Vanilla Configurations
colorscheme challenger_deep
let g:challenger_deep_termcolors = 16

"" Highlights the text that you yanked.
"" Only works on neovim 0.5.0+ (remove vim-highlightedyank once that is the stable version)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" cursor-related colors
highlight CursorLine guibg=#2e3140
autocmd InsertEnter * highlight CursorLine guibg=#282a36
autocmd InsertLeave * highlight CursorLine guibg=#2e3140

set gcr=a:block

" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=i:ver100-iCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor

set gcr+=a:blinkon0

hi Cursor  guifg=#ff79c6 guibg=#ff79c6
hi InsertCursor  guifg=#fdf6e3 guibg=#2aa198
hi VisualCursor  guifg=#fdf6e3 guibg=#ffb86c
hi ReplaceCursor guifg=#fdf6e3 guibg=#dc322f
hi CommandCursor guifg=#fdf6e3 guibg=#ff5555

" window stuff
autocmd VimResized * <C-w>=

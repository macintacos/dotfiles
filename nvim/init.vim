source $NVIM_HOME/options.vim
source $NVIM_HOME/functions.vim
source $NVIM_HOME/mappings.vim

" PLUGINZ {{{
call plug#begin('~/.config/vim-plug')

" all hail tpope
Plug 'tpope/vim-commentary' " 'gc' prefix for commenting things
Plug 'tpope/vim-fugitive'   " git plugin for vim
Plug 'tpope/vim-sensible'   " sensible default options for vim
Plug 'tpope/vim-obsession'  " cool session handling
Plug 'tpope/vim-eunuch'     " better linux command aliases for vim

" utilities
Plug 'machakann/vim-highlightedyank'    | source $PLUG_CONFIG_NVIM_HOME/vim-highlightedyank.vim
Plug 'reedes/vim-lexical'               | source $PLUG_CONFIG_NVIM_HOME/vim-lexical.vim
Plug 'reedes/vim-pencil'                | source $PLUG_CONFIG_NVIM_HOME/vim-pencil.vim
Plug 'airblade/vim-gitgutter'           | source $PLUG_CONFIG_NVIM_HOME/vim-gitgutter.vim
Plug 'airblade/vim-rooter'              | source $PLUG_CONFIG_NVIM_HOME/vim-rooter.vim
Plug 'voldikss/vim-floaterm'            | source $PLUG_CONFIG_NVIM_HOME/vim-floaterm.vim
Plug 'easymotion/vim-easymotion'        | source $PLUG_CONFIG_NVIM_HOME/vim-easymotion.vim
Plug 'chrisbra/Colorizer'               | source $PLUG_CONFIG_NVIM_HOME/Colorizer.vim
Plug 'luochen1990/rainbow'              | source $PLUG_CONFIG_NVIM_HOME/rainbow.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
    \ Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' } |
    \ source $PLUG_CONFIG_NVIM_HOME/vim-visual-multi.vim
Plug 'liuchengxu/vista.vim'         | source $PLUG_CONFIG_NVIM_HOME/vista.vim
Plug 'rhysd/clever-f.vim'           | source $PLUG_CONFIG_NVIM_HOME/clever-f.vim
Plug 'yggdroot/indentLine'          | source $PLUG_CONFIG_NVIM_HOME/indentLine.vim
Plug 'ntpeters/vim-better-whitespace' " show extra whitespace
Plug 'mtth/scratch.vim'             " scratch buffer for...scratch
Plug 'junegunn/goyo.vim'            " a 'zen' mode of sorts
Plug 'itchyny/vim-cursorword'       " underline word under cursor
Plug 'machakann/vim-sandwich'       " alternative to vim-surround
Plug 'MTDL9/vim-log-highlighting'   " highlighting for log files
Plug 'dhruvasagar/vim-prosession'   " pro session handling
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } |
            \ source $PLUG_CONFIG_NVIM_HOME/vim-clap.vim
" need to source after vim-devicons. also need to load functions in
" vim-buffet.vim for colors
source $PLUG_CONFIG_NVIM_HOME/vim-buffet.vim | Plug 'bagrat/vim-buffet'

" languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  | source $PLUG_CONFIG_NVIM_HOME/vim-go.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}     | source $PLUG_CONFIG_NVIM_HOME/coc.vim
Plug 'rizzatti/dash.vim'                            | source $PLUG_CONFIG_NVIM_HOME/dash.vim

" theming
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'vim-airline/vim-airline' | source $PLUG_CONFIG_NVIM_HOME/vim-airline.vim
Plug 'ryanoasis/vim-devicons' " icons in the editor (this needs to come after nerdtree-git-plugin)

" putting this here to make sure it comes after everything
Plug 'liuchengxu/vim-which-key'      | source $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim
call plug#end()
call which_key#register('<Space>', "g:which_key_map") " this makes sure which-key is properly loaded
" }}}

" Vanilla Configurations
colorscheme dracula

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

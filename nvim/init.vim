source $NVIM_HOME/options.vim
source $NVIM_HOME/mappings.vim

" PLUGINZ {{{
call plug#begin('~/.config/vim-plug')

Plug 'machakann/vim-highlightedyank' | source $PLUG_CONFIG_NVIM_HOME/vim-highlightedyank.vim
Plug 'reedes/vim-lexical' | source $PLUG_CONFIG_NVIM_HOME/vim-lexical.vim
Plug 'reedes/vim-pencil' | source $PLUG_CONFIG_NVIM_HOME/vim-pencil.vim
Plug 'liuchengxu/vim-which-key' | source $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim
Plug 'airblade/vim-gitgutter' | source $PLUG_CONFIG_NVIM_HOME/vim-gitgutter.vim
Plug 'ryanoasis/vim-devicons'   " put fancy icons in the editor
Plug 'tpope/vim-commentary'     " 'gc' prefix for commenting things
Plug 'tpope/vim-surround'       " use various motions to surround words
Plug 'tpope/vim-fugitive'       " git plugin for vim
Plug 'tpope/vim-sensible'       " sensible default options for vim
Plug 'itchyny/vim-cursorword'   " underline word under cursor

" theming
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'itchyny/lightline.vim' | source $PLUG_CONFIG_NVIM_HOME/lightline.vim

"" Try these one day
" Plug 'dbmrq/vim-ditto'

call plug#end()
" }}}

" Vanilla Config
colorscheme dracula
"" Highlights the text that you yanked.
"" Only works on neovim 0.5.0+ (remove vim-highlightedyank once that is the stable version)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END
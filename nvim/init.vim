source $NVIM_HOME/options.vim
source $NVIM_HOME/mappings.vim

" PLUGINZ {{{
call plug#begin('~/.config/vim-plug')

" utilities
Plug 'machakann/vim-highlightedyank' | source $PLUG_CONFIG_NVIM_HOME/vim-highlightedyank.vim
Plug 'reedes/vim-lexical'            | source $PLUG_CONFIG_NVIM_HOME/vim-lexical.vim
Plug 'reedes/vim-pencil'             | source $PLUG_CONFIG_NVIM_HOME/vim-pencil.vim
Plug 'airblade/vim-gitgutter'        | source $PLUG_CONFIG_NVIM_HOME/vim-gitgutter.vim
Plug 'liuchengxu/vim-which-key'      | source $PLUG_CONFIG_NVIM_HOME/vim-which-key.vim
Plug 'junegunn/fzf.vim'              | source $PLUG_CONFIG_NVIM_HOME/fzf.vim
Plug 'airblade/vim-rooter'           | source $PLUG_CONFIG_NVIM_HOME/vim-rooter.vim
Plug 'voldikss/vim-floaterm'         | source $PLUG_CONFIG_NVIM_HOME/vim-floaterm.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } |
    \ source $PLUG_CONFIG_NVIM_HOME/defx.nvim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } |
    \ source $PLUG_CONFIG_NVIM_HOME/vim-clap.vim
Plug 'mg979/vim-visual-multi', { 'branch': 'master' } |
    \ source $PLUG_CONFIG_NVIM_HOME/vim-visual-multi.vim
Plug 'liuchengxu/vista.vim'     " show symbols in a handy editor, jump-to-symbol support
Plug 'ryanoasis/vim-devicons'   " put fancy icons in the editor
Plug 'tpope/vim-commentary'     " 'gc' prefix for commenting things
Plug 'tpope/vim-fugitive'       " git plugin for vim
Plug 'tpope/vim-sensible'       " sensible default options for vim
Plug 'itchyny/vim-cursorword'   " underline word under cursor
Plug 'machakann/vim-sandwich'   " alternative to vim-surround

" theming
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'itchyny/lightline.vim' | source $PLUG_CONFIG_NVIM_HOME/lightline.vim

"" Try these one day
" Plug 'dbmrq/vim-ditto'

call plug#end()
call which_key#register('<Space>', "g:which_key_map") " this makes sure which-key is properly loaded
call which_key#register('g', "g:which_key_map_g") " this makes sure which-key is properly loaded
call which_key#register('s', "g:which_key_map_s") " this makes sure which-key is properly loaded
" }}}

" Vanilla Config
colorscheme dracula
"" Highlights the text that you yanked.
"" Only works on neovim 0.5.0+ (remove vim-highlightedyank once that is the stable version)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

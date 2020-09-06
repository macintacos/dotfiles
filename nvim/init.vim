source $DOTFILES_HOME/nvim/options.vim

" PLUGINZ {{{
call plug#begin('~/.config/vim-plug')

Plug 'machakann/vim-highlightedyank'
source $DOTFILES_HOME/nvim/vim-highlightedyank.vim

Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()
" }}}

" Vanilla Config

"" Highlights the text that you yanked.
"" Only works on neovim 0.5.0+ (remove vim-highlightedyank once that is the stable version)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END
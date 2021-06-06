" Plug 'reedes/vim-lexical'
" Description: adds a spell checker/word completion for certain languages

"" turn on based on language
augroup lexical
    autocmd!
    autocmd FileType markdown,md call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text,txt call lexical#init({ 'spell': 0 })
augroup END

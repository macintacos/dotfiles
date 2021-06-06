" Plug 'reedes/vim-pencil'
" Description: modifies vim in such a way that it's easier to write prose when in a markdown/text file.

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

"" turn on based on language
augroup pencil
    autocmd!
    autocmd FileType markdown,md call pencil#init()
    autocmd FileType text,txt call pencil#init()
augroup END

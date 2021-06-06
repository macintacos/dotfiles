" Plug 'reedes/vim-litecorrect'
" Description: dictionary of common works to fuck up while writing prose,
" that'll be auto-corrected while typing.

augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
    autocmd FileType txt call litecorrect#init()
augroup END

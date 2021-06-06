" Plug 'junegunn/vim-after-object'
" Description: gives a new 'after' motion, defined to a list of delimeters
" that you specify (placed below)

autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

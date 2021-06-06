" Plug 'elzr/vim-json'
" Description: json config stuff - mostly to enable folding

let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings = 0

au! BufRead,BufNewFile *.json set filetype=json
" au! BufRead,BufNewFile *.json set foldmethod=syntax
" au! BufRead,BufNewFile *.json set foldlevelstart=99

augroup json_autocmd
    autocmd!
    autocmd FileType json set foldmethod=syntax
    autocmd FileType json set foldlevelstart=3
augroup END

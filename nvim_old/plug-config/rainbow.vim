" Plug 'luochen1990/rainbow'
" Description: prettier representation of nesting by changing the colors of
" braces

" turn it on
let g:rainbow_active = 1

" customize
let g:rainbow_conf = {}

"" colors
let g:rainbow_conf.guifgs = ['#f9d201', '#e66e7b', '#9ecbff', '#b291ee'] 

"" syntax-specific
"" markdown: enable only for code blocks
"" txt: disable completely
let g:rainbow_conf.separately = {
    \ '*': {},
    \ 'markdown': {
    \   'parenthesis_options': 'contained_in=markdownCode contained'
    \ },
    \ 'txt': 0
\ }

" TEST
" [[[[]]]]
" {{{{}}}}


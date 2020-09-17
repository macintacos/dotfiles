" Plug 'vim-airline/vim-airline'
" Description: your status bar, dummy

" skip fileformat
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" display short path
let g:airline_stl_path_style = 'short'

" only show file name
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_c = '%t'

" don't show file type
let g:airline_section_x = ''

" powerline
let g:airline_powerline_fonts = 1

" theme
" let g:airline_theme = "github"

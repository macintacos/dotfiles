" Description: for mappings NOT related to plugins.
"   Mapping related to plugins go IN the plugin file itself, to be consistent.

" LEGEND
" <C-x> = 'control+x'
" <CR> = 'Enter/Return'

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

inoremap jj <ESC>
inoremap kk <ESC>

inoremap <C-s> <ESC><C-s> " Exits INSERT and saves on control+s

map Y y$ " make 'Y' yank for current character to end of line
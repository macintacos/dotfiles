" Plug 'yggdroot/indentLine'
" Description: line indentation customization/indicators

let g:indentLine_fileTypeExclude = ['tex', 'txt', 'markdown']

autocmd FileType help,coc-explorer IndentLinesToggle

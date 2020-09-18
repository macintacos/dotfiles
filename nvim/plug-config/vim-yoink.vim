" Plug 'svermeulen/vim-yoink'
" Description: better copy/paste behavior

" mappings
nmap <C-n> <Plug>(YoinkPostPasteSwapBack)
nmap <C-p> <Plug>(YoinkPostPasteSwapForward)

nmap p <Plug>(YoinkPaste_p)
nmap P <Plug>(YoinkPaste_P)

nmap [y <Plug>(YoinkRotateBack)
nmap ]y <Plug>(YoinkRotateForward)

nmap y <Plug>(YoinkYankPreserveCursorPosition)
xmap y <Plug>(YoinkYankPreserveCursorPosition)

" options
let g:yoinkSavePersistently = 1
let g:yoinkAutoFormatPaste = 1
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkIncludeDeleteOperations = 1

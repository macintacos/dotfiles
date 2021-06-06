" Plug 'svermeulen/vim-yoink'
" Description: better copy/paste behavior

" mappings
nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'

nmap [y <Plug>(YoinkRotateBack)
nmap ]y <Plug>(YoinkRotateForward)

nmap y <Plug>(YoinkYankPreserveCursorPosition)
xmap y <Plug>(YoinkYankPreserveCursorPosition)

" options
let g:yoinkSavePersistently = 1
let g:yoinkAutoFormatPaste = 1
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkIncludeDeleteOperations = 1

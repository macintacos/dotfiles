" Plug 'junegunn/fzf.vim'
" Description: Bringing fzf to vim!

" top-level options
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_preview_window = 'down:60%'

" make it a floating window instead of coming up from the bottom
" https://github.com/junegunn/fzf.vim/issues/821#issuecomment-581481211
let g:fzf_layout = {
    \ 'window': {
        \ 'width': 0.9,
        \ 'height': 0.7,
    \ },
\ }


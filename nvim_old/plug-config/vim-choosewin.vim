" Plug 't9md/vim-choosewin'
" Description: interact with windows and move them around

" mapping
nmap - <Plug>(choosewin)

" functions
function! KillVisibleBufferChooseWin()
    ChooseWin
    let buffer_number = bufnr('%')
    for i in range(1, winnr('$'))
        if winbufnr(i) == buffer_number
            exe i . 'wincmd w'
            enew
        endif
    endfor
    exe 'bwipeout '. buffer_number
endfunction

function! CloseWindowChooseWin()
    ChooseWin
    exe 'close'
endfunction

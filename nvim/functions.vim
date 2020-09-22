" Description: A place to put random functions that help me throughout the day

" smart closing (mapped to q in mappings.vim)
let g:smartclose_ignorewin = ['__Tagbar__', 'coc-explorer']
let g:smartclose_ignoreft  = [
            \ 'tagbar',
            \ 'coc-explorer',
            \ 'HelpDescribe',
            \ 'VebuggerShell',
            \ 'VebuggerTerminal',
            \ ]

function! CheckWinIsFloat(winnr) abort
    let id = win_getid(a:winnr)
    if id > 0 && exists('*nvim_win_get_config')
        return has_key(nvim_win_get_config(id), 'col')
    else
        return 0
    endif
endfunction

function! SmartClose() abort
    let ignorewin = get(g:,'smartclose_ignorewin',[])
    let ignoreft = get(g:, 'smartclose_ignoreft',[])
    " @bug vim winnr('$') do not include popup
    " ref: https://github.com/vim/vim/issues/6474
    let win_count = winnr('$')
    let num = win_count
    for i in range(1,win_count)
        if index(ignorewin , bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)),'&filetype')) != -1
            let num = num - 1
        elseif getbufvar(winbufnr(i),'&buftype') ==# 'quickfix'
            let num = num - 1
        elseif getwinvar(i, '&previewwindow') == 1 && winnr() !=# i
            let num = num - 1
        elseif CheckWinIsFloat(i)
            let num = num - 1
        endif
    endfor
    if num == 1
    else
        quit
    endif
endfunction


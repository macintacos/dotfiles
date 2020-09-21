" Description: A place to put random functions that help me throughout the day

" This function does the following:
" Delete the buffer; keep windows; create a scratch buffer if no buffers left
" From: https://vim.fandom.com/wiki/Deleting_a_buffer_without_closing_the_window#Alternative_Script
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified.  Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Create a mapping (e.g. in your .vimrc) like this:
"nmap <C-W>! <Plug>Kwbd

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

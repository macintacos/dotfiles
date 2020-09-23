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

" Text-related functions, whole-ly taken from SpaceVim's implementation

function! LowerCamelCase() abort
  " fooFzz
  if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
    return
  endif
  let cword = ParseSymbol(expand('<cword>'))
  if !empty(cword)
    let rst = [cword[0]]
    if len(cword) > 1
      let rst += map(cword[1:], "substitute(v:val, '^.', '\\u&', 'g')")
    endif
    let save_register = @k
    let save_cursor = getcurpos()
    let @k = join(rst, '')
    normal! viw"kp
    call setpos('.', save_cursor)
    let @k = save_register
  endif
endfunction

function! UpperCamelCase() abort
    " FooFzz
    if strcharpart(getline('.')[col('.') - 1:], 0, 1) =~ '\s'
        return
    endif
    let cword = ParseSymbol(expand('<cword>'))
    if !empty(cword)
        let rst = map(cword, "substitute(v:val, '^.', '\\u&', 'g')")
        let save_register = @k
        let save_cursor = getcurpos()
        let @k = join(rst, '')
        normal! viw"kp
        call setpos('.', save_cursor)
        let @k = save_register
    endif
endfunction

function! KebabCase() abort
  " foo-fzz
  if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
    return
  endif
  let cword = ParseSymbol(expand('<cword>'))
  if !empty(cword)
    let save_register = @k
    let save_cursor = getcurpos()
    let @k = join(cword, '-')
    normal! viw"kp
    call setpos('.', save_cursor)
    let @k = save_register
  endif
endfunction

function! Snake_Case() abort
  " foo_fzz
  let cword = ParseSymbol(expand('<cword>'))
  if !empty(cword)
    let save_register = @k
    let save_cursor = getcurpos()
    let @k = join(cword, '_')
    normal! viw"kp
    call setpos('.', save_cursor)
    let @k = save_register
  endif
endfunction

function! ParseSymbol(symbol) abort
    if a:symbol =~# '^[a-z]\+\(-[a-zA-Z]\+\)*$'
        return split(a:symbol, '-')
    elseif a:symbol =~# '^[a-z]\+\(_[a-zA-Z]\+\)*$'
        return split(a:symbol, '_')
    elseif a:symbol =~# '^[a-z]\+\([A-Z][a-z]\+\)*$'
        let chars = String2chars(a:symbol)
        let rst = []
        let word = ''
        for char in chars
            if char =~# '[a-z]'
                let word .= char
            else
                call add(rst, tolower(word))
                let word = char
            endif
        endfor
        call add(rst, tolower(word))
        return rst
    elseif a:symbol =~# '^[A-Z][a-z]\+\([A-Z][a-z]\+\)*$'
        let chars = String2chars(a:symbol)
        let rst = []
        let word = ''
        for char in chars
            if char =~# '[a-z]'
                let word .= char
            else
                if !empty(word)
                    call add(rst, tolower(word))
                endif
                let word = char
            endif
        endfor
        call add(rst, tolower(word))
        return rst
    else
        return [a:symbol]
    endif
endfunction

function! String2chars(str) abort
  let save_enc = &encoding
  let &encoding = 'utf-8'
  let chars = split(a:str, '\zs')
  let &encoding = save_enc
  return chars
endfunction


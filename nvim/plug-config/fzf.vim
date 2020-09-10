" Plug 'junegunn/fzf.vim'
" Description: Bringing fzf to vim!

" top-level options
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible

" make it a floating window instead of coming up from the bottom
" https://github.com/junegunn/fzf.vim/issues/821#issuecomment-581481211
let g:fzf_layout = {
    \ 'window': {
        \ 'width': 0.9,
        \ 'height': 0.6,
    \ },
\ }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


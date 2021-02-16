" Plug 'glacambre/firenvim'
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
        \ 'https?://twitter.com/': { 'takeover': 'never', 'priority': 1 },
        \ 'https?://twitch.tv/': { 'takeover': 'never', 'priority': 1 },
        \ 'https?://docs.google.com/': { 'takeover': 'never', 'priority': 1 },
        \ 'https?://sheets.google.com/': { 'takeover': 'never', 'priority': 1 },
        \ 'https?://slides.google.com/': { 'takeover': 'never', 'priority': 1 },
    \ }
\ }

" Disable `firenvim` for the particular webiste
" let fc = g:firenvim_config['localSettings']


" Change `firenvim` file type to enable syntax highlight, `coc` works perfectly
" after this settings!!!
" autocmd BufEnter txti.es_*.txt set filetype=typescript
" autocmd BufEnter github.com_*.txt set filetype=markdown

if exists('g:started_by_firenvim')
    set laststatus=0
    set noswapfile
    set nowritebackup   " remove the write backup file immediately upon writing

    " Increase the font size
    set guifont=Hack\ Nerd\ Font:h16
endif


function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
    if s:IsFirenvimActive(a:event)
        " Disable other things
        set laststatus=0
        set noswapfile
        set nowritebackup   " remove the write backup file immediately upon writing

        " Increase the font size
        set guifont=Hack\ Nerd\ Font:h16
    endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

" Plug 'machakann/vim-highlightedyank'

" settings
let g:highlightedyank_highlight_duration = 200

" mapping
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif


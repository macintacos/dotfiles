" Plug 'machakann/vim-highlightedyank'
" Description: briefly highlights the stuff you just yanked.
"     Will be useless once 0.5.0 is stable; remove when that happens!

" settings
let g:highlightedyank_highlight_duration = 200

" mapping
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif


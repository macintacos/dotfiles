" Plug 'inkarat/vim-LineJuggler'
" Description: Manipulating text, moving things around

" mappings
"" Moving lines
nmap J <Plug>(LineJugglerMoveDown)
nmap K <Plug>(LineJugglerMoveUp)
vmap J <Plug>(LineJugglerMoveDown)
vmap K <Plug>(LineJugglerMoveUp)
"" Duplicating lines
nmap <A-j> <Plug>(LineJugglerDupOverDown)
nmap <A-k> <Plug>(LineJugglerDupOverUp)
vmap <A-j> <Plug>(LineJugglerDupOverDown)
vmap <A-k> <Plug>(LineJugglerDupOverUp)

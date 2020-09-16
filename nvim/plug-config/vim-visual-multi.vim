" Plug 'mg979/vim-visual-multi'
" Description: multiple cursors!

let g:VM_leader = "\\"

" custom remaps (full list: https://github.com/mg979/vim-visual-multi/wiki/Mappings)
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'

" other, more specific map additions
nnoremap gB :call vm#commands#find_all(0, 1)<CR>

" Plug 'mg979/vim-visual-multi'
" Description: multiple cursors!

let g:VM_leader = ";;"
let g:VM_mouse_mappings = 1

" custom remaps (full list: https://github.com/mg979/vim-visual-multi/wiki/Mappings)
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'
let g:VM_maps["Find Under"] = "gb"
let g:VM_maps["Find Under"] = "<C-n>"

" other, more specific map additions
nmap <silent> gb <Plug>(VM-Find-Under)
nmap <silent> <C-n> <Plug>(VM-Find-Under)
nnoremap <silent> gB :call vm#commands#find_all(0, 1)<CR>

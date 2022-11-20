
" Our .vscode-neovim directory
let data_dir = '~/.vscode-neovim'
let plugFile = data_dir . '/plug.vim'

" Download plug.vim if it doesn't exist
" Then install the plugins in this file
if empty(glob(plugFile))
  silent execute '!curl -fLo '.plugFile.' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  execute "autocmd VimEnter * PlugInstall --sync | source " . expand('%:p')
endif

" Source vim-plug directly since we install it in a non-autoload directory
execute "source " . expand(plugFile)

call plug#begin(data_dir)
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'mg979/vim-visual-multi'
call plug#end()

lua << EOF
require('Comment').setup()
EOF

" Sync vim yanking with system clipboard
set clipboard=unnamedplus
set timeoutlen=300

" Keybindings
let mapleader=";"
nnoremap <space> <Cmd>call VSCodeNotify('vspacecode.space')<CR>
xmap <space> <Cmd>call VSCodeNotify('vspacecode.space')<CR>

" Movement
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Blackhole everything except for m/M, which replace d/D
nnoremap m d
nnoremap mm dd
nnoremap M D
nnoremap X "_X
nnoremap x "_x
nnoremap cc "_cc
nnoremap C "_C
nnoremap c "_c
nnoremap cc "_cc
nnoremap D "_D
nnoremap d "_d
nnoremap dd "_dd
vmap m d
vmap mm dd
vmap M D
vmap X "_X
vmap x "_x
vmap cc "_cc
vmap C "_C
vmap c "_c
vmap cc "_cc
vmap D "_D
vmap d "_d
vmap dd "_dd

" Other copy-related things
nnoremap Y y$

" Remaps from vscodevim
nnoremap q  <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap gh <Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>
nnoremap gH <Cmd>call VSCodeNotify('docsView.documentation.focus')<CR>
nnoremap gp <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
nnoremap gl <Cmd>call VSCodeNotify('workbench.action.gotoLine')<CR>
nnoremap >  <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>
nnoremap <  <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>
vmap     >  <Cmd>call VSCodeNotifyVisual('editor.action.indentLines', 1)<CR>
vmap     <  <Cmd>call VSCodeNotifyVisual('editor.action.outdentLines', 1)<CR>

nnoremap J  <Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
vmap     J  <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesDownAction', 1)<CR>
nnoremap K  <Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>
vmap     K  <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesUpAction', 1)<CR>

nnoremap L g_
nnoremap H ^
vmap L g_
vmap H ^

vmap <A-j> <Cmd>call VSCodeNotifyVisual('editor.action.copyLinesDownAction', 1)<CR>
vmap <A-k> <Cmd>call VSCodeNotifyVisual('editor.action.copyLinesUpAction', 1)<CR>

" vim-visual-multi
let g:VM_leader = '\'
let g:VM_mouse_mappings = 1
let g:VM_default_mappings = 1
let g:VM_theme = 'codedark'

" custom remaps (full list: https://github.com/mg979/vim-visual-multi/wiki/Mappings)
let g:VM_maps = {}
let g:VM_maps["Undo"]            = 'u'
let g:VM_maps["Redo"]            = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'
let g:VM_maps["Find Under"]      = "gb"
let g:VM_maps["Find Under"]      = "<C-n>"
let g:VM_maps["Visual Add"]      = "\\a"
let g:VM_maps["Visual Find"]     = "\\f"
let g:VM_maps["Visual Cursors"]  = "\\c"

" other, more specific map additions
nnoremap <silent> gb <Plug>(VM-Find-Under)
nnoremap <silent> <C-n> <Plug>(VM-Find-Under)

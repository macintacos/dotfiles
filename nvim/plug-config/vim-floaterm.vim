" Plug 'voldikss/vim-floaterm'
" Description: Floating windows for specific purposes. Supports terminals but can do a lot of other things too!

let g:floaterm_height = 0.3

let g:floaterm_gitcommit = 'floaterm'   " use floaterm to do git commits
let g:floaterm_autoclose = '1'          " close window if job exits normally
let g:floaterm_wintype = 'normal'       " don't want it to popup
let g:floaterm_rootmarkers = ['.project', '.git', '.gitignore']

" mappings
nnoremap <silent> <C-_> :FloatermToggle<CR>
tnoremap <silent> <C-_> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <C-\> <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <C-t> <C-\><C-n>:Clap floaterm<CR>
tnoremap <silent> <C-n> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <C-p> <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <C-k> <C-\><C-n>:FloatermKill<CR>
tnoremap <silent> <C-S-K> <C-\><C-n>:FloatermKill!<CR>

" settings for the view itself
function s:floatermSettings()
    setlocal nonumber
endfunction

autocmd FileType floaterm call s:floatermSettings()

" Plug 'preservim/nerdtree'
" Description: file manager. Purists seem to hate it, but I can't stand not
" having a file tree. Oh well!

" Show current directory when you specify the directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" since we have icons, remove the arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" show all untracked files in its own directory
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'

" use nerdfonts for git
let g:NERDTreeGitStatusNerdFonts = 1

" icons for things
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'',
    \ 'Staged'    :'',
    \ 'Untracked' :'ﯷ',
    \ 'Renamed'   :'',
    \ 'Unmerged'  :'',
    \ 'Deleted'   :'',
    \ 'Dirty'     :'',
    \ 'Ignored'   :'',
    \ 'Clean'     :'',
    \ 'Unknown'   :'',
\ }

" minimal UI
let NERDTreeMinimalUI = 1

" hidden files by default
let NERDTreeShowHidden = 1

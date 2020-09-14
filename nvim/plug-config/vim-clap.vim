" Plug 'liuchengxu/vim-clap'
" Description: possible replacement for FZF? Lets me search all over a given
" project with ease. 

let g:clap_layout = { 'relative': 'editor' }

function! GetZoxideDirs()
    let zoxide_dirs = systemlist('zoxide query -l -s')
    let final_dirs = []

    for dir in zoxide_dirs
       let current_dir = "" . dir " adding an icon
       call add(final_dirs, current_dir)
    endfor

    return final_dirs
endfunction

let g:clap_provider_zoxide = {}
let g:clap_provider_zoxide.source = GetZoxideDirs()
let g:clap_provider_zoxide.sink = 'Clap files'

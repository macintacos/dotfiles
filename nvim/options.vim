filetype plugin on
syntax on " start highlighting

set clipboard+=unnamedplus 	    " use the system clipbooard for everything
set wildmode=longest:full,full  " better wildmenu completion stuff
set wildmenu    	    " better command-line completion
set confirm			    " instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files
set hidden			    " from what I understand, this will just hide buffers when you leave them
set hlsearch    	    " highlight searces (use <C-L> to temporarily turn off highliting) 
set ignorecase  	    " setting case-insensitive search
set laststatus  	    " always display the status line, even if only one window is displayed
set linebreak 		    " sensible line breaking
set nobackup		    " backup file is immediately deleted upon successfully writing the original file when saving
set nowritebackup 	    " remove the write backup file immediately upon writing
set nocompatible	    " https://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
set ruler       	    " display the cursor position on the last line of the screen, or in the status line of a window
set shortmess+=s	    " don't show 'search hit BOTTOM', etc. messages
set shortmess+=c        " don't give ins-completion-menu messages
set shortmess+=a	    " https://neovim.io/doc/user/options.html#'shortmess'
set showcmd     	    " show partial commands in the last line of the screen
set signcolumn=yes 	    " always show the signcolumn so that it doesn't become all shifty when you resolve errors and such
set smartcase   	    " setting it so that we don't use case-sensitivity until a capital letter is used
set relativenumber      " relative numbers
set expandtab           " puts spaces instead of tab characters
set shiftwidth=4        " width of an indentation is 2 when using '<<'/'>>'
set softtabstop=4       " this is how vim knows to backspace characters I think
set tabstop=4           " This makes suyre that we set tabs to look like 4 spaces
set noshowmode          " lightline takes care of this, no need to show mode at the bottom
set timeoutlen=500      " timeout length of half a second
set updatetime=300      " smaller updatetime for CursorHold & CursorHoldI
set autoindent          " autoindentation stuff; makes it so that indentation is the same as the current line's indentation
set smartindent         " smart indentation stuff
set termguicolors       " true colors
set mouse=a             " mouse everywhere
set nowrap              " I don't like word wrap onby default
set background=dark     " because dark backgrounds
set cursorline          " make it so that the line has a highlight
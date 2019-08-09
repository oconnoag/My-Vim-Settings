" Runtime path manipulation
execute pathogen#infect()
syntax on 
filetype plugin indent on

" Syntax
syntax enable
colorscheme onedark

" Remove transparency if it gets in the way
" hi Normal ctermbg=none

" Find files recursively in cwd
set path+=**

" Tabs
set tabstop=4
set softtabstop=4
set expandtab            " Make tabs spaces
set shiftwidth=4
set autoindent           " copy indent from current line when starting a new line
set smartindent          " even better autoindent (e.g. add indent after '{')
set smarttab

" UI Stuff
set nowrap              " No wrapping long lines
set noswapfile          " No swap files
set number              " Line numbers
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set visualbell          " blink cursor on error, instead of beeping
set colorcolumn=120     " Sets the textwidth line
set numberwidth=5       " text width for numbe
set splitright          " More natural splitting
set splitbelow          " More natural splitting
set title               " Puts filename in the tab

" leader
let mapleader=","      " Leader

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>  " Press ,space to stop highlighting

" screen splitting
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Save the current python file in the buffer and run it in a blank screen
nnoremap <buffer> <F5> :w <bar> :exec '!python' shellescape(@%, 1)<cr>

" Remember :ls views the current buffer (which files are open)
"          :b lets you jump between those files in the buffer (with autocomplete)
"          :find jump between files



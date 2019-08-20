" Load pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on 

" Auto source vimrc (changes automatically take effect)
autocmd! bufwritepost .vimrc source %

" Syntax
syntax enable
colorscheme gruvbox

" Remove transparency if it gets in the way
set bg=dark
" hi Normal ctermbg=none

" Find files recursively in cwd
set path+=**

" Copying and Pasting
set pastetoggle=<F2>
set clipboard=unnamed    " Allows for seemless copying and pasting in and out of vim

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
set numberwidth=5       " text width for numbe
set splitright          " More natural splitting
set splitbelow          " More natural splitting
set title               " Puts filename in the tab

" Add color column for the textwidth of the document
set colorcolumn=120     " Sets the textwidth line
highlight ColorColumn ctermbg=60               " Sets colors of colorcolumn

" No error bells/flash
set noerrorbells
set visualbell
set t_vb= 

" leader
let mapleader=","      " Leader

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case in search
set smartcase           " tries to guess casing
nnoremap <leader><space> :nohlsearch<CR>  " Press ,space to stop highlighting

" screen splitting
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap j gj
nnoremap k gk

" Save the current python file in the buffer and run it in a blank screen
nnoremap <buffer> <F5> :w <bar> :exec '!python' shellescape(@%, 1)<cr>

 " Buffer jumping
:nnoremap  <C-h> :bnext<CR>
:nnoremap  <C-l> :bprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I toggles hidden files
nnoremap <Leader>f :NERDTreeToggle<Enter>         " Toggle the interface
let NERDTreeQuitOnOpen = 1                        " NerdTree closes on open 

" Close nerdtree if it is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pymode_python = 'python'
" let g:pymode_options_colorcolumn = 120
" nnoremap <leader>q :pclose<CR>                    " Close the python-mode run window

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffergator
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>b :BuffergatorOpen<CR>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='simple'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl+p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>p :CtrlP<cr>
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adjust syntax highlighting to 24-bit true color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

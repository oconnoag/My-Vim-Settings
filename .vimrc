" Load pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on 

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" Auto source vimrc (changes automatically take effect)
autocmd! bufwritepost .vimrc source %

" Remove trailing whitespace from certain filetypes
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.txt %s/\s\+$//e

" Convert single quotes to double quotes for string literals (NOTE: will not
" work on string literals that contain double quotes within them). Command
" runs when buffer is written to file (PYTHON ONLY)
autocmd BufWritePre *.py %s/\([^a-z^A-Z]\)'\([^'^"]*\)'/\1"\2"/gce

" Disable syntax highlighting for .rst files (big performance gain)
autocmd BufRead,BufNewFile   *.rst setlocal syntax=OFF

" Syntax
syntax enable
colorscheme onedark

" Remove transparency if it gets in the way
" set bg=dark
" :hi Normal ctermbg=none
" color sheet: https://jonasjacek.github.io/colors/ (233 and 234 seem nice)
" highlight Normal ctermbg=234  " < Vim 8.2
highlight Normal guibg=#151515

" Vertsplit full | instead of a bunch of pipes
set fillchars+=vert:│

" Find files recursively in cwd
set path+=**

" Copying and Pasting
set pastetoggle=<F2>
" set clipboard=unnamed    " Allows for seamless copying and pasting in and out of vim

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
set numberwidth=5       " text width for number
set splitright          " More natural splitting
set splitbelow          " More natural splitting
set title               " Puts filename in the tab
set backspace=2         " Always backspace in insert mode

" Add color column for the textwidth of the document
set colorcolumn=120     " Sets the textwidth line
highlight ColorColumn ctermbg=60               " Sets colors of colorcolumn

" No error bells/flash
set noerrorbells
set visualbell
set t_vb= 

" leader
let mapleader="\<Space>"      " Leader

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case in search
set smartcase           " tries to guess casing
nnoremap <leader><space> :nohlsearch<CR>  " Press ,space to stop highlighting

" Find string literals 
nnoremap <leader>' /\v'([^"^']*)'<CR>

" Screen splitting
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap j gj
nnoremap k gk

" Finally, a way to yank things into the clipboard
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" Duplicate current line
nmap <leader>d Yp

" Toggle line numbers
nmap <leader>n :set nu!<cr>

" Toggle hidden characters
nmap <leader>L :set list!<cr>

" Select all
nmap <leader>A ggVG

" Vim tabs
nmap <leader>t :tabnew<cr>
nmap <leader>T :tabclose<cr>

" Insert/Decrease split sizes
map <leader>= :vertical resize +10<CR>
map <leader>- :vertical resize -10<CR>

" Spell check -- be sure to use z= to get spelling suggestions
set spell
hi SpellBad cterm=underline

" Toggle spell
:nnoremap  <leader>S :set spell!<CR>

" Save the current python file in the buffer and run it in a blank screen
nnoremap <buffer> <F5> :w <bar> :exec '!python' shellescape(@%, 1)<cr>

 " Buffer jumping
:nnoremap  <C-l> :bnext<CR>
:nnoremap  <C-h> :bprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save & load sessions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :mksession! ~/.vim/.vim_session <cr> " Quick write session with F3
map <F4> :source ~/.vim/.vim_session <cr> :highlight Normal ctermbg=234 <cr>   " And load session with F4 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent Undo 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/undodir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>f :NERDTreeToggle<Enter>         " Toggle the interface
let NERDTreeQuitOnOpen = 1                        " NerdTree closes on open 

" Close nerdtree if it is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffergator
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>b :BuffergatorOpen<CR>
nnoremap <leader>B :BuffergatorClose<CR>

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

" Speed up searching
" -----------------
"  Cache saved to a stable file for quick cache access
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"
"  Use ag instead of vim's default globpath -- should be faster
" if executable('ag')
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{gutentags#statusline()}  " Inform when ctags are being generated
let g:gutentags_cache_dir = '~/.vim/ctags_dir'

" let g:gen_tags#ctags_opts = '-u'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" w0rp/ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check Python files with flake8 and pylint.
" let g:ale_echo_msg_format = '%linter% says "%s"'
let b:ale_linters = ['flake8', 'pylint']
let g:ale_python_flake8_options = '--ignore=E501, --max-line-length=119'
let g:ale_python_pylint_options = '-d invalid-name,line-too-long,protected-access,too-few-public-methods,too-many-arguments,useless-object-inheritance'

" if you don't want linters to run on opening a file
" and only lint on save
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Style settings of the errors and warnings
highlight ALEError ctermbg=red ctermfg=white cterm=underline,bold
highlight ALEWarning ctermbg=blue ctermfg=white cterm=underline,bold

" Open the ALE window
nnoremap <leader>a :ALEToggle<CR>

" Jump between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simpylfold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

" Ensure that {}, [] motions don't open folds
set foldopen-=block

" Fold color (cyan)
highlight Folded ctermfg=51

" set fold level to open up classes
set foldlevel=1

" set folding off by default (toggle with zi)
set nofoldenable

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load custom snippets - ÷ (insert mode leader) is <option-?>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime ./snippets.vim

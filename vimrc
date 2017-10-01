call plug#begin('~/.vim/plugged')

" Snippits
Plug 'SirVer/ultisnips'

" File explorer
Plug 'scrooloose/nerdtree'

" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fugitive
Plug 'tpope/vim-fugitive'

" Fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Surround
Plug 'tpope/vim-surround'

" Easy commenting
Plug 'tpope/vim-commentary'

" Gitgutter
Plug 'airblade/vim-gitgutter'

" Supertab (auto completion)
Plug 'ervandew/supertab'

" Vimux (easily intergrate with tmux)
Plug 'benmills/vimux'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto completion
Plug 'artur-shaik/vim-javacomplete2'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Theme
Plug 'Yggdroot/indentLine'

call plug#end()

"""
""" KEY MAPPINGS
"""
" 1. Make pwd always active buffer
" 2. Make sure pwd setup
" 3. Map opening NERDTree to Ctrl+n
set autochdir
let NERDTreeChDirMode=2
map <C-n> :NERDTree .<CR>

" <leader>f to fzf
noremap <leader>f :Files<CR>

" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

let mapleader = ","
let g:mapleader = ","

" Fast saving
map <leader>s :w<CR>

" Fast reloading of vimrc
map <leader>rv :source ~/.vimrc<CR>

" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab mappings
nmap tn :tabnew<Space>
nmap tk :tabnext<CR>
nmap tj :tabprev<CR>
nmap th :tabfirst<CR>
nmap tl :tablast<CR>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Open vimrc with <leader>av
nmap <leader>av :tabnew ~/.vimrc<CR>

" Fugitive mappings
nmap gs :Gstatus<CR>
nmap gc :Gcommit<CR>
nmap gp :Gpush<CR>

"""
""" CONFIGURE PLUGINS
"""
"" NERDTree
" Enable NERDTree on startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it's the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Airline
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set ttimeoutlen=5

"" Autocomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"" Indentline
let g:indentLine_char = '▏'

"""
""" SET UI
"""
color dracula
set colorcolumn=80

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""
""" GENERAL
"""
set nocompatible

" Enable linenumbers and syntax highlighting
syntax on
set number relativenumber

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" use 256 colors in terminal
if !has("gui_running")
  set t_Co=256
  set term=screen-256color
endif

" fix cursor display in cygwin
if has("win32unix")
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif


call plug#begin('~/.vim/plugged')

" Snippits
Plug 'SirVer/ultisnips'

" File explorer
Plug 'scrooloose/nerdtree'

" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fugitive
Plug 'tpope/vim-fugitive'

" Indentation
Plug 'nathanaelkane/vim-indent-guides'

" Fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

" EasyMotion
Plug 'easymotion/vim-easymotion' 

" Surround
Plug 'tpope/vim-surround'

" Easy commenting
Plug 'tpope/vim-commentary'

" Carbonized colour scheme
Plug 'nightsense/carbonized'

" Gitgutter
Plug 'airblade/vim-gitgutter'

" Supertab (auto completion)
Plug 'ervandew/supertab'

call plug#end()

" Avoid buggy behaivior
set nocompatible

" Enable carbonized theme
colorscheme carbonized-dark

" Enable linenumbers and syntax highlighting
syntax on
set number relativenumber

" Configure indent guides
let g:indent_guides_enable_on_vim_startup = 1
set ts=2 sw=2 et

" Enable NERDTree on startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it's the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map opening NERDTree to Ctrl+n
map <C-n> :NERDTreeToggle<CR>

set nowrap        " don't wrap lines
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set colorcolumn=80

" <ESC> to clear search highlighting
nnoremap <esc> :noh<return><esc>



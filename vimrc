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

call plug#end()

" Enable carbonized theme
colorscheme carbonized-dark

" Enable linenumbers and syntax highlighting
syntax on
set number relativenumber

" Enable indent guides on startup
let g:indent_guides_enable_on_vim_startup = 1

" Enable NERDTree on startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it's the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map opening NERDTree to Ctrl+n
map <C-n> :NERDTreeToggle<CR>

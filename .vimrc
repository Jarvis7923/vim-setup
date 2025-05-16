" tmux color
set background=dark

set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundleplugins')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" the following are examples of different formats supported.
" keep plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'dense-analysis/ale'

" cpp formatter
Plugin 'ompugao/uncrustify-vim'

" utilities.
Plugin 'kien/ctrlp.vim'
Plugin 'preservim/nerdtree'

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" to ignore plugin indent changes, instead use:
" filetype plugin on
"
" brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" put your non-plugin stuff after this line
" vundle ends.

" global settings
syntax on

" set path=**

set foldlevel=99
set fdm=syntax

" system clipboards.
set clipboard=unnamedplus

" can have buffer hidden
set hidden

" wild menu settings
set wildmenu
" set wildignore=*.o,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/,*.pdf,*.PDF,*.rb
" set wildignore+=*.dae
" Wild menu settings ends.

" split start from bottom
set splitbelow

" split start from right
set splitright

" enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" enable plugins and load plugin for the detected file type.
filetype plugin on

" load an indent file for the detected file type.
" filetype indent on

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" use space characters instead of tabs.
set expandtab

" do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap
set wrap

" while searching though a file incrementally highlight matching characters as you type.
set incsearch

" ignore capital letters during search.
set ignorecase

" override the ignorecase option if searching for capital letters.
" this will allow you to search specifically for capital letters.
set smartcase

" show partial command you type in the last line of the screen.
set showcmd

" show the mode you are on the last line.
set showmode

" show matching words during a search.
set showmatch

" use highlighting when doing a search.
set hlsearch

" set the commands to save in history default number is 20.
set history=5000

set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" uncrustify config to use cpp formatter
let g:uncrustify_cfg_file_path='~/.uncrustify.cfg'  " path to uncrustify configuration file

" ctrlp settings
let g:ctrlp_working_path_mod='ra'
let g:ctrlp_show_hidden=0
let g:ctrlp_max_depth=100
let g:ctrlp_max_files=50000
let g:ctrlp_lazy_update=0
let g:ctrlp_show_hidden=1
let g:ctrlp_by_filename=0
let g:ctrlp_regexp=1
let g:ctrlp_custom_ignore={
            \ 'dir':  '\v[\/]\.(git|hg|svn|mypy_cache|ruff_cache)$',
            \ 'file': '\v\.(exe|so|dll|pdf|po)$',
            \ }

" ale settings
let g:ale_linters={
            \ 'python': ['pylint', 'flake8', 'mypy'],
            \ }
let g:ale_fixers={
            \ 'python': ['ruff', 'ruff_format', 'isort', 'autoflake'],
            \ }

" trailing white space color group
highlight BadWhitespace ctermbg=red guibg=darkred

" python settigns

let python_highlight_all=1
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ set fdm=indent |
            \ match BadWhitespace /\s\+$/ |
            \ set encoding=utf-8

" cpp, h settigns.
au BufNewFile,BufRead *.cpp,*.h
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ set fdm=indent |
            \ match BadWhitespace /\s\+$/ |
            \ set encoding=utf-8

" urdf.
au BufNewFile,BufRead *.urdf,*.xacro
            \ setlocal filetype=xml |
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set expandtab

" makefile.
au BufNewFile,BufRead Makefile
            \ set tabstop=4 |
            \ set noexpandtab

" tex.
au BufNewFile,BufRead *.tex
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set expandtab

" md.
au BufNewFile,BufRead *.md
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set expandtab

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=200
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif


" tmux color
set background=dark

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundleplugins')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Cpp formatter,
Plugin 'ompugao/uncrustify-vim'

" Utilities.
Plugin 'kien/ctrlp.vim'
Plugin 'preservim/nerdtree'

" Syntax checking and highlighting.
Plugin 'vim-syntastic/syntastic'

" Plugin 'nvie/vim-flake8'

" Python specifics.
Plugin 'integralist/vim-mypy'
" Use the PEP8 bracket, paranthesis, indentation. Not function signiture.
Plugin 'vim-scripts/indentpython.vim'
" Fold function with doc strings.
Plugin 'tmhedberg/SimpylFold'

Plugin 'davidhalter/jedi-vim'

" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle ends.

" global settings
syntax on

" set path=**

set foldlevel=99
set fdm=syntax

" system clipboards.
set clipboard=unnamedplus
" system clipboards ends.

" Can have buffer hidden
set hidden

" Wild menu settings
set wildmenu
set wildignore=*.o,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/,*.pdf,*.PDF,*.rb
set wildignore+=*.dae
" Wild menu settings ends.

" split start from bottom
set splitbelow
" split start from right
set splitright

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
" filetype indent on

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=5000

" syntastic configs.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_python_checkers=['mypy', 'flake8']
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
" let g:syntastic_python_python_use_codec = 1
""--extend-ignore=E501,E261,ANN101,ANN003,ANN202,ANN204,ANN102,ANN206,ANN001,E402,E128,E124,E302"
let g:syntastic_python_flake8_args = "--allow-untyped-defs --extend-ignore=E501,E261,ANN101,ANN102,ANN002,ANN003,ANN204,ANN206,E402,E128,E124,E302,E222,F401"

let g:syntastic_python_mypy_args = "--ignore-missing-imports --follow-imports silent --disable-error-code=import-untyped"

" syntastic cpp.
" TODO: make some check work for cpp.
let g:syntastic_cpp_checkers=[]
let g:syntastic_h_checkers=[]
let g:syntastic_tex_checkers=['lacheck']
" syntastic configs ends.

" uncrustify config to use cpp formatter
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"  " path to uncrustify configuration file
" uncrustify config to use cpp formatter ends.

"CtrlP settings
let g:ctrlp_working_path_mode=0
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_max_files = 50000
let g:ctrlp_lazy_update = 0
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll|pdf|po)$',
\ }

"
"CtrlP settings ends.

" Trailing white space color group
highlight BadWhitespace ctermbg=red guibg=darkred

" Python settigns

" Plugin simple folde preview some doc string when folded.
" g:SimpylFold_docstring_preview	Preview docstring in fold text	0
" g:SimpylFold_fold_docstring		Fold docstrings			1
" g:SimpylFold_fold_import		Fold imports			1
" g:SimpylFold_fold_blank		Fold trailing blank lines	0
" b:SimpylFold_fold_docstring		Fold docstrings (buffer local)	1
" b:SimpylFold_fold_import		Fold imports (buffer local)	1
" b:SimpylFold_fold_blank		Fold trailing blanks (buffer)	0"
let g:SimpylFold_docstring_preview=1

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

let g:jedi#completions_enabled = 1
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0
" let g:jedi#auto_initialization = 1

" Python settigns ends.

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
" cpp, h settigns ends.

" Temporary cpp project settings.
let g:syntastic_enable_cpp_checker = 0
let g:syntastic_enable_h_checker = 0

" urdf.
au BufNewFile,BufRead *.urdf,*.xacro
    \ setlocal filetype=xml |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

" Makefile.
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

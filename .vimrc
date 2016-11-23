let mapleader=","
" let perl_fold=1
syntax on
" set foldmethod=syntax
set hls
set ts=6
set softtabstop=4
set expandtab
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set laststatus=2
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" mappings
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <leader>1 yypVr=kyyPVr=j
map <F2> :TlistToggle<CR>

" bundles
Bundle 'ctrlp.vim'
Bundle 'molokai'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'rdnetto/YCM-Generator'

colorscheme molokai
let g:rehash256 = 1
set tags=~/dev/tags
let g:ctags_statusline=1
let Tlist_Process_File_Always = 1
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v]%p%%\ line\ %l\ of\ %L[\%{Tlist_Get_Tagname_By_Line()}]
cs add ~/dev/cscope.out
